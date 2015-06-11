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
#include <sys/alt_dma.h>
#include "dma_ctr.h"

volatile int dma_complete = 0;

void done_func(){
	printf("here %d \n", dma_complete);
	dma_complete = 1;
	printf("here %d \n", dma_complete);
}

void dma_transmit (alt_u32 txLength, void* ptx_source, void* ptx_dest){

    alt_dma_txchan txchan;

    //open dma channel
    if((txchan = alt_dma_txchan_open("/dev/dma")) == NULL){
        printf("Failed to open transmit channel. \n");
        exit(EXIT_FAILURE);
    }
    
    //configure dma mode
	if(alt_dma_txchan_ioctl(txchan, ALT_DMA_TX_ONLY_ON, ptx_dest) < 0){
        printf("Failed to set DDR2 to peripheral mode. \n");
        exit(EXIT_FAILURE);
    }
    
    //configure dma bus-width, this step is unnecessary if above
    //destination address has already been defined.

    //if(alt_dma_txchan_ioctl(txchan, ALT_DMA_SET_MODE_32, NULL) < 0)
    //{
    //    printf("Failed to set tx mode 32\n");
    //    exit(EXIT_FAILURE);
    //} 
printf("1. %d \n", dma_complete);
    if(alt_dma_txchan_send(txchan, ptx_source, txLength, done_func, NULL)<0){
        printf("Failed to read from DDR2 to IP. \n");
        exit(EXIT_FAILURE);
    }
printf("2. %d \n", dma_complete);
    printf("DMA data transfer from DDR2 to IP is done. \n");
}

void dma_receive (alt_u32 txLength, void* ptx_source, void* ptx_dest){

    alt_dma_rxchan rxchan;

    if(alt_dma_rxchan_prepare(rxchan, ptx_dest, txLength, done_func, NULL) < 0){
    	printf("Failed to post receive request. \n");
    	exit(EXIT_FAILURE);
    }

    //wait until dma transaction is completed
    int temp = 0;
printf("3. %d \n", temp);
    while (temp != 1000) {temp++;}
printf("4. %d \n", temp);
    printf("DMA data transfer from IP to DDR2 is done. \n");
    alt_dma_rxchan_close (rxchan);


}

