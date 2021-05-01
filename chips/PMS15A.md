---
layout: chip
instruction_set: 13
rom_size: 0.5 KW, [(1 KW *)](/chips/PMS15A)
ram_size: 64
product_page: http://www.padauk.com.tw/en/product/show.aspx?num=105&kind=41
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
related_to: PMS150C
code_options:
  fuse:
    security:
    pin_drive: [FUSE_IO_DRV_LOW, FUSE_IO_DRV_NORMAL]
    bootup:
    lvr:
---

# PMS15A

<div class="callout" markdown="1">
The PMS15A may just be a marketing name for the [PMS150C](/chips/PMS150C).
So far, all PMS15A tested appear to be identical to the PMS150C and have the same ROM size.
The ROM size restriction is only enforced when using the official IDE.
**Of course we can't guarantee that Padauk doesn't change this in the future.**
--
*[Source 1](https://github.com/free-pdk/free-pdk.github.io/issues/21)*,
*[Source 2](https://www.eevblog.com/forum/blog/eevblog-1144-padauk-programmer-reverse-engineering/msg2703550/?topicseen#msg2703550)*,
*see also [PMS15B](/chips/PMS15B)*
</div>
