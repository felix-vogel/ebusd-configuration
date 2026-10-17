import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

/** heating programs 1 to 3 with 3 time slots per weekday */
namespace Hctimer_inc {
  /** heating program 1 Mon slot 1 start/end (121) */
  @ext(0x10, 0x14, 0x02)
  model `HP1.Mo.1` is Timeslot;

  /** heating program 1 Mon slot 2 start/end (121) */
  @ext(0x11, 0x14, 0x02)
  model `HP1.Mo.2` is Timeslot;

  /** heating program 1 Mon slot 3 start/end (121) */
  @ext(0x12, 0x14, 0x02)
  model `HP1.Mo.3` is Timeslot;

  /** heating program 1 Tue slot 1 start/end (122) */
  @ext(0x20, 0x14, 0x02)
  model `HP1.Di.1` is Timeslot;

  /** heating program 1 Tue slot 2 start/end (122) */
  @ext(0x21, 0x14, 0x02)
  model `HP1.Di.2` is Timeslot;

  /** heating program 1 Tue slot 3 start/end (122) */
  @ext(0x22, 0x14, 0x02)
  model `HP1.Di.3` is Timeslot;

  /** heating program 1 Wed slot 1 start/end (123) */
  @ext(0x30, 0x14, 0x02)
  model `HP1.Mi.1` is Timeslot;

  /** heating program 1 Wed slot 2 start/end (123) */
  @ext(0x31, 0x14, 0x02)
  model `HP1.Mi.2` is Timeslot;

  /** heating program 1 Wed slot 3 start/end (123) */
  @ext(0x32, 0x14, 0x02)
  model `HP1.Mi.3` is Timeslot;

  /** heating program 1 Thu slot 1 start/end (124) */
  @ext(0x40, 0x14, 0x02)
  model `HP1.Do.1` is Timeslot;

  /** heating program 1 Thu slot 2 start/end (124) */
  @ext(0x41, 0x14, 0x02)
  model `HP1.Do.2` is Timeslot;

  /** heating program 1 Thu slot 3 start/end (124) */
  @ext(0x42, 0x14, 0x02)
  model `HP1.Do.3` is Timeslot;

  /** heating program 1 Fri slot 1 start/end (125) */
  @ext(0x50, 0x14, 0x02)
  model `HP1.Fr.1` is Timeslot;

  /** heating program 1 Fri slot 2 start/end (125) */
  @ext(0x51, 0x14, 0x02)
  model `HP1.Fr.2` is Timeslot;

  /** heating program 1 Fri slot 3 start/end (125) */
  @ext(0x52, 0x14, 0x02)
  model `HP1.Fr.3` is Timeslot;

  /** heating program 1 Sat slot 1 start/end (126) */
  @ext(0x60, 0x14, 0x02)
  model `HP1.Sa.1` is Timeslot;

  /** heating program 1 Sat slot 2 start/end (126) */
  @ext(0x61, 0x14, 0x02)
  model `HP1.Sa.2` is Timeslot;

  /** heating program 1 Sat slot 3 start/end (126) */
  @ext(0x62, 0x14, 0x02)
  model `HP1.Sa.3` is Timeslot;

  /** heating program 1 Sun slot 1 start/end (127) */
  @ext(0x70, 0x14, 0x02)
  model `HP1.So.1` is Timeslot;

  /** heating program 1 Sun slot 2 start/end (127) */
  @ext(0x71, 0x14, 0x02)
  model `HP1.So.2` is Timeslot;

  /** heating program 1 Sun slot 3 start/end (127) */
  @ext(0x72, 0x14, 0x02)
  model `HP1.So.3` is Timeslot;

  /** heating program 2 Mon slot 1 start/end (131) */
  @ext(0x10, 0x15, 0x02)
  model `HP2.Mo.1` is Timeslot;

  /** heating program 2 Mon slot 2 start/end (131) */
  @ext(0x11, 0x15, 0x02)
  model `HP2.Mo.2` is Timeslot;

  /** heating program 2 Mon slot 3 start/end (131) */
  @ext(0x12, 0x15, 0x02)
  model `HP2.Mo.3` is Timeslot;

  /** heating program 2 Tue slot 1 start/end (132) */
  @ext(0x20, 0x15, 0x02)
  model `HP2.Di.1` is Timeslot;

  /** heating program 2 Tue slot 2 start/end (132) */
  @ext(0x21, 0x15, 0x02)
  model `HP2.Di.2` is Timeslot;

  /** heating program 2 Tue slot 3 start/end (132) */
  @ext(0x22, 0x15, 0x02)
  model `HP2.Di.3` is Timeslot;

  /** heating program 2 Wed slot 1 start/end (133) */
  @ext(0x30, 0x15, 0x02)
  model `HP2.Mi.1` is Timeslot;

  /** heating program 2 Wed slot 2 start/end (133) */
  @ext(0x31, 0x15, 0x02)
  model `HP2.Mi.2` is Timeslot;

  /** heating program 2 Wed slot 3 start/end (133) */
  @ext(0x32, 0x15, 0x02)
  model `HP2.Mi.3` is Timeslot;

  /** heating program 2 Thu slot 1 start/end (134) */
  @ext(0x40, 0x15, 0x02)
  model `HP2.Do.1` is Timeslot;

  /** heating program 2 Thu slot 2 start/end (134) */
  @ext(0x41, 0x15, 0x02)
  model `HP2.Do.2` is Timeslot;

  /** heating program 2 Thu slot 3 start/end (134) */
  @ext(0x42, 0x15, 0x02)
  model `HP2.Do.3` is Timeslot;

  /** heating program 2 Fri slot 1 start/end (135) */
  @ext(0x50, 0x15, 0x02)
  model `HP2.Fr.1` is Timeslot;

  /** heating program 2 Fri slot 2 start/end (135) */
  @ext(0x51, 0x15, 0x02)
  model `HP2.Fr.2` is Timeslot;

  /** heating program 2 Fri slot 3 start/end (135) */
  @ext(0x52, 0x15, 0x02)
  model `HP2.Fr.3` is Timeslot;

  /** heating program 2 Sat slot 1 start/end (136) */
  @ext(0x60, 0x15, 0x02)
  model `HP2.Sa.1` is Timeslot;

  /** heating program 2 Sat slot 2 start/end (136) */
  @ext(0x61, 0x15, 0x02)
  model `HP2.Sa.2` is Timeslot;

  /** heating program 2 Sat slot 3 start/end (136) */
  @ext(0x62, 0x15, 0x02)
  model `HP2.Sa.3` is Timeslot;

  /** heating program 2 Sun slot 1 start/end (137) */
  @ext(0x70, 0x15, 0x02)
  model `HP2.So.1` is Timeslot;

  /** heating program 2 Sun slot 2 start/end (137) */
  @ext(0x71, 0x15, 0x02)
  model `HP2.So.2` is Timeslot;

  /** heating program 2 Sun slot 3 start/end (137) */
  @ext(0x72, 0x15, 0x02)
  model `HP2.So.3` is Timeslot;

  /** heating program 3 Mon slot 1 start/end (141) */
  @ext(0x10, 0x16, 0x02)
  model `HP3.Mo.1` is Timeslot;

  /** heating program 3 Mon slot 2 start/end (141) */
  @ext(0x11, 0x16, 0x02)
  model `HP3.Mo.2` is Timeslot;

  /** heating program 3 Mon slot 3 start/end (141) */
  @ext(0x12, 0x16, 0x02)
  model `HP3.Mo.3` is Timeslot;

  /** heating program 3 Tue slot 1 start/end (142) */
  @ext(0x20, 0x16, 0x02)
  model `HP3.Di.1` is Timeslot;

  /** heating program 3 Tue slot 2 start/end (142) */
  @ext(0x21, 0x16, 0x02)
  model `HP3.Di.2` is Timeslot;

  /** heating program 3 Tue slot 3 start/end (142) */
  @ext(0x22, 0x16, 0x02)
  model `HP3.Di.3` is Timeslot;

  /** heating program 3 Wed slot 1 start/end (143) */
  @ext(0x30, 0x16, 0x02)
  model `HP3.Mi.1` is Timeslot;

  /** heating program 3 Wed slot 2 start/end (143) */
  @ext(0x31, 0x16, 0x02)
  model `HP3.Mi.2` is Timeslot;

  /** heating program 3 Wed slot 3 start/end (143) */
  @ext(0x32, 0x16, 0x02)
  model `HP3.Mi.3` is Timeslot;

  /** heating program 3 Thu slot 1 start/end (144) */
  @ext(0x40, 0x16, 0x02)
  model `HP3.Do.1` is Timeslot;

  /** heating program 3 Thu slot 2 start/end (144) */
  @ext(0x41, 0x16, 0x02)
  model `HP3.Do.2` is Timeslot;

  /** heating program 3 Thu slot 3 start/end (144) */
  @ext(0x42, 0x16, 0x02)
  model `HP3.Do.3` is Timeslot;

  /** heating program 3 Fri slot 1 start/end (145) */
  @ext(0x50, 0x16, 0x02)
  model `HP3.Fr.1` is Timeslot;

  /** heating program 3 Fri slot 2 start/end (145) */
  @ext(0x51, 0x16, 0x02)
  model `HP3.Fr.2` is Timeslot;

  /** heating program 3 Fri slot 3 start/end (145) */
  @ext(0x52, 0x16, 0x02)
  model `HP3.Fr.3` is Timeslot;

  /** heating program 3 Sat slot 1 start/end (146) */
  @ext(0x60, 0x16, 0x02)
  model `HP3.Sa.1` is Timeslot;

  /** heating program 3 Sat slot 2 start/end (146) */
  @ext(0x61, 0x16, 0x02)
  model `HP3.Sa.2` is Timeslot;

  /** heating program 3 Sat slot 3 start/end (146) */
  @ext(0x62, 0x16, 0x02)
  model `HP3.Sa.3` is Timeslot;

  /** heating program 3 Sun slot 1 start/end (147) */
  @ext(0x70, 0x16, 0x02)
  model `HP3.So.1` is Timeslot;

  /** heating program 3 Sun slot 2 start/end (147) */
  @ext(0x71, 0x16, 0x02)
  model `HP3.So.2` is Timeslot;

  /** heating program 3 Sun slot 3 start/end (147) */
  @ext(0x72, 0x16, 0x02)
  model `HP3.So.3` is Timeslot;
}
