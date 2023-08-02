# Problem Set 3 (Due XX/XX/XX)

## Question 1: Isomerization process

Consider an isomerization process, $\ce{A \rightleftharpoons B}$, where
$A$ and $B$ refer to different isomeric states of a single molecule. A
dilute gas containing $N_A$ molecules in state $A$ and $N_B$ molecules
in state $B$ undergoes this isomerization process at constant volume and
constant temperature. The isomerization from state $A$ to $B$ is
associated with a change in the energy of the molecule,
$\Delta \epsilon = \epsilon_B - \epsilon_A$, where $\epsilon_A$ and
$\epsilon_B$ are internal energies associated with each of the two
states, respectively. According to the *Boltzmann distribution law*, the
equilibrium ratio of the $A$ and $B$ populations is given by:

$$\frac{\langle N_A \rangle}{\langle N_B \rangle} = \frac{\Omega_A}{\Omega_B} e^{\beta \Delta \epsilon}$$

where $\Omega_A$ and $\Omega_B$ are the degeneracies for a single
molecule in state $A$ and $B$, respectively. Assume that the gas can be
treated as ideal (*i.e.*, all molecules are non-interacting and
independent) regardless of whether a molecule is in state $A$ or state
$B$, and that the single-molecule translational partition function,
$z_{\textrm{trans}}$, is the same for each state.

**(a)** Write an expression for the system partition function,
$Z(N_A, N_B, V_, T)$, in terms of the single-molecule partition
function, $z_a$, for a molecule in state $A$, the single-molecule
partition function, $z_b$, for a molecule in state $B$, the
single-molecule translational partition function, $z_{\textrm{trans}}$,
and the number of molecules in each state ($N_A$ and $N_B$).

The system we are considering consists of a mixture of two different
ideal gas molecules (representing the two different isomers) at a fixed
volume and temperature. Because the two different sets of molecules do
not interact, we can factorize the partition function for the joint
system into the product of the single-molecule partition functions for
each separate isomer. We can write the energy of a single molecule in
each state as:

$$\begin{aligned}
    E_A &= \epsilon_A + E_{\textrm{trans}} \\
    E_B &= \epsilon_B + E_{\textrm{trans}} 
    
\end{aligned}$$

In other words, the energy associated with being in state $A$ or $B$ is
distinct from the typical translational energy of an ideal gas,
$E_{\textrm{trans}}$. We can thus factorize the single-molecule
partition function into the product of a partition function associated
with the translational energy ($z_\textrm{trans}$) and a partition
function associated with the energy and degeneracy of a specific
isomeric state. The corresponding single-molecule canonical (since each
set of molecules is at constant $N,V,T$) partition functions for states
$A$ and $B$, recognizing that the degeneracy of each state is provided
in the problem statement, is:

$$\begin{aligned}
    z_A &= \Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT} \\
    z_B &= \Omega_B z_{\textrm{trans}}e^{-\epsilon_B/kT} 
    
\end{aligned}$$

If we consider only the set of molecules in state $A$, all of these
molecules are then indistinguishable, so the total partition function
for all molecules in state $A$ is given by:

$$Z_A = \frac{z_A^{N_A}}{N_A!}$$

This relation follows from our standard factorization of the partition
function. We can write an equivalent expression for molecules in state
$B$:

$$Z_B = \frac{z_B^{N_B}}{N_B!}$$

Finally, to get a partition function for the combined system, we
recognize that the energies of a subsystem corresponding to the set of
all $A$ molecules and a subsystem corresponding to all $B$ molecules are
independent. Therefore, the partition function of the entire system is
equal to the product of the partition functions of these two subsystems
(and these two subsystems themselves are distinguishable since state $A$
is distinguishable from state $B$). We can then write:

$$\begin{aligned}
    Z &= Z_A Z_B \\
    &= \frac{z_A^{N_A}}{N_A!} \frac{z_B^{N_B}}{N_B!} \\
    &= \frac{\left (\Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT} \right )^{N_A}}{N_A!} \frac{\left (\Omega_B z_{\textrm{trans}}e^{-\epsilon_B/kT}\right )^{N_B}}{N_B!}
    
\end{aligned}$$

So the key points are: states $A$ and $B$ are distinguishable from each
other, translational energies and isomeric state energies are
distinguishable from each other, but molecules in state $A$ are
indistinguishable from other molecules in state $A$ and ditto for state
$B$.

**(b)** Using the result from part **a** and assuming that both $N_A$
and $N_B$ are large, show that the Boltzmann distribution law follows
from the condition that the chemical potential of a molecule in state
$A$ is equal to the chemical potential of a molecule in state $B$
(*i.e.*, $\mu_A = \mu_B$), for a system at constant volume and constant
temperature.

In part a, we derived an expression for the canonical partition function
of the entire combined system. The relationship between the canonical
partition function and the Helmholtz free energy is:

$$F = -k_B T \ln Z$$

We can write the differential form of the Helmholtz free energy of a
two-component mixture as:

$$dF = -SdT - PdV + \mu_A dN_A + \mu_B dN_B$$

Therefore, we can write an expression for the chemical potential of each
species as:

$$\begin{aligned}
    \mu_A &= \left ( \frac{\partial F}{\partial N_A} \right )_{N_B, V, T} \\
    &= -k_B T \left ( \frac{\partial \ln Z}{\partial N_A} \right )_{N_B, V, T} \\
    \mu_B &= -k_B T \left ( \frac{\partial \ln Z}{\partial N_B} \right )_{N_A, V, T}
    
\end{aligned}$$

We can write $\ln Z$ for the partition function from part **a** as:

$$\begin{aligned}
    \ln Z &= \ln \frac{\left (\Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT} \right )^{N_A}}{N_A!} \frac{\left (\Omega_B z_{\textrm{trans}}e^{-\epsilon_B/kT}\right )^{N_B}}{N_B!} \\
    &= N_A \ln \left ( \Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT}\right ) - N_A \ln N_A + N_A +  N_B \ln \left ( \Omega_B z_{\textrm{trans}}e^{-\epsilon_B/kT}\right ) - N_B \ln N_B + N_B 
    
\end{aligned}$$

Using this expression, we can write the chemical potential for each
species as:

$$\begin{aligned}
    \mu_A &= -k_B T \left ( \frac{\partial\ln Z}{\partial N_A}\right )_{N_B, V, T} \\
    &= -k_B T  \ln \left ( \Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT}\right ) - \ln N_A \\
    &= -k_B T \ln \frac{\Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT}}{N_A} \\
    \mu_B &=-k_B T \ln \frac{\Omega_B z_{\textrm{trans}}e^{-\epsilon_B/kT}}{N_B}
    
\end{aligned}$$

Setting $\mu_A = \mu_B$ yields:

$$\begin{aligned}
    \ln \frac{\Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT}}{N_A} &= \ln \frac{\Omega_B z_{\textrm{trans}}e^{-\epsilon_B/kT}}{N_B} \\
    \frac{N_A}{N_B} &= \frac{\Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT}}{\Omega_B z_{\textrm{trans}}e^{-\epsilon_B/kT}}  \\
    \frac{N_A}{N_B} &= \frac{\Omega_A}{\Omega_B} e^{\beta \Delta \epsilon}
    
\end{aligned}$$

The last simplification is because the translational partition function
for each state is identical as specified in the problem statement. We
thus recover the Boltzmann distribution law.

## Question 2: Adsorption of a gas mixture

Consider a two-component mixture of two ideal gas species, denoted as
$A$ and $B$, that can both adsorb to a surface. Each gas molecule of
type $A$ adsorbs with an energy $\epsilon_i = -\epsilon_A$ while each
gas molecule of type $B$ adsorbs with energy $\epsilon_i = -\epsilon_B$.
Gas molecules of either type that are not adsorbed can be treated as an
ideal gas, and gas molecules adsorbed on the surface can exchange with
particles in the bulk. Gas particles exclude each other on the surface -
*e.g.*, if an $A$ particle adsorbs to a part of the surface, a $B$
particle cannot adsorb to the same part of the surface. The partial
pressures of each gas can be written as $P_A = P x_A$ and $P_B = P x_B$,
where $P$ is the pressure, $x_A$ is the mole fraction of gas $A$ in the
mixture, $x_B$ is the mole fraction of gas $B$ in the mixture, and
$x_A + x_B = 1$. Both the surface and bulk are at constant temperature
and constant volume.

**(a)** Derive a grand canonical partition function for the surface.
Define any variables that you introduce.

This question is an extension of a Langmuir isotherm by allowing for the
adsorption of multiple components on a single lattice site. As in the
Langmuir isotherm derivation, let us assume there are $N_s$
distinguishable sites on the surface. Each site for a given
configuration can be either unoccupied (0 energy), occupied by species
$A$ ($-\epsilon_A$ energy), or occupied by species $B$ ($-\epsilon_B$
energy). The partition function for a site in the grand canonical
ensemble is then:

$$\begin{aligned}
    \xi &= \sum_j e^{-E_j/k_BT}e^{\mu_j N_j / k_B T} \\
    &= 1 + e^{\beta(\epsilon_A + \mu_A^s)} + e^{\beta(\epsilon_B + \mu_B^s)}
    
\end{aligned}$$

Here, $\mu_A^s$ is the chemical potential of molecule type $A$ on the
surface, $\mu_B^s$ is the chemical potential of molecule type $B$ on the
surface. The partition function for the entire system of $N_s$ sites is
then:

$$\Xi = \xi^{N_s} = \left ( 1 + e^{\beta(\epsilon_A + \mu_A^s)} + e^{\beta(\epsilon_B + \mu_B^s)} \right )^{N_s}$$

**(b)** Derive an expression for the fraction of the surface that is
occupied by molecules of type $A$, $f_A$, and the fraction of the
surface that is occupied by molecules of type $B$, $f_B$. Write the
expressions for $f_A$ and $f_B$ in terms of the partial pressures of
each component and any other constants that you choose to define.

We can now express the fraction of the surface associated with each
species. We define $N_A$ as the number of molecules of type $A$ adsorbed
to the surface and $N_B$ as the number of molecules of type $B$ adsorbed
to the surface. We can also write the thermodynamic potential
corresponding to the grand canonical partition function as:

$$\Sigma = -k_B T \ln \Xi$$

Then:

$$\begin{aligned}
    f_A &= \frac{\langle N_A \rangle}{N_s} = -\frac{1}{N_s}\left ( \frac{\partial \Sigma}{\partial \mu_A^s} \right )_{\mu_B^s,V,T} \\
    &= \frac{ e^{\beta(\epsilon_A + \mu_A^s)}}{  1 + e^{\beta(\epsilon_A + \mu_A^s)} + e^{\beta(\epsilon_B + \mu_B^s)}} \\
    f_B &= \frac{\langle N_B \rangle}{N_s} = -\frac{1}{N_s}\left ( \frac{\partial \Sigma}{\partial \mu_B^s} \right )_{\mu_A^s,V,T} \\
    &= \frac{ e^{\beta(\epsilon_B + \mu_B^s)}}{  1 + e^{\beta(\epsilon_A + \mu_A^s)} + e^{\beta(\epsilon_B + \mu_B^s)}} 
    
\end{aligned}$$

In the multicomponent system, chemical equilibrium is satisfied by
$\mu_A^s = \mu_A^g$ and $\mu_B^s = \mu_B^g$ where
$\mu_A^g =  \beta^{-1} \ln (\beta P_A\lambda_A^3)$ is the chemical
potential in the gas phase, $P_A$ is the partial pressure of molecule
$A$, and $\lambda_A$ is the thermal de Broglie wavelength of molecule
$A$. Substituting in these expressions, we obtain the following:

$$\begin{aligned}
    f_A &= \frac{  \beta P_A\lambda_A^3 e^{\beta\epsilon_A }}{  1 +  \beta P_A\lambda_A^3 e^{\beta\epsilon_A } +  \beta P_B\lambda_B^3 e^{\beta\epsilon_B }} \\
    f_B &= \frac{  \beta P_B\lambda_B^3 e^{\beta\epsilon_B }}{  1 +  \beta P_A\lambda_A^3 e^{\beta\epsilon_A } +  \beta P_B\lambda_B^3 e^{\beta\epsilon_B }}
    
\end{aligned}$$

If we define
$P_A^0 =\left ( \frac{1}{\beta\lambda_A^3}\right )e^{-\beta \epsilon_A}$
and
$P_B^0 =\left ( \frac{1}{\beta\lambda_B^3}\right )e^{-\beta \epsilon_B}$
we obtain an expression similar to the Langmuir isotherm:

$$\begin{aligned}
    f_A &= \frac{P_A / P_A^0}{1 +  P_A / P_A^0 +  P_B / P_B^0} \\
    f_B &= \frac{P_B / P_B^0}{1 +  P_A / P_A^0 +  P_B / P_B^0} 
    
\end{aligned}$$

This expression shows that the fraction surface coverage of a component
increases if either its partial pressure increases (via $x_A$) or if the
binding energy $\epsilon_A$ becomes larger, leading to an decrease in
$P_A^0$.

## Question 3: 1D Ising model

In class, we discussed the **Ising model** for a magnetic system in
which a set of $N$ distinguishable magnetic dipoles are each
characterized by a spin, $s_i$, that has one of two discrete values:
$s_i = \pm 1$. The total magnetization, $M$, can be approximated as the
sum of all spins, $M = \sum_{i=1}^{N} \mu s_i$. Spins are placed on a
fixed lattice and can interact with an external magnetic field, $H$, and
other nearest-neighbor spins. The energy with which spin $i$ interacts
with its neighbors is:

$$\epsilon_i =  - J \sum_j^\prime s_i s_j\$$

Here, $J$ is the value of the coupling parameter (with units of energy)
that describes the interaction energy between each *pair* of
nearest-neighbor spins. The sum $\sum_j^\prime$ indicates a sum over all
$n$ nearest-neighbor spins of $i$ on the lattice. The *total* energy of
a single microstate is:

$$E = -\sum_i^N \mu H s_i - \frac{J}{2} \sum_{i}^N \sum_j^\prime s_i s_j\$$

The factor of $1/2$ in front of the interaction energy term accounts for
the double-counting of interactions between pairs of spins when summing
over the entire system.

In this problem, we will analytically solve the **1D Ising model**,
which refers to a set of spins that are placed on a one-dimensional
lattice. Each spin therefore only has two nearest-neighbors. We will
assume **free boundary conditions**, which means that the spins at the
beginning and end of the chain ($s_1$ and $s_N$) only have a single
neighbor. An example of a single microstate of a 1D Ising model is
schematically drawn below.

::: center
![image](1D_Ising-01.png){width="30%"}
:::

**(a)** Show that in the zero field limit ($H=0$), the partition
function for the 1D Ising model is:

$$\begin{aligned}
Z &=2 \left[2 \cosh(\beta J)\right]^{N-1}
\end{aligned}$$

Hint: Consider each *pair* of spins when simplifying the partition
function.

The energy of a configuration in the absence of a field ($H=0$) is:

$$\begin{aligned}
E &= -\frac{J}{2} \sum_i^N\sum_j^\prime s_i s_j
\end{aligned}$$

The full partition function, accounting for all possible states, is
then:

$$\begin{aligned}
Z &= \sum_{s_1=\pm 1} \sum_{s_2=\pm 1} \dots \sum_{s_N =\pm 1}\exp \left ( \frac{\beta J}{2} \sum_i^N\sum_j^\prime s_i s_j \right )
\end{aligned}$$

We can simplify the expression for the energy by recognizing that spin
$i$ interacts only with spin $i-1$ and spin $i+1$. We can exactly count
all of these interactions *without* overcounting by starting at spin $1$
and counting interactions between spin $i$ and spin $i+1$ only, while
summing over all spins. We exclude the last spin because there is no
$i+1$ interaction. This gives:

$$\begin{aligned}
E &= -J \sum_i^{N-1} s_i s_{i+1} \\
&= -J \sum_i^{N-1}\sigma_i^\prime
\end{aligned}$$

Here, $i$ now indicates the index of the pair of spins and
$\sigma_i^\prime = s_i s_{i+1}$. We have eliminated the factor of $1/2$
because there is no longer any overcounting when we sum over the $N-1$
interactions as opposed to summing over the $N$ spins. The full
partition function is then:

$$\begin{aligned}
Z &= \sum_{s_1=\pm 1} \sum_{s_2=\pm 1} \dots \sum_{s_N =\pm 1}\exp \left ( \beta J \sum_i^{N-1}\sigma_i^\prime \right )
\end{aligned}$$

The outer sums of this partition function iterate over all possible
arrangements of spins in the system to enumerate all possible
microstates. However, for a 1D system, we can write each arrangement by
summing over each *pair* of spins using the index as noted above. In
general, each pair of spins can only be in one of two states: the spins
can either be aligned or unaligned. The alignment of one pair of spins
does not affect the next pair of spins - while individual spins are
correlated, pairs of spins are uncorrelated or independent. We can thus
factorize the partition function into $N-1$ independent
"single-pair-of-spins" partition functions in analogy with the
factorization of partition functions performed for the ideal gas:

$$\begin{aligned}
z &= \exp \left ( \beta J \sum_{ \sigma_i=\pm 1} \sigma_i^\prime \right )\\
&= \exp \left (\beta J \right )  +  \exp \left (-\beta J \right )
\end{aligned}$$

There are two terms in the single-pair-of-spins partition function
accounting for the two spins either being aligned or unaligned. Pairs of
spins are distinguishable because they are positioned on a lattice,
allowing us to write the full partition function in terms of the
single-pair-of-spins partition function without dividing by $(N-1)!$.
Finally, we recognize that we have to add a prefactor of 2 to the full
partition function because we can generate a unique microstate by
inverting the sign of all spins, doubling the number of possible states.
The full partition function is then:

$$\begin{aligned}
Z &= 2z^{N-1} \\
&= 2\left[ \exp \left (\beta J \right )  +  \exp \left (-\beta J \right ) \right]^{N-1} \\
&= 2\left[2 \cosh(\beta J)\right]^{N-1}
\end{aligned}$$

**(b)** Calculate the ensemble-average energy per spin in the limit that
$N \rightarrow \infty$.

We can obtain the average energy from an appropriate derivative of the
partition function. We can relate the partition function to the
ensemble-average energy using the expression from Lecture 4:

$$\begin{aligned}
\langle E \rangle &= -\left ( \frac{\partial \ln Z }{\partial \beta}\right )_{N,V}
\end{aligned}$$

We can first simplify $\ln Z$:

$$\begin{aligned}
Z &= 2\left[2 \cosh(\beta J)\right]^{N-1} \\
\ln Z &=  \ln \left ( 2\left[2 \cosh(\beta J)\right]^{N-1} \right ) \\
&= \ln 2  + (N-1) \ln 2 + (N-1) \ln \cosh(\beta J)
\end{aligned}$$

The first two terms have no $\beta$ dependence, so when we evaluate the
derivative only the third term survives. The average energy is then:

$$\begin{aligned}
\langle E \rangle &= -(N-1) J \frac{\sinh(\beta J)}{\cosh(\beta J)} \\
&= -(N-1) J \tanh(\beta J)
\end{aligned}$$

We assume that as $N\rightarrow \infty$, $N-1 \approx N$. The
ensemble-average energy per spin is then:

$$\begin{aligned}
\frac{\langle E \rangle}{N} &= -\frac{N-1}{N} J \tanh(\beta J) \\
&\approx -J \tanh(\beta J)
\end{aligned}$$

## Question 4: Monte Carlo simulation of the Ising model

In Problem Set 2, we introduced the Metropolis Monte Carlo algorithm as
a means of computing ensembe-average quantities. In Problem Set 2, we
studied the magnetization of non-interacting spins. We will now use the
same method to study the 1D Ising model which we analytically studied in
##Question 3.--

Consider a 1D Ising model in which $N = 100$ spins are placed on a 1D
lattice, such that each lattice point has $n=2$ nearest-neighbors.
Assume that the system has free boundaries so that spin $1$ and spin
$100$ only have 1 nearest-neighbor (this directly mimics the problem
from ##Question 3).--

**(a)** Write a Python program that computes $\langle E \rangle / N$ for
the 1D Ising model using the Metropolis Monte Carlo algorithm described
above. Attach a copy of your code with appropriate comments explaining
your implementation.

**(b)** Perform independent Monte Carlo simulations for $J =$ -3, -2,
-1, 0, 1, 2, and 3 $k_B T$. Each simulation should include 100,000
trials to obtain accurate approximations of $\langle E \rangle / N$.
Plot $\langle E \rangle / N$ vs. $J$ and compare to the analytical
result from ##Question 3.--

The Python code for part **a** and **b** is included on the Canvas
website. The plots below show the number of MC iterations necessary to
obtain converged values of the ensemble-average energy and the
comparison between the ensemble-average energy and the analytical result
from ##Question 3.--

![Convergence of ensemble-average
energy.](pset_3_Energy_convergence.png){width="70%"}

![Comparison of the ensemble-average energy obtained from the Monte
Carlo method to the analytical solution. Points indicate the model
calculations and the line indicates the analytical
solution.](pset_3_Energy_J.png){width="70%"}
