#property strict

#include "structsEnumsArrays.mqh"
//-----------------------------------------------------------------------------------------------------------------
void writeMarginInfo(dataForWrite &dataArray[]) 
   {
    int fileHandle = FileOpen("requiredMargin1lot", FILE_WRITE);
       for(int i = 0; i < ArraySize(dataArray); i++) {
        FileWrite(fileHandle, dataArray[i].symbolName, 
                  MarketInfo(dataArray[i].symbolName, MODE_MARGINREQUIRED), 
                  MarketInfo(dataArray[i].symbolName, MODE_MINLOT), 
                  MarketInfo(dataArray[i].symbolName, MODE_MARGINREQUIRED ) * MarketInfo(dataArray[i].symbolName, MODE_MINLOT));
       }
    FileClose(fileHandle);    
   }
//-----------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------   