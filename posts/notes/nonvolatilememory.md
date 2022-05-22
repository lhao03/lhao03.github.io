---
title: "Paper: Non-Volatile Memory for Fast, Reliable File Systems"
date: 2022-04-28
tags: computer science, paper
---

_Understanding: 7, Interest: 7_

Mary Baker, Satoshi Asami, Etienne Deprit, John Ouseterhout, and Margo Seltzer. 1992. Non-volatile memory for fast, reliable file systems. In Proceedings of the fifth international conference on Architectural support for programming languages and operating systems (ASPLOS V). Association for Computing Machinery, New York, NY, USA, 10–22. [https://doi.org/10.1145/143365.143380](https://doi.org/10.1145/143365.143380)


Mary Baker, Satoshi Asami, Etienne Deprit, John Ouseterhout, and Margo Seltzer. 1992. Non-volatile memory for fast, reliable file systems. SIGPLAN Not. 27, 9 (Sept. 1992), 10–22. [https://doi.org/10.1145/143371.143380](https://doi.org/10.1145/143365.143380)


- non-volatile RAM (NVRAM)
- two uses of NVRAM to improve I/O performance in distributed file systems:
  - non-volatile file caches on client workstations to reduce write traffic to file servers
  - write buffers for write-optimized file systems to reduce server disk access
- increasing amount of NVRAM shows diminishing returns and block replacement policy makes little difference

# 1. introduction
- large, main-memory file systems better at reducing read traffic than write traffic
  - write traffic will become increasingly important in distributed file systems => could become a bottleneck
- failure to reduce write traffic is due to dirty data:
  - the longer dirty data stays, the higher chance it will be sent to cache by being overwritten or deleted, but the data becomes more vulnerable to machine failures
    - systems like UNIX limit the time dirty data remains in cache => most data is written back to due this
- by storing dirty data in NVRAM: guarantee permanence without cost of transferring it from client cache to server cache to disk

## ways to implement NVRAM
- some RAM with battery backup for time-of-day in workstations
    - since systems include overhead of batteries, incremental additions may not be costly
- SIMMS (overheard of batteries and failover systems) can be amortized over more megabytes of memory
- uninterruptible power supply (UPS): more expensive for small amounts of memory
- EEPROM: has write access times significantly slower than RAM (not appropriate)

- NVRAM: high performance relative to disks and permanence relative to volatile RAM => worthwhile for small caches and write buffers

Section 2
  - allow dirty data to remain longer in client cache without loss of reliability
- one megabyte NVRAM => reduce file write traffic from clients to servers by more than 50%
  - but @ today's prices, adding NVRAM is only worth if cache already includes 16 megabytes volatile memory

Section 3
- using non-volatile buffer to collect large amounts of data before writing => reduce disk write accesses by 10 - 25%

Section 4
- data in non-volatile client cache systems must reach non-volatile storage on server to be considered permanent and before the data is removed from client cache
  - avoid latency of synchronous disk access by writing data into NVRAM on the server
- modified data may be lost if it resides on NVRAM on crashed client
  - must be possible to move NVRAM to another client to retrieve data

# 2. non-volatile client file caches
- write events take up 1/3 total file bytes transferred 
  - most are triggered by 30-second delayed write back and cache consistency policy rather than cache block replacement
- since most data overwritten/deleted within 1/2 hour of creation => using non-volatile client cache may reduce server write traffic

questions to address:
- how long does dirty data last before being overwritten or deleted?
  - *if dirty data lasts a long time before being overwritten, then NVRAM would help by storing that dirty data to reduce chance of dirty data being lost through a crash, while reducing writes*
  - *if dirty data is constantly or being written back frequently due to block replacement (overwritten), maybe NVRAM would not be that useful.*
- if there was infinite room in the non-volatile cache, what % of dirty data would be overwritten or deleted? how much would be written back to the file server due to cache consistency policy?
- given omniscient block replacement policy, how much NVRAM would it take to get a significant reduction in write traffic?
- what block replacement policies work best in non-volatile cache?
- how to integrate NVRAM into cache organization to get the most of the benefits?
- given current costs, does it make more sense to invest in NVRAM or buy more volatile memory

# 2.1. caching models
- write-aside, unified and compared to volatile
- assumed caches of static size and did not give dirty blocks preference
  - giving preference reduces write traffic but increases read traffic

Sprite client cache:
- two lists of 4 kilobyte blocks: free list and LRU list
  - free block, then look at first clean block on LRU for block replacement
  - dirty blocks that are less-recently accessed than selected clean block are scheduled to be written back to the server, block cleaner started
  - our volatile model: the LRU block is replaced, whether clean or dirty

Sprite cache consistency policy:
- server keeps track of last client to write each file
- concurrent write-sharing: if another client opens the file, the server recalls any dirty data not yet flushed from the last writer's cache. if 2+ clients have same file open and at least one has it open for writing, server disables client caching on file until all clients have closed it. 
  - all read and write requests for the file bypass client cache and go directly to file server

- volatile model: all read/write requests directed to single volatile cache
- write-aside: NVRAM used as backup to protect dirty data
  - holds copies of blocks that are also present in volatile memory
  - never read expect during crash recovery
  - dirty blocks remain in NVRAM until replaced by other blocks or flushed back to server by consistency mechanism
  - when dirty blocks are written to file server, they are removed from NVRAM but may remain as clean blocks in volatile cache
  - no 30-second delayed write on dirty data
  - LRU

- unified: blocks not duplicated between NVRAM and volatile cache
  - dirty blocks only in NVRAM
  - clean blocks in either place
    - clean block may be put in NVRAM if volatile cache full or NVRAM has free block or contains the LRU block 
  - application writes directed only to NVRAM
  - read request to either
  - no 30-second delayed write on dirty data
  - dirty data only leaves due to consistency mechanism or replacement
  - LRU 

# 2.2 simulations
- not possible to deduce order and amount of write operations or which were caused by application `fsync` requests
- input parameters: maximum size of volatile and non-volatile caches, NVRAM model, and replacement policy in non-volatile cache

# 2.3 byte lifetimes
figure 2
- 35 - 50% bytes die within 30 seconds
- 60% die within few hours

trace 3,4
- large amounts data transferred: 5 - 10% bytes die within 30 seconds, 80%+ die within few hours

- more bytes will die in cache than suggested by figure 2 because:
  - traces are finite length and its assumed all bytes left in NVRAM at the end of trace are written back to the server
  - simulation started out with empty caches, misclassifying some writes as new data rather than overwrites
- holding dirty blocks in cache for longer than traditional 30 seconds will reduce write traffic from clients to servers

- with cache of infinite size, no bytes are ever written back to file server due to cache block replacement
- across all traces: 85% of bytes written could be absorbed by sufficiently large NVRAM
  - excluding trace 3 and 4: only 65% absorption is possible

- server traffic almost entirely from cache consistency mechanism
  - reducing write traffic would require choosing more efficient cache consistency policy like block-by-block invalidation and flushing rather than whole-file invalidation and flushing

# 2.4. small NVRAM reduces traffic
- results optimal in terms of blocks but not always in bytes:
  - block with next modify time furthest in the future may contain many dirty bytes
  - block spared replacement may only contain few dirty bytes
  - 1/8 megabyte of NVRAM eliminates 30-50% of server write traffic
  - increasing NVRAM is diminishing returns
  - one megabyte NVRAM reduce traffic by 50%

# 2.5. replacement policies
- LRU favors short-lived blocks in cache
- only small differences
- omniscient policy only performs 10 - 15% better

# 2.6. comparison of cache models
- unified model does better with read traffic
  - overall cache size is increased for clean blocks because they can go in non-volatile cache or volatile cache
- adding NVRAM to write-aside doesn't increase cache size for clean blocks

total (read and write) traffic:
compared to volatile:
- write-aside: 8% worse with addition of 4 extra megabytes of cache memory
  - only reduces write traffic
- unified: 8% better with addition of 4 extra megabytes of cache memory
  - reduces read and write
- NVRAM should be closely integrated with cache mechanism for best effect

- for NVRAM amounts less than half megabyte, volatile model performs better
  - pool of blocks available for replace of newly-written data consists of entire volatile cache
    - only consists of NVRAM for NVRAM models (smaller)
  - a model that allows dirty blocks to be written to NVRAM and volatile cache would perform better than all models mentioned (but with 30-second delay so dirty data would be vulnerable)

traffic on memory bus
- write-aside cache starts out with twice as much memory traffic
- one megabyte NVRAM absorbs about half the bytes written by applications
  - unified model transfers at most 50% of original blocks to volatile cache 
- unified model generates at least 25% less file cache traffic than write-aside model

number of accesses generated on NVRAM
- unified cache model generates many more accesses to NVRAM than write-aside
  - because only writes occur in write-aside NVRAM
- unified model generates 2 - 2.5 times more NVRAM accesses than write-aside

# 2.7. non-volatile vs volatile caches
- cost effectiveness of NVRAM depends on amount of volatile memory already present in system
- 2 megabytes NVRAM on top of 8 megabytes volatile cache == 12 megabytes volatile cache
- 4 megabytes NVRAM on top of 8 megabytes volatile cache == 16 megabytes volatile cache
- 16 megabytes: NVRAM performs better because larger volatile cache has already reduced read traffic, but can no longer reduce write traffic
  - adding half byte NVRAM performs better than 6 additional megabytes volatile memory
- NVRAM only makes sense on systems that cache dirty data on clients (Sprite, AFS)

# 3. using NVRAM as file system write buffer
- better for systems like NFS (dirty data written back immediately)
- reduce physical writes from server to disk
- NVRAM as write buffer in front of disk
- UNIX fast file system in NFS environment already uses NVRAM to reduce disk traffic
- NFS protocol requires many synchronous write operations
- buffering writes also allows more efficient disk utilization since the system can sort its I/O operations to reduce disk read motion.
- only 7% of disk bandwidth is used when writing dirty data randomly to disk
- 1000 I/Os requiring 4 megabytes of NVRAM can be buffered and sorted => utilize 40% disk bandwidth
- vs traditional UNIX file systems, LFS is optimized for writing rather than reading
  - amortizes cost of writes by collecting large segments of data before issuing contiguous disk writes
  - file system layout is sequence of segments that comprise a log of the system. 
  - file metadata describes location of blocks in file to support efficient reads
  - traditional file systems seek to predetermined disk location to update metadata or write different files, LFS gathers all dirty file data and metadata into single segment, appends summary block describing segment's contents and writes out the whole unit with a single seek
- two causes of LFS not being able to write a full segment:
  - 30-second timeout: do not impact disk bandwidth
  - *fsync*: requires LFS immediately write out dirty data, regardless of disk traffic, and these forced synchronous writes reduce efficiency (Sprite)
- write-buffer can reduce/avoid disk accesses because writes remain in NVRAM buffer until whole segment accumulates
- LFS: appends a 4 kilobyte block of metadata after each segment (full or partial), and 512 byte summary block (only reclaimed after garbage collection)
- using NVRAM would eliminate partial segment writes, reduce disk space overhead (less than 1% for full segments), improve disk utilization by 5 - 33% and reduce garbage collection load

# 4. impact on system design
- NVRAM must be able to be moved from dead machine to live machine
- make NVRAM blocks self-identifying => moved from machine to machine

