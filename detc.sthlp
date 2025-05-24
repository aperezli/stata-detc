detc ypcvar reparation_id time

Title
-----

detc ypcvar reparation_id time
Estimate adjusted and unadjusted Expected Time to Compliance (ETC) 

Syntax
------

    detc ypcvar reparation_id time

Arguments:

    ypcvar          Variable indicating the yearly probability of compliance (YPC), from discrete-time model (range 0 to 1)
    reparation_id   Identifier for each reparation
    time            Time variable (e.g., years since reparation begins)

Description
-----------

detc is a postestimation command that computes adjusted duration estimates resulting from discrete-time models. 
The term "compliance" is used to describe any event predicted by a duration model, where reparation_id identifies 
the units and the time variable identifies time periods. The prediction resulting from this model is ypcvar (for 
Yearly Probability of Compliance), which reflects the risk of the event conditional on survival to the observed 
time period. We can translate ypcvar into expected duration as 1/ypcvar.
The detc procedure adjusts ypcvar to account for the fact that units are less likley to experience an event if they 
were already likely to experience the event in earlier periods. It creates a new variable, arc_ypcvar (ARC: 
Adjusted Rate of Compliance), which down-weights ypcvar in later periods based on the cumulative survival function.  
This variable can be used to obtain more accurate duration estimates. The program reports the Expected Time to Compliance
(ETC) for overall sample, using unadjusted (1/ypcvar) and adjusted (1/arc_ypcvar) measures. 

Output
------

The command creates the following variables:

    S_ypcvar       Survival function based on compliance probability each time period
    w_ypcvar       Importance weights for each period
    arc_ypcvar     Weighted version of ypcvar (ARC). Use the ARC as an alternative of YPC

It also displays:

    - The mean of ypcvar (unadjusted)
    - The mean of arc_ypcvar (adjusted)
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
