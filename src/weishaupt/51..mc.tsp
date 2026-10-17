import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

@zz(0x51)
namespace Mc {
  /** actual values exchanged between heating circuit 2 and its mixer */
  @passive
  @id(0x50, 0x10)
  model Act {
    /** room temperature */
    @out
    roomtemp: temp2;

    /** program state */
    @out
    @values(Values_programstate)
    programstate: UCH;

    /** unknown request byte */
    @out
    byte3: UCH;

    /** heat demand of the heating circuit */
    heatdemandtemp: temp1;

    /** flow setpoint of the heating circuit */
    supplysettemp: temp1;

    /** flow temperature of the heating circuit */
    supplytemp: temp1;

    /** outside temperature */
    externaltemp: tempsch;

    /** temperature trend */
    trendtemp: tempsch;

    /** status request */
    @values(Values_heatrequest)
    status: UCH;

    bytea: UCH;
    byteb: UCH;
    bytec: UCH;
  }

  /** process data exchanged between the heating circuit controller and the mixer */
  @passive
  @qq(0x70)
  @id(0x50, 0x14)
  model Mischer_5014 {
    /** mixer circuit active (request byte 1, bit 0) */
    @out
    active: BI0;

    /** heat request from the heating circuit, set when the burner controller reports heating (01 -> 03) */
    @out
    heatrequest: BI1;

    @out
    ukn1_3: BI2;

    @out
    ukn1_4: BI3;

    /** unknown flag (seen set in 13 00) */
    @out
    ukn1_5: BI4;

    @out
    ukn1_6: BI5;

    @out
    ukn1_7: BI6;

    @out
    ukn1_8: BI7;

    /** unknown request byte 2 (always 00) */
    @out
    byte2: UCH;

    /** flow setpoint (big endian in the request) */
    @out
    supplysettemp: temp256be;

    /** unknown constant request byte (always 9c) */
    @out
    byte5: UCH;

    @out
    ukn6_1: BI0;

    @out
    ukn6_2: BI1;

    @out
    ukn6_3: BI2;

    /** hot water has priority, set (08) while the burner controller is in DHW mode */
    @out
    dhwpriority: BI3;

    @out
    ukn6_5: BI4;

    @out
    ukn6_6: BI5;

    @out
    ukn6_7: BI6;

    @out
    ukn6_8: BI7;

    /** unknown request byte (seen as 50 and 5a) */
    @out
    byte7: UCH;

    /** unknown response byte (always 00) */
    byte0: UCH;

    /** mixer pump on */
    pump: BI0;

    /** mixer closing (flow temperature above setpoint) */
    closing: BI1;

    /** mixer opening (flow temperature below setpoint) */
    opening: BI2;

    ukn_4: BI3;
    ukn_5: BI4;
    ukn_6: BI5;
    ukn_7: BI6;
    ukn_8: BI7;

    /** actual flow temperature */
    supplytemp: temp2;

    /** unknown response bytes (always 00 9c 04 82 10) */
    @maxLength(5)
    slavedata: HEX;
  }

  /** unknown mixer values (raw data) when requested actively */
  @id(0x50, 0x14)
  model Mischer_5014_Raw_3 {
    @out
    @maxLength(7)
    masterdata: HEX;

    @maxLength(9)
    slavedata: HEX;
  }

  /** mixer parameter 0E0002 */
  @ext(0x0e, 0x00, 0x02)
  model MischerReg_0E0002 is ReadRegister<hex2>;

  /** mixer parameter 0F0002 */
  @ext(0x0f, 0x00, 0x02)
  model MischerReg_0f0002 is Register<hex2>;

  /** mixer parameter 590302 */
  @ext(0x59, 0x03, 0x02)
  model MischerReg_590302 is Register<hex2>;

  /** mixer parameter 990102 */
  @ext(0x99, 0x01, 0x02)
  model MischerReg_990102 is Register<hex2>;

  /** mixer parameter 0A29 */
  @ext(0x29, 0x0a, 0x02)
  model MischerReg_PAnteil is ReadRegister<hex2>;

  /** mixer control parameter 0A0C */
  @ext(0x0c, 0x0a, 0x02)
  model MischerReg_Schaltdifferenz is ReadRegister<temp10>;

  /** mixer control 0A20 (operating mode) */
  @ext(0x20, 0x0a)
  model MischerReg_Betriebsart is WriteRegister<hex2>;

  /** mixer control 0285 (release) */
  @ext(0x85, 0x02)
  model MischerReg_Freigabe is WriteRegister<hex2>;

  /** mixer parameter maximum flow temperature (352) */
  @ext(0x28, 0x00)
  model MischerReg_28008a02 is WriteRegister<temp10>;

  /** mixer parameter minimum flow temperature (351) */
  @ext(0x2b, 0x01)
  model MischerReg_2b015000 is WriteRegister<temp10>;

  /** mixer control 7309 */
  @ext(0x73, 0x09)
  model MischerReg_73090200 is WriteRegister<hex2>;

  /** mixer control 4101 */
  @ext(0x41, 0x01)
  model MischerReg_41010100 is WriteRegister<hex2>;

  /** mixer control B109 */
  @ext(0xb1, 0x09)
  model MischerReg_b109b400 is WriteRegister<hex2>;
}
