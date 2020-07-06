---
layout: page
---

# Free PDK Documentation

*Free PDK* is an effort to create an open source alternative to the proprietary
[Padauk](http://www.padauk.com.tw/index_en.aspx) µC programmer,
as well as adding support to [SDCC](http://sdcc.sourceforge.net/) for Padauk µCs.
The main focus is on supporting µCs of two Padauk series:
- [M series OTP](http://www.padauk.com.tw/en/product/index.aspx?kind=41) (OTP = *one time programmable*)
- [F series MTP](http://www.padauk.com.tw/en/product/index.aspx?kind=42) (MTP = *multiple time programmable*)

Padauk µCs are extremely cheap (as cheap as $0.03 per µC), which is why
Dave from the EEVblog made the [first video](https://youtu.be/VYhAGnsnO7w)
and [a bunch of follow-up videos](https://www.youtube.com/watch?v=r45r4rV5JOI&list=PLvOlSehNtuHsiF93KOLoF1KAHArmIW9lC) on them.
There is an extensive and active
[thread on the EEVblog forum](http://eevblog.com/forum/blog/eevblog-1144-padauk-programmer-reverse-engineering/)
for this project.

This page provides an overview of the different sub-projects created in the [free-pdk](https://github.com/free-pdk)
GitHub organziation. It also provides custom pinout diagrams for some of the Padauk µCs.

## Easy PDK Programmer

![Image of the Programmer](https://github.com/free-pdk/easy-pdk-programmer-hardware/blob/master/easypdkprogrammer.jpg?raw=true)

Padauk µCs are programmed via a proprietary high-voltage protocol.
The protocol was reverse engineered and a fully open source programmer that already supports almost two dozen Padauk µCs has been created.
All sources for the programmer are available at:

- [Easy PDK Programmer Hardware](https://github.com/free-pdk/easy-pdk-programmer-hardware)
- [Easy PDK Programmer Software](https://github.com/free-pdk/easy-pdk-programmer-software)

## SDCC Integration

Padauk themselves use a custom programming language that looks a bit like C for programming the µCs
that is compiled by their proprietary IDE.
While code created using this custom language can be programmed using the Easy PDK Programmer,
we still recommend using SDCC, especially if you want support for proper C code.
Should you be interested in code samples in that custom language, look at
[free-pdk/simple-pdk-code-examples](https://github.com/free-pdk/simple-pdk-code-examples).

Padauk µCs use different kinds of instruction sets: 13, 14, 15, or 16 bit
(more information on these instruction sets can be found below).
Support for the 14 and 15 bit Padauk instruction sets has been added to
[SDCC](http://sdcc.sourceforge.net/), a C compiler for small devices.
Support for the 13 bit Padauk instruction set is being worked on.
SDCC's documentation can be found [here](http://sdcc.sourceforge.net/doc/sdccman.pdf).

Please note that the version that comes with your operating system's package manager is likely
outdated and may not have support or only limited support for the Padauk µCs.

## µC-specific Information and Pinouts

Note: Other µCs than the µCs listed here are supported.
It is an ongoing effor to create pinout diagrams for all supported Padauk µCs.

{% for page in site.pages -%}
{%- if page.layout == "chip" -%}
- **[{{ page.title }}]({{ page.url }})**
  <span class="badge">{{ page.instruction_set }} bit instruction set</span>
  <span class="badge">{{ page.programming | upcase }}</span>
{% endif -%}
{%- endfor %}

## Evaluation Boards

These are evalution boards for the online-programmable MTP (as opposed to the OTP parts, which can only be programmed offline and once) Padauk µC.
[free-pdk/f-eval-boards](https://github.com/free-pdk/f-eval-boards).

## Instruction Sets, Opcodes, and Programming Sequence

The different Padauk µCs use either 13, 14, 15, or 16 bit instruction sets.
The following files provide an overview over the different instruction sets.

- [Padauk µC 13 bit Instruction Set](PADAUK_FPPA_13_bit_instruction_set.html)
- [Padauk µC 14 bit Instruction Set](PADAUK_FPPA_14_bit_instruction_set.html)
- [Padauk µC 15 bit Instruction Set](PADAUK_FPPA_15_bit_instruction_set.html)
- [Padauk µC 16 bit Instruction Set](PADAUK_FPPA_16_bit_instruction_set.html)
- More information, including information on the programming sequence, can be found at
  [free-pdk/fppa-pdk-documentation](https://github.com/free-pdk/fppa-pdk-documentation)

## Other Tools

- **Circuit Symbols for gEDA gschem**:
  A collection of circuit symbols for many of the Padauk µCs.
  [free-pdk/pdk-gschem-symbols](https://github.com/free-pdk/pdk-gschem-symbols).
- **Padauk µC Emulator written in VHDL**:
  This project aims to provide a fully functional, timing accurate VHDL model for simulating PAKAUK FPPA microcontrollers.
  [free-pdk/fppa-pdk-emulator-vhdl](https://github.com/free-pdk/fppa-pdk-emulator-vhdl)
- A bunch more tools are located at
  [free-pdk/fppa-pdk-tools](https://github.com/free-pdk/fppa-pdk-tools).
  - **Disassembler**: dispdk supports 13 bit, 14 bit, 15 bit and 16 bit opcodes
  - **Emulator**: emupdk supports 14 bit opcodes, no peripheral support yet requires mapping of processor ID in emucpu.c
  - **PDK converter**: depdk convert/deobfuscate any PDK file to binary
