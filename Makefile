# SPDX-License-Identifier: GPL-2.0-only
#
# Makefile for the Linux minix filesystem routines.
#

PWD := $(shell pwd)
KDIR := /lib/modules/$(shell uname -r)/build

obj-m += minix.o

minix-objs := bitmap.o itree_v1.o itree_v2.o namei.o inode.o file.o dir.o

EXTRA_CFLAGS=-I$(PWD)/include

SUBDIRS := $(PWD)
COMMON_OPS = -C $(KDIR) M='$(SUBDIRS)' EXTRA_CFLAGS='$(EXTRA_CFLAGS)'

deafult:
	$(MAKE) $(COMMON_OPS) modules

clean:
	rm -rf *.o *.ko *.cmd *.mod.c *.mod .*.cmd .tmp_versions modules.order Module.symvers *~
