/*
 * dma_ctr.h
 *
 *  Created on: 10 Jun 2015
 *      Author: js2113
 */
#ifndef DMA_CTR_H_
#define DMA_CTR_H_

#define EXIT_FAILURE 1

void done_func();
void dma_transmit (int txLength, void* ptx_source, void* ptx_dest);
void dma_receive (int rxLength, void* ptx_source, void* ptx_dest);

#endif /* DMA_CTR_H_ */
