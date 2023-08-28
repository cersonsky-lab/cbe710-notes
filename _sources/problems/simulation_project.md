# Simulation Project (Due Tuesday, November 14, 2023) 

**General point deductions**
For each plot, if you are missing the title, axis label(s), or have not labeled
your units, you will incur a 1 point deduction per missing item per plot.

## Question 1: Ferromagnetic phase transition

Ferromagnetic materials undergo an order-disorder transition as a
function of temperature. The 2D Ising model is able to reproduce this
transition. Recall that the [Ising model](../lecture_files/Lecture8A) consists of $N$ distinguishable
spins on a lattice. Each spin has one of two discrete values:
$s_i = \pm 1$. The magnetization, $M$, is the sum of all spins,
$M = \sum_{i=1}^{N} \mu s_i$. Spins can interact with an external
magnetic field, $H$, and other nearest-neighbor spins. For this problem
we will assume $H=0$. The energy with which spin $i$ interacts with its
neighbors is:

```{math}
\epsilon_i =  - J \sum_j^\prime s_i s_j
```

$J$ is the coupling parameter (in the same units as energy) that determines the
interaction energy between each *pair* of nearest-neighbor spins. The
sum $\sum_j^\prime$ indicates a sum over all $n$ nearest-neighbor spins
of $i$ on the lattice. The *total* energy of the system is:

$$E_\nu = - \frac{J}{2} \sum_{i}^N \sum_j^\prime s_i s_j$$

The factor of $1/2$ accounts for the double-counting of interactions
between pairs of spins when summing over the entire system. In class, we
used a mean-field approximation to show that

$$T_C = \frac{nJ}{k_B}$$

$T_C$ is the temperature at which the system transitions from non-zero
magnetization to zero magnetization. However, the mean-field
approximation introduces significant errors. In this problem, we will
show that Monte Carlo simulations can identify a more accurate
expression for $T_C$.


```{admonition} **(a)**

Develop a simulation representation of an Ising model in which
$N = 400$ spins are placed on a 2D, periodic, square lattice, such that
each lattice point has $n=4$ nearest-neighbors. Plot the absolute value
of the ensemble-average magnetization per spin,
$| \langle M \rangle / N |$, and the heat capacity, $C_V$, as a function
of temperature for a coupling parameter $J = 1.0$.

Choose a temperature range of $T = 0.1$ $J/k_B$ to $T = 6.0$ $J/k_B$ in increments of $0.1$
$J/k_B$. The coupling parameter is expressed in dimensionless units;
accordingly, $J$ is the unit of energy and $J/k_B$ is the unit of
temperature.

I suggest running for at least 1,000,000 trials, saving the
magnetization every 500 steps, and averaging the results from multiple
independent simulations. Explain any other choices you make for
simulation parameters. Consider which pairwise interactions actually
contribute during evaluation of the MC acceptance condition; it is not
necessary to compute the energy of the entire lattice.

<details><summary>20 points available, click for grading breakdown</summary>

-   Magnetization plot: 5 pts
-   $C_{v}$ plot: 5 pts
-   Correct plot shape 4 pts
-   Correct smoothness (sampled a few times or reached good
    convergence): 2 pts
-   Explain how each curve was calculated: 4 pts

</details>
```

```{admonition} **(b)**

A [first-order phase transition](https://en.wikipedia.org/wiki/Phase_transition#Ehrenfest_classification)
is characterized by a discontinuity in a first derivative of the free energy with respect to
the temperature when the system undergoes a phase transition, while a
[second-order phase transition](https://en.wikipedia.org/wiki/Phase_transition#Ehrenfest_classification) is characterized by the divergence of
a second derivative of the free energy with respect to temperature when
the system undergoes a phase transition. Based on your results in part
**a**, is the ferromagnetic order-disorder transition classified as a
first or second order phase transition? Explain your rationale.

<details><summary>10 points available, click for grading breakdown</summary>

-   Correct order identified: 5 pts

-   Rationale: 5 pts
</details>
```

```{admonition} **(c)**
Determine an approximate relationship between $T_C$ and $J$
(assuming $J>0$) for the 2D Ising model using your simulations. You may
assume that $T_C$ and $J$ are linearly related. Compare your expression
to the mean-field result and the exact Onsager solution for the 2D Ising
model.

<details><summary>15 points available, click for grading breakdown</summary>

-   Comparison: 5 pts

-   Show that Ising model is better: 5 pts

-   Explicitly write Onsager's solution: 3 pts

-   Multiple J values tested: 2 pts
</details>
```

```{admonition} **(d)**
Explain the competition between driving forces in the Ising
model and why the values of the magnetization identified at temperatures
above and below the Curie temperature are obtained. Assume that $J>0$ in
your explanation.

5 points available, no grading breakdown
```

## Question 2: Molecular dynamics simulations of a Lennard-Jones fluid

Consider a set of particles that interact via a {term}`Lennard-Jones potential`.
This system, referred to as a *Lennard-Jones fluid*, captures the
behavior of simple solvents. Develop a simulation model for a
Lennard-Jones fluid in which $N = 125$ particles are placed in a 3D,
periodic, cubic simulation box. Assume particles only interact via a
Lennard-Jones potential with characteristic energy $\epsilon$ and length
$\sigma$ which set the energy and length scales of the simulations,
respectively.

<details><summary>Recommendations</summary>

-   Use a dimensionless timestep of $\Delta t = 0.001$.

-   Assume the mass of each particle is $m=1.0$.

-   Set the Boltzmann constant to $k_B = 1.0$.

-   Sample and save system properties every 100 timesteps.

-   For your final simulations, run for at least 100,000 timesteps (this
    should take $< 15$ mins).

- Reduce the number of particles and
simulation timesteps while you are testing code.
- Save your trajectories (positions and velocities), to prevent running the
code an excessive number of times. 

</details>

```{admonition} **(a)**
Simulate a Lennard-Jones fluid initialized at a temperature
$T=1.2$ $\epsilon/k_B$ and a density $\rho = 0.85$ particles/$\sigma^3$
using Molecular Dynamics with a velocity Verlet integrator and no
thermostat. Plot the kinetic energy, potential energy, and total energy
per particle as a function of the simulation time and comment on their
relative values. Indicate the approximate number of timesteps necessary
for the system to reach equilibrium.

<details><summary>15 points available, click for grading breakdown</summary>

-   Plot Kinetic, Potential and Total Energy: 5 pts

-   Constant energy demonstrated: 5 pts

-   Indicated approx number of steps: 5 pts
</details>

```

```{admonition} **(b)**
Using an Andersen thermostat, rerun the molecular dynamics
simulation of the same system with the temperature maintained at
$T = 1.2$ $\epsilon/k_B$ using a coupling constant $\eta = 1$. Plot the
kinetic energy, potential energy, and total energy per particle as a
function of the simulation time, and indicate the number of timesteps
necessary for the system to reach thermal equilibrium. Compare features
of these plots to the results from part **a**.

<details><summary>15 points available, click for grading breakdown</summary>

-   Plot Kinetic, Potential and Total Energy: 5 pts

-   Energy fluctuations, but convergence demonstrated: 5 pts

-   Compare results: 3 pts

-   Correct comparison: 2pts
</details>
```

```{admonition} **(c)**
Plot the equilibrium distribution of particle **speeds** for the
simulations from part **a** and part **b**. Specify the time interval
used for the calculation. Compare these results to the Maxwell-Boltzmann
distribution and calculate the ensemble-average temperature for the
thermostatted simulation. Explain if your results match your
expectations. I recommend using a histogram size of
$0.2  \sigma/\text{unit time}$.

<details><summary>10 points available, click for grading breakdown</summary>

-   Plot speeds correctly: 5 pts

-   Compare results: 3 pts

-   Correct comparison: 2pts
</details>
```

```{admonition} **(d)**
Perform MD simulations of Lennard-Jones fluids at $T=1.5$
$\epsilon/k_B$ and at densities of $\rho = 0.01$, $\rho = 0.10$, and
$\rho=0.85$ particles/$\sigma^3$ and compare the corresponding radial
distribution functions. Specify the time interval used for the
calculation and report the length scale in units of $\sigma$. Comment on
key features of the plot. I recommend using a histogram size of 0.02
$\sigma$. Explain system phase behavior based on your results.
Simulation visualization is also recommended.

<details><summary>5 points available, click for grading breakdown</summary>

-   Correct RDFs (zero at large r, not showing past L/2): 3 pts

-   Compare results for three different densities: 2 pts
</details>
```

```{admonition} **(e)**
Calculate the chemical potential of a Lennard-Jones particle for
each of the systems considered in part **d**. Recall that the chemical
potential is the change in the free energy of the system upon addition
or subtraction of a single particle. Explain the method that you use for
this calculation. Hint: you do not need to perform any additional
simulations if you have saved your trajectories.

<details><summary>5 points available, click for grading breakdown</summary>

-   Explain method: 2 pts

-   Attempted:1 pts

-   Correct results: 2 pts
</details>
```
