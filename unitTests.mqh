#property strict

#include "structsEnumsArrays.mqh"
#include "globalInputs.mqh"

//-----------------------------------------------------------------------------------------------------------------
void calculateIsPriceAboveMovingAverageOnTrendBegin()
   {    
    bool trendBeginArray[];
    int fileHandle = FileOpen("trendBegin", FILE_WRITE);
    ArrayResize(trendBeginArray, 0);
    
    if(fileHandle != INVALID_HANDLE) {
         for(int i = 0; i < ArraySize(dataArray); i++) {
            ArrayResize(trendBeginArray , ArraySize(trendBeginArray) + 1);
            datetime trendBegin = iTime(dataArray[i].symbolName, mediumTimeFrame, dataArray[i].trendDuration);
            int lowTrendBeginShift = iBarShift(dataArray[i].symbolName, lowTimeFrame, trendBegin);
            double openLowTrendPrice = iOpen(dataArray[i].symbolName, lowTimeFrame, lowTrendBeginShift);
            double openLowMovingAve = iMA(dataArray[i].symbolName, lowTimeFrame, movingAveragePeriod, 
                                             lowTrendBeginShift, MODE_SMA, PRICE_CLOSE, 0);
            
            if(openLowTrendPrice >= openLowMovingAve) trendBeginArray[i] = true;
                                                    else
                                                      trendBeginArray[i] = false;   
            
            FileWrite(fileHandle, dataArray[i].symbolName, 
                      iTime(dataArray[i].symbolName, lowTimeFrame, lowTrendBeginShift), 
                      trendBeginArray[i],
                      "price: ", openLowTrendPrice, "ma: ", openLowMovingAve);                                                                                 
         }   
         FileClose(fileHandle);
    }
    else
         Print("calculateIsPriceAboveMovingAverageOnTrendBegin invalid handle");
   }
//-----------------------------------------------------------------------------------------------------------------
void calculateAllBarsNumber(ENUM_TIMEFRAMES tf) 
   {
    int barsNoInformationArray[];
    ArrayResize(barsNoInformationArray, 0);
    int fileHandle = FileOpen("barsNumber" + tf, FILE_WRITE);
    
    if(fileHandle != INVALID_HANDLE) {
       for(int i = 0; i < ArraySize(dataArray); i++) {
         ArrayResize(barsNoInformationArray, ArraySize(barsNoInformationArray) + 1);
         string symbolname = dataArray[i].symbolName;
         barsNoInformationArray[i] = iBars(symbolname, tf); 
         FileWrite(fileHandle, symbolname, tf, barsNoInformationArray[i],
                   iTime(dataArray[i].symbolName, tf, iBars(symbolname, tf) - 1));
       }
       FileClose(fileHandle);
    }
    else 
         Print("calculateAllBarsNumber invalid handle");
          
   }
//-----------------------------------------------------------------------------------------------------------------
void testMovingAverageValues(string symbol, ENUM_TIMEFRAMES tf, int number, string fileName, 
                             int decimalPlaces, int trendDuration)      
   {
    double movingAverageValuesArray[];
    ArrayResize(movingAverageValuesArray, 0);
    int fileHandle = FileOpen(fileName, FILE_WRITE);
    
    if(fileHandle != INVALID_HANDLE) {
       FileWrite(fileHandle, "trend ", tf," start at: ", iTime(symbol, tf, trendDuration));
       for(int i = 0; i < number; i++) {         
         ArrayResize(movingAverageValuesArray, ArraySize(movingAverageValuesArray) + 1);
         movingAverageValuesArray[i] = iMA(symbol, mediumTimeFrame, movingAveragePeriod, i + 1, MODE_SMA, PRICE_CLOSE, 0);
         movingAverageValuesArray[i] = NormalizeDouble(movingAverageValuesArray[i], decimalPlaces);
         FileWrite(fileHandle, i + 1, movingAverageValuesArray[i]);
       }
        
       FileWrite(fileHandle, "trendDuration correct: ", isTrendDurationDataCorrect(symbol, movingAverageValuesArray, trendDuration));
       FileClose(fileHandle);
       
    }
    else {
         Print("testMovingAverage invalid handle");
    }       
   }
//-----------------------------------------------------------------------------------------------------------------
bool isTrendDurationDataCorrect(string symbol, double &movingAverageValuesArray[], int trendDuration)
   {
    for(int i = 0; i < trendDuration - 1 ; i++) {
      if(movingAverageValuesArray[i] >= movingAverageValuesArray[i + 1]) continue;
         else 
      {Print(symbol, ": trend duration test failed"); return false;}      
    }
    if(movingAverageValuesArray[trendDuration - 1] < movingAverageValuesArray[trendDuration - 2]) return true;
         else
      {Print(symbol, ": trend duration test failed"); return false;}   
   }
//-----------------------------------------------------------------------------------------------------------------   