---
layout: page
---

# Undocumented Features

<div class="callout" markdown="1">
  This page is still incomplete. Please contribute by clicking on the `Edit this page on GitHub` link at the bottom of this page.
</div>

{% include toc.md %}



# Introduction

This page lists features that were intentionally removed from the documentation by Padauk, but are still available in several microcontrollers. In some cases the reason for this seems to be marginal performance, in other cases the reason is not entirely clear. 

Please keep in mind that using these features in your design comes with some risks: 

- They may cease to work under certain circumstances, for example increased temperature.
- It is likely that Padauk is not testing these features in their production testing. Therefore you may encounter devices where these features are defective.
- Padauk may remove these features from their products without notice.



## 16 MHz System Clock

Found in all devices.

## Resistance to Frequency Converter (RFC)

Found in PFS154 and PFS173. Discussion [here](https://www.eevblog.com/forum/blog/eevblog-1144-padauk-programmer-reverse-engineering/msg3231126/). *More detailed description coming*.

## 12 Bit ADC

Found in PFS173

