import "@ebusd/ebus-typespec";
import "../_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

/** temperature (steps of 0.1) */
@unit("°C")
@divisor(10)
scalar temp10 extends SIN;

/** temperature (steps of 1/256, big endian) */
@unit("°C")
@divisor(256)
scalar temp256be extends SIR;

/** temperature (steps of 1) */
@unit("°C")
scalar tempsin extends SIN;

/** temperature (signed byte) */
@unit("°C")
scalar tempsch extends SCH;

/** gradient (steps of 0.1) */
@divisor(10)
scalar gradient extends SIN;

/** minutes */
@unit("min")
scalar minutes extends UIN;

/** seconds */
@unit("s")
scalar seconds extends UIN;

/** hours */
@unit("h")
scalar hours16 extends UIN;

/** percent */
@unit("%")
scalar percent16 extends UIN;

/** number of occurrences */
scalar counter extends UIN;

/** two bytes of unknown meaning */
@maxLength(2)
scalar hex2 extends HEX;

/** fan speed in steps of 60 */
@unit("rpm")
@factor(60)
scalar rpm extends UCH;

/** operating phase of the burner */
enum Values_operatingphase {
  BurnerOff: 0x00,
  StandbyFanCheck: 0x01,
  PreIgnitionSpeedReached: 0x02,
  PreIgnitionCountdown: 0x03,
  IgnitionSpeedReached: 0x04,
  FlameFormationTime: 0x05,
  BurnerInOperation: 0x06,
  GasValveCheckV1: 0x07,
  GasValveCheckV2: 0x08,
  PostIgnitionPurge: 0x09,
  `Fault: boiler temperature > 105°C`: 0x0b,
  `Warning: boiler temperature > 95°C`: 0x0c,
  `Fault: flue gas temperature > 120°C`: 0x0d,
  `Warning: flow temperature gradient too high`: 0x0e,
  `Warning/Fault: temperature difference too high`: 0x0f,
  `Warning: flue gas temperature > 115°C`: 0x10,
  `Fault: no flame formation at burner start`: 0x15,
  `Warning: flame failure during operation`: 0x16,
  `Fault: flame simulation`: 0x17,
  `Fault: floor thermostat at input H2 responded`: 0x18,
}

/** operating phase of the burner */
@values(Values_operatingphase)
scalar operatingphase extends UCH;

enum Values_settinguv {
  Heating: 0,
  DHW: 1,
}

/** position of the diverter valve */
@values(Values_settinguv)
scalar settinguv extends UCH;

enum Values_summerwinter {
  Summer: 0,
  Winter: 1,
}


enum Values_holidayday {
  Off: 0,
}

/** holiday day (0 for off) */
@values(Values_holidayday)
scalar holidayday extends UIN;

enum Values_holidaymonth {
  Off: 0,
  January: 1,
  February: 2,
  March: 3,
  April: 4,
  May: 5,
  June: 6,
  July: 7,
  August: 8,
  September: 9,
  October: 10,
  November: 11,
  December: 12,
}

/** holiday month (0 for off) */
@values(Values_holidaymonth)
scalar holidaymonth extends UIN;

enum Values_tempreduced {
  FrostProtectionTemperature: 0,
  ReducedTemperature: 1,
}

/** temperature level to use */
@values(Values_tempreduced)
scalar tempreduced extends UIN;

enum Values_programchooseswitch {
  Standby: 1,
  NormalTemperature: 3,
  ReducedTemperature: 4,
  Summer: 5,
  `Program 1`: 11,
  `Program 2`: 12,
  `Program 3`: 13,
}

/** position of the program selector switch */
@values(Values_programchooseswitch)
scalar programchooseswitch extends UIN;

enum Values_onoff {
  Off: 0,
  On: 1,
}

/** off/on */
@values(Values_onoff)
scalar onoff extends UIN;

enum Values_dhwmode {
  DHWProgram: 0,
  `24Day`: 1,
  DHWBeforeHeat: 2,
}

/** domestic hot water mode */
@values(Values_dhwmode)
scalar dhwmode extends UIN;

enum Values_dhwoperation {
  Priority: 0,
  Sliding: 1,
  Parallel: 2,
}

/** domestic hot water operation */
@values(Values_dhwoperation)
scalar dhwoperation extends UIN;

enum Values_legionnaires {
  Off: 0,
}

/** day of the legionella protection function */
@values(Values_legionnaires)
scalar legionnaires extends UIN;

enum Values_construction {
  Heavy: 0,
  Light: 1,
}

/** type of construction */
@values(Values_construction)
scalar construction extends UIN;

enum Values_speedvariation {
  OperatingLevel: 0,
  Characteristic: 1,
}

/** pump speed variant */
@values(Values_speedvariation)
scalar speedvariation extends UIN;

enum Values_floordrying {
  Off: 0,
  FunctionHeating: 1,
  CoveringReadyHeating: 2,
  FunctionAndCoveringReadyHeating: 3,
}

/** floor drying function */
@values(Values_floordrying)
scalar floordrying extends UIN;

enum Values_programstate {
  Program: 0x02,
  ProgramSuspended: 0x0a,
  ProgramExtended: 0x12,
}

enum Values_heatrequest {
  hotwater: 0x20,
  heating: 0x60,
}

/** default *r for register read */
@base(0x09, 0x02)
model r {}

/** default *w for register write */
@write
@base(0x09, 0x03)
model w {}

/** default *r for process data of the burner controller */
@base(0x50, 0x00)
model r5000 {}

/** default *r for process data of the burner controller from the system controller */
@zz(0xf6)
@base(0x50, 0x00)
model r5000f6 {}

/** read only register */
@inherit(r)
model ReadRegister<T> {
  value: T;
}

/** register that is polled regularly */
@poll(5)
@inherit(r)
model Register<T> {
  value: T;
}

/** writable register */
@inherit(w)
model WriteRegister<T> {
  value: T;
}

/** start and end of a program time slot */
@poll(5)
@inherit(r)
model Timeslot {
  /** start time */
  start: TTQ;

  /** end time */
  end: TTQ;
}

/** counter or hours of the burner controller */
@poll(5)
@inherit(r5000)
model Counter<T> {
  skip: skip;
  value: T;
}

/** temperature value read from the system controller */
@poll(5)
@inherit(r5000f6)
model F6Temp {
  skip: skip;
  value: temp0;
}

/** status of a heating circuit read from the system controller */
@poll(5)
@inherit(r5000f6)
model F6HcStatus {
  skip: skip;

  /** time since last command */
  timesincelastcommand: BI0_6;

  /** release for domestic hot water */
  releasedhw: BI6;

  /** release for heating circuit */
  releasehc: BI7;
}

/** setpoints of a heating circuit controller for the system controller */
@passive
@zz(0xf1)
model setpoints {
  /** status heat request */
  status: opdataheat;

  /** variable consumers */
  action: opdataaction;

  /** boiler target temperature */
  settemp: temp;

  /** boiler target pressure */
  setpressure: press;

  /** output degree */
  outputdegree: percent1;

  /** hot water target temperature */
  dhwsettemp: temp1;

  /** fuel choice */
  fueltype: fueltype;
}
