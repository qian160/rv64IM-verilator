#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "riscv.h"
#include "defs.h"

volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
  if(cpuid() == 0){
    consoleinit();
    printfinit();
    printf("\n");
    printf("xv6 kernel is booting\n");
    printf("\n");
  
    println("kinit...");
    kinit();         // physical page allocator
    println("kvminit...");
    kvminit();       // create kernel page table
    println("kvminithart...");
    kvminithart();   // turn on paging
  
    println("proc init...");
    procinit();      // process table
  
    println("trap init...");
    trapinit();      // trap vectors
    println("trap inithart...");
    trapinithart();  // install kernel trap vector
  
    println("plic init...");
    plicinit();      // set up interrupt controller
    println("plic inithart...");
    plicinithart();  // ask PLIC for device interrupts
  
    println("binit...");
    binit();         // buffer cache
  
    println("iinit...");
    iinit();         // inode table
  
    println("file init...");
    fileinit();      // file table
  
    println("virtio disk init...");
    virtio_disk_init(); // emulated hard disk
  
    println("user init...");
    userinit();      // first user process
    __sync_synchronize();
    started = 1;
  } else {
    while(started == 0)
      ;
    __sync_synchronize();
    printf("hart %d starting\n", cpuid());
    kvminithart();    // turn on paging
    trapinithart();   // install kernel trap vector
    plicinithart();   // ask PLIC for device interrupts
  }
  printf("start running scheduler\n");
  scheduler();        
}
