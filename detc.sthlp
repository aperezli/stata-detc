detc -- Diachronic adjustment for the Expected Time to Compliance (ETC)

Syntax
------

    detc ypcvar reparation_id time

Arguments:

    ypcvar          Predicted probability resulting from a discrete-time duration model (range 0 to 1)
    reparation_id   Identifier for each unit (e.g., reparation measure)
    time            Time variable (e.g., years since reparation begins)

Description
-----------

detc is a postestimation command that computes adjusted duration estimates resulting from discrete-time models. 
The term "compliance" is used to describe any event predicted by a duration model, where reparation_id identifies 
the units and the time variable identifies time periods. The prediction resulting from the model is ypcvar (YPC:
Yearly Probability of Compliance), which reflects the risk of the event conditional on the unit surviving to the 
observed time period. We can translate ypcvar into expected duration as 1/ypcvar.

The detc procedure adjusts ypcvar to account for the fact that units are less likely to survive to the observed time 
period if they were more likely to experience the event in earlier periods. detc creates a new variable, arc_ypcvar 
(ARC: Adjusted Rate of Compliance), which down-weights ypcvar in subsequent periods based on the cumulative survival function.  
This variable can be used to obtain more accurate duration estimates. The program reports the Expected Time to Compliance
(ETC) for overall sample, using unadjusted (1/ypcvar) and adjusted (1/arc_ypcvar) measures. 

Output
------

The command creates the following variables:

    S_ypcvar       Survival function based on the predicted probability in each time period
    arc_ypcvar     Weighted version of ypcvar (ARC). 

It also displays:

    - The mean of ypcvar (unadjusted)
    - The mean of arc_ypcvar (adjusted)
    - ETC indicators (Expected Time to Compliance) based on both measures

Example
-------
    . sysuse detcdata, clear
    . logit C M I t
    . predict ypc
    . detc ypc reparation t

Author
------

Aníbal Pérez-Liñán
University of Notre Dame
Email: aperezl1@nd.edu

Version
-------

Version 1.0.0 — May 2025

See Also
--------

generate, egen, label
