# Monte carlo simulations

## Additional Readings for the Enthusiast

-   Frenkel and Smit Chapter 3

## Topics in this lecture

-   Sampling from a canonical ensemble

-   Stochastic sampling of determinate equations

-   Importance sampling

## Announcements

-   Exam 1 Thursday from 6-7:30 PM in EH 3024. Bring equation sheet, no
    calculator.

-   Simulation project to be assigned Thursday

## Interactions in molecular simulations

### Non-bonded potentials

We ended the last lecture by introducing pairwise non-bonded
interactions between particles that are commonly used in molecular
simulations. The most common non-bonded interaction in molecular
simulations is the Lennard-Jones potential, or the 12-6 potential, which
is typically written as:

$$\begin{aligned}
E_{\textrm{LJ}}(r_{ij}) &= 4\epsilon_{ij} \left [ \left( \frac{\sigma_{ij}}{r_{ij}}\right )^{12} - \left( \frac{\sigma_{ij}}{r_{ij}}\right )^6 \right ] 
\end{aligned}$$

$r_{ij}$ is the (scalar) distance between particle $i$ and $j$,
$\epsilon_{ij}$ is a characteristic interaction energy and $\sigma_{ij}$
is a characteristic interaction length scale describing the approximate
diameter of a particle. The Lennard-Jones potential is broken into an
attractive interaction that scales with $r^{-6}$ and a repulsive
potential that scales with $r^{-12}$. The attractive potential
represents three contributions to typical van der Waals interactions
that are all attractive and scale with $r^{-6}$: London dispersion
forces, which are related to interactions between instantaneous dipoles
that arise from quantum mechanical considerations; dipole-induced dipole
interactions, which are related to attractions between dipoles on a
molecule and induced dipoles that arise from the polarizibility of a
different molecule; and Keesom interactions, which emerge from the
orientation dependence of dipole-dipole interactions. In general, we do
not attempt to divide the LJ potential into contributions from these
three distinct interactions, but rather empirically identify parameters
for $\epsilon$ and $\sigma$ which capture all three effects. The
repulsive potential represents Pauli exclusion, which acts to ensure
that particle wave functions do not overlap. There is no single scaling
relation for Pauli exclusion other than that it must be a strong
repulsive force, so for computational convenience $r^{-12}$ is chosen
since the calculated $r^{-6}$ term can be simply squared.

In addition to van der Waals interactions, it is typical to associate
charges (or partial charges, to account for the unequal distribution of
electrons throughout a molecule that leads to dipoles) to atoms or
particles in a system. These charges interact via a long-range Coulombic
potential:

$$E_{\textrm{coulomb}}(r_{ij}) = \frac{1}{4\pi \epsilon_0 \epsilon_r}\frac{q_i q_j}{r_{ij}}$$

where $\epsilon_0$ is the permittivity of free space, $\epsilon_r$ is
the relative dielectric constant (1 in vacuum, 2-4 in oil, 80 in water),
and $q_i$ is the charge on particle $i$. In practice, Coulombic
interactions are difficult to calculate in simulations due to periodic
boundary conditions because they decay slowly and the minimum image
convention is a severe underestimate of the total magnitude of
electrostatic interactions. Instead, advanced techniques, such as Ewald
summations, have been derived handle their calculation. Such methods are
outside of the scope of this discussion but are discussed in the Frenkel
and Smit textbook if you would like to review them on your own.

![image](figs/fig_9_4.png){width="100%"}

Many other non-bonded interactions are possible and in common use, but
these represent the two most common functional forms used in most
atomistic simulations.

### Interactions in MC simulations

The interactions described above are all described by potentials that
are continuous and differentiable, and thus can be used in molecular
dynamics simulations. However, Monte Carlo simulations can use any
potential energy function regardless of whether it is differentiable,
expanding the repertoire of possible interactions. Some examples of
interactions used in MC simulations are noted here. The first is a
hard-sphere interaction, where particles are strictly not allowed to
overlap (akin to an infinitely strong repulsive potential part of the
Lennard-Jones interaction):

$$E_{\textrm{hard}}(r_{ij}) =  \left\{  \begin{array}{ccc}
\infty &,& r_{ij} < \sigma \\
0&,& r_{ij} \geq \sigma
\end{array} \right\}$$

Another example is the interaction between nearest-neighbors used in the
Ising model, which can be easily represented in MC simulations:

$$E_{\textrm{Ising}}(r_{ij}) =  \left\{  \begin{array}{ccc}
-J &,& \text{if $i,j$ are neighbors} \\
0&,&\text{otherwise}
\end{array} \right\}$$

In principle, many other possible interactions could be defined; here we
only included a subset that are commonly found in the simulation
literature and map directly to many experimental problems.

### Periodic boundary conditions

A chellenge in molecular simulations is defining a represenative system
volume, $V$, because we typically simulate very small volumes relative
to physical systems (i.e. box lengths on the order of 10-100 nm in an
atomistic or coarse-grained system). In such small box sizes, the
interface, or box walls, are substantial, and hence there must be some
method for dealing with the behavior of molecules near the walls. If we
do not treat the boundaries differently - i.e. if we have a *free
boundary* - then molecules at the edge of the box will interact with
vacuum, which may not be intended.

![image](figs/fig_9_2.png){width="100%"}

While clearly the volume of a macroscopic system is inaccessible to
atomistic simulations, it is still possible to define a simulation
volume in which we sample the same ensemble quantities as the
macroscale. We define the simulation box by three box vectors, $a, b,$
and $c$, and by three angles between these vectors, $\alpha, \beta,$ and
$\gamma$. While these parameters can vary, for our purposes we will
assume that the simulation box is cubic, i.e. $a = b = c = L$ and
$\alpha = \beta = \gamma = 90^\circ$. The most common way of treating
the boundary of a simulation box is by imposing **periodic boundary
conditions (PBCs)**, in which one side of the simulation box is
connected to the opposite side so that the simulation box is effectively
infinite. Using PBCs is akin to using an infinite set of equivalent
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
immediately re-enters the box along the positive x-axis. Note that the
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
**minimum image convention** meaning that the distance used in computing
pair potentials is the *shortest* possible distance between two
particles, taking into account periodic boundary conditions. Thus, the
distance in any one dimension of the box can never exceed $L$.

In practice, PBCs are used for the vast majority of simulations, but you
must be careful that they do not introduce artifacts. If the value of
$L$ is small relative to long-wavelength modes of the system, for
example, then the presence of PBCs could limit these modes. For example,
lipid bilayers, while largely planar, undulate out-of-plane over length
scales of hundreds of nanometers; these undulations are often damped in
simulations that are too small to properly capture them.

## Sampling from a canonical ensemble

In the last lecture, we introduced two types of simulation
methodologies: molecular dynamics simulations, in which statistical
quantities are computed by evolving the positions of a series of
particles in time; and Monte Carlo simulations, in which statistical
quantities are computed by sampling a thermodynamcially relevant
probability distribution. We then discussed common simulation
representations of particles, boundary conditions, and interactions
between particles. In this lecture, we will build upon these
fundamentals to describe the principles of Monte Carlo simulations.

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
*volume of phase space* accessible to the $N$ particles (often this
partition function is written with a normalizing prefactor with units of
1/volume$^N$ to ensure that the partition function is unitless; we omit
this prefactor here).

With this new notation, the ensemble average in the classical canonical
ensemble (with $NVT$ fixed) is given as:

$$\label{app_a_ensemble_average}
\langle Y \rangle = \frac{\int d \mathbf{r}^N \exp \left [ -\beta E(\mathbf{r}^N) \right ] Y(\mathbf{r}^N) }{\int d \mathbf{r}^N \exp \left [ -\beta E(\mathbf{r}^N) \right ]}$$

This notation mirrors the notation used to sum over all states
accessible to a system using a discrete partition function, but here the
sum is replaced by an integral over phase space. It is only a notation
change, and conceptually the quantities are the same.

In principle, the integrals in eq.
[\[app_a_ensemble_average\]](#app_a_ensemble_average){reference-type="eqref"
reference="app_a_ensemble_average"} could be calculated in a brute force
manner by determining the value of $Y(\mathbf{r}^N)$ for every set of
particle coordinates and integrating numerically. However, such an
approach would be impossible computationally because the number of
system configurations becomes effectively infinite for even a small
number of particles. Moreover, it is likely that the vast majority of
the system configurations would have a high energy,
$E(\mathbf{r}^N) \gg k_BT$, and as a result the Boltzmann factor for
most values of $Y(\mathbf{r}^N)$ would be zero. In other words, a large
portion of the phase space ($V^N$) possible for a simulation will be
inaccessible due to its high energy - those configurations will be
infinitely unlikely. Performing such a calculation would thus be not
only nearly impossible, but also highly inefficient. Finally, the last
thing to notice is that to calculate $\langle Y \rangle$, it is not
necessary to calculate the value of the integrals in both the numerator
and denominator of eq.
[\[app_a_ensemble_average\]](#app_a_ensemble_average){reference-type="eqref"
reference="app_a_ensemble_average"}; only their ratio must be
determined. This observation will form the basis of the Metropolis Monte
Carlo algorithm. We will now describe Monte Carlo sampling in general,
then discuss the Metropolis algorithm.

## Stochastic sampling of determinate equations

The main idea of the Monte Carlo method is the following: a determinate
mathematical expression (like the integrals in the equations for the
canonical ensemble) is reformulated as a probablistic analogue and then
solved by stochastic sampling. Consider evaluating a function $F$ which
can be estimated as the integral of some function $f(x)$ within a
defined interval $[a, b]$:

$$F = \int_{a}^{b} f(x) dx$$

To follow the idea of equating a determinate function (the integral)
with a stochastic solution method, we can define an arbitrary
probability density function, $p(x)$, which represents the probability
of finding any particular value of $x$. We assume that this probability
density is known for the function of interest. We can then write:

$$\begin{aligned}
F &= \int_{a}^{b} f(x) dx \\
&= \int_a^b  \left ( \frac{f(x)}{\rho(x)} \right ) p(x) dx \\
&= \left \langle \frac{f(x)}{\rho(x)}\right \rangle 
\end{aligned}$$

This expression is the ensemble-average of an observable but in the
continuum limit - in other words, this is the continuum version of the
expression $\langle Y \rangle = \sum p_i Y_i$ where we have replaced the
summation (for discrete states) with an integral and the observable we
are computing is $\left ( \frac{f(x)}{p(x)} \right )$.

Now, we can calculate the average value of
$\left ( \frac{f(x)}{p(x)} \right )$ by randomly selecting points within
the interval $[a, b]$ according to the probability distribution $p(x)$,
and calculating $\left ( \frac{f(x)}{p(x)} \right )$ for each randomly
selected value of $x$. This stochastic sampling of $x$ from all possible
values defines the Monte Carlo method. If we have an infinite number of
trials, then each value of $x$ will be sampled exactly according to
$p(x)$ and the average of $\left ( \frac{f(x)}{p(x)} \right )$ computed
from the infinite number of trials will be exactly equal to the value of
the integral above. We can thus approximate $F$ by:

$$\begin{aligned}
F &= \left \langle \frac{f(x)}{p(x)} \right \rangle  \\
&\approx \left \langle \frac{f(x)}{p(x)}\right \rangle_{\textrm{trials}} \\
&= \frac{1}{\tau}\sum_i^\tau  \frac{f(x)}{p(x)} \label{randomsample}
\end{aligned}$$

where for each of the $\tau$ trials (samples), $x$ is chosen according
to the probability $p(x)$.

Let's consider a simple example of how we might apply this idea. First,
we will choose $p(x)$ to be a uniform probability density:

$$p(x) = \frac{1}{b - a} \quad \text{for $a \leq x \leq b$}$$

Then, we can generally approximate $F$ as:

$$F \approx \frac{b - a}{\tau}\sum_i^{\tau}  f(x)$$

This expression approximates $F$ by randomly, uniformly sampling values
of $x$ between $a$ and $b$, calculating $f(x)$, and taking the average,
with additional values of $\tau$ increasing the accuracy of our
approximation. Of course, for many one-dimensional functions this may
not be particularly efficient relative to just performing numerical
quadrature, but in a $N$-dimensional space, such as the configurational
space of the partition function, this type of methodology could be
efficient.

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
