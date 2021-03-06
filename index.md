---
layout: page
---

# Free PDK Documentation

*Free PDK* is an open sourced and independently created tool-chain for the [Padauk](http://www.padauk.com.tw/index_en.aspx) 8-Bit Microcontrollers, created as an alternative to the proprietary and closed tools provided by the Taiwanese company itself.

This includes the EasyPDKProg µC programmer hardware, adding support for the Padauk µCs to the [SDCC](http://sdcc.sourceforge.net/) C-Compiler, as well as comprehensive documentation of the instruction set architecture, and code examples.

The main focus is on supporting µCs of two Padauk series:
- [M series OTP](http://www.padauk.com.tw/en/product/index.aspx?kind=41) (OTP = *one time programmable*)
- [F series MTP](http://www.padauk.com.tw/en/product/index.aspx?kind=42) (MTP = *multiple time programmable*)

Padauk µCs are extremely inexpensive, priced as low as $0.03/pc in volumes of 100, which is why they generated a lot of interest after being featured by
Dave from the EEVblog ([first video](https://youtu.be/VYhAGnsnO7w) and [a bunch of follow-up videos](https://www.youtube.com/watch?v=r45r4rV5JOI&list=PLvOlSehNtuHsiF93KOLoF1KAHArmIW9lC)). Despite the low price, it was found that the Padauk µCs sport an interesting architecture that can be a seen as a significant and meaningful extension of the Microchip PIC architecture. There is an extensive and active [discussion on the EEVblog forum](http://eevblog.com/forum/blog/eevblog-1144-padauk-programmer-reverse-engineering/) for this project and further discussion [here](https://www.mikrocontroller.net/topic/461002) on µC.net (German).

This page provides an overview of the different sub-projects created in the [free-pdk](https://github.com/free-pdk)
GitHub organization. It also provides custom pinout diagrams for some of the Padauk µCs.

## Easy PDK Programmer

![Image of the Programmer](/assets/img/easypdkprogrammer.jpg)

Padauk µCs are programmed via a proprietary high-voltage protocol.
The protocol was reverse engineered and a fully open source programmer that already supports almost two dozen Padauk µCs has been created.
All sources for the programmer are available at:

- [Easy PDK Programmer Hardware](https://github.com/free-pdk/easy-pdk-programmer-hardware)
- [Easy PDK Programmer Software](https://github.com/free-pdk/easy-pdk-programmer-software)

## SDCC-based Open Source Tool-Chain

Padauk's own tool-chain is based on a custom programming language called "Mini-C" with a syntax based on the C-language. This language is only supported by their own tool-chain, including IDE ("Padauk Developer Studio") and programmer ("Writer"). The tool-chain also uses a custom binary format with encryption/obfuscation. Should you be interested in code samples in that custom language, take a look at [free-pdk/fppa-code-examples](https://github.com/free-pdk/fppa-code-examples).

The open source tool-chain is based on the Small Device C-Compiler (SDCC) and therefore does support Standard C and common binary output formats (intel hex and bin), including those used by the Easy PDK Programmer.

Please note that right now there is no interchangeability between both tool-chains. Binaries generated by SDCC cannot be written by the official Padauk programmer, but only by the Easy PDK Programmer.

Padauk µCs use different kinds of instruction sets: 13, 14, 15, or 16 bit
(more information on these instruction sets can be found below).
Support for the 14 and 15 bit Padauk instruction sets has been added to
[SDCC](http://sdcc.sourceforge.net/), a C compiler for small devices.
Support for the 13 bit Padauk instruction set is being worked on.

Helpful SDCC resources:
- [SDCC Documentation](http://sdcc.sourceforge.net/doc/sdccman.pdf)
- [Open bugs in the Padauk integration](https://sourceforge.net/p/sdcc/bugs/search/?q=_category%3APDK+AND+status%3Aopen)
- [Feature Requests related to the Padauk integration](https://sourceforge.net/p/sdcc/feature-requests/search/?q=pdk+AND+status%3Aopen)

### Installing SDCC

The latest binaries and sources of SDCC can be obtained on the [SDCC website](http://sdcc.sourceforge.net/). If SDCC is available via your operating system's package manager, please ensure that it is at least SDCC 4.0.0; older versions may not have support or only limited support for the Padauk µC.

## µC-specific Information and Pinouts

Note: Other µCs than the µCs listed here may be supported.
If you want to learn more about the naming scheme, [read more here](/chips/#naming-scheme).

### MTP (Flash) Variants

{% include device-table.html memorytype="mtp" %}

### OTP Variants

{% include device-table.html memorytype="otp" %}

## Evaluation Boards

These are evaluation boards for the online-programmable MTP (as opposed to the OTP parts, which can only be programmed offline and once) Padauk µC.
[free-pdk/f-eval-boards](https://github.com/free-pdk/f-eval-boards).

## Instruction Sets, Opcodes, and Programming Sequence

The different Padauk µCs use either 13, 14, 15, or 16 bit instruction sets.
The following files provide an overview over the different instruction sets.

- {{ "13" | link_instruction_set }}
- {{ "14" | link_instruction_set }}
- {{ "15" | link_instruction_set }}
- {{ "16" | link_instruction_set }}

More information, including information on the programming sequence, can be found at
  [free-pdk/fppa-pdk-documentation](https://github.com/free-pdk/fppa-pdk-documentation)

## Other Tools

- **Schematic Symbols**: A collection of schematic symbols for many of the Padauk µCs.
  - **gEDA gschem**: [free-pdk/pdk-gschem-symbols](https://github.com/free-pdk/pdk-gschem-symbols)
  - **KiCad**: [free-pdk/pdk-kicad-symbols](https://github.com/free-pdk/pdk-kicad-symbols)
- **Padauk µC Emulator written in VHDL**:
  This project aims to provide a fully functional, timing accurate VHDL model for simulating PADAUK FPPA microcontrollers.
  [free-pdk/fppa-pdk-emulator-vhdl](https://github.com/free-pdk/fppa-pdk-emulator-vhdl)
- A bunch more tools are located at
  [free-pdk/fppa-pdk-tools](https://github.com/free-pdk/fppa-pdk-tools).
  - **Disassembler**: dispdk supports 13 bit, 14 bit, 15 bit and 16 bit opcodes
  - **Emulator**: emupdk supports 14 bit opcodes, no peripheral support yet requires mapping of processor ID in emucpu.c
  - **PDK converter**: depdk convert/deobfuscate any PDK file to binary

## Projects from the Community

These projects are auto-populated once per day by
[searching GitHub for repositories with the `padauk` topic]({{ site.projects_using_padauk_query_url }}).
Projects that additionally have the `free-pdk` topic are highlighted as
<span class="badge green">Uses Free PDK toolchain</span>.
Projects that contain `.PRE` files are marked as
<span class="badge orange">Uses proprietary toolchain</span>.

{% include community_projects.html %}

## Latest Activity

The latest activity in the `free-pdk` GitHub organization is fetched at least once per day and displayed below.

{% include latest_activity.html %}
