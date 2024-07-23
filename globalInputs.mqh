#property strict

#include "structsEnumsArrays.mqh"

//-----------------------------------------------------------------------------------------------------------------
extern int barsNo = 30;
extern int movingAveragePeriod = 100;
extern ENUM_TIMEFRAMES lowTimeFrame = PERIOD_M30;
extern ENUM_TIMEFRAMES mediumTimeFrame = PERIOD_H4;
extern ENUM_TIMEFRAMES highTimeFrame = PERIOD_W1;
string allFileName = "allData.txt";
extern sortingKey sortingData = trendDuration;
extern sortType usedSorting = selection;
extern bool includeShares = false;
extern ENUM_TIMEFRAMES swingsTimeFrame = PERIOD_M30;
extern color lowTimeFrameRectColor = clrMidnightBlue;   
extern color firstLowBarLineColor = clrCoral;
extern color firstImaPeriodBarColor = clrAqua;
//-----------------------------------------------------------------------------------------------------------------