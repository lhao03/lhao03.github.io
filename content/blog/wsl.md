+++
title="👩🏻‍💻 WSL2 Stuff"
date=2021-03-19
draft=false
[extra]
category = "tech"
+++

I have a really bad habit of not remembering the steps I take to configure stuff. So this blog post will serve as a documentation of how I set up WSL2 for my various development needs. <!-- more --> I thought I was on WSL2 but upon checking I was still on WSL1. 

## weird os error
Reason: Operation not permitted (os error 1)
```bash
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata
```

## links
- [Python, PDFs, and Window’s Subsytem for Linux](https://school.geekwall.in/p/9QG6NstS/)
- [zola and wsl2](https://github.com/getzola/zola/issues/1440)
- [opening linux file system in file explorer](https://www.reddit.com/r/bashonubuntuonwindows/comments/gr6ala/just_installed_wsl_2_where_should_i_save_all_my/)
- [fatal: could not create work tree... : Permission denied](https://stackoverflow.com/questions/16376035/fatal-could-not-create-work-tree-dir-kivy)
