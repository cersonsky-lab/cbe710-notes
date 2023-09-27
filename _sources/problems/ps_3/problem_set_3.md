# Problem Set 3 (Due Monday, October 9, 2023)

## Question 1: Isomerization process

Consider an isomerization process, $\ce{A \rightleftharpoons B}$, where
$A$ and $B$ refer to different isomeric states of a single molecule. A
dilute gas containing $N_A$ molecules in state $A$ and $N_B$ molecules
in state $B$ undergoes this isomerization process at constant volume and
constant temperature. The isomerization from state $A$ to $B$ is
associated with a change in the energy of the molecule,
$\Delta \epsilon = \epsilon_B - \epsilon_A$, where $\epsilon_A$ and
$\epsilon_B$ are internal energies associated with each of the two
states, respectively. According to [Maxwell-Boltzmann statistics](https://en.wikipedia.org/wiki/Maxwell%E2%80%93Boltzmann_statistics),
the equilibrium ratio of the $A$ and $B$ populations is given by:

$$\frac{\langle N_A \rangle}{\langle N_B \rangle} = \frac{\Omega_A}{\Omega_B} e^{\beta \Delta \epsilon}$$

where $\Omega_A$ and $\Omega_B$ are the degeneracies for a single
molecule in state $A$ and $B$, respectively. Assume that the gas can be
treated as [ideal](../../lecture_files/Lecture6.md) (i.e., all molecules are non-interacting and
independent) regardless of whether a molecule is in state $A$ or state
$B$, and that the single-molecule translational partition function,
$z_{\textrm{trans}}$, is the same for each state.

```{admonition} **(a)**

Show that the system partition function,
$Z(N_A, N_B, V, T)$, can be written in terms of the single-molecule partition
function, $z_a$, for a molecule in state $A$, the single-molecule
partition function, $z_b$, for a molecule in state $B$, the
single-molecule translational partition function, $z_{\textrm{trans}}$,
and the number of molecules in each state ($N_A$ and $N_B$) as

$$Z = \frac{\left (\Omega_A z_{\textrm{trans}}e^{-\epsilon_A/kT} \right )^{N_A}}{N_A!} \frac{\left (\Omega_B z_{\textrm{trans}}e^{-\epsilon_B/kT}\right )^{N_B}}{N_B!}$$

Explain your rationale with each step.

<details><summary> Hints</summary>
Consider what entities can be distinguished from one another, and therefore
separated in our partition function formulation.
</details>
```


```{admonition} **(b)**

Using the result from part **a** and assuming that both $N_A$
and $N_B$ are large, show that the Boltzmann distribution law follows
from the condition that the chemical potential of a molecule in state
$A$ is equal to the chemical potential of a molecule in state $B$
(*i.e.*, $\mu_A = \mu_B$), for a system at constant volume and constant
temperature.
```

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

```{admonition} **(a)**

Derive a grand canonical partition function for the surface.
Define any variables that you introduce.

<details><summary> Hints</summary>
This question is an extension of a Langmuir isotherm by allowing for the
adsorption of multiple components on a single lattice site. 
</details>
```

```{admonition} **(b)**

Show that the fraction of the surface that is
occupied by molecules of type $A$, $f_A$, and the fraction of the
surface that is occupied by molecules of type $B$, $f_B$ is given by

$$\begin{aligned}
    f_A &= \frac{P_A / P_A^0}{1 +  P_A / P_A^0 +  P_B / P_B^0} \\
    f_B &= \frac{P_B / P_B^0}{1 +  P_A / P_A^0 +  P_B / P_B^0}
\end{aligned}$$

```


## Question 3: 1D Ising model

In class, we discussed the {term}`Ising model` for a magnetic system in
which a set of $N$ distinguishable magnetic dipoles are each
characterized by a spin, $s_i$, that has one of two discrete values:
$s_i = \pm 1$. The total magnetization, $M$, can be approximated as the
sum of all spins, $M = \sum_{i=1}^{N} \mu s_i$. Spins are placed on a
fixed lattice and can interact with an external magnetic field, $H$, and
other nearest-neighbor spins. The energy with which spin $i$ interacts
with its neighbors is:

$$\epsilon_i =  - J \sum_j s_i s_j\$$

Here, $J$ is the value of the coupling parameter (with units of energy)
that describes the interaction energy between each *pair* of
nearest-neighbor spins. The sum $\sum_j$ indicates a sum over all
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

![image](1D_Ising-01.png)

```{admonition} **(a)**

Show that in the zero field limit ($H=0$), the partition
function for the 1D Ising model is:

$$\begin{aligned}
Z &=2 \left[2 \cosh(\beta J)\right]^{N-1}
\end{aligned}$$

<details><summary>Hints</summary>
Hint: Consider each *pair* of spins when simplifying the partition
function.
</details>
```


```{admonition} **(b)**

Calculate the ensemble-average energy per spin in the limit that
$N \rightarrow \infty$.

```


## Question 4: Monte Carlo simulation of the Ising model

In Problem Set 2, we introduced the Metropolis Monte Carlo algorithm as
a means of computing ensembke-average quantities. In Problem Set 2, we
studied the magnetization of non-interacting spins. We will now use the
same method to study the 1D Ising model which we analytically studied in
Question 3

Consider a 1D Ising model in which $N = 100$ spins are placed on a 1D
lattice, such that each lattice point has $n=2$ nearest-neighbors.
Assume that the system has free boundaries so that spin $1$ and spin
$100$ only have 1 nearest-neighbor (this directly mimics the problem
from ##Question 3).--


```{admonition} **(a)**

Write a Python program that computes $\langle E \rangle / N$ for
the 1D Ising model using the Metropolis Monte Carlo algorithm described
above. Attach a copy of your code with appropriate comments explaining
your implementation.

```


```{admonition} **(b)**

Perform independent Monte Carlo simulations for $J =$ -3, -2,
-1, 0, 1, 2, and 3 $k_B T$. Each simulation should include 100,000
trials to obtain accurate approximations of $\langle E \rangle / N$.
Plot $\langle E \rangle / N$ vs. $J$ and compare to the analytical
result from Question 3.

```

The plots below show the number of MC iterations necessary to
obtain converged values of the ensemble-average energy and the
comparison between the ensemble-average energy and the analytical result
from Question 3.

![Convergence of ensemble-average
energy.](pset_3_Energy_convergence.png)

![Comparison of the ensemble-average energy obtained from the Monte
Carlo method to the analytical solution. Points indicate the model
calculations and the line indicates the analytical
solution.](pset_3_Energy_J.png)
