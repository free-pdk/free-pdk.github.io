---
layout: chip
instruction_set: 14
rom_size: 2 KW
ram_size: 128
product_page: http://www.padauk.com.tw/en/product/show.aspx?num=14&kind=41
easypdk_supported: true
has_pinout_diagram: true
programming: otp
maxio: 14
timers: T16,T2 T3
PWM: 2x 8-Bit,3x 11-Bit
Comp: 1
ADC: "-"
Special: LCD
oss_status: "Supported"
code_options:
  fuse:
    security:
    pin_drive: [FUSE_IO_DRV_LOW, FUSE_IO_DRV_NORMAL]
    bootup:
    lvr:
  misc2:
    comp_edge:
  notes: |
    This µC has additional undocumented code options configured in `MISC2`: <https://github.com/free-pdk/pdk-includes/blob/f44fc2e7678b1ab72ed8bac6b9d408118f330ad8/device/pms154c.h#L156-L158>
---

# PMS154C
