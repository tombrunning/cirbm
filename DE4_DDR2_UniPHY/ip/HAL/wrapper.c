#include 'wrapper.h'
#include "io.h"

#define SET_BASE_ADDRESS_OFFSET 0x4
#define SET_TRANSFER_LENGTH_OFFSET 0x8

void set_base_address(unsigned long wrapper_base, unsigned long base_address)
{
    IOWR_32DIRECT(wrapper_base, SET_BASE_ADDRESS_OFFSET, base_address);
}

void set_transfer_length(unsigned long wrapper_base, unsigned long transfer_length);
{
    IOWR_32DIRECT(wrapper_base, SET_TRANSFER_LENGTH_OFFSET, transfer_length);
}