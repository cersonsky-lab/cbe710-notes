# Summary of thermodynamic potentials

  Potential                                                    Equation                                                                       Natural variables                                                                      Total derivative                                                    
  ------------- ------------------------------------------------------------------------------------------------------ ---------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------- -- -- --
  Energy                        $\underline{U} = T\underline{S} - P\underline{V} + \sum_i^n \mu_i N_i$                  $\underline{U}(\underline{S}, \underline{V}, N_1, N_2, \dots)$                 $d\underline{U} = Td\underline{S} - P d\underline{V} +  \sum_i^n \mu_i dN_i$                      
  Entropy        $\underline{S} = \frac{1}{T}\underline{U} + \frac{P}{T}\underline{V} - \sum_i^n \frac{\mu_i}{T} N_i$   $\underline{S}(\underline{U}, \underline{V}, N_1, N_2, \dots)$   $d\underline{S} = \frac{1}{T}d\underline{U} + \frac{P}{T}d\underline{V} - \sum_i^n \frac{\mu_i}{T} dN_i$        
  Enthalpy                                 $\underline{H} = \underline{U} + P\underline{V}$                                   $\underline{H}(\underline{S}, P, N_1, N_2, \dots)$                       $d\underline{H} = Td\underline{S} + \underline{V}dP +  \sum_i^n \mu_i dN_i$                       
  Helmholtz                                $\underline{F} = \underline{U} - T\underline{S}$                                   $\underline{F}(T, \underline{V}, N_1, N_2, \dots)$                       $d\underline{F} = -\underline{S}dT - Pd\underline{V} +  \sum_i^n \mu_i dN_i$                      
  Gibbs                           $\underline{G} = \underline{U} - T\underline{S} + P\underline{V}$                                 $\underline{G}(T, P, N_1, N_2, \dots)$                             $d\underline{G} = -\underline{S}dT + \underline{V}dP +  \sum_i^n \mu_i dN_i$                      
  Gibbs-Duhem                                                    N/A                                                                                 N/A                                                     $-\underline{S}dT + \underline{V}dP  - \sum_i^n N_i d\mu_i = 0$                             

  Type                           Constraints                   Behavior at equilibrium   Displacement from equilibrium        
  -------------- -------------------------------------------- ------------------------- ------------------------------- -- -- --
  Energy          Constant $\underline{S}, \underline{V}, N$          Minimized           $\Delta \underline{U} > 0$          
  Entropy         Constant $\underline{U}, \underline{V}, N$          Maximized           $\Delta \underline{S} < 0$          
  Enthalpy              Constant $\underline{S}, P, N$                Minimized           $\Delta \underline{H} > 0$          
  Helmholtz FE          Constant $T, \underline{V}, N$                Minimized           $\Delta \underline{F} > 0$          
  Gibbs FE                    Constant $T, P, N$                      Minimized           $\Delta \underline{G} > 0$          
