#property strict

#include "structsEnumsArrays.mqh"
//-----------------------------------------------------------------------------------------------------------------
void writeMarginInfo() 
   {
    int fileHandle = FileOpen("requiredMargin1lot", FILE_WRITE);
       for(int i = 0; i < ArraySize(dataArray); i++) {
        FileWrite(fileHandle, dataArray[i].symbolName, 
                  NormalizeDouble(MarketInfo(dataArray[i].symbolName, MODE_MARGINREQUIRED), 2), 
                  MarketInfo(dataArray[i].symbolName, MODE_MINLOT), 
                  NormalizeDouble((MarketInfo(dataArray[i].symbolName, MODE_MARGINREQUIRED ) * MarketInfo(dataArray[i].symbolName, MODE_MINLOT)), 2));
       }
    FileClose(fileHandle);    
   }
//-----------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------   