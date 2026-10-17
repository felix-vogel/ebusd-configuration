import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

@zz(0x08)
namespace Bu {
  // ##### process values #####

  /** process values */
  @poll(5)
  @inherit(r5000)
  @ext(0x09, 0x21, 0x20, 0x11, 0x27, 0x11, 0x2b, 0x01, 0x61)
  model ProcessValues1 {
    skip: skip;
    byte1: UCH;
    byte2: UCH;
    byte3: UCH;
    byte4: UCH;
    byte5: UCH;
    byte6: UCH;
    byte7: UCH;
    byte8: UCH;
  }

  /** process values */
  @poll(5)
  @inherit(r5000)
  @ext(0xbc, 0x11, 0x62, 0x01, 0x65, 0x11, 0x70, 0x01, 0x74)
  model ProcessValues2 {
    skip: skip;
    byte1: UCH;
    byte2: UCH;
    byte3: UCH;

    /** fan control setpoint speed */
    fancontrolsetspeed: rpm;

    /** fan control actual speed */
    fancontrolactualspeed: rpm;

    byte6: UCH;
  }

  /** process values */
  @poll(5)
  @inherit(r5000)
  @ext(0xb2, 0x01, 0x7c, 0x01, 0xc4, 0x03, 0x02)
  model ProcessValues3 {
    skip: skip;
    byte1: UCH;
    byte2: UCH;
    byte3: UCH;
  }

  /** process values */
  @poll(5)
  @inherit(r5000)
  @ext(0x88, 0x01, 0x22, 0x01, 0x5b, 0x11, 0x5f, 0x01, 0x66, 0x01, 0x68)
  model ProcessValues4 {
    skip: skip;
    byte1: UCH;
    byte2: UCH;
    byte3: UCH;
    byte4: UCH;
    byte5: UCH;
    byte6: UCH;
  }

  /** process values */
  @poll(5)
  @inherit(r5000)
  @ext(0x1f, 0x01, 0x6a, 0x11, 0x6e, 0x11, 0x89, 0x01, 0xb3)
  model ProcessValues5 {
    skip: skip;
    byte1: UCH;
    byte2: UCH;
    byte3: UCH;
    byte4: UCH;
    byte5: UCH;
    byte6: UCH;
  }

  /** process values */
  @poll(5)
  @inherit(r5000)
  @ext(0x60, 0x33, 0x08)
  model ProcessValues6 {
    skip: skip;
    byte1: UCH;
    byte2: UCH;
    byte3: UCH;
    byte4: UCH;
  }

  // ##### end user and manufacturer parameters #####

  /** end user parameters */
  @poll(5)
  @inherit(r5000)
  @ext(0xc1, 0x62, 0x3d)
  model Enduser {
    skip: skip;

    /** normal temperature setpoint */
    normaltempsetvalue: temp0;

    /** lowering temperature setpoint */
    loweringtempsetvalue: temp0;

    /** changeover temperature summer/winter */
    changeovertempsummerwinter: temp0;

    /** domestic hot water setpoint day */
    dhwsetvalueday: temp0;

    /** normal room temperature */
    normalroomtemp: temp0;

    /** lowering room temperature */
    loweringroomtemp: temp0;

    /** summer/winter operation? */
    byte: UCH;
  }

  /** manufacturer parameters */
  @poll(5)
  @inherit(r5000)
  @ext(0xc5, 0xb2, 0x01)
  model Manufacturer1 {
    skip: skip;

    /** burner options */
    burneroptions: UCH;

    byte2: UCH;
    byte3: UCH;
    byte4: UCH;
    byte5: UCH;
    byte6: UCH;

    /** STB shutdown temperature boiler */
    stbshutdowntempboiler: temp0;

    /** STW shutdown temperature boiler */
    stwshutdowntempboiler: temp0;

    /** ASTB shutdown temperature flue gas */
    astbshutdowntempfluegas: temp0;

    byte10: UCH;
    s19: UCH;
    s20: UCH;
  }

  /** manufacturer parameters */
  @poll(5)
  @inherit(r5000)
  @ext(0x41, 0x72, 0x0d)
  model Manufacturer2 {
    skip: skip;

    /** fan controller (P part) */
    fancontrollerp: UCH;

    /** fan controller (I part) */
    fancontrolleri: UCH;

    byte3: UCH;
    s15: UCH;
    s16: UCH;
    byte6: UCH;
    byte7: UCH;
    byte8: UCH;
  }

  // ##### error history #####

  /** error history, a reversed ring buffer of 6 entries */
  @poll(5)
  @inherit(r5000)
  @ext(0x27, 0x02, 0x9f)
  @chain(
    16,
    #[0x9b, 0x92, 0x63],
    #[0x95, 0x92, 0x6d],
    #[0x8f, 0x92, 0x77],
    #[0x79, 0x92, 0x81],
    #[0x73, 0x92, 0x8b],
    #[0x6d, 0x92, 0x95]
  )
  model ErrorHistory {
    skip1: skip;

    /** offset to the first error entry in the ring buffer */
    offset: UCH;

    skip2: skip;

    /** error code of entry E6 */
    `E6.ErrorCode`: UCH;

    /** operating phase of entry E6 */
    `E6.OperatingPhase`: operatingphase;

    /** load setting of entry E6 */
    `E6.LoadSetting`: UCH;

    /** diverter valve position of entry E6 */
    `E6.SettingUV`: settinguv;

    /** flow temperature of entry E6 */
    `E6.SupplyTemp`: tempsch;

    /** flue gas temperature of entry E6 */
    `E6.FlueGasTemp`: tempsch;

    /** ionisation signal of entry E6 */
    `E6.IonisationSignal`: UCH;

    /** outside temperature of entry E6 */
    `E6.ExternalTemp`: tempsch;

    /** domestic hot water temperature of entry E6 */
    `E6.DHWTemp`: tempsch;

    /** throughput value of entry E6 */
    `E6.ThroughputValue`: UCH;

    skip3: skip;

    /** error code of entry E5 */
    `E5.ErrorCode`: UCH;

    /** operating phase of entry E5 */
    `E5.OperatingPhase`: operatingphase;

    /** load setting of entry E5 */
    `E5.LoadSetting`: UCH;

    /** diverter valve position of entry E5 */
    `E5.SettingUV`: settinguv;

    /** flow temperature of entry E5 */
    `E5.SupplyTemp`: tempsch;

    /** flue gas temperature of entry E5 */
    `E5.FlueGasTemp`: tempsch;

    /** ionisation signal of entry E5 */
    `E5.IonisationSignal`: UCH;

    /** outside temperature of entry E5 */
    `E5.ExternalTemp`: tempsch;

    /** domestic hot water temperature of entry E5 */
    `E5.DHWTemp`: tempsch;

    /** throughput value of entry E5 */
    `E5.ThroughputValue`: UCH;

    skip4: skip;

    /** error code of entry E4 */
    `E4.ErrorCode`: UCH;

    /** operating phase of entry E4 */
    `E4.OperatingPhase`: operatingphase;

    /** load setting of entry E4 */
    `E4.LoadSetting`: UCH;

    /** diverter valve position of entry E4 */
    `E4.SettingUV`: settinguv;

    /** flow temperature of entry E4 */
    `E4.SupplyTemp`: tempsch;

    /** flue gas temperature of entry E4 */
    `E4.FlueGasTemp`: tempsch;

    /** ionisation signal of entry E4 */
    `E4.IonisationSignal`: UCH;

    /** outside temperature of entry E4 */
    `E4.ExternalTemp`: tempsch;

    /** domestic hot water temperature of entry E4 */
    `E4.DHWTemp`: tempsch;

    /** throughput value of entry E4 */
    `E4.ThroughputValue`: UCH;

    skip5: skip;

    /** error code of entry E3 */
    `E3.ErrorCode`: UCH;

    /** operating phase of entry E3 */
    `E3.OperatingPhase`: operatingphase;

    /** load setting of entry E3 */
    `E3.LoadSetting`: UCH;

    /** diverter valve position of entry E3 */
    `E3.SettingUV`: settinguv;

    /** flow temperature of entry E3 */
    `E3.SupplyTemp`: tempsch;

    /** flue gas temperature of entry E3 */
    `E3.FlueGasTemp`: tempsch;

    /** ionisation signal of entry E3 */
    `E3.IonisationSignal`: UCH;

    /** outside temperature of entry E3 */
    `E3.ExternalTemp`: tempsch;

    /** domestic hot water temperature of entry E3 */
    `E3.DHWTemp`: tempsch;

    /** throughput value of entry E3 */
    `E3.ThroughputValue`: UCH;

    skip6: skip;

    /** error code of entry E2 */
    `E2.ErrorCode`: UCH;

    /** operating phase of entry E2 */
    `E2.OperatingPhase`: operatingphase;

    /** load setting of entry E2 */
    `E2.LoadSetting`: UCH;

    /** diverter valve position of entry E2 */
    `E2.SettingUV`: settinguv;

    /** flow temperature of entry E2 */
    `E2.SupplyTemp`: tempsch;

    /** flue gas temperature of entry E2 */
    `E2.FlueGasTemp`: tempsch;

    /** ionisation signal of entry E2 */
    `E2.IonisationSignal`: UCH;

    /** outside temperature of entry E2 */
    `E2.ExternalTemp`: tempsch;

    /** domestic hot water temperature of entry E2 */
    `E2.DHWTemp`: tempsch;

    /** throughput value of entry E2 */
    `E2.ThroughputValue`: UCH;

    skip7: skip;

    /** error code of entry E1 */
    `E1.ErrorCode`: UCH;

    /** operating phase of entry E1 */
    `E1.OperatingPhase`: operatingphase;

    /** load setting of entry E1 */
    `E1.LoadSetting`: UCH;

    /** diverter valve position of entry E1 */
    `E1.SettingUV`: settinguv;

    /** flow temperature of entry E1 */
    `E1.SupplyTemp`: tempsch;

    /** flue gas temperature of entry E1 */
    `E1.FlueGasTemp`: tempsch;

    /** ionisation signal of entry E1 */
    `E1.IonisationSignal`: UCH;

    /** outside temperature of entry E1 */
    `E1.ExternalTemp`: tempsch;

    /** domestic hot water temperature of entry E1 */
    `E1.DHWTemp`: tempsch;

    /** throughput value of entry E1 */
    `E1.ThroughputValue`: UCH;
  }

  // ##### counters of the statistics #####

  /** 3 1: boiler sensor defective */
  @ext(0xc5, 0x12, 0xcd)
  model BoilerSensorDefective is Counter<counter>;

  /** I45: burner operation since last service */
  @ext(0xab, 0x12, 0xa3)
  model BurnerOperationSinceLastService is Counter<hours16>;

  /** 5 1: CRC error heating engineer parameter */
  @ext(0xbf, 0x12, 0xb7)
  model CRCErrorHeatingEngeneerParameter is Counter<counter>;

  /** 5 2: CRC error manufacturer parameter */
  @ext(0xbd, 0x12, 0xb5)
  model CRCErrorManufacturerParameter is Counter<counter>;

  /** 3 3: domestic hot water sensor defective */
  @ext(0xc1, 0x12, 0xc9)
  model DHWSensorDefective is Counter<counter>;

  /** 6 4: SCOT calibration error */
  @ext(0xa5, 0x12, 0xad)
  model ErrorSCOTCalibration4 is Counter<counter>;

  /** 6 5: SCOT calibration error */
  @ext(0xa3, 0x12, 0xab)
  model ErrorSCOTCalibration5 is Counter<counter>;

  /** 6 6: SCOT calibration error */
  @ext(0xa1, 0x12, 0xa9)
  model ErrorSCOTCalibration6 is Counter<counter>;

  /** 6 8: SCOT calibration error */
  @ext(0xaf, 0x12, 0xa7)
  model ErrorSCOTCalibration8 is Counter<counter>;

  /** 6 2: SCOT control signal error */
  @ext(0xa7, 0x12, 0xaf)
  model ErrorSCOTControlInput is Counter<counter>;

  /** 6 1: SCOT IO control error */
  @ext(0xb9, 0x12, 0xb1)
  model ErrorSCOTIOControl is Counter<counter>;

  /** 5 3: power supply error */
  @ext(0xbb, 0x12, 0xb3)
  model ErrorVoltagSupply is Counter<counter>;

  /** 3 4: outside sensor defective */
  @ext(0xcf, 0x12, 0xc7)
  model ExternalSensorDefektive is Counter<counter>;

  /** 4 3: fan fault during operation */
  @ext(0xb3, 0x12, 0xbb)
  model FanFaultDuringOperation is Counter<counter>;

  /** 4 4: fan fault during standstill */
  @ext(0xb1, 0x12, 0xb9)
  model FanFaultDuringShutdown is Counter<counter>;

  /** flame failure during operation */
  @ext(0xdb, 0x12, 0xd3)
  model FlameFailureDuringOperation is Counter<counter>;

  /** 2 3: flame simulation */
  @ext(0xd9, 0x12, 0xd1)
  model FlameSimulation is Counter<counter>;

  /** 3 2: flue gas sensor defective */
  @ext(0xc3, 0x12, 0xcb)
  model FlueGasSensorDefective is Counter<counter>;

  /** 4 1: gas valve circuit V1/V2 defective */
  @ext(0xb7, 0x12, 0xbf)
  model GasValveCycleV1V2Defective is Counter<counter>;

  /** 3 7: gas pressure switch failure during safety time */
  @ext(0xc9, 0x12, 0xc1)
  model GPSFailureDuringSafetyTime is Counter<counter>;

  /** 2 4: H2 emergency off function */
  @ext(0xc7, 0x12, 0xcf)
  model H2EmergencyOffFunction is Counter<counter>;

  /** no flame formation */
  @ext(0xdd, 0x12, 0xd5)
  model NoFlameFormation is Counter<counter>;

  /** 3 6: no gas pressure available */
  @ext(0xcb, 0x12, 0xc3)
  model NoGasPressureAvailable is Counter<counter>;

  /** 4 2: PWM pump defective */
  @ext(0xb5, 0x12, 0xbd)
  model PWMPumpDefective is Counter<counter>;

  /** 3 5: domestic hot water turbine defective */
  @ext(0xcd, 0x12, 0xc5)
  model WWTurbineDefective is Counter<counter>;

  /** unknown hours */
  @ext(0xad, 0x12, 0xa5)
  model StatisticUkn01 is Counter<hours16>;

  /** unknown counter */
  @ext(0xdf, 0x12, 0xd7)
  model StatisticUkn02 is Counter<counter>;

  /** unknown counter */
  @ext(0xd1, 0x12, 0xd9)
  model StatisticUkn03 is Counter<counter>;

  /** unknown counter */
  @ext(0xe9, 0x12, 0xe1)
  model StatisticUkn04 is Counter<counter>;

  /** unknown counter */
  @ext(0xeb, 0x12, 0xe3)
  model StatisticUkn05 is Counter<counter>;

  // ##### statistics #####

  /** statistics */
  @poll(5)
  @inherit(r5000)
  @ext(0x67, 0xb2, 0xa3)
  model Statistic1 {
    byte0: UCH;

    /** I45: burner operation since last service */
    burneroperationsincelastservice: hours16;

    byte3: UCH;
    byte4: UCH;

    /** 6 8: SCOT calibration error */
    errorscotcalibration8: counter;

    /** 6 6: SCOT calibration error */
    errorscotcalibration6: counter;

    /** 6 5: SCOT calibration error */
    errorscotcalibration5: counter;

    /** 6 4: SCOT calibration error */
    errorscotcalibration4: counter;
  }

  /** statistics */
  @poll(5)
  @inherit(r5000)
  @ext(0x6b, 0xb2, 0xaf)
  model Statistic2 {
    byte0: UCH;

    /** 6 2: SCOT control signal error */
    errorscotcontrolinput: counter;

    /** 6 1: SCOT IO control error */
    errorscotiocontrol: counter;

    /** 5 3: power supply error */
    errorvoltagesupply: counter;

    /** 5 2: CRC error manufacturer parameter */
    crcerrormanufacturerparameter: counter;

    /** 5 1: CRC error heating engineer parameter */
    crcerrorheatingengeneerparameter: counter;

    /** 4 4: fan fault during standstill */
    fanfaultduringshutdown: counter;
  }

  /** statistics */
  @poll(5)
  @inherit(r5000)
  @ext(0x7f, 0xb2, 0xbb)
  model Statistic3 {
    byte0: UCH;

    /** 4 3: fan fault during operation */
    fanfaultduringoperation: counter;

    /** 4 2: PWM pump defective */
    pwmpumpdefective: counter;

    /** 4 1: gas valve circuit V1/V2 defective */
    gasvalvecyclev1v2defective: counter;

    /** 3 7: gas pressure switch failure during safety time */
    gpsfailureduringsafetytime: counter;

    /** 3 6: no gas pressure available */
    nogaspressureavailable: counter;

    /** 3 5: domestic hot water turbine defective */
    wwturbinedefective: counter;
  }

  /** statistics */
  @poll(5)
  @inherit(r5000)
  @ext(0x03, 0xb2, 0xc7)
  model Statistic4 {
    byte0: UCH;

    /** 3 4: outside sensor defective */
    externalsensordefektive: counter;

    /** 3 3: domestic hot water sensor defective */
    dhwsensordefective: counter;

    /** 3 2: flue gas sensor defective */
    fluegassensordefective: counter;

    /** 3 1: boiler sensor defective */
    boilersensordefective: counter;

    /** 2 4: H2 emergency off function */
    h2emergencyofffunction: counter;

    /** 2 3: flame simulation */
    flamesimulation: counter;
  }

  /** statistics */
  @poll(5)
  @inherit(r5000)
  @ext(0x17, 0xb2, 0xd3)
  model Statistic5 {
    byte0: UCH;

    /** flame failure during operation */
    flamefailureduringoperation: counter;

    /** no flame formation */
    noflameformation: counter;

    byte5: UCH;
    byte6: UCH;
    byte7: UCH;
    byte8: UCH;
    byte9: UCH;
    byte10: UCH;
    byte11: UCH;
    byte12: UCH;
  }

  /** statistics */
  @poll(5)
  @inherit(r5000)
  @ext(0x1b, 0xb2, 0xdf)
  model Statistic6 {
    byte0: UCH;

    /** STW excess temperature */
    stwexcess: UCH;

    byte2: UCH;
    byte3: UCH;
    byte4: UCH;

    /** I41: day operating hours counter in 15 min */
    dayoperatinghours: UCH;

    byte6: UCH;

    /** number of mains on */
    numbermainson: UIN;

    byte9: UCH;
    byte10: UCH;
    byte11: UCH;
    byte12: UCH;
  }
}
