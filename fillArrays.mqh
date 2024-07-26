#property strict

#include "structsEnumsArrays.mqh"
#include "globalInputs.mqh"
#include "calculations.mqh"
#include "unitTests.mqh"

//-----------------------------------------------------------------------------------------------------------------
void fillDataArrayWithElements(string symbolName, bool risingTrend, int trendDuration, 
                               datetime trendOpenTime,
                               double priceRatio, double trendStrength)
  { 
   if(isShare(symbolName) && !includeShares) {
      //Print("shares are not writing");
      return;
   }
   else if(isSymbolForbidden(symbolName)) {
      //Print("forbidden symbol");
      return;
   }
   else {
      dataForWrite arrayElement;
      arrayElement.symbolName = symbolName;
      arrayElement.risingTrend = risingTrend;
      arrayElement.trendDuration = trendDuration;
      arrayElement.trendOpenTime = trendOpenTime;
      arrayElement.priceRatio = priceRatio;
      arrayElement.trendStrength = trendStrength;
   
      ArrayResize(dataArray, ArraySize(dataArray) + 1);
      dataArray[ArraySize(dataArray) - 1] = arrayElement;
      
      if(risingTrend) {
         testMovingAverageValues(symbolName, mediumTimeFrame, trendDuration + 5, symbolName + "_iMA", 6, trendDuration);
      }
   }
  }
//-----------------------------------------------------------------------------------------------------------------
void fillSortingDataArrayWithElements(sortingKey structElement)
  {

   int arraySize = ArraySize(dataArray);

   for(int i  = ArraySize(sortingDataArray) - 1; i > 0 ; i--)
     {
      sortingDataArray[i].position = i;
      sortingDataArray[i].symbolName = "";
      sortingDataArray[i].sortingData = 0;
      ArrayResize(sortingDataArray, ArraySize(sortingDataArray) - 1);
     }

   dataForSort arrayElement;

      for(int i = 0; i < arraySize; i++)
        {

         //Print(i, ": ", "sorting data:", structElement, "symbolName: ", dataArray[i].symbolName);
         arrayElement.symbolName  = dataArray[i].symbolName;

         switch(structElement)
              {   
               case trendDuration:
                  arrayElement.sortingData = dataArray[i].trendDuration;
                  break;
   
               case priceRatio:
                  arrayElement.sortingData = dataArray[i].priceRatio;
                  break;
   
               case trendStrength:
                  arrayElement.sortingData = dataArray[i].trendStrength;
                  break;
   
               default:
                  Print("enumeration error");
                  break;
              }
              
         ArrayResize(sortingDataArray, ArraySize(sortingDataArray) + 1);
         sortingDataArray[ArraySize(sortingDataArray) - 1] = arrayElement;
         
        }
  }
//-----------------------------------------------------------------------------------------------------------------
void writeSortedArray(sortingKey structElement, string fileName)
  {

   int arraySize = ArraySize(sortingDataArray);
   int fileHandle = FileOpen(fileName, FILE_WRITE);

   for(int i = 0; i < arraySize; i++)
     {
      if(fileHandle != INVALID_HANDLE)
        {
         FileWrite(fileHandle, i ," symbol: ", sortingDataArray[i].symbolName, 
                   EnumToString(structElement), ": ", sortingDataArray[i].sortingData);
        }
      else
        {
         Print("sortFile opening failed!");
        }
     }
   FileClose(fileHandle);
  }
//-----------------------------------------------------------------------------------------------------------------