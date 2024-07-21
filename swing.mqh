#property strict

#include "structsEnumsArrays.mqh"
#include "globalInputs.mqh"
#include "calculations.mqh"

void writeSwingCalculationArray(string symbol) 
   {
    ArrayResize(swingCalculationArray, 0);
    Print("swingCalculationArray size: ", ArraySize(swingCalculationArray));
    
    int allBarsAvailable = iBars(symbol, lowTimeFrame);
    int firstBarIdx = allBarsAvailable - movingAveragePeriod - 1;
    Print("first bar idx: ", firstBarIdx);
    
    datetime firstBarDate = iTime(symbol, lowTimeFrame, firstBarIdx);
    Print("first bar date: ", firstBarDate);
    
    ArrayResize(swingCalculationArray, firstBarIdx);
    Print("swingCalculationArray size: ", ArraySize(swingCalculationArray) - 1);
    
    int fileHandle = FileOpen("swing", FILE_WRITE);
    
    if(fileHandle != INVALID_HANDLE) {
    
       for(int i = firstBarIdx - 1; i >= 0; i--) {
         swingCalculationArray[i].barIdx = i + 1;
         swingCalculationArray[i].barDate = iTime(symbol, lowTimeFrame, i);
         swingCalculationArray[i].lowMa = NormalizeDouble(iMA(symbol, lowTimeFrame, movingAveragePeriod, 
                                                          i, MODE_SMA, PRICE_CLOSE, 0), 2);
         
         int mediumTfBarIdx = iBarShift(symbol, mediumTimeFrame, swingCalculationArray[i].barDate);
         swingCalculationArray[i].mediumMa = NormalizeDouble(iMA(symbol, mediumTimeFrame, movingAveragePeriod, 
                                                             mediumTfBarIdx, MODE_SMA, PRICE_CLOSE, 0), 2);
       
         int highTfBarIdx = iBarShift(symbol, highTimeFrame, swingCalculationArray[i].barDate);
         swingCalculationArray[i].highMa = NormalizeDouble(iMA(symbol, highTimeFrame, movingAveragePeriod, 
                                                             highTfBarIdx, MODE_SMA, PRICE_CLOSE, 0), 2);
                                                             
         swingCalculationArray[i].mediumDeviation = NormalizeDouble(iClose(symbol, lowTimeFrame, i) - 
                                                                    swingCalculationArray[i].mediumMa, 2);    
                                                                                                                    
         swingCalculationArray[i].highDeviation = NormalizeDouble(iClose(symbol, lowTimeFrame, i) - 
                                                                    swingCalculationArray[i].highMa, 2); 
                                                                    
         swingCalculationArray[i].isMediumTrendRising = isRisingTrend(symbol, mediumTimeFrame, movingAveragePeriod,
                                                                      mediumTfBarIdx, mediumTfBarIdx + 1);
         swingCalculationArray[i].isLowTrendRising = isRisingTrend(symbol, lowTimeFrame, movingAveragePeriod,
                                                                   i, i + 1);
                                                                                                      
         FileWrite(fileHandle,
                   swingCalculationArray[i].barIdx,    
                   swingCalculationArray[i].barDate,
                   swingCalculationArray[i].lowMa,
                   swingCalculationArray[i].mediumMa,
                   swingCalculationArray[i].highMa,
                   swingCalculationArray[i].mediumDeviation,
                   swingCalculationArray[i].highDeviation,   
                   swingCalculationArray[i].isMediumTrendRising,
                   swingCalculationArray[i].isLowTrendRising);                          
       }
       FileClose(fileHandle);
     }
     else
         Print("swing invalid handle");    
   }