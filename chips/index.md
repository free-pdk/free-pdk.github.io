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

### Oddities

As always, no rule is without exception, and we discovered or found references to a few odd µCs:

- `PES50N(c)`
  No further information is known.
- `PGR431`
  No further information is known.
- `XDM{1,2,3,4}n0N`
  These devices apparently consist of the die of a Padauk device from the main numbering scheme and additonal components in the same package.
  Support for them in Mini-C is recent.

  - `1`: Various
  - `2`: Various
  - `3`: unknown
  - `4`: One 24C02 serial 2 Kb EEPROM.

  - `N`: Number (just assigned serially)

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
