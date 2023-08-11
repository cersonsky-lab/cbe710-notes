# Monte Carlo simulations

## Additional Readings for the Enthusiast

-   {cite:ts}`frenkel_understanding_2002` Ch. 3

## Interactions in molecular simulations

### Non-bonded potentials

We ended the [last lecture](Lecture9B) by introducing pairwise non-bonded
interactions between particles that are commonly used in molecular
simulations. We primarily covered the {term}`Lennard-Jones potential`,
{term}`long-range Coulombic potential` which account for the van der Waals
and electrostatic interactions of our particles.

### Interactions in MC simulations

As a reminder, Monte Carlo simulations can use any
potential energy function regardless of whether it is differentiable,
expanding the repertoire of possible interactions. In the [previous lecture](Lecture9B),
we covered {term}`hard-particle interaction`s and nearest-neighbor interactions.

### Periodic boundary conditions

A challeng in molecular simulations is defining a represenative system
volume, $V$, because we typically simulate very small volumes relative
to physical systems (i.e. box lengths on the order of 10-100 nm in an
atomistic or coarse-grained system). In such small box sizes, the
interface, or box walls, are substantial, and hence there must be some
method for dealing with the behavior of molecules near the walls. If we
do not treat the boundaries differently - i.e. if we have a _free
boundary_ - then molecules at the edge of the box will interact with
vacuum, which may not be intended.

```{admonition} Why don't we just increase our volume to be arbitrarily large, so that we can observe the _bulk_ behavior without worrying about the boundary vacuum?

<details><summary>Click for answer</summary>

Sometimes we do! The problem is, again, that our simulation complexity greatly increases with each new particle we
consider as part of our system, so doing this makes our computation more costly. If we can avoid it and still get
meaningful results, we would like to do so.
</details>
```

While clearly the volume of a macroscopic system is inaccessible to
atomistic simulations, it is still possible to define a simulation
volume in which we sample the same ensemble quantities as the
macroscale.

Suppose we define the simulation box by three box vectors, $a, b,$
and $c$, and by three angles between these vectors, $\alpha, \beta,$ and
$\gamma$. While these parameters can vary, for our purposes we will
assume that the simulation box is cubic, i.e. $a = b = c = L$ and
$\alpha = \beta = \gamma = 90^\circ$. The most common way of treating
the boundary of a simulation box is by imposing

```{glossary}
periodic boundary conditions
    also called PBCs; a simulation practice in which we pretend each side of the simulation box
    is connected on the opposite side to an identical simulation
```

Using PBCs is akin to using an infinite set of equivalent
simulation boxes that are offset by a box length $L$ in a given
Cartesian direction from the "actual" simulation box. Each of these
equivalent simulation boxes have equivalent particles as well with their
positions again modified by $L$ - the particle located at position
$r(x,y,z)$ in the simulation box is mirrored across all of these
simulation boxes such that it is the same as the particle at positions
$r(x+L, y, z)$, $r(x, y+L, z)$, $r(x, y, z+L)$, and so on. This
treatment is analogous to defining the simulation box as a unit cell in
an infinitely periodic material: if a particle leaves the box along the
negative x-axis, a particle from one of the adjacent simulation boxes
immediately re-enters the box along the positive x-axis.

![image](figs/fig_10_2-01.png)

Note that the
boundaries of the simulation box themselves have no particular
significance. The system is also translationally invariant: all particle
positions are shifted uniformly, no system properties would change. If
particles interact via pairwise intermolecular potentials (see below),
periodic boundary conditions then allows us to write:

$$\begin{aligned}
E(\textbf{r}^N) &= \frac{1}{2} \sum_{i}^{N} \sum_{j}^N E(|\textbf{r}_{ij}|) \quad \text{with free boundaries}\\
E(\textbf{r}^N) &= \frac{1}{2} \sum_{i}^{N} \sum_{j}^N \sum_{\textbf{n}} E(|\textbf{r}_{ij} + \textbf{n}L|)  \quad \text{with periodic boundaries}
\end{aligned}$$

Here, $\textbf{r}^N$ is a vector representing the set of all $N$
particle positions, $\textbf{r}_{ij}$ is the (vector) distance between
particle $i$ and $j$, $\textbf{n}$ is a vector of 3 arbitrary integers,
and $L$ is the size of the box. The factor of 1/2 eliminates
overcounting of pairs of atoms. In other words, each particle can
interact with every possible periodic image since the system is
infinite. This may not be desirable, so typically interactions use the
[minimum image convention](https://en.wikipedia.org/wiki/Periodic_boundary_conditions#Practical_implementation:_continuity_and_the_minimum_image_convention)
meaning that the distance used in computing
pair potentials is the _shortest_ possible distance between two
particles, taking into account periodic boundary conditions. Thus, the
distance in any one dimension of the box can never exceed $L$.

In practice, PBCs are used for the vast majority of simulations, but you
must be careful that they do not introduce artifacts, or

```{glossary}
finite size effects
    unphysical artifacts introduced when simulation boundary conditions
    impose unrealistic constraints on the behavior of a system
```

This can occur, for example, if the value of
$L$ is small relative to long-wavelength modes of the system, for
example, then the presence of PBCs could limit these modes. For example,
lipid bilayers, while largely planar, undulate out-of-plane over length
scales of hundreds of nanometers; these undulations are often damped in
simulations that are too small to properly capture them. 

## Sampling from a canonical ensemble

We will now build upon the
fundamentals introduced in the [last lecture](Lecture9B)
to describe the principles of Monte Carlo simulations.

In general, the goal of a simulation might be to estimate the ensemble
average of a quantity which will be denoted as $Y$. The ensemble-average
value of $Y$ can be obtained readily if we know the partition function
for the system. Recall from our study of the Ising model that a general
expression for the partition function of a system with $N$
non-independent particles is:

$$\begin{aligned}
Z = \sum_{\textbf{r}_1} \sum_{\textbf{r}_2} \sum_{\textbf{r}_3} \dots \sum_{\textbf{r}_N} e^{-\beta E(\textbf{r}_1, \textbf{r}_2, \textbf{r}_3, \dots \textbf{r}_N)}
\end{aligned}$$

In this notation, each sum accounts for all possible positions
($\textbf{r}_i$) of one of the particles, and the energy of each
configuration is a function of all particle positions. The bold notation
indicates that $\textbf{r}_i$ is a vector; in this case a vector with 3
coordinates referring to the x/y/z positions of the particle. We cannot
factorize this partition function because the particles are interacting
and hence a single-particle partition function cannot be written without
knowledge of the positions/states of the other particles. If we now
assume that particle positions are continuous, rather than discrete, we
can transform our sums to integrals in the classical limit and write the
expression as:

$$\begin{aligned}
Z &= \int_{\textbf{r}_1} \int_{\textbf{r}_2}  \int_{\textbf{r}_3} \dots \int_{\textbf{r}_N} d\textbf{r}_1 d\textbf{r}_2 d\textbf{r}_3 \dots d\textbf{r}_N e^{-\beta E(\textbf{r}_1, \textbf{r}_2, \textbf{r}_3, \dots \textbf{r}_N)} \\
&\equiv \int_{V^N} d\textbf{r}^N \exp \left [ -\beta E(\textbf{r}^N)\right ] 
\end{aligned}$$

Here, each integral runs over some volume which is accessible to each
particle in the system since the particle positions have units of
length. We simplify the notation by writing the integral over a single
vector, $\textbf{r}^N$, which contains the positions of all $N$
particles; in three-dimensions, this is then a vector with $3N$
coordinates, and integrating over all possible positions is equivalent
to integrating over a 3N-dimensional volume $V^N$ which we call the
*volume of phase space* accessible to the $N$ particles[^1].

With this new notation, the ensemble average in the classical canonical
ensemble (with $NVT$ fixed) is given as:

```{math}
:label: app_a_ensemble_average
\langle Y \rangle = \frac{\int d \mathbf{r}^N \exp \left [ -\beta E(\mathbf{r}^N) \right ] Y(\mathbf{r}^N) }{\int d \mathbf{r}^N \exp \left [ -\beta E(\mathbf{r}^N) \right ]}
```

This notation mirrors the notation used to sum over all states
accessible to a system using a discrete partition function, but here the
sum is replaced by an integral over phase space. It is only a notation
change, and is conceptually equivalent.

In principle, the integrals in Eq. {eq}`app_a_ensemble_average`
could be calculated in a brute force
manner by determining the value of $Y(\mathbf{r}^N)$ for every set of
particle coordinates and integrating numerically. However, such an
approach would be impossible computationally because the number of
system configurations becomes effectively infinite for even a small
number of particles.

Moreover, it is likely that the vast majority of
the system configurations would have a high energy,
$E(\mathbf{r}^N) \gg k_BT$, and as a result the Boltzmann factor for
most values of $Y(\mathbf{r}^N)$ would be zero. In other words, a large
portion of the phase space ($V^N$) possible for a simulation will be
inaccessible due to its high energy - those configurations will be
infinitely unlikely. Performing such a calculation would thus be not
only nearly impossible, but also highly inefficient.

Finally, the last
thing to notice is that to calculate $\langle Y \rangle$, it is not
necessary to calculate the value of the integrals in both the numerator
and denominator of Eq. {eq}`app_a_ensemble_average`; only their ratio must be
determined. This observation will form the basis of the Metropolis Monte
Carlo algorithm. We will now describe Monte Carlo sampling in general,
then discuss the Metropolis algorithm.

## Stochastic sampling of determinate equations

The main idea of the Monte Carlo method is the following: a determinate
mathematical expression (like the integrals in the equations for the
canonical ensemble) is reformulated as a probablistic analogue and then
solved by stochastic sampling.

In reality, we very rarely know the exact formulation of our probability density,
and so we can use stochastic sampling to construct an approximation.
For example, suppose we have this weirdly shaped object and want to compute its area,
and are unable to do so analytically.

![image](figs/fig_10_3A.png)


This can be likened to computing the average value of a binary function across a space
larger than our shape, _i.e._,


$$ A = \langle f \rangle = \sum_{x,y} f(x,y) p_{x,y} $$

where $f$ is 1 when we are sitting in the shape and 0 otherwise.

Now, we can calculate the average value of
$f$ by randomly selecting points within our bounding box and recording
whether or not we hit our shape.


![image](figs/fig_10_3.gif)

If we have an infinite number of
trials, then we will sample exactly according to
$p(x,y)$ and the average of $f$ computed
from the infinite number of trials will be exactly equal to our area.

$$\begin{aligned}
A = \frac{1}{\tau}\sum_i^\tau  f(x_i, y_i)
\end{aligned}$$

where $\tau$ is our number of trials (samples).

Let's consider applying this uniform sampling methodology to the
calculation of the canonical partition function. We could write:

$$\begin{aligned}
Z &= \int_{V^N} d \mathbf{r}^N \exp \left [ -\beta E(\mathbf{r}^N) \right ] \\
&\approx \frac{V^N}{\tau} \sum_i^\tau \exp \left [-\beta E(\mathbf{r}_i^N)\right ]
\end{aligned}$$

$V^N$ is again the volume of phase space which is the $3N$-dimensional
analogue to the interval $[a, b]$; $\tau$ is the total number of samples
used for the approximation, and $E(\mathbf{r}_i^N)$ is the potential
energy of the system for the specific configuration denoted by $i$.
There are two major problems with this approach in practice. First, it's
difficult to estimate the total phase space volume, $V^N$. This problem
can be avoided, however, by recognizing that calculating the
ensemble-average value of an observable requires only the ratio of two
quantities within the phase space $V^N$. So we can write:

$$\begin{aligned}
\langle Y \rangle_{NVT} &\approx \frac{\frac{V^N}{\tau} \sum_i^\tau Y_i(\mathbf{r}_i^N) \exp \left [-\beta E(\mathbf{r}_i^N)\right ]}{\frac{V^N}{\tau} \sum_i^\tau \exp \left [-\beta E(\mathbf{r}_i^N)\right ]} \\
& \approx \frac{ \sum_i^\tau Y_i(\mathbf{r}_i^N) \exp \left [-\beta E(\mathbf{r}_i^N)\right ]}{ \sum_i^\tau \exp \left [-\beta E(\mathbf{r}_i^N)\right ]}
\end{aligned}$$

We use the notation $\langle Y\rangle_{NVT}$ as a reminder that the
ensemble-average value of $Y$ is calculated in the canonical ensemble.
Due to the ratio, the term involving the total phase space drops out.
But, we are left with a second problem, which is that the vast majority
of configurations in most systems will have a near-zero contribution to
the ensemble average, since the Boltzmann weight
$\exp \left [-\beta E(\mathbf{r}_i^N)\right ] \approx 0$ for any
configurations with unfavorable energies. For example, consider sampling
configurations from a set of hard spheres to represent a fluid - any
configuration in which there is slight overlap between spheres leads to
an infinite system energy, and the corresponding Boltzmann weight would
be zero. Randomly selecting particle positions would thus lead to the
vast majority of configurations not contributing to the average,
inhibiting an accurate calculation. Instead, we would like to perform
**importance sampling**, by only examining configurations with finite
contributions to the ensemble average.

![image](figs/fig_10_1.png){width="60%"}

## Importance sampling and Markov chains

To evaluate ensemble averages from the canonical ensemble, we can use
Eq. [\[randomsample\]](#randomsample){reference-type="eqref"
reference="randomsample"} but with the probability density, $p(x)$,
chosen to maximize the likelihood of sampling configurations that
contribute meaningfully to the calculation of the ensemble average. This
is the essence of importance sampling. We can perform importance
sampling for configurations in the canonical ensemble by recalling that
the probability of finding the system in a given microstate of the
canonical ensemble, $p(\textbf{r}^N)_{NVT}$, is related to the Boltzmann
factor for that state normalized by the partition function. We can then
write:

$$\begin{aligned}
p(\textbf{r}^N)_{NVT} &= \frac{\exp \left [-\beta E(\mathbf{r}^N)\right ]}{Z} \\
\langle Y \rangle_{NVT} &= \int d \mathbf{r}^N p(\textbf{r}^N)_{NVT}  Y(\mathbf{r}^N) 
\end{aligned}$$

The ensemble average then has the same form as $F = \int_a^b f(x) dx$ if
we let $x=\mathbf{r}^N$ and
$f(x) = p(\mathbf{r}^N)_{NVT} Y(\mathbf{r}^N)$. Following the reasoning
above, we can then approximate $\langle Y \rangle_{NVT}$ by:

$$\begin{aligned}
\langle Y \rangle_{NVT} &\approx \left \langle \frac{f(x)}{p(x)} \right \rangle_{\textrm{trials}} \\
& = \left \langle \frac{ p(\mathbf{r}^N)_{NVT} Y(\mathbf{r}^N) }{p(\mathbf{r}^N)} \right \rangle_{\textrm{trials}}
\end{aligned}$$

From this expression, we see that if we select trials according to the
probability distribution $p(\mathbf{r}^N) = p(\mathbf{r}^N)_{NVT}$, then
we get:

$$\langle Y \rangle_{NVT}  = \langle Y \rangle_{\textrm{trials}} \label{ensemble_average_mc}$$

Thus, we choose configurations in our ensemble according to the
canonical ensemble probability distribution, in which case the
ensemble-average value of $Y$ can be estimated by sampling
configurations according to their Boltzmann weight. Finally, we note
that we just need to know the probability of sampling a configuration -
we do not necessarily need an expression for the partition function
itself. In principle, we could choose another probability distribution
$p(x)$ from which to sample states, but the choice of
$p(\mathbf{r}^N) = p(\mathbf{r}^N)_{NVT}$ is the simplest.

Our problem then boils down to: how do we select states according to the
correct probability distribution without knowing the value of the
partition function? To do so, we will generate a **Markov chain of
states** as a means of sampling our distribution. A Markov chain refers
to a *sequence* of states (i.e. configurations or trials using our
previous nomenclature) that satisfy the following two conditions:

-   Each state generated belongs to a finite set of possible outcomes
    called the state space. The statistical mechanical analogue to this
    statement is to say that each microstate generated belongs to a
    finite ensemble. We can denote each possible state by
    $\mathbf{r}_1^N, \mathbf{r}_2^N, \mathbf{r}_3^N, \dots$ for the
    enormous set of possible microstates within the canonical ensemble
    that we are sampling. For the canonical ensemble, this state space
    is equal to $V^N$, the accessible phase space.

-   The probability of sampling state $i+1$ in the sequence of states
    sampled depends only on state $i$, and not on previous states in the
    chain.

Since the likelihood of sampling a new state is only related to what
current state we are in, we can define a transition probability,
$\Pi(m\rightarrow n)$, which defines the likelihood of transitioning
from state $m$ to state $n$. We can then imagine an algorithm in which
we start in some state $m$ then transition to a new state $n$ with a
probability given by $\Pi(m\rightarrow n)$ and repeat this for a large
number of trials. If we do this an infinite number of times, then the
state $m$ will appear with an overall probability given by $p(m)$, where
$p(m)$ is the *limiting* probability distribution that does not depend
on any of the other states (unlike the transition probability). When
sampling from the canonical ensemble, then, we want $p(m)$ to equal
$p(\mathbf{r}_m^N)_{NVT}$ - that is, the likelihood of sampling state
$m$ if we take enough states from our Markov chain is equal to the
probability of sampling that state according to the canonical ensemble
distribution function. Thus, we need to find an expression for the
transition probability, $\Pi$, that yields this correct limiting
distribution. We will return to this problem in the next lecture.

![image](figs/fig_10_2.png){width="100%"}

[^1]: Often this partition function is written with a normalizing prefactor with units of
1/volume$^N$ to ensure that the partition function is unitless; we omit
this prefactor here.