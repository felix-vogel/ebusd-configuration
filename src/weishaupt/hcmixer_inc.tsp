import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

/** additional heating engineer parameters of a mixer heating circuit (e.g. for floor heating) */
namespace Hcmixer_inc {
  /** boiler to mixer circuit increase (355) */
  @ext(0x11, 0x01, 0x02)
  model BoilerMKIncrease is Register<temp10>;

  /** maximum mixer runtime (356) */
  @ext(0x2b, 0x00, 0x02)
  model MaxMixerRuntime is Register<seconds>;

  /** pump speed variant (357) */
  @ext(0x31, 0x01, 0x02)
  model SpeedVariation is Register<speedvariation>;

  /** maximum pump speed (358) */
  @ext(0x2f, 0x01, 0x02)
  model MaxPumpSpeed is Register<percent16>;

  /** minimum pump speed (359) */
  @ext(0x30, 0x01, 0x02)
  model MinPumpSpeed is Register<percent16>;

  /** domestic hot water operation (360) */
  @ext(0x37, 0x01, 0x02)
  model DHWOperation is Register<dhwoperation>;

  /** floor drying function (381) */
  @ext(0x1a, 0x01, 0x02)
  model FloorDryingFunction is Register<floordrying>;

  /** floor drying day (382) */
  @ext(0x12, 0x0a, 0x02)
  model FloorDryingDay is Register<UIN>;

  /** floor drying temperature (383) */
  @ext(0x13, 0x0a, 0x02)
  model FloorDryingTemperature is Register<tempsin>;
}
