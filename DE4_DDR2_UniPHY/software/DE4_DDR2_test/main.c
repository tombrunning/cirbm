// ============================================================================
// RMB FPGA
// ============================================================================
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   |Mod. Date:    |Changes Made:
//   V1.0  |Jiang Su  |06/07/2015    |DDR2+Pipelining memory reader+simple ip
// ============================================================================

#include <stdio.h>
#include <system.h>
#include "terasic_includes.h"
#include "i2c.h"
#include "mem_init.h"
#include "dma_ctr.h"
#include "system.h"
#include <io.h>

#define SHOW_PROGRESS

int main(){

    bool bPass, bLoop = FALSE;
    int MemSize = MEM_IF_DDR2_EMIF_SPAN;
    int TimeStart, TimeElapsed, TestIndex = 0;
    void *ddr2_base = (void *)MEM_IF_DDR2_EMIF_BASE;
    alt_u32 InitValue;
    alt_u8 ButtonMask;
    char go = 0;

    //DDR2 Initialisation
    printf("//////////////////// DE4 DDR2 SDRAM Information /////////////////////////\n");
    printf("DDR2  Size: %d MBytes\n\n\n", MEM_IF_DDR2_EMIF_SPAN/1024/1024);


    while(1){
        printf("//////////////////// Memory Initialization //////////////////////////////\n");
        ButtonMask = 0x00;
        while((ButtonMask & 0x0F) == 0x0F){
            ButtonMask = IORD(BUTTON_BASE, 0) & 0x0F;
        }
        
        if ((ButtonMask & 0x01) == 0x00){
            bLoop = TRUE;
        }else{
            bLoop = FALSE;
        }                    
        
        bPass = TRUE;
        TestIndex = 0;
        
        do{
            TimeStart = alt_nticks();
            TestIndex++;
            InitValue = 0x00000001;
            printf("=====> DDR2 Initialization Iteration: %d\n", TestIndex);
            bPass = mem_init((alt_u32)ddr2_base, MemSize, InitValue);
            TimeElapsed = alt_nticks()-TimeStart;
            if (bPass){
                printf("> DDR2 Initialisation is Completed! size=%d bytes, %.3f sec\n\n\n", MemSize, (float)TimeElapsed/(float)alt_ticks_per_second());
            }else{
                printf("> DDR2 Initialisation is failed. \n");
            }
            bLoop = FALSE;
        }while(bLoop && bPass);

        //IP
        int rbmTimeStart, rbmTimeElapsed = 0;
        int DATA_WIDTH = 32;
        int too_many_iters = 0;
        alt_u32 length_in_byte = 20000;
        alt_u32 target_trans = length_in_byte/4;

        alt_u32 start_ip = 1;
        alt_u32 reset_ip = 1;
        alt_u32 num_trans = 0;

        printf("//////////////////// Data Transfer and IP Activation ////////////////////\n");
        rbmTimeStart = alt_nticks();

        IOWR_32DIRECT(WRAPPER_0_BASE, 0xC, reset_ip);

        IOWR_32DIRECT(WRAPPER_0_BASE, 0x0, MEM_IF_DDR2_EMIF_BASE);

        IOWR_32DIRECT(WRAPPER_0_BASE, 0x4, length_in_byte);

        IOWR_32DIRECT(WRAPPER_0_BASE, 0x8, start_ip);
        //usleep(5000);

        while(num_trans != target_trans && too_many_iters <= target_trans){
        	num_trans = IORD_32DIRECT(WRAPPER_0_BASE,0x0);
        	too_many_iters=+1;
        }

        rbmTimeElapsed = alt_nticks()-rbmTimeStart;

        if(too_many_iters > target_trans){
        	printf(">Data transfer between memory and IP was failed and target transfer amount was not achieved.\n");
        }else{
			printf(">Time cost by IP is: %.3f sec \n", (float)rbmTimeElapsed/(float)alt_ticks_per_second());
			printf(">The number of words transferred is %d. \n>Each word is %d bits\n", (int)num_trans, DATA_WIDTH);
			printf(">Memory info:\n");
			//pointers for testing purpose
			alt_u32* pAddr = 0x00000000;
			printf ("BBAddress: 0x%08X------- Value: 0x%08X \n", (int)(pAddr), (int)(*pAddr));
			printf ("BBAddress: 0x%08X------- Value: 0x%08X \n", (int)(++pAddr), (int)(*pAddr));
			printf ("BBAddress: 0x%08X------- Value: 0x%08X \n", (int)(++pAddr), (int)(*pAddr));
			printf ("BBAddress: 0x%08X------- Value: 0x%08X \n", (int)(++pAddr), (int)(*pAddr));
			printf ("BBAddress: 0x%08X------- Value: 0x%08X \n", (int)(++pAddr), (int)(*pAddr));
			printf ("BBAddress: 0x%08X------- Value: 0x%08X \n", (int)(++pAddr), (int)(*pAddr));
			printf ("BBAddress: 0x%08X------- Value: 0x%08X \n", (int)(++pAddr), (int)(*pAddr));
			printf("Repeat RBM?");
        }
    	go = getchar();
    	go = getchar();
    	if (go == 'n' || go == 'N') break;

    }

    printf("End. \n");
    return 0;

}
