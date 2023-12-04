# Practice Problems for Unit Exam

See below for practice problems related to CBE710, Fall 2023.

**As I may choose to rotate these questions into future iterations
of the class, this page will not be available in future archives.**

## Question 1: Thermodynamic cycle analysis

In [Problem Set 4](ps_4/problem_set_4), we derived the efficiency of the {term}`Carnot cycle` by
analyzing the work and heat interactions for an ideal gas working fluid.
The efficiency of a thermodynamic cycle is:

$$\begin{aligned}
\eta &= -\frac{\delta W_E}{\delta Q_H}
\end{aligned}$$

where $\delta W_E$ is the total work done during the cycle and
$\delta Q_H$ is the heat transferred at the "hot" temperature. The
Carnot cycle and the Otto cycle are illustrated in the $P-V$ diagrams
below.

![image](figures/exam_2_phase_cycles-01.png)


```{admonition} **(a)**

By considering entropy changes, rather than work and heat
interactions alone, derive the efficiency of the Carnot cycle in terms
of $T_H$ and $T_C$ for an **ideal gas** assuming that all steps are
**reversible**.

<details><summary>Click for answer</summary>

During the Carnot cycle, the total internal energy change and total
entropy change of the system must both be zero since these are both
state functions. We can thus write:

$$\begin{aligned}
    \Delta U &= \delta W + \delta Q_H + \delta Q_C = 0 \\
    \Delta S &= \int \frac{dQ_H}{T_H} + \int \frac{dQ_C}{T_C} = 0
    
\end{aligned}$$

Since all heat transfers occur along isothermal paths, the expression
for the entropy simplifies to:

$$\begin{aligned}
    \frac{\delta Q_H}{T_H} + \frac{\delta Q_C}{T_C} &= 0 \\
    \frac{Q_H}{Q_C} &= - \frac{T_H}{T_C}
    
\end{aligned}$$

Note that this expression was used in the original derivation of the
entropy. We can then write for the efficiency:

$$\begin{aligned}
    \eta &= -\frac{\delta W}{\delta Q_H} \\
    &= \frac{\delta Q_H + \delta Q_C}{\delta Q_H}\\
    &= 1 + \frac{Q_C}{Q_H} \\ 
    &= 1 - \frac{T_C}{T_H} \\
    &= \boxed{\frac{T_H-T_C}{T_H}}
    
\end{aligned}$$

We regain the efficiency of the Carnot cycle as expected.
</details>
```

```{admonition} **(b)**

Does the efficiency of the Carnot cycle depend on the choice of
working fluid (*i.e.*, is the efficiency the same for a non-ideal gas)?
Explain your rationale.

<details><summary>Click for answer</summary>

The derivation in part a is performed only using state functions that do
not depend on the identity of the working fluid, so the thermal
efficiency would be the same for any working fluid considered.

</details>
```

```{admonition} **(c)**

The Otto cycle is shown above; $\delta Q_H$ and $\delta Q_C$ are
labeled as the heat interactions during the isochoric (constant volume)
heating and cooling steps, respectively. If we assume that all steps are
**reversible**, show that the efficiency of the Otto cycle for an
**ideal gas working fluid** is:

$$\begin{aligned}
\eta &= 1 - \left ( \frac{V_3}{V_1}\right )^{\gamma -1}
\end{aligned}$$

where $V_1$ and $V_3$ are the volume of the gas at the states labeled as
$1$ and $3$, respectively, and $\gamma = \frac{C_P}{C_V}$. Assume that
$C_P$ and $C_V$ are not functions of temperature.

<details><summary>Hint</summary>

In [Problem Set 4](ps_4/problem_set_4), we showed that the following relation is true
for an ideal gas for any reversible adiabatic path connecting an initial
($i$) and final ($f$) state:

$$\begin{aligned}
P_i V_i^\gamma = P_fV_f^\gamma 
\end{aligned}$$

Given that we can compute the efficiency in terms of temperature (although we
must use our energy, not entropy, paths in this case to do so), this gives
us a convenient way to then convert our equation to one in terms of volume.
</details>


<details><summary>Click for answer</summary>

We can approach this solution following a similar approach as Problem
Set 4. First, we recognize that we can apply the First Law as with the
Carnot cycle to define the efficiency as:

$$\begin{aligned}
    \eta &= -\frac{\delta W_E}{\delta Q_H} =  1 + \frac{Q_C}{Q_H}
    
\end{aligned}$$

The two heat interactions only occur along the isochoric (constant
volume) paths; since these paths are no longer isothermal, we cannot
trivially calculate the entropy change. Instead, we can compute the heat
directly by applying the First Law along each constant volume path,
since the work will be zero:

$$\begin{aligned}
    \Delta U &= \delta Q + \delta W = \delta Q - PdV = \delta Q
    
\end{aligned}$$

For an ideal gas, we know that the internal energy change is only a
function of the temperature, so we can write in general:

$$\begin{aligned}
    \Delta U &= \int_{T_i}^{T_f} \left ( \frac{\partial U}{\partial T}\right )_V dT \\
    &= C_V (T_f - T_i) 
    
\end{aligned}$$

Here, we assume that $C_V$ itself is not a function of temperature. We
can then define the efficiency in terms of the temperatures of the
various states as:

$$\begin{aligned}
    \eta &= 1 + \frac{Q_C}{Q_H} \\
    &= 1 + \frac{C_V(T_2 - T_1)}{C_V(T_4-T_3)} \\
    &= 1 + \frac{T_2 - T_1}{T_4-T_3} 
    
\end{aligned}$$

For an ideal gas working fluid the heat capacities cancel out. The
problem, though, is that these temperatures are unknown. We can relate
them by recognizing that for an ideal gas the following relationship
holds true along the reversible adiabats (derived in Problem Set 4):

$$\begin{aligned}
    P_fV_f^\gamma = P_i V_i^\gamma
    
\end{aligned}$$

Substituting in the ideal gas equation of state for the pressure gives:

$$\begin{aligned}
    RT_f V_f^{\gamma -1} &= RT_i V_i^{\gamma -1} \\
    T_fV_f^{\gamma -1} &= T_i V_i^{\gamma -1 }
    
\end{aligned}$$

We can thus apply this relationship to relate $T_1$ and $T_4$ and $T_2$
and $T_3$, recognizing that $V_1 = V_2$ and $V_3 = V_4$:

$$\begin{aligned}
    T_1V_1^{\gamma -1} &= T_4 V_4^{\gamma -1 } \\
    T_2V_2^{\gamma -1} &= T_3 V_3^{\gamma -1 } \\ 
    T_2V_2^{\gamma -1} - T_1V_1^{\gamma -1} &= T_3V_3^{\gamma -1} - T_4V_4^{\gamma -1} \\
    (T_2 - T_1) V_1^{\gamma-1} &= (T_3- T_4) V_3^{\gamma-1} \\
    \therefore \frac{T_2 - T_1}{T_3 - T_4} &= \left ( \frac{V_3}{V_1}\right )^{\gamma -1}
    
\end{aligned}$$

Substituting this all in yields the efficiency:

$$\begin{aligned}
    \eta &= 1 + \frac{T_2 - T_1}{T_4-T_3}  \\
    &= \boxed{1 - \left ( \frac{V_3}{V_1}\right )^{\gamma -1}}
    
\end{aligned}$$
</details>
```

```{admonition} **(d)**

Does the efficiency of the Otto cycle depend on the choice of
working fluid (*i.e.*, is the efficiency the same for a non-ideal gas)?
Explain your rationale.

<details><summary> Click for answer</summary>

In our derivation above, we made the assumption that $C_V$ is not a
function of temperature or other thermodynamic parameters, such that it
cancels out of the final expression. This assumption will generally not
be true for all working fluids, so the Otto cycle efficiency does depend
on the choice of working fluids, unlike the Carnot cycle efficiency.
Similarly, the relationship between parameters defined for the
reversible adiabats is also not generally true and follows only from the
ideal gas equation of state.

</details>
```

## Question 2: Joule-Thomson inversion temperature

The Joule-Thomson expansion (studied in [Problem Set 5](ps_5/problem_set_5)) involves forcing
a gas through an insulated valve from a region of high pressure to a
region of low pressure at **constant enthalpy**.


```{admonition} **(a)** 
Derive an expression for the differential change in the
temperature of the gas as a function of the differential change in
pressure for a closed, single-component system undergoing a
Joule-Thomson expansion. Your answer should be of the form:

$$\begin{aligned}
dT &= f(\alpha, C_P, T, V) dP
\end{aligned}$$

where
$\alpha = \frac{1}{V} \left ( \frac{\partial V}{\partial T} \right )_P$
is the coefficient of thermal expansion.

<details><summary>Click for answer</summary>

There are potentially many ways to do this.

One way is to start by
writing out the exact differential of the temperature in terms of the
pressure at constant enthalpy (which is key to this problem), as this is
an expression we can then integrate.

$$\begin{aligned}
    dT &= \left ( \frac{\partial T}{\partial P} \right )_H dP
    
\end{aligned}$$

The challenge here is that this partial derivative has no clear physical
meaning, so we need to transform it to something more useful. Again,
there are many ways to proceed here, but one is to write out the
derivative as:

$$\begin{aligned}
    \left ( \frac{\partial T}{\partial P} \right )_H \left ( \frac{\partial P}{\partial H} \right )_T \left ( \frac{\partial H}{\partial T} \right )_P &= -1 \\
    \left ( \frac{\partial T}{\partial P} \right )_H &= - \frac{\left ( \frac{\partial H}{\partial P} \right )_T}{  \left ( \frac{\partial H}{\partial T} \right )_P}
    
\end{aligned}$$

We can next simplify this by seeing that
$\left ( \frac{\partial H}{\partial T} \right )_P$ can also be
simplified and related to the heat capacity at constant pressure by
applying the expansion rule to the exact differential of the enthalpy:

$$\begin{aligned}
    dH &= VdP + TdS \\
    &= \left ( \frac{\partial H}{\partial P} \right )_S dP + \left ( \frac{\partial H}{\partial S} \right )_P dS\\
    \left ( \frac{\partial H}{\partial T} \right )_P &= \left ( \frac{\partial H}{\partial P} \right )_S \left ( \frac{\partial P}{\partial T} \right )_P +  \left ( \frac{\partial H}{\partial S} \right )_P  \left ( \frac{\partial S}{\partial T} \right )_P \\
    &= \left ( \frac{\partial H}{\partial S} \right )_P  \left ( \frac{\partial S}{\partial T} \right )_P \\
    &= T \left ( \frac{\partial S}{\partial T} \right )_P \\
    &= C_P
    
\end{aligned}$$

This gives us one of the two derivatives. We can also now simplify
$\left ( \frac{\partial H}{\partial P} \right )_T$ following the same
approach:

$$\begin{aligned}
    \left ( \frac{\partial H}{\partial P} \right )_T &= \left ( \frac{\partial H}{\partial P} \right )_S \left ( \frac{\partial P}{\partial P} \right )_T +  \left ( \frac{\partial H}{\partial S} \right )_P  \left ( \frac{\partial S}{\partial P} \right )_T \\
    &= \left ( \frac{\partial H}{\partial P} \right )_S + \left ( \frac{\partial H}{\partial S} \right )_P  \left ( \frac{\partial S}{\partial P} \right )_T  \\
    &= V + T \left ( \frac{\partial S}{\partial P} \right )_T
    
\end{aligned}$$

We can also recognize that we can simplify the new partial derivative
that arises through an appropriate Maxwell relation:

$$\begin{aligned}
    \left ( \frac{\partial S}{\partial P} \right )_T &= -\left ( \frac{\partial V}{\partial T} \right )_P
    
\end{aligned}$$

This last partial derivative is related to the coefficient of thermal
expansion, $\alpha$, through:

$$\begin{aligned}
    \left ( \frac{\partial V}{\partial T} \right )_P &= \alpha V
    
\end{aligned}$$

Putting this all together, we obtain:

$$\begin{aligned}
    dT &= \left ( \frac{\partial T}{\partial P} \right )_H dP \\
    &= -\left ( \frac{ V - T\alpha V }{ C_P }  \right ) dP \\
    &= \boxed{\frac{V}{C_P} \left ( T \alpha -  1 \right ) dP}
    
\end{aligned}$$

</details>
```

```{admonition} **(b)**

During the Joule-Thomson expansion, the temperature of the gas
will either increase or decrease depending on whether its initial
temperature is above or below a materials parameter called the
**inversion temperature**. Based on your solution to part **a**, write
an expression for the inversion temprature.

<details><summary>Click for answer</summary>

We can see from the preceding expression that the change in temperature
during this process will depend on the sign of the quantity
$T \alpha -  1$ since the volume and heat capacity are always positive
quantities. The inversion temperature is then:

$$\begin{aligned}
    T_\textrm{inv} \alpha - 1 &= 0 \\
    T_\textrm{inv} &= \frac{1}{\alpha}
    
\end{aligned}$$
</details>

```

```{admonition} **(c)**

Is there an inversion temperature for an ideal gas? Explain your
answer.

<details><summary>Click for answer</summary>


We can evaluate the term in parentheses from part **a** using the ideal
equation of state:

$$\begin{aligned}
    T \alpha - 1 &= \frac{T}{V} \left ( \frac{\partial V}{\partial T}\right )_P - 1\\
    &= \frac{T}{V} \left ( \frac{\partial (RT/P)}{\partial T}\right )_P - 1\\ 
    &= \frac{RT}{PV} - 1 \\
    &= 0 
    
\end{aligned}$$

There is thus no change in the temperature of an ideal gas during a
Joule-Thomson expansion so it does not have an inversion temperature.
</details>
```

## Question 3: Single-component phase behavior

The plot below shows a typical $P-T$ phase diagram for a
single-component system.

![image](figures/exam_2_phase_diagrams-02.png)

```{admonition} **(a)** 
Sketch plots of the molar Gibbs free energy,
$G$, vs. molar volume, $V$, for each of the four points labeled on the
phase diagram. Label the molar volume of each relevant phase on your
diagrams and ensure that your plots qualitatively capture expected
trends.

<details><summary>Click for answer</summary>

![image](figures/exam_2_phase_diagrams_solutions-01.png)

</details>

```

```{admonition} **(b)** 
Briefly explain your rationale for how you sketched the plots
plots in part **a**. Only a qualitative explanation is required (no
equations are necessary).

<details><summary>Click for answer</summary>

There are a few guiding principles behind these plots. First, the Gibbs
free energy should reach a local minimum at the molar volume
corresponding to the liquid and vapor phases, since each phase has a
single well-defined molar volume even if it does not appear at
equilibrium. Second, the Gibbs free energy should reach a global minimum
at the molar volume corresponding to the phase that appears at
equilibrium. If two phases are in coexistence, the Gibbs free energy of
each phase should be equal. Third, the molar volume of the liquid phase
and vapor phase should become closer to each other as the system until
they reach the same value at the critical point. 

</details>

```

## Question 4: Work of separation

```{admonition} **(a)**

Show that the change in the Gibbs free energy is equal to the
reversible **non-PV** work (*i.e.,* the sum of all work terms other than
pressure-volume work, such as the work done to change system
composition) done on the system for any process **at constant
temperature and pressure**.

<details><summary>Click for answer</summary>

From the First Law, we can write the total energy change as:

$$\begin{aligned}
    \Delta U &= \delta W + \delta Q
    
\end{aligned}$$

We can further break the work term into two components related to $PV$
work and non-$PV$ work:

$$\begin{aligned}
    \Delta U &= \delta W^{PV} + \delta W^{\textrm{other}} + \delta Q \\
    \delta W^{\textrm{other}} &= \Delta U - \delta W^{PV} - \delta Q
    
\end{aligned}$$

If the process is reversible, we can replace $\delta Q$ by $\int TdS$,
and if the process is isothermal then we obtain:

$$\begin{aligned}
    \delta W^{\textrm{other}} &= \Delta U - \delta W^{PV} - T\Delta S
    
\end{aligned}$$

Similarly, we can replace the $PV$ work term with $-\int P dV$, which
for an isobaric process is then:

$$\begin{aligned}
    \delta W^{\textrm{other}} &= \Delta U + P\Delta V - T\Delta S \\
    &= \Delta G
    
\end{aligned}$$
</details>

```

```{admonition} **(b)** 
Write an expression for the work needed to separate a
single-phase binary gas mixture into two single-component gases in terms
of the composition of component 1 ($y_1$). Assume the process is at
constant temperature and pressure and is reversible.

<details><summary>Click for answer</summary>

We can immediately apply the relationship from part **a** to determine
the work required for demixing. In this case, we must do work on the
system equal to the negative of the Gibbs free energy of mixing, since
we are demixing the system:

$$\begin{aligned}
    \delta W^{\textrm{other}} &= -\Delta G_\textrm{mix} 
    
\end{aligned}$$

For a gas mixture, we can generally apply the {term}`ideal solution`
approximation (even if the gases are not ideal) since the likelihood of
strong cross interactions is small. Using this approximation, the Gibbs
free energy of mixing is equal to only the entropy of mixing:

$$\begin{aligned}
    \delta W^{\textrm{other}} &= RT \left [ y_1 \ln y_1 + (1-y_1) \ln (1-y_1) \right ]
    
\end{aligned}$$
</details>

```

```{admonition} **(c)** 
Rewrite your expression from part **b** without assuming that
the process is reversible.

<details><summary>Hint</summary>Your final expression will be an inequality.</details>

<details><summary>Click for answer</summary>

If the process is not reversible, then the expression for the entropy
change for an isothermal process is:

$$\begin{aligned}
    \Delta S > \frac{\delta Q}{T}

\end{aligned}$$

That is, we can no longer equate the entropy change to the heat
transferred divided by the temperature (this follows from the Second Law
of Thermodynamics). Returning to part **a**, we find that increasing the
entropy change thus indicates that $T\Delta S > T\Delta S_\textrm{rev}$
and accordingly $\delta W^{\textrm{other}} < \Delta G$. Replacing the
expression in part **b** and adjusting the inequality then yields:

$$\begin{aligned}
    \delta W^{\textrm{other}} &> RT \left [ y_1 \ln y_1 + (1-y_1) \ln (1-y_1) \right ]
    
\end{aligned}$$

The key point here is that the Gibbs free energy of mixing tells me the
minimum amount of work necessary to separate the two gases, while the
actual amount of work could be larger if the process is irreversible.

</details>
```

```{admonition} **(d)**

Write a expression for the work required to separate a binary
mixture into single-component systems at constant temperature and
pressure in terms of the fugacity of each component without assuming the
process is reversible.

<details><summary>Click for answer</summary>

This question is a straightforward extension of the prior two. We can
write in general:

$$\begin{aligned}
    \delta W^{\textrm{other}} &\ge -\Delta G_\textrm{mix} 
    
\end{aligned}$$

where the equality only holds for a reversible process. We can then
replace the expression for $\Delta G_\textrm{mix}$ using a relation
derived in class as follows:

$$\begin{aligned}
    \Delta G_\textrm{mix} &= \sum_i x_i\left ( \overline{G}_i - G_i \right ) \\
    &= \sum_i x_i \left ( RT \ln \hat{f}_i - RT \ln f_i\right ) \\
    &= RT \sum_i x_i \ln \frac{\hat{f}_i}{f_i} \\
    \therefore \delta W^{\textrm{other}} &\ge - RT \sum_i x_i \ln \frac{\hat{f}_i}{f_i}
    
\end{aligned}$$
</details>

```

## Question 5: Expansion of a non-ideal gas

A gas obeys the following equation of state:

$$\begin{aligned}
P &= \frac{RT}{V} + \frac{B(T)}{V^2}
\end{aligned}$$

Here, $B(T)$ is a function of temperature. The partial derivative of
$B(T)$ with respect to temperature at constant volume is $B'(T)$. The
gas is initially at a temperature $T_1$ and volume $V_1$ and is
isothermally and reversible expanded to a new volume, $V_2 = 2 V_1$.

```{admonition} **(a)** 
Calculate the entropy change of the gas during this process in
terms of only parameters defined in the problem statement.
<details><summary>Click for answer</summary>

We can write the exact differential of the entropy as a function of
volume at constant temperature as:

$$\begin{aligned}
    dS &= \left ( \frac{\partial S}{\partial V}\right)_T
    
\end{aligned}$$

We do not have an obvious expression for this partial derivative or a
means to directly calculate it from an equation of state. However, we
can transform this to a more convenient form using an appropriate
Maxwell relation. Specifically, we can write for the Helmholtz free
energy:

$$\begin{aligned}
    dF &= -SdT - PdV \\
    \left (\frac{\partial F}{\partial T} \right)_{V} &= -S\\
    \left (\frac{\partial F}{\partial V} \right)_{T} &= -V \\
    \therefore \left (\frac{\partial S}{\partial V} \right)_{T} &= \left (\frac{\partial P}{\partial T} \right)_{V}
    
\end{aligned}$$

We can evaluate this expression for the equation of state:

$$\begin{aligned}
    \left (\frac{\partial P}{\partial T} \right)_{V} &= \frac{R}{V} + \frac{B'(T)}{V^2}
    
\end{aligned}$$

Integrating this expression as a function of volume along an isothermal
path yields the entropy change:

$$\begin{aligned}
    \Delta S &= \int_{V_1}^{2V_1} \frac{R}{V} + \frac{B'(T)}{V^2} dV \\
    &= R \ln 2 + \frac{B'(T_1)}{2V_1} 
    
\end{aligned}$$
</details>

```

```{admonition} **(b)** 
Calculate the energy change of the gas during this process in
terms of only parameters defined in the problem statement.
<details><summary>Click for answer</summary>

The idea here is that we can write by the first law:

$$\begin{aligned}
    \Delta U &= \delta W + \delta Q
    
\end{aligned}$$

We can compute the work from the change in volume by:

$$\begin{aligned}
    \delta W &= \int_{V_1}^{V_2} dW \\
    &= -\int_{V_1}^{V_2} P dV
    
\end{aligned}$$

Since we have an equation of state, we can substitute in the expression
for pressure and integrate directly given that the process is
isothermal.

$$\begin{aligned}
    \delta W &= -\int_{V_1}^{2V_1} \frac{RT}{V} + \frac{B(T)}{V^2} dV \\
    &= -RT_1 \ln 2 - \frac{B(T_1)}{2V_1}
    
\end{aligned}$$

We can obtain the heat from the change in entropy, recognizing that:

$$\begin{aligned}
    \delta Q &= \int dQ = \int T dS 
    
\end{aligned}$$

Since the path is isothermal, we know that $\delta Q = T\Delta S$. The
result from part **a** then gives:

$$\begin{aligned}
    \delta Q &= RT_1 \ln 2 + \frac{T_1 B'(T_1)}{2V_1} 
    
\end{aligned}$$

The total internal energy change is then:

$$\begin{aligned}
    \Delta U &= \delta W + \delta Q \\
    &= -RT_1 \ln 2 - \frac{B(T_1)}{2V_1} + RT_1 \ln 2 + \frac{T_1 B'(T_1)}{2V_1} \\
    &= \frac{T_1 B'(T_1) - B(T_1)}{2 V_1}
    
\end{aligned}$$
</details>
```

## Question 6: Semi-permeable membrane

A system is divided into two compartments by a rigid, diathermal,
semi-permeable membrane. Compartment (1) contains an ideal-gas mixture
with three components, $A$, $B$, and $C$, while compartment (2) contains
an ideal-gas mixture with only two components, $A$ and $B$. The membrane
is impermeable to component $C$ and only allows pairs of $A-B$ molecules
to pass the membrane simultaneously. The entire system (i.e., both
compartments taken together) is isolated.

![image](figures/membrane_schematic-01.png)

```{admonition} **(a)** 
Derive all equilibrium conditions that must be satisfied for
this system.

<details><summary>Click for answer</summary>
Since the entire system is isolated, we know that at equilibrium any
first-order variation in the entropy has to be zero. Therefore, we can
write using the entropy representation of the Fundamental Equation:

$$\begin{aligned}
    \delta \underline{S} = &\frac{1}{T^{(1)}} \delta \underline{U}^{(1)} + \frac{1}{T^{(2)}} \delta \underline{U}^{(2)} + \frac{P^{(1)}}{T^{(1)}} \delta \underline{V}^{(1)} + \frac{P^{(2)}}{T^{(2)}} \delta \underline{V}^{(2)} - \nonumber \\ &\frac{\mu_A^{(1)}}{T^{(1)}} \delta N_A^{(1)} - \frac{\mu_A^{(2)}}{T^{(2)}} \delta N_A^{(2)} - \frac{\mu_B^{(1)}}{T^{(1)}} \delta N_B^{(1)} - \frac{\mu_B^{(2)}}{T^{(2)}} \delta N_B^{(2)} - \frac{\mu_C^{(1)}}{T^{(1)}} \delta N_C^{(1)} - \frac{\mu_C^{(2)}}{T^{(2)}} \delta N_C^{(2)} = 0 
    
\end{aligned}$$

This expression is reproduced from Lecture 23 with an additional term
for component $C$. We can now consider constraints on the system,
recognizing that the entire system is isolated, the volumes of both
compartments are fixed, and the membrane is permeable to energy and two
of the components but not the third. We can start with some simple
constraints:

$$\begin{aligned}
    \delta \underline{U}^{(1)} &= -\delta \underline{U}^{(2)} \\
    \delta \underline{V}^{(1)} &= \delta \underline{V}^{(2)} = 0 \\
    \delta N_C^{(1)} &= \delta N_C^{(2)} = 0 
    
\end{aligned}$$

Next, we have that pairs of molecules translocate simultaneously. This
behavior implies that:

$$\begin{aligned}
    \delta N_A^{(1)} &= -\delta N_A^{(2)} \\
    \delta N_B^{(1)} &= -\delta N_A^{(2)} \\
    \delta N_A^{(1)} &= \delta N_B^{(1)}
    
\end{aligned}$$

Substituting these constraints into the prior expression gives:

$$\begin{aligned}
    \delta \underline{S} = & \left (\frac{1}{T^{(1)}} - \frac{1}{T^{(2)}} \right )   \delta \underline{U}^{(1)} - \left ( \frac{\mu_A^{(1)}}{T^{(1)}} -  \frac{\mu_A^{(2)}}{T^{(2)}} + \frac{\mu_B^{(1)}}{T^{(1)}} - \frac{\mu_B^{(2)}}{T^{(2)}}\right )  \delta N_A^{(1)} = 0
    
\end{aligned}$$

Setting all prefactors to zero to ensure that $\delta \underline{S} = 0$
gives us our equilibrium conditions:

$$\begin{aligned}
    T^{(1)} &= T^{(2)} \\
    \mu_A^{(1)} + \mu_B^{(1)} &= \mu_A^{(2)} + \mu_B^{(2)} 
    
\end{aligned}$$

Note that the chemical potential of component $C$ is not involved in one
of the conditions for phase equilibrium and neither is the pressure
since the membrane is rigid.
</details>

```

```{admonition} **(b)** 
Compartment (1) initially contains some amount of components
$A$, $B$, and $C$, while compartment (2) contains some amount of pure
$A$. The system evolves to equilibrium and the composition of the
ideal-gas mixture in compartment (2) is measured. The system is now
emptied and restored to the same initial configuration, but with 10x the
amount of component $C$ in compartment (1). When the system reaches
equilibrium, will the composition of the ideal-gas mixture in
compartment (2) necessarily be the same as in the original initial
conditions? Explain your answer.

<details><summary>Click for answer</summary>
The idea here is that while component $C$ does not affect phase
equilibrium due to an equilibrium criterion, its presence affects the
chemical potentials of components $A$ and $B$. Specifically, we know
that the chemical potential of a component in an ideal-gas mixture
depends on the composition of the mixture due to the entropy of mixing.
Therefore, while $C$ does not interact with any of the components or
partition between the compositions, the amount of $C$ in the system will
affect the composition and therefore the chemical potentials of $A$ and
$B$ in the leftmost compartment, which due to the conditions of
equilibrium will change the composition of $A$ and $B$ in the rightmost
compartment by diffusing pairs of molecules through the membrane.
</details>
```

## Question 7: PVT isotherm

Your collaborator brings you a $P-V$ diagram with a single isotherm at
constant temperature for an unknown material, as plotted below.

![image](figures/p-v-isotherm_v2-01.png)

You are also told that the vapor phase of this material follows the
equation of state:

$$\begin{aligned}
P(V+b) = RT
\end{aligned}$$

where $b$ is a constant.

```{admonition} **(a)** 
Approximate the liquid-phase fugacity coefficient, $\phi^L$, of
this material at its saturation pressure.

<details><summary>Click for answer</summary>
We can estimate the fugacity coefficient from the given equation of
state since the fugacity coefficient of the liquid and vapor phases will
be equal at the saturation pressure. We can rewrite the equation of
state in terms of the compressibility factor. We will write this in
terms of the pressure, since this equation of state is linear in
pressure and will enable a straightforward calculation using a
pressure-dependent departure function:

$$\begin{aligned}
    P(V+b) &= RT \\
    V &= \frac{RT}{P}-b \\
    Z &= \frac{PV}{RT} \\
    &= 1 - \frac{bP}{RT} 
    
\end{aligned}$$

We can now calculate the fugacity coefficient from the departure
function:

$$\begin{aligned}
    \ln \phi &= \frac{G-G^\textrm{IG}}{RT} \\
    &= \int_0^P \frac{Z-1}{P} dP \\
    &= \int_0^P -\frac{b}{RT} dP \\
    &= -\frac{bP}{RT} \\
    \therefore \phi &= \exp \left( -\frac{bP}{RT} \right )
    
\end{aligned}$$

Next, we can estimate the saturation pressure as the pressure at which
the isotherm intersects the phase envelope; we can see that this is the
region where the pressure is unchanging as a function of volume. We thus
estimate:

$$P^\textrm{sat} \approx P_1$$

We can now calculate the fugacity coefficient:

$$\begin{aligned}
    \phi^\textrm{sat} &= \exp \left (-\frac{b P_1}{RT} \right )
    
\end{aligned}$$
</details>

```

```{admonition} **(b)** 
<details><summary>Click for answer</summary>
Approximate the fugacity of this material at the same
temperature and $P = P_3$. State any assumptions that you make.

From the *P-V-T* data, we know that at $P = P_3$ the system will be in
the liquid phase. We can calculate liquid phase fugacities by using the
Poynting method:

$$\begin{aligned}
    f^L &= \phi^\textrm{sat} P^\textrm{sat} \exp \left [ \frac{V^L(P-P^\textrm{sat})}{RT} \right ] \\
    &\approx \phi^\textrm{sat} P^\textrm{sat}
    
\end{aligned}$$

We assume the Poynting correction is negligible. We have
$P^\textrm{sat}$ and $\phi^\textrm{sat}$ from the previous part, so we
get:

$$\begin{aligned}
    f^L &\approx  P_1 \exp \left (-\frac{b P_1}{RT} \right ) \\
    
\end{aligned}$$

If we do not neglect the Poynting correction, we instead get:

$$\begin{aligned}
    f^L &\approx  P_1 \exp \left (-\frac{b P_1}{RT} \right ) \exp \left [ \frac{V_1(P_3-P_1}{RT} \right ]
    
\end{aligned}$$

where we approximate the volume of the liquid as its volume at the
saturation pressure, $V_1$.
</details>
```

## Question 8: Energy change in the $PV$ plane

```{admonition} Question
For a particular system, if the volume is kept at a
constant value $V_1$ while the pressure is changed to an
arbitrary value $P'$ from an initial value $P_1$, the heat transferred
into the system is:

$$\delta Q = A(P' - P_1)$$

where $A > 0$ is a
constant with units of volume. Along reversible, adiabatic paths, the
following expression is also true for this system:

$$\begin{aligned}
P^3V^5 = \textrm{constant}
\end{aligned}$$

where $V$ is the molar volume. If the system is brought
to an arbitrary pressure $P_2$ and arbitrary volume $V_2$ from its
initial state, show that the corresponding change in the
molar internal energy is given by:

$$\begin{aligned}
\Delta U & = U(P_2, V_2) - U(P_1, V_1)\\
& = P_2V_2^{5/3} \left ( \frac{3}{2} \right ) \left ( \frac{1}{V_2^{2/3}} - \frac{1}{V_1^{2/3}} \right ) + A \left ( \frac{P_2 V_2^{5/3}}{V_1^{5/3}}-P_1 \right )
\end{aligned}$$

Clearly sketch or describe any paths in the $P-V$ plane
that you define. 

<details><summary>Click for answer</summary>
They key is to recognize that any two points in the $P-V$ plane can be
connected by two paths: first, a path from
$V_1, P_1 \rightarrow V_1, P'$, and then a reversible adiabatic path
from $V_1, P' \rightarrow V_2, P_2$. $P'$ is just the pressure of the
state connected to $V_2, P_2$ by the adiabatic path.

Considering first the constant volume path, we know that if only $P-V$
work is possible then the work along this path is zero, and the change
in energy is given solely by the transfer of heat. From the problem
description, we then have:

$$\begin{aligned}
    U(P', V_1) - U(P_1, V_1) &= \delta Q \\
    &= A(P'-P_1)
    
\end{aligned}$$

Next, we consider the reversible adiabatic path from
$V_1, P' \rightarrow V_2, P_2$. Along this path, $\delta Q = 0$, so the
change in energy is only due to the work:

$$\begin{aligned}
    U(P_2, V_2) - U(P', V_1) = - \int_{V_1}^{V_2} PdV
    
\end{aligned}$$

Using the expression relating pressures and volumes along the adiabatic
path, we can write that $P^3V^5 = P_2^3V_2^5$:

$$\begin{aligned}
    U(P_2, V_2) - U(P', V_1) &= - \int_{V_1}^{V_2} \frac{P_2V_2^{5/3}}{V^{5/3}}dV \\
    &= P_2V_2^{5/3} \left ( \frac{3}{2} \right ) \left ( \frac{1}{V_2^{2/3}} - \frac{1}{V_1^{2/3}} \right )
    
\end{aligned}$$

We can now sum the changes in the energy along these two paths:

$$\begin{aligned}
    U(P_2, V_2) - U(P_1, V_1) &= [ U(P_2, V_2) - U(P', V_1) ] + [ U(P', V_1) - U(P_1, V_1) ] \\
    &=  P_2V_2^{5/3} \left ( \frac{3}{2} \right ) \left ( \frac{1}{V_2^{2/3}} - \frac{1}{V_1^{2/3}} \right ) + A(P'-P_1)
    
\end{aligned}$$

Finally, we just replace $P'$, recognizing that it can be related to
$P_2$ since they are connected by an adiabatic path:

$$\begin{aligned}
    U(P_2, V_2) - U(P_1, V_1) &= P_2V_2^{5/3} \left ( \frac{3}{2} \right ) \left ( \frac{1}{V_2^{2/3}} - \frac{1}{V_1^{2/3}} \right ) + A \left ( \frac{P_2 V_2^{5/3}}{V_1^{5/3}}-P_1 \right )
    
\end{aligned}$$
</details>
```

## Question 9: Cooling by a refrigerator

A system is described by the equation of state:

$$\begin{aligned}
\underline{H} = N A T
\end{aligned}$$

where $A$ is a constant with units of
energy/temperature. The system is cooled from an initial temperature
$T_H$ to a final temperature $T_L$ by operating a refrigerator (i.e., a
heat engine operating in reverse) at constant pressure. During the
cooling process, heat is released from the refrigerator at the high
temperature $T_H$ while heat is adsorbed from the system at the current
temperature $T$. The refrigerator operates reversibly and experiences no
net effect of the process.

![image](figures/exam_2_refrigerator-01.png)

```{admonition} Question
How much work is required to cool the system from $T_H$ to $T_L$? Your
answer should include $N$, $A$, $T_H$, and $T_L$.

<details><summary>Click for answer</summary>

Consider a differential element of time, $\delta t$, during the cooling
process. During this time, some heat $\delta Q_H$ is released from the
refrigerator at temperature $T_H$, some heat $\delta Q$ is adsorbed from
the system into the refrigerator at temperature $T$, and some work
$\delta W$ is done by the refrigerator to continue cooling the system.
Since the refrigerator has no net change in energy or entropy during the
process (by the definition of a heat engine, and explicitly stated in
the problem), we can apply the First Law to the refrigerator to get:

$$\begin{aligned}
    \delta Q_H + \delta Q + \delta W = 0
    
\end{aligned}$$

Since this process is reversible, we must be in equilibrium at each
state and hence $dS = 0$ for each differential unit of time. We then
have:

$$\begin{aligned}
    \frac{\delta Q_H}{T_H} + \frac{\delta Q}{T} &= 0 \\
    \delta Q_H &= - \left ( \frac{T_H}{T}\right ) \delta Q
    
\end{aligned}$$

We can use equal signs since the process is reversible. Combining these
two expressions gives:

$$\begin{aligned}
    \left ( 1 - \frac{T_H}{T}\right ) \delta Q = -\delta W
    
\end{aligned}$$

From the equation of state, we have that $\underline{H} = NAT$ for the
system. Since $d\underline{H} = Td\underline{S} + \underline{V}dP$ and
we are at constant pressure,
$d\underline{H} = Td\underline{S} = \delta Q$. Therefore, we have that:

$$\begin{aligned}
    \delta Q &= -d\underline{H} = -NAdT
    
\end{aligned}$$

Note that since $dT < 0$ (the temperature of the system decreases), we
choose the sign convention such that $\delta Q > 0$, since $\delta Q$
refers to the heat adsorbed by the refrigerator. Combining everything
allows us to integrate and solve for the work:

$$\begin{aligned}
    \delta W &= -NA \left ( \frac{T_H}{T} - 1 \right )dT  \\
    \Delta W &= \int_{T_H}^{T_L} -NA \left ( \frac{T_H}{T} - 1 \right )dT\\
    &= -NAT_H \ln \left ( \frac{T_L}{T_H}\right ) + A(T_L - T_H) \\
    &= NA \left [ T_H \ln \left ( \frac{T_H}{T_L}\right ) - (T_H - T_L) \right ]
    
\end{aligned}$$

Note that this value is positive (work is done to cool the system),
since $T_H > T_L$ the first term will always be larger than $T_H$, so
the total term in brackets must be positive.

</details>
```

## Question 10: Compressing a solid

The pressure on a sample of a solid-phase material is increased
reversibly and isothermally from a pressure $P_1$ to a pressure $P_2$
(i.e., the solid is compressed). There are $N$ moles of material in the
sample and the material is held at a temperature $T_1$. The following
materials properties are all constant during this process:

-   Coefficient of thermal expansion:
    $\alpha =  \frac{1}{V} \left ( \frac{\partial V}{\partial T}\right )_P$

-   Isothermal compressibility:
    $\beta = -\frac{1}{V} \left ( \frac{\partial V}{\partial P}\right )_T$

-   Heat capacity at constant pressure:
    $C_P = T \left ( \frac{\partial S}{\partial T}\right )_P$

While the isothermal compressibility is non-zero, over the pressure
range of interest the molar volume, $V$, is approximately constant. Each
answer may contain the materials properties listed above, $N$, $V$,
$T_1$, $P_1$, and $P_2$, but should not contain any partial derivatives
or integrals.

```{admonition} **(a)** 
How much heat is transferred during the compression? Recall that
the compression is reversible.

<details><summary>Click for answer</summary>

The heat transferred during a reversible process is related to the
entropy by:

$$\Delta Q = \int_{P_1}^{P_2} Td\underline{S}$$

We need an expression for the entropy as a function of pressure. We can
write a total derivative for the entropy in terms of $T$ and $P$ as:

$$\begin{aligned}
    d\underline{S} &= \left (\frac{\partial \underline{S}}{\partial P} \right)_{T,N} dP +\left (\frac{\partial \underline{S}}{\partial T} \right)_{P,N} dT \\
    &= \left (\frac{\partial \underline{S}}{\partial P} \right)_T dP + \left (\frac{NC_P}{T}\right ) dT
    
\end{aligned}$$

For an isothermal process, only the first term contributes, so we need
to relate this partial derivative to the materials parameters given in
the problem statement. We can simplify this expression using a Maxwell
relation:

$$\begin{aligned}
    d\underline{G} &=  -\underline{S} dT + \underline{V}dP \\
    \left ( \frac{\partial \underline{G}}{\partial T}\right )_{P} &= -\underline{S} \\
    \left ( \frac{\partial \underline{G}}{\partial P}\right )_{T} &= \underline{V} \\
    \therefore \left ( \frac{\partial \underline{S}}{\partial P}\right )_{T} &= -\left ( \frac{\partial \underline{V}}{\partial T}\right )_{P} 
    
\end{aligned}$$

Substituting into the expression for the change in heat at constant
temperature:

$$\begin{aligned}
    \Delta Q &= T_1 \int_{P_1}^{P_2} \left (\frac{\partial \underline{S}}{\partial P} \right)_{T,N} dP \\
    &= T_1\int_{P_1}^{P_2}  -\left ( \frac{\partial \underline{V}}{\partial T}\right )_{P}  dP \\
    &= T_1 \int_{P_1}^{P_2} -NV\alpha dP
    
\end{aligned}$$

Assuming that for a solid the molar volume, $V$, is approximately
constant during compression, we have:

$$\begin{aligned}
    \Delta Q = -NV\alpha T_1 (P_2 - P_1)
    
\end{aligned}$$
</details>
```

```{admonition} **(b)** 
How much work is done on the solid during the compression?

<details><summary>Click for answer</summary>
We can calculate the work by integrating the change in volume:

$$\begin{aligned}
    \Delta W = -\int_{V_1}^{V_2} P d\underline{V}
    
\end{aligned}$$

We do not have an expression for $d\underline{V}$, but can write a total
derivative for the change in the volume in terms of the temperature and
pressure:

$$\begin{aligned}
    d\underline{V} = \left (\frac{\partial \underline{V}}{\partial P} \right)_{T,N} dP + \left (\frac{\partial \underline{V}}{\partial T} \right)_{P,N} dT
    
\end{aligned}$$

Along an isothermal path this gives:

$$\begin{aligned}
    d\underline{V} = \left (\frac{\partial \underline{V}}{\partial P} \right)_{T,N} dP
    
\end{aligned}$$

Substituting into the expression for the work gives:

$$\begin{aligned}
    \Delta W = -\int_{P_1}^{P_2} P  \left (\frac{\partial \underline{V}}{\partial P} \right)_{T,N} dP
    
\end{aligned}$$

Note that the limits of integration have been changed to reflect the
path. Recognizing the relationship to the isothermal compressibility we
get:

$$\begin{aligned}
    \Delta W &= \int_{P_1}^{P_2} NV\beta PdP \\
    &= \frac{NV\beta}{2}\left (P_2^2 - P_1^2 \right )
    
\end{aligned}$$
</details>
```

```{admonition} **(c)** 
If the solid is instead subjected to a reversible
adiabatic compression, write an expression for the final
temperature of the solid, $T_2$, after being compressed to $P_2$.

<details><summary>Click for answer</summary>
Using the previous expression for the entropy:

$$\begin{aligned}
    d\underline{S} &= \left (\frac{\partial \underline{S}}{\partial P} \right)_{T,N} dP +\left (\frac{\partial \underline{S}}{\partial T} \right)_{P,N} dT
    
\end{aligned}$$

For a reversible process, the change in entropy is related to the heat
transfer by:

$$\begin{aligned}
    d\underline{S} = \frac{dQ}{T}
    
\end{aligned}$$

A reversible adiabatic compression thus occurs at constant entropy. We
can then rearrange the expression above for $d\underline{S}=0$:

$$\begin{aligned}
    0 &= \left (\frac{\partial \underline{S}}{\partial P} \right)_{T,N} dP +\left (\frac{\partial \underline{S}}{\partial T} \right)_{P,N} dT \\
    \left (\frac{\partial \underline{S}}{\partial P} \right)_{T,N} dP &= -\left (\frac{\partial \underline{S}}{\partial T} \right)_{P,N} dT \\
    -\left ( NV\alpha\right ) dP &= - \left ( \frac{NC_P}{T} \right )dT \\
    \int_{P_1}^{P_2}\left ( V\alpha\right ) dP &= \int_{T_1}^{T_2}\left ( \frac{C_P}{T} \right )dT \\
    V\alpha (P_2 - P_1) &= C_P \ln(T_2/T_1) \\
    \therefore T_2 &= T_1\exp \left [ \frac{V\alpha (P_2-P_1)}{C_P} \right ]
    
\end{aligned}$$
</details>
```