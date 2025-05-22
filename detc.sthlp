detc ypcvar reparation_id time

Title
-----

detc ypcvar reparation_id time
Estimate adjusted and unadjusted exposure-to-compliance indicators

Syntax
------

    detc ypcvar reparation_id time

Arguments:

    ypcvar          Variable indicating the yearly probability of compliance (YPC) estimated by the model (range 0 to 1)
    reparation_id   Identifier for each reparation
    time            Time variable (e.g., years since reparation begins)

Description
-----------

detc computes a time-weighted measure of the yearly probability of compliance (ARC: Adjusted Rate of Compliance)
by down-weighting later periods based on a survival function derived from observed compliance rates.
The method adjusts for the probability of early compliance, which reduces the likelihood of compliance in later periods.

Output
------

The command creates the following variables:

    S_ypc       Survival function based on compliance probability each time period
    w_ypc       Importance weights for each period
    arc_ypc     Weighted version of ypcvar (ARC). Use the ARC as an alternative of YPC

It also displays:

    - The mean of ypcvar (unadjusted)
    - The mean of arc_ypc (adjusted)
    - ETC indicators (Expected Time to Compliance)

Example
-------

    . detc ypc repid year

Author
------

Developed by Aníbal Pérez-Liñán
University of Notre Dame
Email: aperezl1@nd.edu

Version
-------

Version 1.0.0 — May 2025

See Also
--------

generate, egen, label
