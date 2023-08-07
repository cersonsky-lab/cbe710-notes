# Problem Set 2 (Due Thursday, September 28, 2023)

## Question 1: Expressions for entropy

The Boltzmann entropy for the microcanonical ensemble is:

$$S(N,V,E) = k_B \ln \Omega(N,V,E)$$

where $\Omega(N,V,E)$ is the degeneracy (or number of unique
microstates) in the microcanonical ensemble. An alternative, general
definition of the entropy, referred to as the Gibbs entropy, is:

$$S = - k_B\sum_i p_i \ln p_i$$

where $p_i$ is the probability of microstate $i$ and the sum runs over
all microstates.

```{admonition} **(a)**
Show that the Boltzmann and Gibbs entropy are equivalent for the microcanonical ensemble.
<details>
<summary> Hints </summary>
Recall that according to the second postulate of statistical mechanics,
all microstates in the microcanonical ensemble are equally probable.
</details>
```

```{admonition} **(b)**
Starting from an appropriate partial derivative of the Helmholtz
free energy, show that entropy can be expressed in terms of the
{term}`canonical partition function` and the temperature as
$S = k_B \left[T\left ( \frac{\partial \ln Z}{\partial T} \right )_{N,V} + \ln Z\right] $.
<details>
<summary> Hints </summary>

$dF = -SdT - PdV + \mu dN$

</details>

```

```{admonition} **(c)**
Show that the expression derived in part **b** reduces to the
Boltzmann entropy if the canonical ensemble is dominated by a single
energy level (i.e., the contributions of all other energy levels to the
partition function are negligible).
```

```{admonition} **(d)**
Calculate the Gibbs entropy of the canonical ensemble, and show
that this expression for the entropy leads to the correct thermodynamic
expression for the Helmholtz free energy ($F=E-TS$).
```

## Question 2: Pulling on a protein

A simplified model for the protein keratin is a linear, long chain
molecule consisting of $N$ units. Each unit can be in either an
unstretched state with energy $\epsilon_\alpha$ and length $a$, or a
stretched state with energy $\epsilon_\beta$ and length $b$. The chain
is stretched at constant tension, $\tau$, which causes it to reach a
total length $L$; $\tau$ is a force that is conjugate to $L$. Assume
that stretching the chain (i.e. changing $L$) does not change the total
chain volume, the chain is held at constant temperature, and each unit
is independent.

![image](pset_2_pulling_polymer_fig.png)

<details>
<summary> Hint </summary>

Hint: for a system of $N$ distinguishable, independent subsystems for
which the energy of the combined system, $E$, is equal to the sum of the
energies of the subsystems, $E = \sum_i \epsilon_i$, the partition
function of the combined system, $Z$, is related to the partition
function of each subsystem, $z$, by:

$$Z = z^N$$

This relationship is true of any generalized partition function $\Phi$,
as well as the canonical partition function, $Z$.

</details>

```{admonition} **(a)**
Using the first law of thermodynamics, show that the thermodynamic
potential $B$ corresponding to this ensemble is expressed
as $B = - PdV - SdT - L d\tau$.
```

```{admonition} **(b)**
Derive an expression for a generalized partition function with
fixed thermodynamic parameters that correspond to the natural variables
of the potential derived in part **a**. Your result should be in terms
of $\epsilon_a$, $\epsilon_b$, $a$, $b$, $\tau$, and $N$.

<details>
<summary> Hint </summary>

Since each unit of the molecule is independent and the different units
are distinguishable, we can use the first hint within this problem
to factorize the partition function and write:

$$\begin{aligned}
    \Phi &= \phi^N
    
\end{aligned}$$

Here, $\phi$ is the single-unit partition function, which we see is a
two-state model with one state characterized by energy $\epsilon_a$ and
length $a$ and the other state characterized by energy $\epsilon_b$ and
length $b$. 

</details>
```

```{admonition} **(c)**

Calculate the average length, $\langle L \rangle$, of the
molecule as a function of the tension, $\tau$.
```


## Question 3: Magnetization of a paramagnet revisited

In [Problem Set 1](../ps_1/problem_set_1.md), we used the microcanonical ensemble to show that the
magnetization of a paramagnet is:

$$\begin{aligned}
M = N\mu \tanh (\beta \mu H) 
\end{aligned}$$

The system is $N$ distinguishable, non-interacting spins that are fixed
on a lattice and exposed to a magnetic field $H$ at constant
temperature. Each spin $s_i$ has a magnetic moment of $\mu$, and can be
in one of two states: parallel to the field ($s_i = 1$) or anti-parallel
to the field ($s_i = -1$). The energy of a particular microstate is due
only to interactions between the spins and the magnetic field:

$$E = -\sum_{i=1}^N s_i \mu H$$

The magnetization is defined as:

$$\begin{aligned}
M = \sum_i^N s_i \mu
\end{aligned}$$

```{admonition} Derive the magnetization of the system using the canonical ensemble.
<details>
<summary> Hint </summary>

$\cosh(x) = \frac{e^x + e^{-x}}{2}$

$\sinh(x) = \frac{e^x - e^{-x}}{2}$

</details>
```

## Question 4: Numerical calculation of the magnetization of a paramagnet

As an alternative to the analytical derivation of the magnetization of a
paramagnet, the Metropolis Monte Carlo algorithm can be used to
calculate the ensemble-average magnetization. We will derive this
algorithm in a [later lecture](../../lecture_files/Lecture10.md);
in this question, you will apply the algorithm
to compare to the analytical result in Question 3.

Consider a system of $N=100$ distinguishable, non-interacting spins in a
magnetic field $H$ at constant temperature. Each spin is fixed to a
lattice position such that the relative positions of spins cannot
interchange. The system can assume a set of configurations in which each
spin is either parallel to the field or antiparallel to the field, with
the energy of each configuration defined in Question 3. The Metropolis-
Monte Carlo algorithm for calculating the ensemble-average magnetization
consists of the following steps:

1.  Initialize the system in a random configuration.

2.  Randomly generate a new configuration, in which at least 1 spin has
    switched orientation.

3.  Calculate the energy of the new configuration, $E_{\textrm{new}}$,
    and old configuration, $E_{\textrm{old}}$.

4.  Calculate the probability of accepting the trial configuration,
    $\alpha$, using the following equation:
    $$\alpha = \text{min} \left ( 1, \exp \left \{ -\beta \left [ E_{\textrm{new}} - E_{\textrm{old}} \right ] \right \} \right )$$,
    where $\beta = (k_B T)^{-1}$.

5.  Generate a uniform random number in the range \[0, 1\]. If the
    random number is less than $\alpha$, then retain the new
    configuration as the system configuration; the new configuration is
    *accepted*. If the random number is greater than $\alpha$, then
    retain the old configuration as the system configuration; the new
    configuration is *rejected*. Note that all new configurations for
    which the system energy is lowered are automatically accepted.

6.  Performing steps 2-5 defines a single Monte Carlo trial. Repeat
    steps 2-5 for a large number of trials (discussed below).

7.  Calculate $\langle M \rangle$ by averaging values of $M$ over all
    configurations sampled during the trials. Note that configurations
    will be repeated when new configurations are rejected in step 5.

Think carefully about how to efficiently implement this algorithm.
**This problem is intended to provide you with practice in Python
programming prior to the assignment of the simulation project.** Your
grade for this problem will be based in part on the readability of your
code and plots in addition to the accuracy of the solution.

```{admonition} **(a)**
Write a Python program that computes $\langle M \rangle$ for the
paramagnetic spin lattice described in Question 3 using the Metropolis-
Monte Carlo algorithm described above. Attach a copy of your code with
appropriate comments explaining your implementation.
```

```{admonition} **(b)**
Perform independent Monte Carlo simulations for field strengths
of $\mu H =$ -3.0 $k_BT$ to $\mu H =$ 3.0 $k_B T$ in increments of 0.5
$k_B T$. Each simulation should include 100,000 Monte Carlo trials to
obtain accurate approximations of $\langle M \rangle$. Plot
$\langle M \rangle$ vs. $\mu H$ and compare to the analytical result
from Question 3.
```

The Python code for part **a** and **b** is included on the Canvas
website. The plots below show the number of MC iterations necessary to
obtain converged values of the ensemble-average magnetization and the
comparison between the ensemble-average mangetization and the analytical
result from Question 3.

![Convergence of ensemble-average
magnetization.](pset_2_Magnetization_convergence.png){width="70%"}

![Comparison of the ensemble-average magnetization obtained from the
Monte Carlo method to the analytical solution. Points indicate the model
calculations and the line indicates the analytical
solution.](pset_2_Magnetization_H.png){width="70%"}
