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
extern ENUM_TIMEFRAMES swingsTimeFrame = PERIOD_M30;
extern int lowMovingAveragePeriod = 20;
extern ENUM_TIMEFRAMES lowTimeFrame = PERIOD_M30;
extern int mediumMovingAveragePeriod = 10;
extern ENUM_TIMEFRAMES mediumTimeFrame = PERIOD_H4;
extern int highMovingAveragePeriod = 5;
extern ENUM_TIMEFRAMES highTimeFrame = PERIOD_D1;
string allFileName = "allData.txt";
extern sortingKey sortingData = trendDuration;
extern bool writingIndicatorsEnable = true;
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