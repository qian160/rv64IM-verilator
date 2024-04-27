#include "virt.h"
#include <functional>
#include <cassert>
#include <fstream>
#include <vector>
#include <algorithm>

extern char *img_file;
extern uint64_t getPC();

using namespace std;
using handler_t = void(uint64_t offset, uint64_t len , bool is_write);

typedef struct{
    uint64_t begin, end;
    uint8_t* mem;
    std::function<handler_t>handler;
} mmio_map;

vector<mmio_map> maps;
//mmio_map maps[16]= {};
//static uint32_t nr_map = 0;

uint8_t * uart_ptr;
uint8_t * plic_ptr;
uint8_t * clint_ptr;
uint8_t * virtio_ptr;
uint8_t * dram_ptr;

void add_mmio_map(const char *name, int index, uint8_t* mem, std::function<handler_t> handler){
    //assert(nr_map < 16);
    assert(maps.size() < 16);
    MemMapEntry dev = virt_memmap[index];
    uint64_t begin = dev.base, end = dev.base + dev.size;
    maps.push_back(
        mmio_map{
            begin,
            end,
            mem,
            handler
        }
    );
    printf("%8s: [%8lx, %8lx]\n", name, dev.base, dev.base + dev.size - 1);
}

static inline mmio_map* find_map_by_addr(uint64_t addr) {
    auto it = std::find_if(maps.begin(), maps.end(), [addr](mmio_map &m){
        return addr >= m.begin && addr < m.end;
    });

    if (it == maps.end())
        return nullptr;

    int idx = std::distance(maps.begin(), it);
    return &maps[idx];
}

//dpic
extern "C" long long mmio_read(uint64_t addr, int len){
    //let chisel do the sext
    mmio_map * map = find_map_by_addr(addr);
    Assert(map, "bad mmio addr: %lx\n", addr);
    Assert(addr >= map -> begin && addr + len <= map -> end, "addr %lx is out of bounds", addr);

    uint64_t offset = addr - map -> begin;
    uint8_t * base = map -> mem + offset;
    if(map -> handler)
        map -> handler(offset, len, 0);

    switch (len) {      // 1 << funct3[1:0]
        case 1: return *(uint8_t*) base;
        case 2: return *(uint16_t*)base;
        case 4: return *(uint32_t*)base;
        case 8: return *(uint64_t*)base;
        default:
            Assert(0, "mmio_read:  bad len = %d\n", len);
    }
	return 114514;
}

extern "C" void mmio_write(uint64_t addr, int len, long long wdata){
    //sscout << _pink << "mmio write:  addr = " << addr << normal << endl;
	mmio_map * map = find_map_by_addr(addr);
    Assert(map, "bad mmio addr: %lx\n", addr);
    Assert(addr >= map -> begin && addr + len <= map -> end, "addr %lx: out of bound", addr);

    uint64_t offset = addr - map -> begin;
    uint8_t * base = map -> mem + offset;

    switch (len) {
        case 1:
            *(uint8_t*) base = (uint8_t)wdata;     break;
        case 2:
            *(uint16_t*)base = (uint16_t)wdata;    break;
        case 4:
            *(uint32_t*)base = (uint32_t)wdata;    break;
        case 8:
            *(uint64_t*)base = (uint64_t)wdata;    break;
        default:
            Assert(0, "mmio write:  bad length =  %d\n", len);
    }
    if(map -> handler)
        map -> handler(offset, len, 1);
}

static void uart_handler(uint64_t offset, uint64_t len, bool is_write)
{
    if (is_write && offset == 0)
        cout << *((char*)uart_ptr);
    // read ?
}

void init_dram(char *img_file) {
    std::ifstream file(img_file);

    if (!file.is_open()) {
        cout << "failed to open " << img_file << "!\n";
        exit(1);
    }

    file.seekg(0, std::ios::end);
    std::streampos filesz = file.tellg();
    file.seekg(0, std::ios::beg);

    file.read((char*)dram_ptr, filesz);
    file.close();
}

bool in_pmem(uint64_t addr) {
    MemMapEntry dram = virt_memmap[VIRT_DRAM];
    return (addr >= dram.base && addr < dram.base + dram.size);
}

void init_devide() {
    clint_ptr = (uint8_t*)malloc(virt_memmap[VIRT_CLINT].size);
    add_mmio_map("CLINT", VIRT_CLINT, clint_ptr, nullptr);

    plic_ptr = (uint8_t*)malloc(virt_memmap[VIRT_PLIC].size);
    add_mmio_map("PLIC", VIRT_PLIC, plic_ptr, nullptr);

    uart_ptr = (uint8_t*)malloc(virt_memmap[VIRT_UART0].size);
    uart_ptr[LSR] = 0xff;   // always available
    add_mmio_map("UART", VIRT_UART0, uart_ptr, uart_handler);

    virtio_ptr = (uint8_t*)malloc(virt_memmap[VIRT_VIRTIO].size);
    add_mmio_map("VIRTIO", VIRT_VIRTIO, virtio_ptr, nullptr);

    dram_ptr = (uint8_t *)malloc(virt_memmap[VIRT_DRAM].size);
    init_dram(img_file);
    add_mmio_map("DRAM", VIRT_DRAM, dram_ptr, nullptr);
}