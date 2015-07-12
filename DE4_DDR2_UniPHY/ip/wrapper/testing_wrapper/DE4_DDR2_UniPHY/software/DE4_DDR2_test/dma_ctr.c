/*
 * dma_ctr.c
 *
 *  Created on: 10 Jun 2015
 *      Author: js2113
 */
//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>
//#include <sys/alt_dma.h>
//#include <sys/alt_irq.h>
//#include <system.h>
//#include <io.h>
//#include <inttypes.h>
//#include <altera_avalon_performance_counter.h>
//#include <unistd.h>

#include <stdio.h>
#include <stdlib.h>
#include "sys/alt_dma.h"
#include "dma_ctr.h"

#ifndef NULL
#define NULL 0
#endif

#ifndef my_data
#define my_data alt_u32
#endif

volatile int dma_complete = 0;

void done_func(){
	printf("here %d \n", dma_complete);
	dma_complete = 1;
	printf("here %d \n", dma_complete);
}

////////////////////////////////////////////////////////////////////////
// Function:
void dma_transmit (
// Parameters
    int txLength, // Text length transferred in bytes
    void* ptx_source, // Source address
    void* ptx_dest    // Destination address
// Return: Nothing
// Use: DMA transmit mode transferring data from memory to peripheral
////////////////////////////////////////////////////////////////////////
){
    alt_dma_txchan txchan;

    //open dma channel
    if((txchan = alt_dma_txchan_open("/dev/dma")) == NULL){
        printf("Failed to open transmit channel. \n");
        exit(EXIT_FAILURE);
    }
    
    //configure dma mode
	if( alt_dma_txchan_ioctl(txchan, ALT_DMA_TX_ONLY_ON, ptx_dest) < 0){
        printf("Failed to set DDR2 to peripheral mode. \n");
        exit(EXIT_FAILURE);
    }
    
    //configure dma bus-width
	if(alt_dma_txchan_ioctl(txchan, ALT_DMA_SET_MODE_128, NULL) < 0)
    {
        printf("Failed to set tx mode 128\n");
        exit(EXIT_FAILURE);
    }

	dma_complete = 0;

printf("\n1. %d \n", dma_complete);
    if(alt_dma_txchan_send(txchan, ptx_source, txLength, done_func, NULL)<0){
        printf("Failed to read from DDR2 to IP. \n");
        exit(EXIT_FAILURE);
    }
printf("2. %d \n", dma_complete);
    printf("DMA data transfer from memory to peripheral is done. \n");
    alt_dma_txchan_ioctl(txchan,ALT_DMA_TX_ONLY_OFF, NULL);
    alt_dma_txchan_close (txchan);
    dma_complete = 0;
}

////////////////////////////////////////////////////////////////////////
// Function:
void dma_receive (
// Parameters
    int rxLength, // Text length transferred in bytes
    void* ptx_source, // Source address
    void* ptx_dest    // Destination address
// Return: Nothing
// Use: DMA receive mode transferring data from peripheral to memory
////////////////////////////////////////////////////////////////////////
){

    alt_dma_rxchan rxchan;

    //open dma channel
    if((rxchan = alt_dma_rxchan_open("/dev/dma")) == NULL){
        printf("Failed to open receive channel. \n");
        exit(EXIT_FAILURE);
    }

    //configure dma mode
	if( alt_dma_rxchan_ioctl(rxchan, ALT_DMA_RX_ONLY_ON, ptx_source) < 0){
        printf("Failed to set peripheral to DDR2 mode. \n");
        exit(EXIT_FAILURE);
    }

    //configure dma bus-width
	if(alt_dma_rxchan_ioctl(rxchan, ALT_DMA_SET_MODE_128, NULL) < 0)
    {
        printf("Failed to set rx mode 128\n");
        exit(EXIT_FAILURE);
    }

	dma_complete = 0;
printf("3. %d \n", dma_complete);
    if(alt_dma_rxchan_prepare(rxchan, ptx_dest, rxLength, done_func, NULL) < 0){
    	printf("Failed to post receive request. \n");
    	exit(EXIT_FAILURE);
    }
printf("4. %d \n", dma_complete);
dma_complete = 1;
    //wait until dma transaction is completed
    while (!dma_complete) ;

    printf("DMA data transfer from peripheral to memory is done. \n");
    alt_dma_rxchan_ioctl(rxchan,ALT_DMA_RX_ONLY_OFF, NULL);
    alt_dma_rxchan_close (rxchan);
    dma_complete = 0;

}

