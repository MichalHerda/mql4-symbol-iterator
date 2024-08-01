#property strict
//-----------------------------------------------------------------------------------------------------------------
#include "structsEnumsArrays.mqh"
//-----------------------------------------------------------------------------------------------------------------
extern int movingAveragePeriod = 20;
extern movAveCombination maCombination = ALL;
extern bool lowTimeFrameCriterium = true;
extern bool mediumTimeFrameCriterium = true;
extern bool highTimeFrameCriterium = true; 
extern int swingMovingAveragePeriod = 10;
extern ENUM_TIMEFRAMES swingsTimeFrame = PERIOD_M30;
extern int lowMovingAveragePeriod = 20;
extern ENUM_TIMEFRAMES lowTimeFrame = PERIOD_M30;
extern int mediumMovingAveragePeriod = 10;
extern ENUM_TIMEFRAMES mediumTimeFrame = PERIOD_H4;
extern int highMovingAveragePeriod = 5;
extern ENUM_TIMEFRAMES highTimeFrame = PERIOD_D1;
string allFileName = "allData.txt";
extern sortingKey sortingData = trendDuration;
sortType usedSorting = selection;
bool includeShares = false;
color lowTimeFrameRectColor = clrMidnightBlue;   
color firstLowBarLineColor = clrCoral;
color firstImaPeriodBarColor = clrAqua;
double trendDurationFilterLow = 1;
double trendDurationFilterHigh = 10000;
double priceRatioFilterLow = 1;
double priceRatioFilterHigh = 100;
double trendStrengthFilterLow = 1;
double trendStrengthFilterHigh = 100; 
int barsNo = 30;
//-----------------------------------------------------------------------------------------------------------------