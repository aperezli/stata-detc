 program define detc
    version 17.0
	syntax varlist(min=3 max=3 numeric) // Expect exactly 3 numeric variables
    if `"`varlist'"' == "" {
        display as error "Please specify: YPC variable, Reparation ID, t."
        exit 198
    }
    local ypc_ : word 1 of `varlist'
	 capture drop arc_`ypc_'  // drop if variable alreday exists 
    local rep_ : word 2 of `varlist'
	local t_   : word 3 of `varlist'
	sort `rep_' `t_'
   capture drop S_`ypc_'
   capture drop w1_ 
   capture drop w2_`ypc_'
   capture drop arc_`ypc_'
 * Compute    S_`ypc_' (survival rate, i.e., diachronic risk of exposure to the YPC)
    gen       S_`ypc_' = 1 if `t_' == 0
    replace   S_`ypc_' = S_`ypc_'[_n-1]*(1 - `ypc_'[_n-1]) if `rep_' == `rep_'[_n-1]
    format    S_`ypc_' %9.3f
    label var S_`ypc_' "Pr of exposure `ypc_'"
 * Compute sumS_ : total exposure over the life of each reparation
	by   `rep_' : egen sumS_ = sum(S_`ypc_')  
 * Compute relative exposure (weight 1) for observations within reparation
	gen s_ = (S_`ypc_') // do not normalize
 * Compute scaling factor, mean of weights across the sample
   egen s_hat = mean(s_)	
   * sum s_hat
 * Compute importance weights for observations 
   gen       w_`ypc_' = s_/s_hat 
   format    w_`ypc_' %9.2f
   label var w_`ypc_' "Weight for `ypc_'"
 * Compute Adjusted Rate of Compliance (weighted YPC)   
   gen        arc_`ypc_' = `ypc_'*(w_`ypc_')  
   format     arc_`ypc_' %9.2f
   label var  arc_`ypc_' "ARC for `ypc_'"  
 * Display estimates
   quietly sum     `ypc_'  
   global mYPC = r(mean)
   di "YPC (mean) = " %9.3f $mYPC
   di " ETC (unadjusted) = " %9.1f 1/$mYPC
   quietly sum arc_`ypc_'
   global arc_YPC = r(mean)
   di "ARC (mean) = " %9.3f $arc_YPC
   di " ETC (adjusted) = " %9.1f 1/$arc_YPC 
   drop sumS_ s_ s_hat w_`ypc_'
end  
