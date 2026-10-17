import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

/** process values, user and heating engineer parameters shared by all heating circuit controllers */
namespace Hc_inc {
  // ##### process values #####

  /** heat demand of the heating circuit */
  @ext(0x02, 0x00, 0x02)
  model HeatDemand is Register<temp10>;

  /** flow temperature WTC */
  @ext(0x0d, 0x00, 0x02)
  model SupplyTemperatureWTC is Register<temp10>;

  /** flow setpoint of the heating circuit */
  @ext(0x04, 0x00, 0x02)
  model SupplySetValueHC is Register<temp10>;

  /** flow temperature of the heating circuit */
  @ext(0x0f, 0x00, 0x02)
  model SupplyTemperatureHC is Register<temp10>;

  /** room setpoint */
  @ext(0x12, 0x00, 0x02)
  model RoomSetValue is Register<temp10>;

  /** room temperature */
  @ext(0x11, 0x00, 0x02)
  model RoomTemperature is Register<temp10>;

  /** mixed outside temperature */
  @ext(0x1a, 0x0a, 0x02)
  model MixedExternalTemperature is Register<temp10>;

  /** outside temperature (not used by Weishaupt WCMDiagnose) */
  @ext(0x0c, 0x00, 0x02)
  model ExternalTemperature is Register<temp10>;

  /** position of the program selector switch */
  @ext(0x12, 0x01, 0x02)
  model ProgramChooseSwitch is Register<programchooseswitch>;

  // ##### parameters for the end user #####

  /** normal setpoint temperature (171) */
  @ext(0x05, 0x00, 0x02)
  model NormalSetTemp is Register<temp10>;

  /** reduced setpoint temperature (172) */
  @ext(0x08, 0x00, 0x02)
  model ReducedSetTemp is Register<temp10>;

  /** room frost protection (173) */
  @ext(0x14, 0x0a, 0x02)
  model FrostProtection is Register<temp10>;

  /** summer/winter changeover temperature (174) */
  @ext(0x16, 0x01, 0x02)
  model SummerWinterChangeOverTemperature is Register<temp10>;

  /** gradient (175) */
  @ext(0x0e, 0x01, 0x02)
  model Gradient is Register<gradient>;

  // ##### parameters for the end user: holiday #####

  /** start of holiday (181) */
  @poll(5)
  @inherit(r)
  @ext(0x1b, 0x01, 0x04)
  model StartOfHoliday {
    /** day */
    day: holidayday;

    /** month */
    month: holidaymonth;
  }

  /** start of holiday: day (181) */
  @ext(0x1b, 0x01, 0x02)
  model `StartOfHoliday.Day` is Register<holidayday>;

  /** start of holiday: month (181) */
  @ext(0x1c, 0x01, 0x02)
  model `StartOfHoliday.Month` is Register<holidaymonth>;

  /** end of holiday (182) */
  @poll(5)
  @inherit(r)
  @ext(0x1e, 0x01, 0x04)
  model EndOfHoliday {
    /** day */
    day: holidayday;

    /** month */
    month: holidaymonth;
  }

  /** end of holiday: day (182) */
  @ext(0x1e, 0x01, 0x02)
  model `EndOfHoliday.Day` is Register<holidayday>;

  /** end of holiday: month (182) */
  @ext(0x1f, 0x01, 0x02)
  model `EndOfHoliday.Month` is Register<holidaymonth>;

  /** temperature during holiday (183) */
  @ext(0x2d, 0x01, 0x02)
  model HolidayTemp is Register<tempreduced>;

  // ##### parameters for the heating engineer #####

  /** room influence (341) */
  @ext(0x0f, 0x01, 0x02)
  model RoomInfluence is Register<UIN>;

  /** room sensor correction (342) */
  @ext(0x09, 0x01, 0x02)
  model RoomSensorCorrection is Register<temp10>;

  /** adaption (343) */
  @ext(0x15, 0x01, 0x02)
  model Adaption is Register<onoff>;

  /** room thermostat (344) */
  @ext(0x1c, 0x0a, 0x02)
  model RoomThermostat is Register<tempsin>;

  /** reduced (350) */
  @ext(0x32, 0x01, 0x02)
  model Reduces is Register<tempreduced>;

  /** minimum flow temperature (351) */
  @ext(0x2b, 0x01, 0x02)
  model MinSupplyTemperature is Register<temp10>;

  /** maximum flow temperature (352) */
  @ext(0x28, 0x00, 0x02)
  model MaxSupplyTemperature is Register<temp10>;

  /** switch on delay (353) */
  @ext(0x10, 0x01, 0x02)
  model SwitchOnSetting is Register<minutes>;

  /** switch off delay (354) */
  @ext(0x2e, 0x01, 0x02)
  model SwitchOffSetting is Register<minutes>;
}
