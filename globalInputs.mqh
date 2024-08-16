#property strict
//-----------------------------------------------------------------------------------------------------------------
#include "structsEnumsArrays.mqh"
//-----------------------------------------------------------------------------------------------------------------
extern int movingAveragePeriod = 20;
movAveCombination maCombination;
extern bool lowTimeFrameCriterium = true;
extern bool mediumTimeFrameCriterium = false;
extern bool highTimeFrameCriterium = false; 
extern int swingMovingAveragePeriod = 10;
ENUM_TIMEFRAMES swingsTimeFrame;
extern int lowMovingAveragePeriod = 20;
extern ENUM_TIMEFRAMES lowTimeFrame = PERIOD_M30;
extern int mediumMovingAveragePeriod = 5;
extern ENUM_TIMEFRAMES mediumTimeFrame = PERIOD_H4;
extern int highMovingAveragePeriod = 10;
extern ENUM_TIMEFRAMES highTimeFrame = PERIOD_D1;
extern int adxPeriod = 5;
extern ENUM_TIMEFRAMES adxTimeFrame = PERIOD_H4;
string allFileName = "allData.txt";
extern sortingKey sortingData = trendDuration;
extern bool writingIndicatorsEnable = true;
sortType usedSorting = selection;
bool includeShares = false;
color lowTimeFrameRectColor = clrMidnightBlue;   
color firstLowBarLineColor = clrCoral;
color firstImaPeriodBarColor = clrAqua;
double trendDurationFilterLow = 0;
double trendDurationFilterHigh = 1000000;
double priceRatioFilterLow = 0;
double priceRatioFilterHigh = 100;
double trendStrengthFilterLow = 1;
double trendStrengthFilterHigh = 100; 
int barsNo = 30;
bool timerInitialized = false;
//-----------------------------------------------------------------------------------------------------------------
void setMaCombination() {
    int combination = (lowTimeFrameCriterium << 2) | (mediumTimeFrameCriterium << 1) | highTimeFrameCriterium;
    switch (combination) {
        case 0: maCombination = NONE; break;
        case 1: maCombination = HIGH; break;
        case 2: maCombination = MEDIUM; break;
        case 3: maCombination = MEDIUM_HIGH; break;
        case 4: maCombination = LOW; break;
        case 5: maCombination = LOW_HIGH; break;
        case 6: maCombination = LOW_MEDIUM; break;
        case 7: maCombination = ALL; break;
    }
}
//-----------------------------------------------------------------------------------------------------------------
void setSwingTimeFrame() {
   int combination = (lowTimeFrameCriterium << 2) | (mediumTimeFrameCriterium << 1) | highTimeFrameCriterium;
   switch (combination) {
        case 0: swingsTimeFrame = lowTimeFrame; break;
        case 1: swingsTimeFrame = highTimeFrame; break;
        case 2: swingsTimeFrame = mediumTimeFrame; break;
        case 3: swingsTimeFrame = mediumTimeFrame; break;
        case 4: swingsTimeFrame = lowTimeFrame; break;
        case 5: swingsTimeFrame = lowTimeFrame; break;
        case 6: swingsTimeFrame = lowTimeFrame; break;
        case 7: swingsTimeFrame = lowTimeFrame; break;
    }
}
//-----------------------------------------------------------------------------------------------------------------