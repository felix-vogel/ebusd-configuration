import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

namespace Bc_f6 {
  /** actual values broadcast by the burner controller */
  @passive
  @zz(BROADCAST)
  @id(0x50, 0x0a)
  model Act {
    status1: UCH;
    operatingphase: operatingphase;
    ukn2_1: BI0;
    ukn2_2: BI1;
    ukn2_3: BI2;
    flame: BI3;
    gasvalve1: BI4;
    gasvalve2: BI5;
    pump: BI6;
    error: BI7;
    ukn3_1: BI0;

    @values(Values_summerwinter)
    sowi: BI1;

    ukn3_3: BI2;
    ukn3_4: BI3;
    ukn3_5: BI4;
    ukn3_6: BI5;
    ukn3_7: BI6;

    /** position of the diverter valve */
    @values(Values_settinguv)
    settinguv: BI7;

    /** load setting */
    load: UCH;

    /** flow temperature */
    supplytemp: temp1;

    /** flue gas temperature */
    fluegastemp: temp1;

    /** domestic hot water temperature */
    dhwtemp: temp1;

    ukntemp: temp1;

    /** outside temperature */
    externaltemp: tempsch;

    /** temperature trend */
    trendtemp: temp2;

    /** flow setpoint temperature */
    supplysettemp: temp0;
  }

  /** time broadcast, the weekday is part of the date (1 = Monday) */
  @passive
  @zz(BROADCAST)
  @id(0x07, 0x00)
  model B_time {
    /** outside temperature */
    externaltemp: temp2;

    /** seconds are not transmitted (ff) */
    time: btime;

    date: bdate;
  }

  /** status text broadcast by the controller (f1), "E000" seen */
  @passive
  @zz(BROADCAST)
  @id(0xfe, 0x01)
  model StatusText {
    @maxLength(10)
    text: STR;
  }

  /** identification broadcast of the devices (08, 51, 75), id contains non-printable bytes */
  @passive
  @zz(BROADCAST)
  @id(0x07, 0x04)
  model IdAnswer {
    /** device manufacturer */
    mf: Ebus.Id.manufacturer;

    /** device id */
    @maxLength(5)
    id: STR;

    /** software version */
    sw: PIN;

    /** hardware version */
    hw: PIN;
  }

  /** system setpoint temperature */
  @ext(0x27, 0x03, 0xc3)
  model SetpointTempSystem is F6Temp;

  /** heating demand of heating circuit 2 */
  @ext(0x58, 0x03, 0xbc)
  model Hc2HeatingDemand is F6Temp;

  /** status of heating circuit 2 */
  @ext(0x49, 0x03, 0xad)
  model Hc2Status is F6HcStatus;

  /** domestic hot water setpoint */
  @ext(0x33, 0x01, 0x6f)
  model SetpointDHW is F6Temp;

  /** register read of the burner controller by another controller, content unknown */
  @passive
  @zz(0xf6)
  @id(0x50, 0x22, 0xeb, 0x4f, 0x03)
  model Register_eb4f03 {
    value: hex2;
  }

  /** register read of the burner controller by another controller, content unknown */
  @passive
  @zz(0xf6)
  @id(0x50, 0x22, 0xcb, 0x50, 0x03)
  model Register_cb5003 {
    value: hex2;
  }

  /** register read of the burner controller by another controller, which remains unanswered */
  @passive
  @zz(0xf6)
  @id(0x09, 0x02, 0x99, 0x01, 0x02)
  model Register_990102 {}
}
