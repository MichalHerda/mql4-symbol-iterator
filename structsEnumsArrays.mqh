#property strict

//-----------------------------------------------------------------------------------------------------------------
struct dataForWrite
  {
   string            symbolName;
   bool              risingTrend;
   int               trendDuration;
   datetime          trendOpenTime;
   double            priceRatio;
   double            trendStrength;
   double            consolidationFactor;
  };
//-----------------------------------------------------------------------------------------------------------------
struct trend 
  {
   string            symbolName;
   int               trendDuration;
   datetime          trendOpenTime;
   ENUM_TIMEFRAMES   swingsTimeFrame;
   int               swingsNumber;
   int               swingsDurationMax;
   double            swingsDurationAve;
   double            movAveDeviationMax;
   double            movAveDeviationAve;    
  };
//-----------------------------------------------------------------------------------------------------------------
struct swing 
  {
   int               position;
   int               duration;
   double            depth;  
  };
//-----------------------------------------------------------------------------------------------------------------
struct swingCalculation
  {
   int               barIdx;
   datetime          barDate;
   bool              isOverHighTfMa;
   bool              isOverMediumTfMa;
   bool              isOverLowTfMa;
   bool              wasPreviousBarUnderLowTfMa;
   int               swingNumber;
   double            highMa;
   double            mediumMa;
   double            lowMa;
   double            highDeviation;
   double            mediumDeviation;
   double            lowDeviation;   
  };
//-----------------------------------------------------------------------------------------------------------------
enum sortingKey
  {
   trendDuration,
   priceRatio,
   trendStrength,
  };
//-----------------------------------------------------------------------------------------------------------------
enum sortType
  {
   bubble,
   selection,
  };   
//-----------------------------------------------------------------------------------------------------------------
struct dataForSort
  {
   int               position;
   string            symbolName;
   double            sortingData;
  };
//-----------------------------------------------------------------------------------------------------------------  
dataForWrite dataArray[];
dataForSort sortingDataArray[];
trend trendArray[];
swing swingArray[];
swingCalculation swingCalculationArray[];
//-----------------------------------------------------------------------------------------------------------------
string forbiddenSymbolsAdmirals[] = {"USDZAR-Z", "USDZAR", "USDUAH-Z", "USDUAH", "USDTHB", "USDSGD", "USDSEK",
                                     "USDRON-Z", "USDPEN", "USDNOK", "USDMXN-Z", "USDMXN", "USDJOD-Z", "USDJOD",
                                     "USDHUF", "USDHRK-Z", "USDHRK", "USDHKD", "USDDKK-Z", "USDCNH-Z", "USDCLP-Z",
                                     "USDCLP", "USDBRL-Z", "USDBRL", "USDBGN-Z", "USDBGN", "USDAED-Z", "USDAED",
                                     "I.USDX", "I.EURX", "GLDUSD", "GBXUSD", "GBPHKD", "EURRON", "EURHKD"                           
                                    };
//-----------------------------------------------------------------------------------------------------------------