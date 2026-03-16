---
layout: chip
instruction_set: 13
rom_size: 0.5 KW, [(1 KW *)](/chips/PMS15B)
ram_size: 64
product_page: http://www.padauk.com.tw/en/product/show.aspx?num=123
easypdk_supported: true
has_pinout_diagram: true
programming: otp
maxio: 6
timers: T16,T2
PWM: 1x 8-Bit
Comp: 1
ADC: "-"
Special: "-"
oss_status: "Supported"
related_to: PMS150G
code_options:
  fuse:
    security:
    pin_drive: [FUSE_IO_DRV_STRONG, FUSE_IO_DRV_NORMAL]
    bootup:
    lvr:
    open_drain:
---

# PMS15B

<div class="callout" markdown="1">
The PMS15B may just be a marketing name for the [PMS150G](/chips/PMS150G).
So far, all PMS15B tested appear to be identical to the PMS150G and have the same ROM size.
The ROM size restriction is only enforced when using the official IDE.
**Of course we can't guarantee that Padauk doesn't change this in the future.**
--
*[Source](https://github.com/free-pdk/free-pdk.github.io/commit/4d62e76350d7078276c6ec059e1382e06a159a94#commitcomment-50046062)*,
*see also [PMS15A](/chips/PMS15A)*

</div>
