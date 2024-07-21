#include "structsEnumsArrays.mqh"
#include "globalInputs.mqh"
//-----------------------------------------------------------------------------------------------------------------
struct timePeriod
   {
    datetime beginDate;
    datetime endDate;
   };
//-----------------------------------------------------------------------------------------------------------------
timePeriod timePeriodArray[];
//-----------------------------------------------------------------------------------------------------------------
void fillTimePeriodArray(string symbol)
   {
    ArrayResize(timePeriodArray, 0);
    bool isPeriodWriting = false;
    
    for (int i = ArraySize(swingCalculationArray) - 1; i >= 0; i--) {
      
         if(isPeriodWriting) {
            if(!swingCalculationArray[i].isLowTrendRising || !swingCalculationArray[i].isMediumTrendRising) {
               isPeriodWriting = false;
               datetime endDate = iTime(symbol, lowTimeFrame, i); 
               timePeriodArray[ArraySize(timePeriodArray) - 1].endDate = endDate; 
            }
         }   
         else {
            if(swingCalculationArray[i].isLowTrendRising && swingCalculationArray[i].isMediumTrendRising) {
               isPeriodWriting = true;
               ArrayResize(timePeriodArray, ArraySize(timePeriodArray) + 1);
               datetime beginDate = iTime(symbol, lowTimeFrame, i);
               timePeriodArray[ArraySize(timePeriodArray) - 1].beginDate = beginDate;
            }
         }
    }   
    Print("timePeriodArray size: ", ArraySize(timePeriodArray));
    
    int fileHandle = FileOpen("timePeriodArray", FILE_WRITE);
    
    if(fileHandle != INVALID_HANDLE) {
      for(int i = 0; i < ArraySize(timePeriodArray); i++) {
         FileWrite(fileHandle,
                   i + 1,
                   timePeriodArray[i].beginDate,
                   timePeriodArray[i].endDate);
      }
      FileClose(fileHandle);
    }
    else {
      Print("chartIndicators invalid handle");
    }       
   }
          
//-----------------------------------------------------------------------------------------------------------------   
   