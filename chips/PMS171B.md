---
layout: chip
instruction_set: 14
rom_size: 1.5 KW
ram_size: 96
product_page: http://www.padauk.com.tw/en/product/show.aspx?num=96&kind=41
easypdk_supported: true
has_pinout_diagram: true
programming: otp
maxio: 14
timers: T16, T2 T3
PWM: 2x 8-Bit
Comp: 1
ADC: 8-Bit
Special: "-"
oss_status: "Supported"
code_options:
  fuse:
    security:
    pin_drive: [FUSE_PB4_PB5_NORMAL, FUSE_PB4_PB5_STRONG]
    bootup:
  rom:
    int0:
    int1:
    tmx_bits:
    tmx_freq:
    tm2_out:
    pwm_sel:
  misc2:
    comp_edge:
  misclvr:
    lvr_4bit:
    bandgap:
  notes: |
    Some additional options seem to exist which are not documented in the datasheet: <https://github.com/free-pdk/pdk-includes/blob/f44fc2e7678b1ab72ed8bac6b9d408118f330ad8/device/pms171b.h#L145-L148>
---

# PMS171B
