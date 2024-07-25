#property strict

#include "structsEnumsArrays.mqh"
#include "globalInputs.mqh"
//-----------------------------------------------------------------------------------------------------------------
void bubbleSorting()
  {

   dataForSort temp;
   bool swapped;

   for(int j = 0; j < ArraySize(sortingDataArray) - 1; j++)
     {
      swapped = false;
      for(int i = 0; i < ArraySize(sortingDataArray) - 1 - j; i++)
        {         
         if(sortingDataArray[i].sortingData < sortingDataArray[i+1].sortingData)
           {
            temp = sortingDataArray[i];
            sortingDataArray[i] = sortingDataArray[i+1];
            sortingDataArray[i+1] = temp;
            swapped = true;
           }
           
        }
        if (swapped == false) break;
     }
   for(int k=0; k < ArraySize(sortingDataArray); k++)
     {
      Print(k, ": ", sortingDataArray[k].symbolName, ": ", sortingDataArray[k].sortingData);
     }
  }
//-----------------------------------------------------------------------------------------------------------------
void selectionSorting()
   {
   
    dataForSort temp;
    
    for(int j = 0; j < ArraySize(sortingDataArray) - 1; j++)
      {
       int minimumIdx = j;
       for(int i = j + 1; i < ArraySize(sortingDataArray); i++) 
         {
          if(sortingDataArray[i].sortingData > sortingDataArray[minimumIdx].sortingData) minimumIdx = i;
         }  
         
       if(minimumIdx != j) 
         {
          temp = sortingDataArray[minimumIdx];
          sortingDataArray[minimumIdx] = sortingDataArray[j];
          sortingDataArray[j] = temp;
         }   
      }
   }
//-----------------------------------------------------------------------------------------------------------------
void sort()
   {
    switch(usedSorting)
      {
       case bubble:
         //Print("start bubble sorting");
         bubbleSorting();
         break;
         
       case selection:
         //Print("start selection sorting");
         selectionSorting();
         break;
         
       default:
         Print("no sorting selected");
         break;      
      }
   }
//-----------------------------------------------------------------------------------------------------------------   