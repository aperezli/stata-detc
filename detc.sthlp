detc ypcvar reparation_id time

Title
-----

detc ypcvar reparation_id time
Estimate adjusted and unadjusted Expected Time to Compliance (ETC)

Syntax
------

    detc ypcvar reparation_id time

Arguments:

    ypcvar          Variable indicating the yearly probability of compliance (YPC), estimated by prior model (range 0 to 1)
    reparation_id   Identifier for each reparation
    time            Time variable (e.g., years since reparation begins)

Description
-----------

detc is a postestimation command that computes an adjusted measure of the Yearly Probability of Compliance (ypcvar).
The ypcvar is the probability of compliance resulting from a predictive model for each reparation_id at point in time. 
The unadjusted ETC is the inverse of the yearly probability of compliance, i.e., the average of 1/YPC.
The adjusted measure (ARC: Adjusted Rate of Compliance) down-weights ypcvar in later periods based on the survival function.
The method adjusts for the probability of early compliance, which reduces the exposure to compliance in later periods.
The diachronically-adjusted ETC is the average of 1/ARC.

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
