#property strict
//-----------------------------------------------------------------------------------------------------------------
#include "structsEnumsArrays.mqh"
//-----------------------------------------------------------------------------------------------------------------
extern int movingAveragePeriod = 100;
extern ENUM_TIMEFRAMES swingsTimeFrame = PERIOD_M30;
extern ENUM_TIMEFRAMES lowTimeFrame = PERIOD_M30;
extern ENUM_TIMEFRAMES mediumTimeFrame = PERIOD_H4;
extern ENUM_TIMEFRAMES highTimeFrame = PERIOD_W1;
string allFileName = "allData.txt";
extern sortingKey sortingData = trendDuration;
extern sortType usedSorting = selection;
extern bool includeShares = false;
extern color lowTimeFrameRectColor = clrMidnightBlue;   
extern color firstLowBarLineColor = clrCoral;
extern color firstImaPeriodBarColor = clrAqua;
extern double trendDurationFilterLow = 5;
extern double trendDurationFilterHigh = 1000;
extern double priceRatioFilterLow = 50;
extern double priceRatioFilterHigh = 95;
extern double trendStrengthFilterLow = 2;
extern double trendStrengthFilterHigh = 90; 
extern int barsNo = 30;
//-----------------------------------------------------------------------------------------------------------------