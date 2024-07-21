#include "structsEnumsArrays.mqh"

//-----------------------------------------------------------------------------------------------------------------
datetime getBarOpenTime(string symbol, ENUM_TIMEFRAMES tf, int barIdx)
   {
    return iTime(symbol, tf, barIdx);
   }
//-----------------------------------------------------------------------------------------------------------------
bool isShare(string symbol)
   {
    int firstCharCode = StringGetChar(symbol, 0);
    return firstCharCode == '#';
   }
//-----------------------------------------------------------------------------------------------------------------
bool isSymbolForbidden(string symbol)
   {
    for(int i = 0; i < ArraySize(forbiddenSymbolsAdmirals); i++) {
      if(symbol == forbiddenSymbolsAdmirals[i]) {
         //Print("symbol forbidden !!!");
         return true;
      }
    }
    return false;
   }
//-----------------------------------------------------------------------------------------------------------------
double getAllTimeMinimumPrice(string symbol) 
   {
    int lowestMonthlyBarIdx = iLowest(symbol, PERIOD_MN1, MODE_LOW);
    
    return iLow(symbol, PERIOD_MN1, lowestMonthlyBarIdx);    
   }
//-----------------------------------------------------------------------------------------------------------------
double getAllTimeMaximumPrice(string symbol) 
   {
    int highestMonthlyBarIdx = iHighest(symbol, PERIOD_MN1, MODE_LOW);
    
    return iHigh(symbol, PERIOD_MN1, highestMonthlyBarIdx);    
   }   
//-----------------------------------------------------------------------------------------------------------------
double getSpan(string symbol) 
   {
    double minimum = getAllTimeMinimumPrice(symbol);   
    double maximum = getAllTimeMaximumPrice(symbol);
    
    return maximum - minimum;
   }
//-----------------------------------------------------------------------------------------------------------------   
double getPriceRatio(double lowestPrice, double highestPrice, double currentPrice)
  {

   double span = highestPrice - lowestPrice;
   double calculatedPrice = currentPrice - lowestPrice;
   if( (span != 0) && (highestPrice > lowestPrice) )
      {
       return (calculatedPrice / span) * 100;
      }
   else
       return 0;    

  }
//-----------------------------------------------------------------------------------------------------------------
bool isRisingTrend(string symbol, ENUM_TIMEFRAMES tf, int period)
  {
   double movAveBar1 = iMA(symbol, tf, period, 1, MODE_SMA, PRICE_CLOSE, 0);
   double movAveBar2 = iMA(symbol, tf, period, 2, MODE_SMA, PRICE_CLOSE, 0);

   return movAveBar1 > movAveBar2;
  }
//-----------------------------------------------------------------------------------------------------------------
int getGreenBarsNo(string symbol, ENUM_TIMEFRAMES tf, int period)
  {

   int green = 0;
   for(int j = 1; j <= period; j++)
     {
      if((iClose(symbol, tf,  j - 1)) > ((iOpen(symbol, tf, j))))
        {
         green++;
        }
     }

   return green;
  }
//-----------------------------------------------------------------------------------------------------------------
int getRedBarsNo(string symbol, ENUM_TIMEFRAMES tf, int period)
  {

   int red = 0;
   for(int j = 1; j <= period; j++)
     {
      if((iClose(symbol, tf,  j - 1)) < ((iOpen(symbol, tf, j))))
        {
         red++;
        }
     }

   return red;
  }
//-----------------------------------------------------------------------------------------------------------------
int getTrendDuration(string symbol, ENUM_TIMEFRAMES tf, int period, double movAveBar1, double movAveBar2)
  {
   int trendDuration = 0;
   while(movAveBar1 > movAveBar2)
     {
      movAveBar1 = iMA(symbol, tf, period, trendDuration + 1, MODE_SMA, PRICE_CLOSE, 0);
      movAveBar2 = iMA(symbol, tf, period, trendDuration + 2, MODE_SMA, PRICE_CLOSE, 0);
      trendDuration++;
     }

   return trendDuration;
  }
//-----------------------------------------------------------------------------------------------------------------
double getTrendStrength(string symbol, ENUM_TIMEFRAMES tf, int period, 
                        int trendDuration, double highestPrice, double lowestPrice)
  {
   double trendOpenPrice = iOpen(symbol, tf, trendDuration);
   double trendClosePrice = iClose(symbol, tf, 1);

   double span = highestPrice - lowestPrice;

   if(span != 0)
     {
      return ((trendClosePrice - trendOpenPrice) / span) * 100;
     }
   else
      return 0;
  }
//-----------------------------------------------------------------------------------------------------------------
double getMinimumPrice(string symbol, ENUM_TIMEFRAMES tf, int period)
   {
     
      int lowestBarIdx = iLowest(symbol, tf, MODE_LOW, 0, period);
      Print("lowest value on bar: ", lowestBarIdx," of given period.");
      
      return iLow(symbol, tf, lowestBarIdx);
            
   }  
//-----------------------------------------------------------------------------------------------------------------
double getMaximumPrice(string symbol, ENUM_TIMEFRAMES tf, int period)
   {
     
      int highestBarIdx = iHighest(symbol, tf, MODE_LOW, 0, period);
      Print("highest value on bar: ", highestBarIdx," of given period.");
      
      return iHigh(symbol, tf, highestBarIdx);
            
   }  
//-----------------------------------------------------------------------------------------------------------------
double getConsolidationFactor(string symbol, ENUM_TIMEFRAMES tf, int period) 
   {
      double minimumPeriodPrice = getMaximumPrice(symbol, tf, period);
      double maximumPeriodPrice = getMinimumPrice(symbol, tf, period);
      
      double consolidationFactor = 0;
      return consolidationFactor;         
   }