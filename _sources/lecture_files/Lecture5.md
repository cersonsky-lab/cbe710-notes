# Generalized ensembles


## Additional Readings for the Enthusiast

-   {cite:ts}`chandler_introduction_1987` Chapter 3.5

-   {cite:ts}`mcquarrie_statistical_2000` Chapter 3.2

## Goals for today's lecture
- For an arbitrary set of extensive and intensive variables, how can we construct an ensemble?

## Preliminary notes: natural variables

In the preceding three lectures, we presented derivations to describe
the microcanonical ($NVE$) and canonical ($NVT$) ensembles.

In each case, we equated a corresponding thermodynamic potential
to a probability and a normalizing constant.
What should also be noticed, however, is that the thermodynamic potential
corresponding to each statistical ensemble is exactly the potential that
has the same natural variables as the parameters held constant for each
microstate of the corresponding ensemble. Recall that we can write as
the fundamental relation for the entropy and its relationship to the
microcanonical ensemble:

$$\begin{aligned}
dS &= \frac{1}{T} dE + \frac{P}{T} dV - \frac{\mu}{T} dN \\
S &= k_B \ln \Omega (N,V,E)
\end{aligned}$$

From inspection, we see that $NVE$ are the natural variables of the
entropy, and these are the same parameters held constant for each
microstate of the microcanonical ensemble. Similarly, we can write for
the Helmholtz free energy:

$$\begin{aligned}
dF &= -SdT - PdV + \mu dN \\
F &= -k_B T \ln Z(N,V,T)
\end{aligned}$$

Again, we see that $NVT$ are the natural variables of the Helmholtz free
energy, and these are the same parameters held constant for microstate
of the canonical ensemble. These observations suggest that there may be
some general recipe for relating the normalizing constant of a
statistical ensemble to a thermodynamic potential with corresponding
natural variables.

Based on this reasoning, we might like to have statistical ensembles to
solve a problem where some other variable is held constant. This leads
to the idea of deriving a

```{glossary}
generalized ensemble
    a statistical ensemble appropriate for any system that permits
    the exchange of some extensive variable with the environment
```

For example, consider the adsorption of a gas to a surface; equilibrium is
established when the chemical potential of the gas in the bulk is equal
to the chemical potential of the gas at the surface, and hence it would
be intuitive to use a statistical ensemble in which the chemical
potential (rather than the number of particles) is fixed in each
microstate. While our example to date (polymer adsorption) has
demonstrated that we can solve a particular problem using any
statistical ensemble, it is also apparent that solutions can be obtained
more easily if we choose an appropriate ensemble. Typically, it will be
easier to solve problems if we choose an ensemble with the same natural
variables as the variables that are constant for the system of interest.
It is thus convenient to derive a generalized ensemble appropriate for
any given set of natural varables.

## Derivation of the generalized ensemble

First, let us consider again the derivation of the canonical ensemble
presented in the previous lecture. We considered a single system
embedded within a bath; the total combined system had fixed $NVE$, but
the energy of the system of interest was allowed to exchange with the
energy of the bath such that the system of interest and bath were
instead at fixed temperature. Here, will consider the same system, but
now we assume that in addition to exchanging energy with the environment
the system can also exchange some extensive property $X$ with the bath
with the associated work given by $fdX$.

![image](figs/fig_5_1-01.png)

This notation matches the
generalized definition of work from [our previous lecture](Lecture1B).

At equilibrium, the
temperature of the bath is equal to the temperature of the system and in
addition the generalized force, $f$, is the same for the system and the
bath since intensive variables are equal at equilibrium. For example,
$f$ might be the chemical potential, $\mu$, and $X$ might be the number
of particles, $N$, in which case $fdX = \mu dN$ would be chemical work.
Alternatively, $f$ might be the negative pressure, $-P$, and $X$ might
be the volume, $V$, in which case $fdX = -P dV$ would be
expansion-contraction work. Both forms of work will lead to similar
partition functions, motivating the derivation of a generalized
ensemble.

We can now follow the same derivation performed previously for the
canonical ensemble to obtain a partition function for this generalized
system in which $E$ and $X$ can exchange between the system and bath. We
first write constraints reflecting the exchange of material between the
system and bath, recognizing again that the combined system is isolated
and described by the microcanonical ensemble:

$$\begin{aligned}
E_S + E_B &= E_T = \text{constant} \\
X_S + X_B &= X_T = \text{constant}
\end{aligned}$$

The probability that the system samples a particular microstate with
$E_j$ and $X_j$ (ignoring other mechanical variables, such as the
volume, $V$) is written as:

$$\begin{aligned}
p_j(E_j, X_j) &= \frac{\Omega_B(E_T-E_j, X_T-X_j)}{C_1}
\end{aligned}$$

As in the derivation of the canonical ensemble, this expression states
that the probability of finding the system in a particular microstate
$j$ is proportional to the number of microstates that the bath can
sample when the system is in microstate $j$ with $C_1$ as a
normalization factor. We now consider the subset of bath states in which
the bath energy and value of $X$ are fixed to the values $E_T-E_j$ and
$X_T-X_j$ respectively, so this subset of states is a microcanonical
ensemble.

```{admonition} Using the procedure similar to the last lecture, show that $p_j = C_2 \exp \left (  -\beta E_j+\beta fX_j \right )$
<details>
  <summary><b></b>[Show derivation]</summary>

We first take the logarithm of both sides:

$$\begin{aligned}
\ln p_j(E_j, X_j) &=  \ln \Omega_B(E_T-E_j, X_T-X_j) - \ln C_1
\end{aligned}$$

Assuming that $E_B \gg E_j$ and $X_B \gg X_j$, we expand
$\ln \Omega_B(E_T-E_j, X_T-X_j)$ as a Taylor series around the point
where $E_T-E_j = E_T$ and $X_T - X_j = X_T$ (hence we Taylor expand in 2
variables, and ignore second-order and higher terms):

$$\begin{aligned}
\approx & \quad \ln \Omega_B(E_T, X_T)\\
& \quad - E_j \left ( \frac{\partial \ln \Omega_B(E_T-E_j, X_T-X_j)}{\partial (E_T-E_j)} \right )_{X,V}    \\\nonumber
& \quad - X_j \left ( \frac{\partial \ln \Omega_B(E_T-E_j, X_T-X_j)}{\partial (X_T-X_j)} \right )_{E,V}
\\= & \quad \ln \Omega_B(E_T,X_T)  - \frac{E_j}{k_B} \left ( \frac{\partial S_B}{\partial E_B} \right )_{X,V} - \frac{X_j}{k_B} \left ( \frac{\partial S_B}{\partial X_B} \right )_{E,V} 
\end{aligned}$$

We have substituted in expressions for the entropy of the bath
microcanonical ensemble (for the given values of the system energy and
number of particles). So far the equations should all look familiar.

We can now write the fundamental relation in the entropy representation
while adding the generic work term $fdX$ to obtain expressions for the
two partial derivatives:

$$\begin{aligned}
dE &= TdS - PdV + f dX \\
dS &= \frac{1}{T} dE + \frac{P}{T} dV - \frac{f}{T} dX \label{general_entropy}\\ 
&= \left ( \frac{\partial S}{\partial E} \right )_{X,V} dE + \left ( \frac{\partial S}{\partial V} \right )_{E, X} dV + \left ( \frac{\partial S}{\partial X} \right )_{E, V} dX
\end{aligned}$$

We thus see that, for the bath (subscript $B$):

$$\begin{aligned}
\left ( \frac{\partial S_B}{\partial E_B} \right )_{X,V} &= \frac{1}{T_B} \\
\left ( \frac{\partial S_B}{\partial X_B} \right )_{E,V} &= -\frac{f_B}{T_B}
\end{aligned}$$

Substituting these relationships into the derivation above and letting
$T_B = T_S = T$ and $f_B =f_S= f$ by the conditions of equilibrium
gives:

$$\begin{aligned}
\ln \Omega_B(E_T-E_j, X_T-X_j) &=  \ln \Omega_B(E_T, X_T) - \frac{E_j}{k_B T} + \frac{f X_j}{k_BT}
\end{aligned}$$

Substituting back into the original expression for the probability
yields:

$$\begin{aligned}
\ln p_j(E_j, X_j) &=  \ln \Omega_B(E_T-E_j, X_T-X_j) - \ln C_1 \\
&=  \ln \Omega_B(E_T, X_T) - \frac{E_j}{k_B T} + \frac{f X_j}{k_BT} - \ln C_1\\
\therefore  p_j &= C_2 \exp \left ( -\beta E_j+\beta fX_j\right )
\end{aligned}$$
</details>
```


We now invoke the normalization condition $\sum p_j = 1$ to finalize the
derivation:

$$\begin{aligned}
p_j(E_j, X_j) = \frac{\exp \left ( -\beta E_j+\beta fX_j\right )}{\sum_{j}^{\textrm{microstates}} \exp \left ( -\beta E_j+\beta fX_j\right )}
\end{aligned}$$

The partition function for the generalized ensemble, which we will give
the symbol $\Phi$ is thus:

```{math}
:label: general_partition

\Phi  = \sum_{j}^{\textrm{microstates}} \exp \left ( -\beta E_j+\beta fX_j\right )
```

This general partition function looks quite similar to the canonical
partition function except that there is now the new work term in
the exponential. Note one subtlety, here - we include in this derivation
terms for both the internal energy, $E$, and various work terms. When
defining a problem, you might think to include a work term as part of
the energy, which would lead to overcounting. Thus, when using the
general ensemble approach, it is important that contributions to the
internal energy (*e.g.*, translational degrees of freedom for particles)
are not also repeated as work terms (e.g., expansion-contraction work) that
are separately included in the partition function.

## Thermodynamic connection for the generalized ensemble

Having established an expression for the generalized ensemble partition
function, we can now derive a relationship between a thermodynamic
potential and this generalized partition function, just as we have a
relationship between the Helmholtz free energy and the canonical
partition function. Doing so requires a new definition of the entropy,
referred to as the [**Gibbs entropy**](https://en.wikipedia.org/wiki/Entropy_(statistical_thermodynamics)#Gibbs_entropy_formula):

$$S = -k_B \sum_j p_j \ln p_j$$

You will shows this expression's equivalence to the Boltzmann definition
of the entropy on [Problem Set 2](#TBD). We now have the expressions:

$$\begin{aligned}
p_j(E_j, X_j) &= \frac{\exp \left ( -\beta E_j + \beta f X_j \right )}{\Phi} \label{general_probability}\\
\Phi  &= \sum_{j}^{\textrm{microstates}} \exp \left ( -\beta E_j + \beta f X_j \right ) \\
S &= -k_B \sum_{j} p_j \ln p_j
\end{aligned}$$

which we will use to derive a thermodynamic connection. Using the Gibbs
entropy formula and the expression for the probability of a microstate,
we can write:

$$\begin{aligned}
S &= -k_B \sum_j p_j \ln p_j \\
&= -k_B \sum p_j \ln \left ( \frac{\exp \left [ -\frac{E_j}{k_B T} \right ] \exp \left [ \frac{f X_j}{k_B T} \right ]}{\Phi} \right ) \\
&= -k_B \sum p_j \left ( - \frac{E_j}{k_BT} + \frac{f X_j}{k_BT} - \ln \Phi \right ) \\
&= \sum p_j \left ( \frac{E_j}{T} \right )  - \sum p_j \left (\frac{f X_j}{T} \right )+  \sum p_j k_B \ln \Phi \\
&= \frac{1}{T} \sum p_j E_j - \frac{f}{T} \sum p_j X_j + k_B \ln \Phi \sum p_j
\end{aligned}$$

Here, we recognize that $\sum p_j E_j = \langle E \rangle$,
$\sum p_j X_j = \langle X \rangle$, $\sum p_j = 1$ due to the
normalization of state probabilities, and $\ln \Phi$ has no $j$
dependence, so we can write:

$$\begin{aligned}
S &= \frac{\langle E \rangle}{T} - \frac{f \langle X \rangle}{T} + k_B \ln \Phi \\
TS &= \langle E \rangle -  f \langle X \rangle + k_B T \ln \Phi \\
&\therefore E - f X - TS = -k_B T \ln \Phi
\end{aligned}$$

Thus,the generalized ensemble with partition function
$\Phi = \sum_{j} \exp \left [ -\frac{E_j}{k_B T} \right ]  \exp \left [ \frac{f X_j}{k_B T} \right ]$
is related to thermodynamic variables via
$-k_B T \ln \Phi =   E - TS - f X$. As a first consistency check, we can
see that if $f = 0$, the equation correctly reduces to
$-k_B T \ln Z = E - TS = F$ which is the correct thermodynamic link
between the canonical partition function and the Helmholtz free energy
($F = E - TS$). We will use $\Sigma$ to refer to this new "free energy"
that we have defined: $\Sigma = E - TS - fX$.


Let's just check the self-consistency of this result by writing out
thermodynamic relations.

```{admonition} Show that $X = -\left ( \frac{\partial \Sigma}{\partial f}\right )_{V, T}$
<details>
  <summary><b></b>[Show derivation]</summary>

First, write out the total derivative
of $\Sigma$ and substitute in the fundamental equation gives:

$$\begin{aligned}
d\Sigma &= dE - f dX - Xdf - TdS - SdT \\
&= (f dX -TdS - PdV) - f dX - Xdf - TdS - SdT \\
&= - Xdf - SdT - P dV \\
&= \left ( \frac{\partial \Sigma}{\partial f}\right )_{V, T} dX + \left ( \frac{\partial \Sigma}{\partial T}\right )_{X, V} dT + \left ( \frac{\partial \Sigma}{\partial V}\right )_{X, T} dV \\
\therefore X &= -\left ( \frac{\partial \Sigma}{\partial f}\right )_{V, T}
\end{aligned}$$
</details>
```

```{admonition} Show that $X = \langle X \rangle$. 
<details>
  <summary><b></b>Hints</summary>

  Substitute the equation for $\Sigma$ into the equation you just solved.

</details>
<details>
  <summary><b></b>[Show derivation]</summary>

We can use $X = -\left ( \frac{\partial \Sigma}{\partial f}\right )_{V, T}$ to check that the thermodynamic connection
between $\Phi$ and $\Sigma$ is accurate:

$$\begin{aligned}
X &= -\left ( \frac{\partial \Sigma}{\partial f}\right )_{V, T} \\
&= k_B T \left (\frac{\partial \ln \Phi}{\partial f} \right )_{V, T} \\
&= \frac{k_B T}{\Phi} \left ( \frac{\partial \Phi}{\partial f} \right )_{V, T} \\
&= \frac{k_B T}{\Phi} \left [\frac{\partial}{\partial f} \left ( \sum_{j} \exp \left [ -\frac{E_j}{k_B T} \right ]  \exp \left [ \frac{f X_j}{k_B T} \right ] \right ) \right ]_{V,T} \\
&= \frac{k_B T}{\Phi} \sum_{j} \frac{X_j}{k_B T} \exp \left [ -\frac{E_j}{k_B T} \right ]  \exp \left [ \frac{f X_j}{k_B T} \right ] \\
&= \sum_{j} X_j \left ( \frac{\exp \left [ -\frac{E_j}{k_B T} \right ]  \exp \left [ \frac{f X_j}{k_B T} \right ]}{\Phi} \right )\\
&= \sum_j X_j p_j \\
&= \langle X \rangle
\end{aligned}$$

Thus, this checks out - we correctly find that the ensemble average is
equal to the thermodynamic parameter via the relationship between $\Phi$
and $\Sigma$.

</details>
```

## Recipe for the generalized ensemble

In the previous section, the thermodynamic potential that corresponds to
the log of the generalized ensemble partion function is **exactly** that
potential for which the thermodynamic variables conjugate to $E$ and $X$
are held constant (i.e., the $VTf$ ensemble in this generalized case).
We have assumed these variables as constant from the beginning of this
derivation, but it is apparent that these are the **natural variables**
of the thermodynamic potential corresponding to $E-TS - fX = \Sigma$ by
taking the derivative:

$$\begin{aligned}
d\Sigma &= dE - TdS - SdT - fdX - Xdf \\
&= TdS - PdV + fdX - TdS - SdT - fdX - Xdf \\
&=  -PdV - SdT - Xdf
\end{aligned}$$

Therefore, the thermodynamic potential $\Sigma$ is at an extremum when
$V$, $T$, and $f$ are constant, which defines them as the set of natural
variables for this potential and this partition function. To emphasize
this point, we can also write the thermodynamic connection as:

$$\Sigma(V, T, f) = -k_B T \ln \Phi(V, T, f)$$

where $\Sigma(V, T, f)$ is the generalized thermodynamic potential that
is a function of the natural variables $VTf$.

This observation suggests a general recipe for deriving a generalized
ensemble:

1.  **Determine the natural variables of the system** (e.g., $\mu$, $V$,
    $T$) as the variables that are either fixed due to the constraints
    of the system boundaries or are constant due to conditions of
    equilibrium (i.e., intensive variables conjugate to extensive
    variables that can exchange with the environment).

2.  **Write a general partition function** ($\Phi$) of the form in Eq.
    {eq}`general_partition`, including all work terms that
    correspond to extensive variables that can exchange with the
    environment.

3.  For each extensive variable that is able to exchange with the
    environment, **substract the product of the extensive variable and its
    conjugate variable from the internal energy $E$ to obtain a
    thermodynamic potential** with the correct natural variables

4.  **Equate $-k_BT \ln \Phi$ to the thermodynamic potential ($\Sigma$)**
    that is a function of the same natural variables.

5.  **Derive other thermodynamic variables** via appropriate derivatives of
    $\Sigma$.

The one caveat here is that for a system that can exchange energy with
the environment, we treat the extensive variable as the entropy, $S$,
and substract $TS$ from the internal energy, leading to the canonical
ensemble. This is due to the equivalence of the energy and entropy
representations of the fundamental equation. The other caveat, as noted
above, is to ensure that you do not include work terms in the expression
for the energy of the system itself - that would be double counting
energies.

## Example: the {term}`grand canonical ensemble`

As a test of the generalized ensemble approach, we can derive the grand
canonical ensemble, in which the energy and number of particles of a
system are allowed to vary while the volume and temperature are held
constant.


```{admonition} 1.   Determine the natural variables of the system.
<details>
  <summary><b></b>[Click for answer]</summary>

Since $N$ (conjugate to $\mu$) and $E$ (conjugate to $1/T$)
can exchange with the environment and $V$ is fixed due to the
constraints of the system boundaries, the natural variables at
equilibrium are $\mu$, $V$ and $T$. Here, $\mu dN$ is the work term that
corresponds to $fdX$ in the generalized ensemble, so we have that
$f = \mu$ and $X = N$.
</details>
```

```{admonition} 2. Write a general partition function.
<details>
  <summary><b></b>[Click for answer]</summary>

The partition function (using the symbol $\Xi$ per convention for this
ensemble) then has the form:

$$\begin{aligned}
\Xi &=  \sum_{j} \exp \left [ -\beta E_j \right ]  \exp \left [\beta \mu N_j \right ]
\end{aligned}$$
</details>
```

```{admonition} 3. Substract the product of the extensive variable and its conjugate variable from the internal energy $E$ to obtain the thermodynamic potential.
<details>
  <summary><b></b>[Click for answer]</summary>

We then determine the corresponding thermodynamic potential (using the symbol $\Sigma_G$,
with the subscript indicating the grand canonical ensmeble), noting that because the system
can exchange energy with the environment, we subtract a factor of $TS$:

$$\begin{aligned}
\Sigma_G  &= E - TS - \mu N \\
d\Sigma_G &= -P dV - SdT - N d\mu
\end{aligned}$$

This potential, $\Sigma_G$, is also sometimes called the grand
potential. The total derivative emphasizes that it has the correct
natural variables ($\mu$, $V$ and $T$).
</details>
```

```{admonition} 4. Equate $-k_BT \ln \Phi$ to the thermodynamic potential.
<details>
  <summary><b></b>[Click for answer]</summary>

We can then equate this
potential to the partition function as:

$$\Sigma _G = -k_B T \ln \Xi$$

which we can use to derive various relations.
</details>
```

```{admonition} 5. Derive other thermodynamic variables: what is the ensemble-average number of particles?
<details>
  <summary><b></b>[Click for answer]</summary>

The ensemble-average number of particles in the system would be:

$$\begin{aligned}
\langle N \rangle &=  \left ( \frac{\partial \Sigma_G}{\partial \mu}\right )_{V, T} \\
&= - k_B T\left ( \frac{\partial \ln \Xi}{\partial \mu}\right )_{V,T}
\end{aligned}$$

With explicit relations for $E_j$ and $N_i$ we could then derive the
number of particles.
</details>
```

## Example: the {term}`isothermal-isobaric ensemble`

As another example, we can derive the isothermal-isobaric ensemble, in
which the energy and volume of a system are allowed to vary while the
number of particles is held constant.

```{admonition} 1.   Determine the natural variables of the system.
<details>
  <summary><b></b>[Click for answer]</summary>

In this case, the natural
variables at equilibrium are $N$, $P$ and $T$ and $-PdV$ is the work
term that corresponds to $fdX$ in the generalized ensemble.

</details>
```

```{admonition} 2. Write a general partition function.
<details>
  <summary><b></b>[Click for answer]</summary>

The partition function (using the symbol $\Delta$ per convention for
this ensemble) then has the form:

$$\begin{aligned}
\Delta &=  \sum_{j} \exp \left [ -\beta E_j \right ]  \exp \left [-\beta PV_j \right ]
%&= \sum_{i}  Z(N, V_i, T)  \exp \left [ \frac{-PV_i}{k_B T} \right ] 
\end{aligned}$$
</details>
```

```{admonition} 3. Substract the product of the extensive variable and its conjugate variable from the internal energy $E$ to obtain the thermodynamic potential.
<details>
  <summary><b></b>[Click for answer]</summary>

The corresponding thermodynamic potential is:

$$\begin{aligned}
G  &= E - TS + PV \\
dG &= VdP- SdT + \mu dN
\end{aligned}$$

This potential, $G$, is the Gibbs free energy, which is relevant at
typical experimental conditions. The total derivative emphasizes that it
has the correct natural variables ($N$, $P$ and $T$).

</details>
```

```{admonition} 4. Equate $-k_BT \ln \Phi$ to the thermodynamic potential.
<details>
  <summary><b></b>[Click for answer]</summary>

We can then equate
this potential to the partition function as:

$$G = -k_B T \ln \Delta$$

which we can use to derive various relations.

</details>
```

```{admonition} 5. Derive other thermodynamic variables: what is the ensemble-average volume of the system?
<details>
  <summary><b></b>[Click for answer]</summary>

The ensemble-average volume of the system would be:

$$\begin{aligned}
\langle V \rangle &=  \left ( \frac{\partial G}{\partial P}\right )_T \\
&= - k_B T\left ( \frac{\partial \ln \Delta}{\partial P}\right )_T 
\end{aligned}$$

With explicit relations for $E_j$ and $V_i$ we could then derive the
volume.
</details>
```

We now have discussed 4 explicit ensembles - microcanonical ($NVE$),
canonical ($NVT$), grand canonical ($\mu VT$), and isothermal-isobaric
($NPT$), along with a generalized ensemble in which additional work
terms (e.g. corresponding to external electric/magnetic fields, for
instance) can be incorporated.
