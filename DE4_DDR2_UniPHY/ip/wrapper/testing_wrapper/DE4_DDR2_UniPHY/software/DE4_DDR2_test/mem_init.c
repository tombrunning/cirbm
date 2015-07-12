// --------------------------------------------------------------------
// Copyright (c) 2009 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
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
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
// Function: Filling the targeting memory with 1s and read & display.


#include "terasic_includes.h"
#include "mem_init.h"

#define SHOW_PROGRESS

bool mem_init(alt_u32 BaseAddr, alt_u32 ByteLen, alt_u32 InitValue){
    bool bPass = TRUE;
    typedef alt_u32 my_data;
    my_data szData[2400];
    int i, nRemainedLen, nAccessLen;
    my_data *pDes, *pSrc;
    int nItemNum, nPos;
    const int my_data_size = sizeof(my_data);
#ifdef SHOW_PROGRESS
    int nProgressIndex=0;
    alt_u32 szProgress[10];
    
    for(i=0;i<10;i++){
        szProgress[i] = ByteLen/10*(i+1);
    }
    printf (">Info of the 1st value in memory: BaseAddr:%08X, ByteLen:%08X, InitValue:%08X \n", (int)BaseAddr, (int)ByteLen, (int)InitValue);
#endif    
    
    nItemNum = sizeof(szData)/sizeof(szData[0]);
    for(i=0;i<nItemNum;i++){
            szData[i] = InitValue++;
    }
    
#ifdef SHOW_PROGRESS
    printf("=====> write...\n=====> ");
#endif      
    // write
    pDes = (my_data *)BaseAddr;
    nAccessLen = sizeof(szData);
    nItemNum = nAccessLen / my_data_size;
    nPos = 0;
    while(nPos < ByteLen){
        nRemainedLen = ByteLen - nPos;
        if (nAccessLen > nRemainedLen){
            nAccessLen = nRemainedLen;
            nItemNum = nAccessLen / my_data_size;
        }    
        memcpy(pDes, szData, nAccessLen);
        pDes += nItemNum;
        nPos += nAccessLen;
#ifdef SHOW_PROGRESS
        if (nProgressIndex <= 9 && nPos >= szProgress[nProgressIndex]){
            nProgressIndex++;
            printf("%02d%% ", nProgressIndex*10);
        }
#endif           
    } 
    //printf("2 return value of this function: %b \n",bPass);
    //printf("1 return value of this function: %b \n", bPass);

    //alt_dcache_flush_all();

#ifdef SHOW_PROGRESS
    nProgressIndex = 0;
    printf("\n=====> Verifying Initialization (ignored)\n");
#endif
    //printf("3return value of this function: %d \n",bPass);
 /*
        while(bPass && nPos < ByteLen){
        nRemainedLen = ByteLen - nPos;
        if (nAccessLen > nRemainedLen){
            nAccessLen = nRemainedLen;
            nItemNum = nAccessLen / my_data_size;
        }
        pSrc++;
        nPos += nAccessLen;
#ifdef SHOW_PROGRESS
        if (nProgressIndex <= 9 && nPos >= szProgress[nProgressIndex]){
            nProgressIndex++;
            printf("%02d%% ", nProgressIndex*10);
        }
#endif
    }
    
#ifdef SHOW_PROGRESS
    printf("\n");
#endif     
    
 */

    return bPass;
}

