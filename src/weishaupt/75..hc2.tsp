import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hc_inc.tsp";
import "./hctimer_inc.tsp";
import "./hcmixer_inc.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

@zz(0x75)
namespace Hc2 {
  /** setpoints of heating circuit 2 for the system controller */
  @qq(0x70)
  @id(0x05, 0x07)
  model Set is setpoints;

  /** included parts */
  union _includes {
    Hc_inc,
    Hctimer_inc,
    Hcmixer_inc,
  }
}
