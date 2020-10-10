---
layout: page
---

# Undocumented Features

<div class="callout" markdown="1">
  This page is still incomplete. Please contribute by clicking on the `Edit this page on GitHub` link at the bottom of this page.
</div>

{% include toc.md %}

## Introduction

This page lists features that were intentionally removed from the documentation by Padauk, but are still available in several microcontrollers. In some cases the reason for this seems to be marginal performance, in other cases the reason is not entirely clear. 

Please keep in mind that using these features in your design comes with some risks: 

- They may cease to work under certain circumstances, for example increased temperature.
- It is likely that Padauk is not testing these features in their production testing. Therefore you may encounter devices where these features are defective.
- Padauk may remove these features from their products without notice.

## 16 MHz System Clock

The CPU system clock is configured in the *clkmd* register that is present on all MCUs. The highest clock speed setting is 8 MHz, derived from dividing the clock speed of the internal high-speed RC oscillator (IHRC) by two. A setting for a clock divider of one is absent from all devices. Notably there is a bit combination marked as *reserved*.

{: .center}
![clkcmd register description for PFS154](/assets/img/clkclmd_pfs154.png)

Selecting this bit combination will set the clock divider to one and will therefore allow setting the system clock to 16 MHz. One issue is that the MCU is only stable at this clock at a relatively high supply voltage (VDD) close to 5V. For example, the minimum voltage where the PFS173 can be clocked at 16 MHz is 4.0V. At a temperature higher than room temperature most likely even higher voltages are required. It is possible that 16 MHz core clock will cease to work if a certain environmental temperature is exceed.

To prevent crashing of the MCU it is therefore necessary to ensure that the supply voltage has reached a sufficiently high level before activating the 16 MHz clock setting. This can be achieved by activating the low-voltage-reset feature (LVR), [see tutorial page](tutorial). Discussion [here](https://www.eevblog.com/forum/blog/eevblog-1144-padauk-programmer-reverse-engineering/msg3262072/?PHPSESSID=k35321s2v4vtjpphogkgu8ts14#msg3262072) and following posts.

Example code:


~~~
unsigned char _sdcc_external_startup(void)
{
	MISCLVR = MISCLVR_4V;
	CLKMD = CLKMD_IHRC_DIV | CLKMD_ENABLE_IHRC;  // 16/1=16 Mhz main clock
	return 0; // perform normal initialization
}
~~~

Alternatively you can use the `EASY_PDK_INIT_SYSCLOCK_16MHZ()` define provided with the Free-PDK environment.

## Resistance to Frequency Converter (RFC)

Found in PFS154 and PFS173. Discussion [here](https://www.eevblog.com/forum/blog/eevblog-1144-padauk-programmer-reverse-engineering/msg3231126/). *More detailed description coming*.

## 12 Bit ADC

Found in PFS173

