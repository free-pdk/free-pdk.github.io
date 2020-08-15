---
layout: page
---

# Chips

## MTP (Flash) Variants

{% include device-table.html memorytype="mtp" %}

## OTP Variants

{% include device-table.html memorytype="otp" %}

## Naming Scheme

Padauk's µCs are usually named according to this scheme:

`P{G,F,M}{C,S}nNN(c)`

- `F`: MTP (Flash)
- `G`: MTP (Flash + EEPROM)
- `M`: OTP

- `C`: High ESD and high noise tolerance
- `S`: Low ESD and low noise tolerance

- `n`: Number of hardware threads ("FPPAs")

- `NN`: Part number suffix, numeric

- `(c)`: Optional part number suffix, alphabetic; possibly a revision code.

### XDM{F}{SSS} chips

`XDM{F}{SSS}` chips are a combination of regular Padauk µCs with additional hardware inside a single package.
An overview of available chips can be found [here](http://www.zhienchina.com/product/MCU.html).
The naming scheme is `XDM`:
- `F`: 1 = MOS, 2 = Power, 3 = Communication, 4 = Memory/Flash, 5 = drive (? Chinese name is 驱动)
- `SSS`: Number to differentiate parts
Below is a list of available chips and the included additional hardware:

<div class="table-responsive" markdown="1">

| Name | Included Padauk µC | Additional Hardware |
| ---- | ------------------ | ------------------- |
| XDM1101	| {{ "PMS150C" | link_chip }} | 2302 (2A NMOS) |
| XDM1102	|	{{ "PMS150C" | link_chip }} | 2300 (3A NMOS) |
| XDM2101	| {{ "PMS132B" | link_chip }} | 78L05 (5V Regulator) |
| XDM2102 | {{ "PMS150C" | link_chip }} | 2300 (3A NMOS) + 4056 (Lithium Battery Charger) |
| XDM2801	| {{ "PMS164" | link_chip }}  | 78L05 (5V Regulator) |
| XDM4101	| {{ "PFS172" | link_chip }}  | 24C02 (2K EEPROM) |
| XDM4102	| {{ "PMS132B" | link_chip }} | 24C02 (2K EEPROM) |
| XDM4103	|	{{ "PMS152" | link_chip }}  | 24C02 (2K EEPROM) |
| XDM4104	| {{ "PFS154" | link_chip }}  | 24C02 (2K EEPROM) |
| XDM4105 | {{ "PFS173" | link_chip }}  | 24C02 (2K EEPROM) |
| XDM4106	| {{ "PMS171" | link_chip }}  | 24C02 (2K EEPROM) |
| XDM4107	| {{ "PMS134" | link_chip }}  | 24C02 (2K EEPROM) |

</div>


### Oddities

As always, no rule is without exception, and we discovered or found references to a few odd µCs:

- `PES50N(c)`
  No further information is known.
- `PGR431`
  No further information is known.

- `XN1{2,3}{1,2}0(c)`
  No further information is known.

- `PDK22CNN(c)`
  A lot of these were supported by older versions of Mini-C; since then support for all of them has been dropped.
  - `NN`: Part number suffix, numeric
  - `(c)`: Optional part number suffic, alphabetic.

- `P201C{D,S}1{4,6}A`
  Some of these were supported by older versions of Mini-C; since then support for all but one has been dropped.

- `P23{2,4}C(cnn)`
  Many of these were supported by older versions of Mini-C; since then support for all but one has been dropped.

- `EV_2`, `ip5{d,c}`, `MCU371`, `MCU390`, `PDK82C1{2,3}`, `PDK_3S_EV`, `PDK_EV5`, `PDK82S_EV`
  These are only known from Mini-C files. Nothing else is known about them.,

- `DF329`, `DF69`, `MCS11`
  These are missing from Mini-C and the catalog, but there are datasheets. All of them are pdk16 devies with 8 hardware threads.

- `DF319`, `DF339`
  These are missing from Mini-C and the catalog, but there are datasheets. However, the datsheets contain little information.
  These are probably pre-programmed OTP devices for use as motor controllers.
