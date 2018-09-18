.PHONY: default clean

# configure compilers
CC=mpicc
CXX=mpicxx
# configure flags
CCFLAGS += $(shell mpicc --showme:compile)
LDFLAGS += $(shell mpicc --showme:link)

default: openmpi_example

openmpi_example: openmpi_example.o

clean:
	rm -f openmpi_example.o openmpi_example sge_log/*
