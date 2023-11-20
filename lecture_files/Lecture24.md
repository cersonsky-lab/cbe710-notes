# Fugacity

## Additional Readings for the Enthusiast

{cite:ts}`tester_thermodynamics_1997`, Ch. 8.5, 9.7, 9.1, 9.2

## Goals for Today's Lecture
- Why is it insufficient to calculate the chemical potential with respect to a reference state at $P=0$?
- What is the fugacity, and what does it conceptually represent?
- How do interactions within a system affect the fugacity?

## Single-component phase equilibrium: defining fugacity

We have now described departures from ideality with respect to the $PVT$
behavior of systems by defining the {term}`compressibility factor`, $Z = PV/RT$,
and deriving the general form for a departure function. In principle, we
now have the framework necessary to compute the chemical potential and
thus determine conditions of phase equilibrium. Recall that for a
single-component system, phase equilibrium is reached at constant
temperature and pressure if the following condition is met:

$$\mu^{(1)}(T,P) = \mu^{(2)}(T,P)$$

where $(1)$ and $(2)$ refer to the two phases that coexist in the
system. We can relate the chemical potential to the temperature and
pressure via the {term}`Gibbs-Duhem equation` in intensive form:

$$\begin{aligned}
d\mu &= - SdT + VdP \\
\therefore \mu &= f_1(T,P)
\end{aligned}$$

Therefore, in order to understand phase equilibrium, we need a procedure
for calculating $\mu$. We'll start with vapor-liquid equilibrium in a
single-component system, as this serves as the most straightfoward example.

To calculate $\mu$ in either the liquid or vapor
phase, we can integrate the {term}`Gibbs-Duhem equation` from a reference state
to the chemical potential of interest.

```{admonition} What would be a good choice for our reference state?
<details><summary>Click for answer</summary>

Just as in our discussion of departure functions, we can use the ideal
gas state at the same temperature $T$.
</details>
```

This reference state is convenient because we can obtain the value of the
chemical potential for any given temperature at constant pressure for an
ideal gas if we know the temperature dependence of $C_P^0$ (with the
$^0$ indicating the ideal gas state as above); this follows from the
relationship between the entropy and the heat capacity derived in the
last two lectures. To obtain the chemical potential for any given $T$
and $P$ we can thus integrate the Gibbs-Duhem equation at constant
temperature $T$ from $P^{\textrm{ref}}$ to $P$, yielding:

$$\mu(T, P) - \mu(T, P^{\textrm{ref}})  = \int_{P^{\textrm{ref}}}^{P} V dP$$

This integral is straightforward if we know the $PVT$ behavior of the
system either through tabulated compressibility factors or equations of
state. Again, note that we only have the $dP$ term because we are
assuming a isothermal path between a reference state at the same
temperature (and hence $dT=0$).

```{admonition} What happens to $\mu(T, P) - \mu(T, P^{\textrm{ref}})$ as $P^{\textrm{ref}}\to 0$?
<details><summary>Click for answer</summary>

Given that our reference state is an ideal gas, we can write

$$\begin{aligned}
\mu^0(T, P) - \mu^0(T, P^{\textrm{ref}})  &= \int_{P^{\textrm{ref}}}^{P} \frac{RT}{P} dP \\
&= RT \int_{P^{\textrm{ref}}}^{P} \frac{1}{P} dP \\
&= RT \ln\left(\frac{P}{P^{\textrm{ref}}}\right)
\end{aligned}$$

This shows the system will behave like
an ideal gas as $P^\textrm{ref} \rightarrow 0$, but the chemical
potential will approach negative infinity in the same limit.

</details>
```

This issue,
which also appeared in our treatment of departure functions, motivates
the definition of a new quantity, the {term}`fugacity`, which is better
behaved.

We define the fugacity $f$ in terms of the isothermal {term}`departure function` of
the molar Gibbs free energy (or, equivalently, chemical potential):

```{glossary}
fugacity
    $$\begin{aligned}
    f = P\exp^{\frac{G(T,P) - G^0(T,P)}{RT}} = P\exp^{\frac{\mu(T,P) - \mu^0(T,P)}{RT}}
    \end{aligned}$$
```

such that

$$\begin{aligned}
RT \ln \frac{f}{P} \equiv G(T,P) - G^0(T,P) = \mu(T,P) - \mu^0(T,P)
\end{aligned}$$

Here, $f$ is the fugacity and is a function of temperature and pressure.
$G^0$ is the molar Gibbs free energy of the ideal gas reference state.
The fugacity has units of pressure, and by inspection of this definition
we see that

```{admonition} If the system is an ideal gas...
<details><summary> f is less than P.</summary>
Try again!
</details>
<details><summary> f is equal to P. </summary>

Correct! Because $f=P$ and therefore $\mu(T,P) = \mu^0(T,P)$ for an
ideal gas, we can also think of the fugacity as the pressure of an
ideal gas that has the same chemical potential as
the real fluid of interest at the same temperature.

</details>
<details><summary> f is greater than P. </summary>
Try again!
</details>
```

```{admonition} If the system has repulsive interactions that increase the chemical potential...
<details><summary> f is less than P.</summary>
Try again!
</details>
<details><summary> f is equal to P. </summary>
Try again!
</details>
<details><summary> f is greater than P. </summary>
Correct!
</details>
```

```{admonition} If the system has attractive interactions that decrease the chemical potential...
<details><summary> f is less than P.</summary>
Correct!
</details>
<details><summary> f is equal to P. </summary>
Try again!
</details>
<details><summary> f is greater than P. </summary>
Try again!
</details>
```

Thus, the fugacity effectively
captures departures of the pressure from ideality. We can also write the
fugacity in differential form as:

$$\begin{aligned}
d \ln(f) = \frac{d\mu}{RT}
\end{aligned}$$

Finally, we can also define a related, unitless quantity, the

```{glossary}
fugacity coefficient

    $$\begin{aligned}
    \phi \equiv \frac{f}{P}
    \end{aligned}$$
```

Returning to the condition of phase equilibrium, if two phases (e.g.,
the liquid and vapor phases of a pure component) are in equilibrium,
then the chemical potentials are equal, leading to:

$$\begin{aligned}
\mu^{\textrm{liq}}(T,P) &= \mu^{\textrm{vap}}(T,P) \\
\mu^{\textrm{liq}} - \mu^0(T,P) &=  \mu^{\textrm{vap}}(T,P)- \mu^0(T,P) \\
RT \ln \frac{f^{\textrm{liq}}}{P} &= RT \ln \frac{f^{\textrm{vap}}}{P}\\
%\frac{\mu^{\textrm{liq}} - \mu^{\textrm{vap}}}{RT} &= \ln \left ( \frac{f^{\textrm{liq}}}{f^{\textrm{vap}}}\right ) = 0 \\
\therefore f^{\textrm{liq}} &= f^{\textrm{vap}} \\
\therefore \phi^\textrm{liq} &= \phi^\textrm{vap}
\end{aligned}$$

Since the ideal gas reference state is the same for both phases, the
reference state chemical potentials ,$\mu^0(T,P$), can be subtracted
from each phase's chemical potential and we find that fugacities are
equal between two phases at equilibrium. We also establish the
equivalence of fugacity coefficients since pressures are equal at
equilibrium.

Concept check:
```{admonition} The phase with the _____ fugacity will be present at equilibrium.
<details><summary>lower</summary>
Correct! </details>
<details><summary>higher</summary>
Try again! </details>
```

```{admonition} At phase equilibrium, the ______ of the two phases must be equal.
<details><summary>fugacities</summary>
Try again! </details>
<details><summary>fugacity coefficients</summary>
Try again! </details>
<details><summary>fugacities and fugacity coefficients</summary>
Correct! </details>
```

## Calculating the fugacity

Next, let's consider how to calculate the fugacity as a function of the
pressure in analogy to what was discussed above for the chemical
potential. Our eventual goal is to try to identify a single pressure,
the saturation pressure, for which the fugacities of the liquid and
vapor phases of a material are equal, which would then satisfy the
condition of phase equilibrium. First, we can write from the definition:

$$\begin{aligned}
\left ( \frac{\partial \ln f}{\partial P} \right )_{T} &= \frac{1}{RT}\left ( \frac{\partial \mu}{\partial P} \right )_{T} 
\end{aligned}$$

The intensive form of the Gibbs-Duhem relation is:

$$\begin{aligned}
d\mu &= -S dT + V dP \\
\therefore \left ( \frac{\partial \mu}{\partial P} \right )_{T} &= V \\
\left ( \frac{\partial \ln f}{\partial P} \right )_{T, N} &=  \frac{V}{RT} \\
\end{aligned}$$

and thus

$$\ln \left [ \frac{f(P)}{f(P^{\textrm{ref}})} \right ] = \frac{1}{RT} \int_{P^{\textrm{ref}}}^P V dP$$


Note that this integral is performed at constant $T$ and $N$. We thus
obtain a similar expression as was originally developed for the chemical
potential in terms of an ideal gas. If our reference state is defined
such that the molar volume $V$ is not a strong function of pressure,
then we can directly integrate this expression. For example, if we
consider a change in the fugacity of a condensed state (i.e., a liquid),
then the molar volume is largely invariant with respect to pressure
since most liquids/solids are incompressible. In this case, a reasonable
reference pressure is the saturation pressure, $P^{\textrm{sat}}$, where
the vapor fugacity is equal to the liquid fugacity, and we integrate to
the pressure of interest at constant volume and temperature:

$$\begin{aligned}
f^{\textrm{liq}}(P) = f^{\textrm{sat}}(P^{\textrm{sat}}) \exp\left [ \frac{V^{\textrm{liq}}(P-P^{\textrm{sat}})}{RT} \right ]
\end{aligned}$$

The exponential term is called the [Poynting correction](https://en.wikipedia.org/wiki/Poynting_effect)
and accounts
for the change in the fugacity associated with pressures that are higher
than the saturation pressure. Recall that compressibility factors for
liquids are often quite small ($Z\approx 0.01 - 0.3$) and the term in
the exponential is equivalent to the difference in the compressibility
factor of the liquid at a pressure $P$ relative to the saturation
pressure. Therefore, the term in the exponential is also typically
$\approx 0$ and the Poynting correction is typically close to 1 unless
the pressure is significantly larger than the saturation pressure,
allowing the correct to be safely neglected.

The prior framework is useful for computing liquid-phase fugacities, but
is not particularly helpful in determining conditions of phase
equilibrium because it presupposes that we know the saturation pressure,
which is exactly the quantity that we seek to determine.

```{admonition} Why can't we use the Poynting approach for vapor phases?
<details><summary>Click for answer</summary>
In vapor phases, vapor-phase volume will be a strong function of pressure.
</details>
```

Instead, we
can return to our definition of the fugacity coefficient as equal to the
isothermal Gibbs departure function and use this to calculate fugacities
directly from tabulated or analytical compressibility factors (or
equations of state). First, recall the expression for the isothermal
Gibbs departure function:

$$\begin{aligned}
G(T,P) - G^0(T,P) &= RT \ln \phi \\
&= RT \int_0^P (Z-1)\frac{dP}{P} \\ 
\therefore \ln \phi &= \int_0^P (Z-1)\frac{dP}{P}
\end{aligned}$$

In principle we can integrate this expression directly. A problem,
however, is that $Z(P)$ is generally a poorly behaved function for real
gases at phase coexistence, since many gas equations of state are cubic
with respect to volume and thus would be multivalued for a given value
of $P$ corresponding to volumes of different phases.

For example, the van der Waals equation of state is:

$$P = \frac{RT}{V-b} - \frac{a}{V^2}$$

where
- $b$ represents excluded molecular volume
- $a$ measures the attraction between molecules

```{admonition} Why would this formulation cause Z(P) to be poorly-defined?
<details><summary> Click for answer</summary>

This expression is cubic in $V$ and when plotted
would have pressures that correspond to multiple different volumes.
This equation of state is the simplest that properly captures two
different molecular volumes corresponding to a vapor and liquid phase if
plotted at constant temperature; the smaller volume corresponds to the
liquid phase ($V^L$), while the larger corresponds to the vapor phase
($V^V$) in a two-phase region. Thus, $Z(P)$ is not a well-defined
function because it is multivalued for a given value of $P$.
</details>
```

Thus we can instead use $Z(V)$ to calculate the fugacity coefficient. From the
definition of $Z$, we can write a total differential for $Z$ at constant
$T$ as:

$$\begin{aligned}
Z &= PV/RT \\
Z RT &= PV \\
RT dZ &= V dP + P dV \\
\frac{dP}{P} &=  \left (\frac{RT}{PV}\right ) dZ - \frac{dV}{V} \\
&= \frac{dZ}{Z} - \frac{dV}{V}
\end{aligned}$$

Substituting this expression into the fugacity coefficient expression
gives:

$$\begin{aligned}
\ln \phi &= \int_0^P \left ( Z - 1\right ) \left ( \frac{dP}{P} \right ) \\
&= \int_1^Z \left ( Z - 1\right ) \left ( \frac{dZ}{Z} \right ) - \int_\infty^V \left ( Z - 1\right ) \left ( \frac{dV}{V} \right ) \\
&= \int_1^Z dZ - \int_1^Z \frac{dZ}{Z}  - \int_\infty^V \left ( Z - 1\right ) \left ( \frac{dV}{V} \right )  \\
&= Z -1 - \ln Z + \int^\infty_V \left ( \frac{ Z - 1}{V}\right )dV
\end{aligned}$$

Note that we have chosen appropriate limits of integration for each
integral to reflect an ideal gas reference state - at $P = 0$, $Z = 1$
since that is the ideal gas state, and also at $P = 0$, $V = \infty$
since volume and pressure are inversely related. Also, recall that all
of these integrals are along isothermal paths (i.e., at constant $T$ and
$N$). We now have an expression in which the integral is related to
volume, which would be appropriate for a compressibility factor given as
$Z(V)$. From knowledge of the compressibility factor, we thus have a
means of computing fugacities and determining the conditions of
equilibrium - we could choose a pressure, determine the corresponding
molar volumes of the liquid and vapor phases associated with the
isotherm for that pressure (i.e., roots of the cubic equation of state),
calculate the fugacity for each molar volume, and iterate until a
pressure is found such that the fugacity corresponding to each volume is
identical. This pressure would be the saturation pressure. A similar
procedure could be performed using tabulated compressibility factor data
by interpolating between known data points as needed.



## [Link to Shared Notes](https://docs.google.com/document/d/1nQI-uqbcs7XYo5LneCgOuZDE-gxwqzc-/edit?usp=drive_link)
