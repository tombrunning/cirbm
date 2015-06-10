// ============================================================================
// Copyright (c) 2011 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
// Major Functions/Design Description:
//
//   Please refer to DE4_UserManual.pdf in DE4 system CD.
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   |Mod. Date:    |Changes Made:
//   V1.0  |Richard   |07/19/2011    |Init, System built by Quartus 11.0 SP1 Build 208
// ============================================================================

#include <stdio.h>
#include <system.h>
#include "terasic_includes.h"
#include "i2c.h"
#include "mem_test.h"
#include "system.h"
#include <io.h>

#define SHOW_PROGRESS

bool DDR2_RepeatRead(int Addr, int nNum){
    bool bSuccess = TRUE;
    int i, Value, FirstValue;
    FirstValue = IORD(MEM_IF_DDR2_EMIF_BASE, Addr);
    for(i=0;i<nNum;i++){
        Value = IORD(MEM_IF_DDR2_EMIF_BASE, Addr);
        if (Value != FirstValue){
            printf("Data mismatch at try=%d/%d, Read=%08Xh, Expected=%08Xh\n", i, nNum, Value, FirstValue);
            bSuccess = FALSE;
        }            
    }
    
    if (bSuccess)
        printf("Repeat read  success, addr=%d, repeat=%d, value=%08Xh\n", Addr, nNum, FirstValue); 
    return bSuccess;
}

int main(){

    bool bPass, bLoop = FALSE;
    int MemSize = MEM_IF_DDR2_EMIF_SPAN;
    int TimeStart, TimeElapsed, TestIndex = 0;
    void *ddr2_base = (void *)MEM_IF_DDR2_EMIF_BASE;
    alt_u32 InitValue;
    alt_u8 ButtonMask;
    
    
    printf("===== DE4 DDR2 Test Program (UniPHY) =====\n");
    printf("DDR2 Clock: 400 MHZ\n");
    printf("DDR2  Size: %d MBytes\n", MEM_IF_DDR2_EMIF_SPAN/1024/1024);
    //printf("DDR2  Rank: %d Rank(s)\n", DDR2_NUM_CHIPSELECTS);
    //printf("DDR2  Bank: %d Bank(s)\n", DDR2_BA_WIDTH);
    //printf("DDR2   Row: %d \n", DDR2_ROW_WIDTH);
    //printf("DDR2   Col: %d \n", DDR2_COL_WIDTH);
    
    while(1){
        printf("\n==========================================================\n");
        printf("Press any BUTTON to start test [BUTTON0 for continued test] \n");
        ButtonMask = 0x0F;
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
            // memory test
            printf("=====> DDR2 Testing, Iteration: %d\n", TestIndex);
            InitValue = alt_nticks();
            bPass = TMEM_Verify((alt_u32)ddr2_base, MemSize, InitValue);
            TimeElapsed = alt_nticks()-TimeStart;
            if (bPass){
                printf("DDR2 test pass, size=%d bytes, %.3f sec\n", MemSize, (float)TimeElapsed/(float)alt_ticks_per_second());
            }else{
                printf("DDR2 test fail\n");
            }
        }while(bLoop && bPass);
    }        
    return 0;

}
