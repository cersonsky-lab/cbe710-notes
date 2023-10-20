# Practice Problems for Unit Exam

See below for practice problems related to CBE710, Fall 2023.

**As I may choose to rotate these questions into future iterations
of the class, this page will not be available in future archives.**

## Question 1: Einstein model of a solid

A major challenge in classical thermodynamics was explaining why the
heat capacity ($C_V$) of crystalline solids approaches zero at zero
temperature. Einstein solved this problem by modeling a solid as $N$
atoms that behave like independent harmonic oscillators about their
equilibrium positions in the crystal lattice. Each atom vibrates at the
same frequency, $\omega$, in three independent directions; the system is
thus a collection of $3N$ identical harmonic oscillators.

For this problem, the following relationship may be useful:

$$\begin{aligned}
\sum_{k=0}^\infty r^k = \frac{1}{1-r}
\end{aligned}$$


```{admonition} **(a)**

The energy of a single quantum harmonic oscillator is:

$$E_n = (n+\frac{1}{2})h \omega \quad n = 0, 1, 2, \dots$$

where $n$ is a quantum number, $h$ is Planck's constant, and $\omega$ is
the vibrational frequency. Write an expression for the canonical
partition function for the Einstein solid.

<details><summary>Show answer</summary>

Before you look, did you define your oscillators as independent?

<details><summary>Yes</summary>

We can start by recognizing that all $3N$ oscillators are independent,
so we can instead write the single-oscillator canonical partition
function, $z$, as:

$$\begin{aligned}
    z &= \sum_i \exp(-\beta E_i ) \\
    &= \sum_{n=0}^\infty \exp \left [ -  (n+\frac{1}{2})\beta h\omega \right ] \\
    &= \exp(-\beta h \omega/2)  \sum_{n=0}^\infty \exp \left [ -n\beta h\omega \right ] \\
    &= \exp(-\beta h \omega/2)  \sum_{n=0}^\infty \exp \left [ -\beta h\omega \right ]^n 
    
\end{aligned}$$


We now substitute in the relationship from the hint with $n=k$ and
$r=\exp \left ( -\beta h\omega \right )$:

$$\begin{aligned}
    z &= \frac{ \exp(-\beta h \omega/2) }{1- \exp \left [ -\beta h\omega \right ]}
    
\end{aligned}$$

Before we go on... do you define your oscillators as distinguishable?

<details><summary>Yes</summary>

Each oscillator will be distinguishable in the
solid (since each position is translationally distinct) so we write the
total system partition function as:

$$\begin{aligned}
    Z &= z^{3N} \\
    &= \left ( \frac{ \exp(-\beta h \omega/2) }{1- \exp \left [ -\beta h\omega \right ]} \right )^{3N}
    
\end{aligned}$$
</details>
</details>
</details>
```


```{admonition} **(b)**

Using your expression from part **a**, solve for the internal energy of
the Einstein solid.

<details><summary>Show answer</summary>

We can solve for the energy by writing out an expression for the
Helmholtz free energy using the canonical partition function, and then
relating to this entropy through the expression derived in [our earlier lecture](../lecture_files/Lecture4):

$$\begin{aligned}
    E = -\left (\frac{\partial \ln Z}{\partial \beta} \right )_V
    
\end{aligned}$$

Taking the derivative gives:

$$\begin{aligned}
    E &=-\left (\frac{\partial \ln Z}{\partial \beta} \right )_V \\
    &= -3N \left (\frac{\partial \ln z}{\partial \beta} \right )_V\\
    \ln z &= -\frac{\beta h\omega}{2} - \ln \left [1-\exp(-\beta h\omega)\right] \\
    \therefore &E = 3N \left ( \frac{h\omega}{2} + \frac{h\omega}{\exp(\beta h\omega) -1} \right )
    
\end{aligned}$$
</details>
```


```{admonition} **(c)**

Using your expression from part **b**, solve for
$C_V =\left (\frac{\partial E}{\partial T} \right )_V$ for the Einstein
solid. Write your answer in terms of the vibrational temperature,
defined as: $\Theta \equiv h\omega / k = \beta h\omega T$.

<details><summary>Show answer</summary>

It's easiest to first show the temperature dependence explicitly, which
we can do by substituting in $\Theta$ to our previous result to obtain
(after a lengthy product/chain rule):

$$\begin{aligned}
    E &= 3 N k_B \Theta \left ( \frac{1}{2} + \frac{1}{\exp(\Theta / T) - 1} \right ) \\
    C_V &= \left (\frac{\partial E}{\partial T} \right )_V \\
    &= 3 N k_B \left ( \frac{\Theta}{T} \right )^2 \frac{\exp (\Theta/T)}{\left [\exp (\Theta/T) -1 \right ]^2}
    
\end{aligned}$$
</details>
```

```{admonition} **(d)**

Show that $C_V\rightarrow 0$ as $T\rightarrow 0$.

<details><summary>Show answer</summary>

As $T\rightarrow 0$, $\Theta / T \rightarrow \infty$, so
$\exp(\Theta/T) \gg 1$ and we approximate the expression as:

$$\begin{aligned}
    C_V &\approx 3 N k_B \left ( \frac{\Theta}{T} \right )^2 \frac{\exp (\Theta/T)}{\exp (2\Theta/T)} \\
    &= 3 N k_B \left ( \frac{\Theta}{T} \right )^2 \exp(-\Theta/T)
    
\end{aligned}$$

As $T\rightarrow 0$, the exponential term will approach zero more
rapidly than the harmonic term will diverge, so we indeed find that
$C_V \rightarrow 0$ as $T\rightarrow 0$.
</details>
```


```{admonition} **(e)**
The Einstein model does not obtain the correct functional form
for $C_V$ in the low-temperature limit. What is the major assumption
made in this model that is likely not true of real solids?

<details><summary>Show answer</summary>
The major assumption made is that all atoms oscillate independently. In
real solids, atoms have coupled oscillations that give rise to
additional energetic contributions (e.g. phonon modes) not captured by
this model.
</details>
```

## Question 2: Analyzing simple systems

Write the requested quantity for each system. In each part, define the
final quantity only in terms of parameters defined in the problem
statement. Do not evaluate any sums or integrals.

```{admonition} **(a)** 
The system is $N$ independent, non-interacting diatomic
molecules. Two of the molecules are uniquely radiolabeled such that they
can be distinguished from all other molecules and from each other. The
partition functions associated with translational, rotational, and
vibrational energies are $z_\textrm{trans}$, $z_\textrm{rot}$, and
$z_\textrm{vib}$, respectively. Write a canonical partition function for
this system.

<details><summary>Show answer</summary>
Factorize this partition function, recognizing that we have two sets of
indistinguishable particles

$$\begin{aligned}
    Z &= \frac{\left(z_\textrm{trans}z_\textrm{rot}z_\textrm{vib}\right)^{N-2}}{(N-2)!} {\left(z_\textrm{trans}z_\textrm{rot}z_\textrm{vib}\right)^{2}} \\
    &= \frac{\left(z_\textrm{trans}z_\textrm{rot}z_\textrm{vib}\right)^{N}}{(N-2)!}
    
\end{aligned}$$

</details>
```

```{admonition} **(b)** 
The system is a surface with $N$ binding sites onto which two
different types of molecules adsorb. $M$ identical molecules of the
first type adsorb to form a first layer on the surface. $W$ identical
molecules of the second type then adsorb on top of the first layer to
form a second layer. Write the degeneracy for this system.

<details><summary>Show answer</summary>
The degeneracy can be combinatorally computed as the number of ways to
arrange molecules in the first layer multiplied by the number of ways to
arrange molecules in the second layer. The first layer degeneracy is our
standard value from class:

$$\begin{aligned}
    \Omega_{\textrm{first}} = \frac{N!}{(N-M)!M!}
    
\end{aligned}$$

The second layer is given by the number of ways of arranging $W$
molecules on the first $M$ molecules:

$$\begin{aligned}
    \Omega_{\textrm{second}} = \frac{M!}{(M-W)!W!}
    
\end{aligned}$$

Combining:

$$\begin{aligned}
    \Omega &= \frac{N!}{(N-M)!M!}\frac{M!}{(M-W)!W!} \\
    &= \frac{N!}{(N-M)!(M-W)!W!}
    
\end{aligned}$$

</details>
```

```{admonition} **(c)** 
The system is $N$ freely rotating spins on a 2D lattice subject
to an in-plane external magnetic field, $H$. Each spin has a magnetic
moment, $\mu$, and can obtain any in-plane orientation, rather than just
a up/down orientation. The energy of each spin is:

$$\begin{aligned}
E = -\mu H \cos \theta
\end{aligned}$$

where $\theta$ is the angle between the spin and the direction of the
external magnetic field. Write a canonical partition function for this
system.

<details><summary>Show answer</summary>
Like the systems studied in [Problem Set 1](problem_set_1) and [2](problem_set_2), we can factorize the
partition function since all spins are independent and
indistinguishable. The single-spin partition function is obtained by
integrating over all possible angles:

$$\begin{aligned}
    z &= \int_0^{2\pi} e^{ \beta \mu H \cos \theta} d\theta \\
    \therefore Z &= z^N = \left [ \int_0^{2\pi} e^{ \beta \mu H \cos \theta} d\theta \right ]^N
    
\end{aligned}$$
```

## Question 3: Adsorption of vibrating atoms

A set of atoms binds to $M$ lattice sites on a surface such that every
lattice site is occupied by a single atom. Each atom vibrates in a
parabolic potential on each site and does not interact with other atom.
The vibrational energy of a single atom is described by:

$$\begin{aligned}
\epsilon_i(n) = \left (n+ \frac{1}{2} \right ) h v \quad n=0, 1, 2, \dots
\end{aligned}$$

where $h$ is Planck's constant, $n$ is an integer, and $v$ is a
characteristic vibrational frequency. The degeneracy of each energy
level is 1. 

```{admonition} **(a)** 
Write the canonical partition function of the $M$ adsorbed atoms
in terms of $M$ and $hv$.

<details><summary>Hint</summary>

$$\begin{aligned}
\sum_{k=0}^\infty r^k &= \frac{1}{1-r}
\end{aligned}$$

</details>

<details><summary>Show answer</summary>


Before we go on... did you define your absorbed atoms as independent subsystems?

<details><summary>Yes</summary>

Did you define them as distinguishable?

<details><summary>Yes, I got this.</summary>

The adsorbed atoms are distinguishable and independent, so we can
factorize the partition function and compute a single-atom vibrational
partition function as:

$$\begin{aligned}
    z &= \sum_{n=0}^\infty e^{-\beta \left (n+ \frac{1}{2} \right ) h v} \\
    &= e^{-\beta hv/2}\sum_{n=0}^\infty e^{-\beta hvn}
    
\end{aligned}$$

Using the first expression from the hint, we let $r=\exp(-\beta hv)$ and
we can simplify this to:

$$\begin{aligned}
    z &= \frac{e^{-\beta hv/2} }{1-e^{-\beta hv}}
    
\end{aligned}$$

The total system partition function is then:

$$\begin{aligned}
    Z = z^M = \left ( \frac{e^{-\beta hv/2} }{1-e^{-\beta hv}} \right )^M
    
\end{aligned}$$

</details>
</details>
</details>
```

```{admonition} **(b)** 
Rather than occupying all possible lattice sites, now only $N$
atoms adsorb to the surface, where $N<M$. Each atom still vibrates
independently and there is no other energetic contribution associated
with adsorption. Only one atom can adsorb per lattice site. Write an
expression for the canonical partition function of the $N$ adsorbed
atoms in terms of $M$, $N$, and $hv$.

<details><summary>Show answer</summary>

The energy of the system of adsorbed particles is still the sum of the
energies of the $N$ independent particles, so we can still factorize the
partition function. However, now that there are more lattice sites than
adsorbed atoms, we have to account for the degeneracy of the
configurations that give identical energies. Note that we do not need to
consider the degeneracy of the energy itself, which is given solely by
the number of bound atoms, $N$.

The degeneracy of the system (i.e., the number of equivalent
configurations that yields the same energy) is equal to the number of
ways we can split the $M$ lattice sites into occupied and empty sites.
This is the same calculation performed to calculate the entropy of a
two-state system in the microcanonical ensemble. The system partition
function with this term is then:

$$\begin{aligned}
    Z &= \frac{M!}{N!(M-N)!} z^N
    
\end{aligned}$$

where $z$ is defined as in part **a**.

</details>
```

```{admonition} **(c)** 
The adsorbed atoms are now in equilibrium with a surrounding gas
of atoms. The gas has a constant chemical potential $\mu$. Determine the
ensemble-average number of atoms adsorbed on the $M$ sites at
equilibrium.

<details><summary>Show answer</summary>

Before we go on... did you assume either the grand canonical or canonical ensemble?

<details><summary>Yes</summary>

We will use the grand canonical ensemble here, following a similar approach as in [our earlier lecture](../lecture_files/Lecture7).

Did you define each lattice site as independent?

<details><summary>Yes</summary>
We can write a single-site partition function:

$$\begin{aligned}
    \xi &= \sum_i e^{\beta \mu N_i} e^{-\beta \epsilon_i} \\
    &= 1 + e^{\beta \mu} \sum_{n=0}^\infty e^{-\beta \left (n+ \frac{1}{2} \right ) h v}
    
\end{aligned}$$

The idea here is that there is one state where no particle is adsorbed
($N_i = 0$) and therefore the energy of the site is also 0. We then
obtain an infinite series of states where a single particle is adsorbed
and vibrates. We can replace this latter quantity with the
single-particle vibrational partition function from part **a**:

$$\begin{aligned}
    \xi &= 1 + e^{\beta \mu} z
    
\end{aligned}$$

The total system partition function (recognizing that sites are still
distinguishable) is then:

$$\begin{aligned}
    \Xi &= \left (1 + e^{\beta \mu} z \right )^M
    
\end{aligned}$$

We can now determine the ensemble-average number of adsorbed atoms by
writing a total derivative of the corresponding grand potential:

$$\begin{aligned}
    d \Sigma &= -S dT - PdV - Nd\mu \\
    \langle N \rangle &= -\left ( \frac{\partial \Sigma}{\partial \mu} \right )_{V, T}
    
\end{aligned}$$

Substituting in the relation between the grand potential and grand
canonical partition function then gives:

$$\begin{aligned}
    \langle N \rangle &= M k_B T \left ( \frac{\partial \ln (1 + e^{\beta \mu} z}{\partial \mu} \right )_{V,T} \\
    &= M k_B T \frac{\beta e^{\beta \mu}z}{1 + e^{\beta \mu} z} \\
    &= \frac{M e^{\beta \mu}z}{1 + e^{\beta \mu} z}
    
\end{aligned}$$

</details>
</details>
</details>
```

## Question 4: Two-state free energy change

A quantity that is often calculated in simulations is the free energy
change with a process that transforms a system from state $A$ for state
$B$. For example, you might consider the free energy change for mutating
a protein side-chain, modifying its interactions with the environment.
Assume that the energy of microstate $i$ in state $A$ is given by
$E_A(x_i)$ and the energy of microstate $i$ in state $B$ is given by
$E_B(x_i)$.


```{admonition} Question

Using the tools of statistical mechanics, show that for a
system in the canonical ensemble, this two-state Helmholtz free energy
change be written as:

$$\begin{aligned}
\exp\left(-\beta \Delta F\right) &= \langle \exp \left ( -\beta \Delta E \right )\rangle_{A}
\end{aligned}$$

where $\Delta F = F_B - F_A$, $\Delta E(x_i) = E_B(x_i) - E_A(x_i)$ and
the subscript $A$ indicates that the ensemble-average is computed using
the partition function for state $A$.


<details><summary>Show answer</summary>

We can start by writing the free energy for each of the two states:

$$\begin{aligned}
    F_A &= -k_B T \ln \left ( \sum_i \exp[{-\beta E_A(x_i)}]\right ) \\
    F_B &= -k_B T \ln \left ( \sum_i \exp[{-\beta E_B(x_i)}]\right ) 
    
\end{aligned}$$

Substracting gives the following expression:

$$\begin{aligned}
    F_B - F_A = -k_B T \ln \frac{\sum_i \exp[{-\beta E_B(x_i)}]}{\sum_i \exp[{-\beta E_A(x_i)}]}
    
\end{aligned}$$

We now define $\Delta E(x_i) \equiv E_B(x_i) - E_A(x_i)$ so that
$E_B(x_i) = \Delta E(x_i)+E_A(x_i)$. Substituting this into the
numerator gives:

$$\begin{aligned}
    F_B - F_A &= -k_B T \ln \frac{\sum_i \exp[-\beta \Delta E(x_i) - \beta E_A(x_i)]}{\sum_i \exp[{-\beta E_A(x_i)}]} \\
    &= -k_B T \ln \frac{\sum_i \exp[-\beta \Delta E(x_i)] \exp[- \beta E_A(x_i)]}{\sum_i \exp[{-\beta E_A(x_i)}]}
    
\end{aligned}$$

The term within the logarithm is now exactly the ensemble-average value
of $\exp(-\beta\Delta E)$, sampled according to the energy function of
state $A$. By taking the exponent of each side, we therefore obtain:

$$\begin{aligned}
    F_B - F_A &= -k_B T \ln \langle \exp(-\beta\Delta E) \rangle_{A}\\
    \therefore \exp\left(-\beta \Delta F\right) &= \langle \exp \left ( -\beta \Delta E \right )\rangle_{A}
    
\end{aligned}$$
</details>
```


## Question 5: Protein folding

A four-residue soluble protein can obtain one of the four conformations
drawn schematically in Figure 1. Three conformations (labeled 1-3)
correspond to an unfolded protein, while one conformation (labeled 4)
corresponds to folded protein. The energy of each unfolded conformation
is $E_j = \epsilon$, while the energy of the folded conformation is
$E_j = 0$. Each of the conformations also has a length, $L_j$, as
labeled on the schematic. The protein reversibly folds and unfolds at
constant temperature and volume.

![image](figures/exam_1_protein_folding_fig.png)
Four possible conformations of a protein labeled with the
energy, $E$, and the length, $L$, of each
conformation.

```{admonition} **(a)** 
What is the probability of observing the protein in an unfolded
conformation (i.e., the probability of observing **any** of the three
unfolded conformation)?

<details><summary>Show answer</summary>

Since we are at fixed $NVT$, we can write this probability using the
canonical ensemble by explicitly summing over the possible states of the
system (recognizing that the degeneracy of the unfolded state is 3):

$$\begin{aligned}
    p_{\textrm{unfolded}} &= \frac{3e^{-\epsilon/k_B T}}{Z} \\
    Z &= \sum_j e^{-E_j/k_T} \\
    &= e^{0} + 3e^{-\epsilon/k_B T} \\
    &= 1 + 3e^{-\epsilon/k_B T} \\
    p_{\textrm{unfolded}} &= \frac{3e^{-\epsilon/k_B T}}{ 1 + 3e^{-\epsilon/k_B T}}
    
\end{aligned}$$

</details>
```

```{admonition} **(b)** 
What is the probability of observing the protein in an unfolded
conformation in the high and low temperature limits?

<details><summary>Show answer</summary>

In the high temperature limit, $k_B T \gg \epsilon$ and
$e^{-\epsilon/k_B T} = 1$. All states are equally probable so
$p_{\textrm{unfolded}} = \frac{3}{4}$.

In the low temperature limit, $k_B T \ll \epsilon$ and
$e^{-\epsilon/k_B T} = 0$. The system will now only be observed in its
lowest-energy state, which in this case is the folded state, and hence
$p_{\textrm{unfolded}} = 0$.

</details>
```

```{admonition} **(c)** 
A constant tension, $\tau$, is now applied to the same protein
while the system is still at constant volume and temperature. The
extensive conjugate variable to the tension is the length of the
protein, $L$. What is the probability of observing the protein in an
unfolded conformation (i.e., any unfolded conformation) when under
tension?

<details><summary>Show answer</summary>

Placing the protein under tension introduces as new work term, $\tau L$,
to the system. We can write the differential form of the energy as:

$$dE = TdS - PdV + \tau dL$$

The generalized partition function corresponding to the four possible
states of the system can then be written as:

$$\begin{aligned}
    \Phi &= \sum_j e^{-E_j/k_B T}e^{\tau L_j/k_BT} \\
    &= e^{-\epsilon/k_B T}e^{4b \tau / k_B T} + 2e^{-\epsilon/k_B T}e^{3b \tau / k_B T} + e^{2b \tau / k_B T}
    
\end{aligned}$$

Since the different unfolded states now have different probabilities
(due to their different lengths), we have to sum the probabilities of
the three unfolded conformations to get the probability of obtaining any
unfolded conformation. The total probability is then:

$$p_{\textrm{unfolded}} = \frac{ e^{-\epsilon/k_B T}e^{4b \tau / k_B T} + 2e^{-\epsilon/k_B T}e^{3b \tau / k_B T}}{e^{-\epsilon/k_B T}e^{4b \tau / k_B T} + 2e^{-\epsilon/k_B T}e^{3b \tau / k_B T} + e^{2b \tau / k_B T}}$$

</details>
```

```{admonition} **(d)** 
What is the average length of the protein if it is held under
tension for a long period of time?

<details><summary>Show answer</summary>

The average length can either be computed by summing over appropriately
weighted states or by taking a derivative of the partition function.
Here, we will use the latter strategy. First, we define a generalized
thermodynamic potential with natural variables of $N, V, T, \tau$:

$$\begin{aligned}
    \Sigma &= E - TS - \tau L \\
    d\Sigma &= -SdT - PdV - Ld\tau \\
    \therefore & -\left ( \frac{\partial \Sigma}{\partial \tau} \right )_{V, T} = \langle L \rangle
    
\end{aligned}$$

We relate our potential to the partition function via:

$$\Sigma = - k_B T \ln \Phi$$

We now solve for the average length of the protein, $\langle L \rangle$:

$$\begin{aligned}
    \langle L \rangle &= -\left ( \frac{\partial \Sigma}{\partial \tau} \right )_{V, T} \\
    &= k_B T \left ( \frac{\partial \ln \Phi}{\partial \tau} \right )_{V, T} \\
    &= \frac{k_BT}{\Phi} \left ( \frac{\partial \Phi}{\partial \tau} \right )_{V, T} \\
    &= \frac{4be^{-\epsilon/k_B T}e^{4b \tau / k_B T} + 6be^{-\epsilon/k_B T}e^{3b \tau / k_B T} + 2be^{2b \tau / k_B T}}{e^{-\epsilon/k_B T}e^{4b \tau / k_B T} + 2e^{-\epsilon/k_B T}e^{3b \tau / k_B T} + e^{2b \tau / k_B T}}
    
\end{aligned}$$

</details>
```

## Question 6: Crystalline defects

In a perfect crystal, there are $N$ lattice sites, and each lattice site
is occupied by a single atom. In general, however, crystalline materials
are not perfect, but instead have defects in which an atom is removed
from lattice site; such a defect is referred to as a point defect.
Multiple types of points defects are possible in crystalline materials.

![image](figures/exam_1_defects_fig_v2.png)
Examples of crystalline defects.

```{admonition} **(a)**

One type of point defect is called a *Schottky defect*, in which
an atom is removed from one of the $N$ lattice sites and moved to the
surface of the material (see Figure). The resulting empty lattice site
is referred to as a *vacancy*. Assume that the energy associated with
creating a Schottky defect is $\epsilon_s$, moving an atom from a
lattice site to the surface increases the size of the lattice from $N$
to $N+1$, vacancies created in the lattice can be associated with any of
the lattice sites (including newly created surface lattice sites), and
there can be as many as $N$ Schottky defects in the system.

Write a **canonical** partition function for a crystalline material with
$N$ atoms that **only** forms Schottky defects. Your answer may include
a summation and should be in terms of $N$, $\epsilon_s$, and any other
variables that you choose to define.

<details><summary>Hint</summary>
Many people try to solve this problem by defining a two-state
subsystem (i.e. a single lattice site that could be occupied or
unoccupied) and factorizing the partition function. The problem with
this approach is that the number of subsystems depends on the total
energy of the system, since changing the system energy by introducing a
defect also increases the size of the lattice and thus the number of
subsystems. As a result, the subsystems are not independent; if we
consider a fixed number of subsystems, then their energies cannot be
independently varied since the total energy is constrained. This problem
is tricky for that reason!
</details>

<details><summary>Show answer</summary>

From the information in the problem statement, we know that creating a
single Schottky defects costs an energy $\epsilon_s$ and increases the
size of the lattice to $N+1$. For $n$ Schottky defects, then, the energy
is $n\epsilon$ and the size of the lattice $N+n$. We can write a
canonical partition function by summing over all possible energy levels,
$E_\nu$:

$$\begin{aligned}
    Z = \sum_{n=0}^N \Omega(N,V,E_\nu) e^{-\beta E_\nu}
    
\end{aligned}$$

The degeneracy of each energy level is given by the number of ways to
distribute $n$ vacancies across $N+n$ lattice points, or:

$$\Omega(N,V,E_\nu) = \frac{(N+n)!}{N!n!}$$

The partition function is then:

$$Z = \sum_{n=0}^N \frac{(N+n)!}{N!n!} e^{-\beta n \epsilon_s}$$

</details>
```

```{admonition} **(b)**

Another type of point defect is called a *Frenkel defect*, in
which an atom is removed from a lattice site and occupies an
interstitial site, or a binding site that is located in between lattice
sites (see Figure). Atoms on interstitial sites can diffuse to other
interstitial sites so that there is no correlation between the location
of the interstitial atom and the location of the vacancy. Unlike a
Schottky defect, a Frenkel defect does not increase the size of the
lattice.

Write an expression for the **entropy** of a crystalline material with
$N$ atoms, $n$ Frenkel defects, and $N'$ interstitial sites. Assume that
the system is at constant energy.

<details><summary>Show answer</summary>

Here, we consider the entropy in terms of two distinct terms: the
entropy of the atoms on the $N'$ interstitial sites, and the entropy of
the vacancies on the $N$ lattice sites. At constant energy, the
Boltzmann entropy is:

$$S = k_B \ln \Omega$$

The degeneracy of $n$ atoms located on $N'$ interstitial sites is then:

$$\Omega_i = \frac{N'!}{(N'-n)!n!}$$

while the degeneracy of $n$ vacancies located on $N$ lattice sites is:

$$\Omega_v = \frac{N!}{(N-n)!n!}$$

The total entropy of the lattice can then be written as:

$$\begin{aligned}
    S_{\textrm{total}} &= S_{\textrm{interstital}} + S_{\textrm{vacancies}} \\
    &= k_B \ln \frac{N'!}{(N'-n)!n!} + k_B \ln \frac{N!}{(N-n)!n!} \\
    &= k_B \ln \left ( \frac{N'!}{(N'-n)!n!}  \frac{N!}{(N-n)!n!} \right )
    
\end{aligned}$$

</details>
```

## Question 7: Adsorption of a mobile gas

Monatomic ideal gas molecules adsorb onto a surface that is
homogeneously protected by a surface monolayer. Upon adsorption, the gas
molecules are *mobile* and are equally likely to be found at any
position on the surface, as opposed to being localized to specific
binding sites. Each molecule adsorbs favorably with an energy
$-\epsilon_a$. Adsorbed molecules do not interact with each other and
behave like an ideal gas confined to two dimensions. In this problem, we
will calculate how the ensemble-average surface density of adsorbed
molecules varies as a function of the pressure of the bulk gas, in
analogy to the {term}`Langmuir adsorption isotherm`.

```{admonition} **(a)** 
Assume that $N_a$ molecules are adsorbed to the surface. Similar
to a 3D ideal gas, the translational energy of a single molecule of the
adsorbed 2D gas is

$$\epsilon_{xy} = \frac{h^2(n_x^2 + n_y^2)}{8mA} \quad n_x, n_y = 1, 2, 3\dots$$

where $h$ is Planck's constant, $m$ is the mass of the molecule, and $A$
is the area of the surface. Note that this energy does *not* include the
energy associated with adsorbing to the surface. The single-molecule
canonical partition function that corresponds to the translational
energy is:

$$\begin{aligned}
z_{\textrm{xy}} &= \frac{2\pi m k_B T}{h^2}A = \frac{A}{\lambda^2}
\end{aligned}$$

where $\lambda = \sqrt{ \frac{h^2}{2\pi m k_B T}}$ is the thermal de
Broglie wavelength.

Using this information, write the **canonical** partition function for
the system of $N_a$ adsorbed gas molecules. Your answer may be in terms
of $N_a$, $\lambda$, $A$, $\epsilon_a$, and $k_B T$ or $\beta$.

<details><summary>Hints </summary>

Many students again tried to define a single subsystem partition
function that had two states, bound and unbound, following our previous
approach for the Langmuir isotherm. The problem statement explicitly
says not to do this by defining the system as the set of *adsorbed*
particles. In our derivation of the Langmuir isotherm our system was
defined as a set of discrete binding sites which could be treated as
individual subsystems, but since here there are no binding sites (since
the particles are mobile) this same approach cannot be done. We could do
this problem in the grand canonical ensemble by correctly defining a
single-particle partition function that takes into account the change in
the translational energy of the particle in the bound/unbound states,
but this approach is more complex and the problem statement explicitly
dissuades it.

</details>

<details><summary>Show answer</summary>

First, we can recognize that each of the $N_a$ adsorbed particles are
independent and in this case indistinguishable, since unlike the
Langmuir isotherm case they do not adsorbed to fixed binding sites. The
canonical partition function can then be written as:

$$Z = \frac{z^{N_a}}{N_a!}$$

Now we need an expression for the single-molecule partition function,
$z$. Here, we recognize that the energy of the molecule is divided into
two components: the translational energy, $\epsilon_{xy}$, and the
binding energy, $\epsilon_a$:

$$\epsilon = \epsilon_{xy} -\epsilon_a$$

Since these two terms are independent of each other, we can factorize
$z$ to write:

$$z = z_{xy}z_{a} = \frac{A e^{\epsilon_a/k_BT}}{\lambda^2}$$

Here we recognize that
$z_a = \sum_j e^{-\epsilon_j/k_BT} = e^{\epsilon_a/k_BT}$ since all of
the particles by definition are adsorbed, so the partition function has
one term. The system partition function is then:

$$\begin{aligned}
    Z &= \frac{z^{N_a}}{N_a!} \\
    &= \frac{1}{N_a!} \left [\frac{A e^{\epsilon_a/k_BT}}{\lambda^2} \right ] ^{N_a}
    
\end{aligned}$$

</details>
```

```{admonition} **(b)** 
Calculate the chemical potential, $\mu_a$, of the molecules
adsorbed to the surface. Your answer may be in terms
of $N_a$, $\lambda$, $A$, $\epsilon_a$, and $k_B T$ or $\beta$.

<details><summary>Show answer</summary>

First, we know that we can calculate the chemical potential from the
Helmholtz free energy:

$$\begin{aligned}
    dF &= -SdT - PdV + \mu_a dN_a \\
    \therefore \mu_a &= \left ( \frac{\partial F}{\partial N_a} \right )_{V, T}
    
\end{aligned}$$

We can relate the Helmholtz free energy to the canonical partition
function and use this to calculate the chemical potential (noting that
the single-molecule partition function has no $N_a$ dependence):

$$\begin{aligned}
    \mu_a &= \left ( \frac{\partial F}{\partial N_a} \right )_{V, T} \\
    &= -k_B T \left ( \frac{\partial \ln Z}{\partial N_a} \right )_{V, T} \\
    \ln Z &= \ln  \frac{z^{N_a}}{N_a!} \\
    &= N_a \ln z - N_a \ln N_a + N_a \\
    \mu_a &= -k_B T \left [ \ln z -\ln N_a \right ] \\
    &= k_B T \ln \left ( \frac{N_a}{z} \right ) \\
    &= k_BT \ln \left (\frac{N_a}{A} \lambda^2 e^{-\epsilon_a/k_BT}  \right )
    
\end{aligned}$$

</details>
```

```{admonition} **(c)** 
The chemical potential of the ideal gas molecules in the bulk,
$\mu_{\textrm{gas}}$, can be written as:

$$\mu_{\textrm{gas}} = \mu_0 + k_B T\ln P$$

where $\mu_0$ is a constant and $P$ is the pressure. Using this
information, write an expression that relates the ensemble-average
surface density, $\langle N_a \rangle / A$, to the pressure (along with
other terms) at equilibrium.

<details><summary>Show answer</summary>

The condition of equilibrium is that $\mu_a = \mu_{\textrm{gas}}$. We
can then write:

$$\begin{aligned}
    \mu_a &= \mu_{\textrm{gas}} \\
    k_BT \ln \left (\frac{N_a}{A} \lambda^2 e^{-\epsilon_a/k_BT}  \right )&= \mu_0 + k_B T\ln P  \\
    \ln \left (\frac{N_a}{A} \lambda^2 e^{-\epsilon_a/k_BT}  \right ) &= \frac{\mu_0}{k_BT} + \ln P \\
    \frac{N_a \lambda^2}{A} e^{-\epsilon_a/k_B T} &= P e^{\mu_0 /k_BT} \\
    \therefore \frac{N_A}{A} &= \frac{P}{\lambda^2} e^{\epsilon_a/k_B T} e^{\mu_0 /k_BT}
    
\end{aligned}$$

This is our adsorption isotherm for a system with mobile, rather than
discrete, binding sites.

</details>
```

## Question 8: van der Waals equation of state

The van der Waals equation of state is:

$$\begin{aligned}
P= \frac{Nk_B T}{V - Nb} - a\frac{N^2}{V^2}
\end{aligned}$$

where $N$ is the number of particles, $V$ is the volume, $b$ is the
excluded volume of each particle (*i.e.*, particles cannot overlap), and
$a$ accounts for attractions between particles. Particles interact with
an energy $E_\textrm{int}(r)$, where $r$ is the distance between a pair
of particles.

```{admonition} **(a)** 
Write the canonical partition function for the system with only
two particles ($N=2$). Assume that particle positions are **continuous**
and that the positions of the two particles are independent (even though
there are now interactions between the particles). Write your answer in
terms of the interaction energy $E_\textrm{int}(r)$, quantities defined
in the problem statement, and the thermal de Broglie wavelength.

<details><summary>Show answer</summary>

The key point here is that we can separate the partition function into
the ideal gas partition function for each particle, accounting for
translational degrees of freedom, and a partition function corresponding
to interactions between the particles. We can write this as:

$$Z = \frac{z_{\textrm{trans}}^2}{2!}z_{\textrm{int}}$$

Here, the first term is the ideal-gas translational partition function
for two indistinguishable ideal gas particles while the second term
accounts for interactions between particles. The single-particle
translational partition function is then given by the ideal gas equation
of state, which we adjust to account for the reduced volume due to the
volume excluded by the two particles:

$$\begin{aligned}
    z_\textrm{trans} &=\frac{V-2b}{\lambda^3}
    
\end{aligned}$$

Here, we have left the partition function in terms of the de Broglie
wavelength for simplicity. We can write the second term, recognizing
that the energy is continuous, and not discretized, as:

$$\begin{aligned}
    z_{\textrm{int}} &= \int_0^\infty e^{-\beta E_\textrm{int}(r)} dr 
    
\end{aligned}$$

Note that in this notation we assume the integral is over all possible
vector values of $r$, such that we omit a degeneracy term associated
with the increased number of states with identical scalar values of $r$
at increasing distances. You could also include an explicit accounting
of the degeneracy (as is done in part b). Combining these terms we get:

$$\begin{aligned}
    Z = \frac{1}{2}\left (\frac{V-2b}{\lambda^3}\right)^2 \int_0^\infty e^{-\beta E_\textrm{int}(r)} dr
    
\end{aligned}$$

</details>
```

```{admonition} **(b)** 
The canonical partition function for the system with $N$
particles can be derived analytically using a mean-field approximation.
Assume that the interaction energy between particles $i$ and $j$ is:

$$E_\textrm{int}(r) = \begin{cases} 
\infty & r < d \\
-\epsilon \left ( \frac{d}{r}\right )^6 & r \geq d 
\end{cases}$$

where $d$ is the particle diameter and $\epsilon$ defines the magnitude
of the interaction energy. Using this expression, write a mean-field
approximation for the interaction energy per particle by assuming that
each particle interacts with the average positions of all other
particles.

<details><summary>Hints</summary>

Consider how many particles, on average, are in a spherical shell
at a distance $r$ from a reference particle.

</details>

<details><summary>Show answer</summary>

In the mean-field approximation, we assume that all particles are
uniformly distributed throughout the system. The average interaction
between a particle at the origin and particles at a distance $r$ can be
approximated as the interaction energy, $E_\textrm{int}(r)$, multiplied
by the average number of particles at a distance $r$. Recalling back to
the density of states of an ideal gas, we can estimate the average
number of particles at a distance $r$ as the number of particles within
a distance $r+dr$, which can be estimated as the overall density,
$\rho = N/V$, of the system multiplied by the surface area of a
spherical shell with radius $r$. We further ignore values for which
$r<d$ since particles cannot overlap. The total interaction energy is
then approximated as:

$$\begin{aligned}
    \langle E_\textrm{int} \rangle &= \int_d^\infty E_\textrm{int}(r) \frac{N}{V} 4 \pi r^2 dr \\
    &= -\frac{4 \pi \epsilon N}{V}\int_d^\infty \frac{d^6}{r^4} dr \\
    &=-\frac{4 \pi \epsilon d^3 N }{3 V}
    
\end{aligned}$$

</details>
```

```{admonition} **(c)** 
Using the expression from part **b**, write a mean-field
approximation for the canonical partition function of the entire system
of $N$ particles. Be careful to avoid overcounting interaction energies.

<details><summary>Show answer</summary>

Using the mean-field approximation, we can now write the single-particle
partition function in terms of the translational part and the
interaction energy part, as in part a. Note that we divide the
interaction energy by 2 to avoid overcounting between pairs of
particles.

$$\begin{aligned}
    z &= \frac{V-Nb}{\lambda^3} e^{-\frac{1}{2}\beta \langle E_\textrm{int}\rangle }
    
\end{aligned}$$

Substituting in the value for the average interaction energy gives:

$$\begin{aligned}
    z &= \frac{V-Nb}{\lambda^3} \exp\left [{\frac{2\pi \epsilon d^3 N}{3V k_BT}} \right ]
    
\end{aligned}$$

The full partition function is then:

$$\begin{aligned}
    Z &= \frac{z^N}{N!} \\
    &= \frac{1}{N!} \left ( \frac{V-Nb}{\lambda^3} \right )^N \exp\left (\frac{2\pi \epsilon d^3 N^2}{3V k_BT} \right )
    
\end{aligned}$$

</details>
```

```{admonition} **(d)** 
By taking the appropriate derivative of your result from part
**c**, obtain the van der Waals equation of state given in the problem
statement and provide an explicit expression for $a$.

<details><summary>Show answer</summary>

We obtain the equation of state from the volume-derivative of the
Helmholtz free energy:

$$\begin{aligned}
    P &= - \left ( \frac{\partial F}{\partial V}\right )_{N,T}
    
\end{aligned}$$

We can write for $F$:

$$\begin{aligned}
    F &= -k_B T \ln Z 
    
\end{aligned}$$

Since we only care about the the volume-dependent terms, we write:

$$\begin{aligned}
    F &= -k_BT \left [ N \ln (V-Nb) + \frac{2 \pi \epsilon d^3 N^2}{3Vk_BT} - N \ln (N! \lambda^3)\right ]
    
\end{aligned}$$

Taking the deriatve gives:

$$\begin{aligned}
    P &=\frac{N  k_BT }{V-Nb} - \frac{2 \pi \epsilon d^3 N^2}{3V^2} \\
    &= \frac{Nk_BT}{V-Nb} - a \frac{N^2}{V^2}
    
\end{aligned}$$

where $a = \frac{2\pi \epsilon d^3}{3}$.
</details>
```
