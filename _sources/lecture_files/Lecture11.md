# Monte Carlo and Intro to Molecular Dynamics Simulations

## Recommended textbooks

Frenkel and Smit Chapter 4.

## Topics in this lecture

-   Metropolis Monte Carlo

-   Molecular Dynamics

## Announcements

-   Exam 1 today, 6-7:30 PM, EH 3024

-   Sim. project to be assigned today/tomorrow

## Importance sampling and Markov chains

In the last lecture, we began to introduce the idea of the Metropolis
Monte Carlo method for sampling the canonical ensemble. Briefly, our
goal is to develop an algorithm that stochastically samples system
configurations that occur with a high probability and thus contribute
meaningfully to the system partition function. By doing so, we can
compute ensemble-average quantities using the equation:

$$\begin{aligned}
\langle Y \rangle_{NVT} &= \int d \mathbf{r}^N p(\textbf{r}^N)_{NVT}  Y(\mathbf{r}^N) 
\end{aligned}$$

The challenge is only sampling states that have a large value of
$p(\textbf{r}^N)_{NVT}$. However, if we sample states from the actual
canonical probability distribution itself, then we could approximate the
value of $\langle Y \rangle$ as a simple average over the number of
states sampled (or number of trials). At no point do we actually need to
calculate the partition function itself, which would be effectively
impossible.

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
distribution.

![image](figs/fig_10_2.png){width="100%"}

## Detailed balance and the Metropolis algorithm

At equilibrium, the probability of finding the system in a configuration
$\mathbf{r}_m^N$ must be stationary, meaning that the probability
distribution of the canonical ensemble is invariant with time (this is a
consequence of ergodicity) and is equal to the limiting distribution of
our Markov chain. If we think about a Markov chain as a very large
sequence of states, then for the probability of a particular state to be
stationary, the number of transitions into that state must be the same
as the number of transitions out of it. Think of this like a mass
balance in transport - the flux into a particular state is equal to the
flux out of it, otherwise we would "accumulate" probability for that
state. Therefore, it must be the case that in any given Markov chain the
number of trials that generate new states from a particular state must
be equal to the total number of trials from all other states that
generate the original configuration. If we write the probability of
transitioning from some configuration $\mathbf{r}_m^N$ to
$\mathbf{r}_n^N$ as $\Pi(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)$ and
the probability of being in state $\mathbf{r}_m^N$ as
$p(\mathbf{r}_m^N)$, then we can fulfill the condition that
$p(\mathbf{r}_m^N)$ is stationary by imposing the condition of
**detailed balance**:

$$\label{app_a_detailed_balance}
p(\mathbf{r}_m^N) \Pi(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) = p(\mathbf{r}_n^N) \Pi(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N)$$

This condition states that the probability of being in a particular
state $m$ and transitioning to a new one $n$ is the same as the
probability of being in the new state $n$ and transitioning to the old
one $m$. We can rearrange this expression to write:

$$\frac{p(\mathbf{r}_m^N)}{p(\mathbf{r}_n^N)}  = \frac{ \Pi(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N)}{\Pi(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)}$$

Writing detailed balance in this form more clearly shows the consequence
of this definition - if the probability of state $m$,
$p(\mathbf{r}_m^N)$, is 10 times larger than the probability of state
$n$, then this expression says that there will be 10 times more
transitions from state $n$ to $m$ than transitions from $m$ to $n$,
agreeing with expectations. Enforcing this condition for all possible
pairs of states guarantees that the number of transitions into and out
of each state is equal if an infinite number of transitions are
attempted (detailed balance is actually an overly stringent criterion -
we could achieve the same properties while enforcing a less stringent
relationship between transition probabilities, but that is outside the
scope of this class).

If a system obeys detailed balance, then the Markov chain must reach a
stationary probability distribution which is necessarily true for any
equilibrium system. Having defined the principle of detailed balance, we
can now apply this to a particular Markov chain that samples states
within the canonical ensemble by following the **Metropolis** algorithm.
The key aspect of the Metropolis algorithm is to further divide the
transition probability,
$\Pi(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)$, into two terms - the
probability of generating a new trial state,
$g(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)$, and the probability of
accepting the new trial state,
$\alpha (\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)$:

$$\Pi(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) = g(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) \alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)$$

The equation for detailed balance can then be rewritten as:

$$\begin{aligned}
%p(\mathbf{r}_m^N) g(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) \alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) &= p(\mathbf{r}_n^N) g(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N) \alpha(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N ) \notag \\ 
\frac{g(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) \alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)}{g(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N) \alpha(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N )} &= \frac{p(\mathbf{r}_n^N)}{p(\mathbf{r}_m^N)}
\end{aligned}$$

Now, we can connect this expression explicitly to the canonical
ensemble. In the canonical ensemble, the probability of finding a
particular state $m$ is related to that state's Boltzmann weight, so we
can write:

$$p(\mathbf{r}_m^N)_{NVT} = \frac{\exp \left [ -\beta E(\mathbf{r}_m^N) \right ]}{Z}$$

Next, we assume that the probability $g$ for generating trial moves is
symmetric, and then write that
$g(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) = g(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N)$.
We can assume this because in general we can **arbitrarily** choose a
function for $g$ as long as the detailed balance condition is satisfied.
Combining these expressions, we then write:

$$\begin{aligned}
\frac{g(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) \alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)}{g(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N) \alpha(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N )} &= \frac{p(\mathbf{r}_n^N)_{NVT}}{p(\mathbf{r}_m^N)_{NVT}} \\
\frac{\alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)}{\alpha(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N)} &= \exp \left \{ -\beta \left [ E(\mathbf{r}_n^N) - E(\mathbf{r}_m^N) \right ] \right \} \label{app_a_acceptance_condition}
\end{aligned}$$

Eq.
[\[app_a_acceptance_condition\]](#app_a_acceptance_condition){reference-type="eqref"
reference="app_a_acceptance_condition"} stipulates the conditions on the
acceptance condition,
$\alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)$, that leads to
correct Boltzmann-weighted sampling of configurations in the canonical
ensemble. Importantly, the partition function drops out of this
expression, resolving the issue of being unable to calculate the
partition function explicitly. In principle, several choices of the
acceptance condition could fulfill the conditions imposed detailed
balance; the choice used in the original derivation of the Metropolis
algorithm is:

$$\label{app_a_acceptance}
\alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) = \text{min} \left ( 1, \exp \left \{ -\beta \left [ E(\mathbf{r}_n^N) - E(\mathbf{r}_m^N) \right ] \right \} \right )$$

This condition fulfills eq.
[\[app_a_acceptance_condition\]](#app_a_acceptance_condition){reference-type="eqref"
reference="app_a_acceptance_condition"}. This is apparent if we consider
the case where $p(\mathbf{r}_n^N) < p(\mathbf{r}_m^N)$, then:

-   $E(\mathbf{r}_n^N) - E(\mathbf{r}_m^N) > 0$

-   $\exp \left \{ -\beta \left [ E(\mathbf{r}_n^N) - E(\mathbf{r}_m^N) \right ] \right \} < 1$

-   $\alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N) = \exp \left \{ -\beta \left [ E(\mathbf{r}_n^N) - E(\mathbf{r}_m^N) \right ] \right \}$

-   $\alpha(\mathbf{r}_n^N \rightarrow \mathbf{r}_m^N) = 1$

The last two quantities satisfy the ratio stipulated in eq.
[\[app_a_acceptance_condition\]](#app_a_acceptance_condition){reference-type="ref"
reference="app_a_acceptance_condition"}. Finally, it is very important
to note that it is possible for the system to stay in the same state;
that is:

$$\Pi(\mathbf{r}_m \rightarrow \mathbf{r}_m) = 1 - \sum_{n\ne m} \Pi(\mathbf{r}_m \rightarrow \mathbf{r}_n)$$

Any given Markov chain generated using the Metropolis Monte Carlo
algorithm can thus have many consecutive identical states, particularly
if the system reaches a local energy minimum.

Based on this derivation, the Metropolis Monte Carlo algorithm for
correctly sampling states from the canonical ensemble consists of the
following steps (given in Problem Set 2):

1.  Assume the system is in a configuration, $\mathbf{r}_m^N$, which is
    state $i$ in a Markov chain.

2.  Generate a trial configuration $\mathbf{r}_n^N$ according to the
    probability $g(\mathbf{r}_m^N \rightarrow \mathbf{r}^N_n)$. There
    can be many possible ways of generating trial configurations (or
    many "moves"), as noted below.

3.  Calculate the energy difference between the new and old
    configurations and calculate the probability of transitioning to the
    new state, $\alpha(\mathbf{r}_m^N \rightarrow \mathbf{r}_n^N)$
    according to Eq.
    [\[app_a_acceptance\]](#app_a_acceptance){reference-type="ref"
    reference="app_a_acceptance"}.

4.  Generate a uniform random number in the range \[0, 1\]. If the
    random number is less than the transition probability, then state
    $i +1$ in the Markov chain has the new configuration
    $\mathbf{r}_n^N$ and the system configuration is updated; that is,
    the new trial move is *accepted*. If the random number is greater
    than the transition probability, then state $i+1$ in the Markov
    chain has the old configuration ($\mathbf{r}_m^N$), the system
    configuration remain the same, and the move is rejected. This step
    is the stochastic implementation of Eq.
    [\[app_a_acceptance\]](#app_a_acceptance){reference-type="ref"
    reference="app_a_acceptance"}. Note that according to Eq.
    [\[app_a_acceptance\]](#app_a_acceptance){reference-type="ref"
    reference="app_a_acceptance"}, all transitions in which the system
    energy is lowered are automatically accepted.

5.  Repeat steps 2-4 until a sufficient number of states in the Markov
    chain are generated.

6.  Approximate the ensemble-average value of some observable
    $Y(\mathbf{r}^N)$ by averaging over all states in the Markov chain.
    Note that many states will be repeated, and we include consecutive
    identical states (which appear when moves are rejected). Averaging
    over all states in the Markov chain then calculates
    $\langle Y(\mathbf{r}^N)\rangle_{NVT}$.

Metropolis Monte Carlo has several advantages. First, the acceptance
ratio only relies on the energies of the two states, and as a result the
rule for generating trials moves with a probability given by $g$ can be
arbitrary and does not have to be physically meaningful. For example,
typical trial moves in a system consisting of a series of liquid-like
particles could be the slight displacement of a single particle, the
rotation of an entire molecule, the displacement of several particles
simultaneously, or non-physical moves such as "hopping" a particle from
one side of the system to the other. This feature also means that
many-body potentials can be easily used to calculate system energies,
which is more difficult to do in molecular dynamics simulations that
require pair potentials. In addition, because all configurations are
sampled according to their equilibrium probability distributions,
averaging observables over simulation configurations generates ensemble
averages. The downside, however, is that the algorithm is only useful
for calculating equilibrium thermodynamic properties and not observing
system kinetics.

Some care has to be taken in computing ensemble-average quantities. One
choice that can affect values is the starting configuration. If an
initial configuration is generated that is a high energy (and thus
unlikely) state, then it may contribute to a large degree to a resulting
ensemble average even if its actual Boltzmann weight is low. In other
words, imagine a chain with only 10 states; the initial state will
contribute to 1/10 of the ensemble-average even if it should actually
contribute to a much smaller degree. As a result, it is typical to run a
MC algorithm for an initial period of steps that are treated as an
"equilibration" period so that any unphysical, high energy starting
configuration relaxes to a set of low-energy configurations. Inspection
of the MC equations indeed shows that there should generally be a
decrease in the system energy until a set of configurations with similar
low-energy values are obtained.

We finish by summarizing the Metropolis Monte Carlo approach as follows.
The goal is to calculate the ensemble-average value of some quantity
that depends on the configuration of the system, $Y(\mathbf{r}^N)$,
which could be a parameter like the energy, pressure, temperature, etc.
To do so explicitly, we could sum over all possible microstates in the
canonical ensemble, weighted by the appropriate Boltzmann factor, to
calculate this ensemble average. However, this sum is impossible to
calculate. Instead, we calculate an approximation for the ensemble
average stochastically by sampling states from the canonical ensemble
with the correct probability. Since the partition function, and thus
probability, are not generally known, we instead set up a Markov chain
of states, where the likelihood of sampling a new state depends only on
the current state. By invoking the principle of detailed balance, we
determine the value of the transition probability between any two
arbitrary states. The Metropolis algorithm then boils down to attempting
to sample a particular state, calculating the probability with which
that state should be sampled, and either accepting or rejecting the new
state. This process is repeated until the estimate of the given quantity
converges.

## Molecular dynamics: the idea

We have now introduced Metropolis Monte Carlo as a rigorous method for
sampling configurations from the canonical ensemble by generating a
Markov chain of states with a correct probability. However, Metropolis
Monte Carlo still suffers from drawbacks; one problem is to ensure that
states are efficiently sampled (i.e. avoiding repeatedly testing states
where particles overlap, for example). Another fundamental problem is
invoking a concept of time - as Metropolis MC cannot be applied to
calculate time-dependent properties of a system, it cannot be used to
calculate non-equilibrium behavior (also because it assumes that we are
sampling from an equilibrium ensemble) or system properties that depend
on particle velocities. For example, one cannot calculate a diffusion
coefficient, which is an equilibrium property of a system, from a MC
simulation. There are some variations on the Metropolis algorithm that
seek to improve on this deficiency, but they are outside of the scope of
the present discussion.

In Molecular Dynamics, we avoid these two issues by introducing an
approach which tries to closely resemble experimental procedures.
Specifically, we assume that each particle in the system obeys Newton's
laws of motion, and then apply these equations of motion repeatedly to
generate system configurations. It is (generally) assumed that quantum
effects do not contribute and hence we refer to this as a classical
simulation method. Specifically, we discretize a time interval into
distinct steps, and at each step we calculate forces acting on each
particle to determine the next configuration. There is no stochastic
element to a basic molecular dynamics simulation, although in practice
the limitations of computer precision mean that there will always be
some minimal randomness introduced into a simulation. Since we are
calculating forces that attempt to reproduce the features of a physical
system, each configuration of the system generated during a MD
simulation is physically obtainable (in principle) and we do not have to
worry about particles overlapping. Moreover, we can explicitly calculate
a timescale associated with behavior, and can also model non-equilibrium
events. There are still issues with the technique - notably, the problem
of ensuring that we simulate systems for sufficiently long enough times
to observe the behavior we are interested in - but the problems are
distinct from those of MC simulations.

We will start by defining a basic MD algorithm, in analogy to the basic
MC algorithm:

1.  Choose a starting configuration, $\mathbf{r}^N(t)$ where $t=0$.

2.  Generate initial particle velocities, $\textbf{v}^N(t)$ where $t=0$.

3.  Compute the forces acting on all particles, $\textbf{f}^N(t)$, at
    time $t$.

4.  Update $\textbf{v}^N(t)$ and $\textbf{r}^N(t)$ using
    $\textbf{f}^N(t)$ and advance the time to $t+\Delta t$, where
    $\Delta t$ is the simulation timestep.

5.  Repeat steps 3-4 until a sufficient number of timesteps have
    elapsed. Periodically compute and save the value of some observables
    (e.g., temperature, pressure).

6.  Approximate the ensemble average value of some observable
    $Y(\mathbf{r}^N)$ by averaging over states sampled during a period
    of time during which the system is at equilibrium.

Conceptually, the algorithm is fairly straightforward; we will now
explore details of its implementation. We will skip the step about
generating initial velocities and come back to that discussion in the
next lecture; first, we will discuss the core two steps of the MD
algorithm.

## Calculating forces

The most time-consuming, and perhaps most important, aspect of the MD
algorithm is the force calculation. First, recall that we generally have
defined interactions in terms of energies, which was used directly in
the Metropolis Monte Carlo algorithm. We can write the force on each
particle as:

$$\begin{aligned}
\textbf{f}_i &= -\left ( \frac{\partial E(\textbf{r}^N)}{\partial x_i}\right ) \hat{\textbf{x}} -\left ( \frac{\partial E(\textbf{r}^N)}{\partial y_i}\right ) \hat{\textbf{y}} -\left ( \frac{\partial E(\textbf{r}^N)}{\partial z_i}\right ) \hat{\textbf{z}}
\end{aligned}$$

Here, $\textbf{f}_i$ is the force acting on particle $i$,
$E(\textbf{r}^N)$ is the potential energy of the entire system,
$x_i, y_i, z_i$ are the $x/y/z$ positions of particle $i$ (i.e. the
three components of the vector $\textbf{r}_i$), and
$\hat{\textbf{x}}, \hat{\textbf{y}}, \hat{\textbf{z}}$ are unit vectors
in each of the Cartesian directions. The force on each particle is thus
the gradient of the potential energy function, and in general is a
function of all other particle positions which are calculated by summing
pairwise potentials. For example, let's consider the calculation of the
forces on a single particle in a system of $N$-particles that only
interact via pairwise Lennard-Jones potentials. We can then calculate
the force on particle $i$ (which only depends on the interactions of $i$
with other particles, and not on the interactions of other particles
with each other) as:

$$\begin{aligned}
\textbf{f}_i &= -\left ( \frac{\partial E(\textbf{r}^N)}{\partial x_i}\right ) \hat{\textbf{x}} -\left ( \frac{\partial E(\textbf{r}^N)}{\partial y_i}\right ) \hat{\textbf{y}} -\left ( \frac{\partial E(\textbf{r}^N)}{\partial z_i}\right ) \hat{\textbf{z}} \\
&= -\sum_{j\ne i}^N  \left ( \frac{\partial E_{LJ}(r_{ij})}{\partial x_i}\right ) \hat{\textbf{x}} + \left ( \frac{\partial E_{LJ}(r_{ij})}{\partial y_i}\right ) \hat{\textbf{y}} + \left ( \frac{\partial E_{LJ}(r_{ij})}{\partial z_i}\right ) \hat{\textbf{z}}
\end{aligned}$$

Here, $r_{ij} = \sqrt{\textbf{r}_{ij} \cdot \textbf{r}_{ij}}$ is the
scalar distance between particle $i$ and $j$, where $\textbf{r}_{ij}$ is
the vector distance and we compute the scalar distance from the dot
product. Note that calculating the distance is a time-consuming step
since the square root function is computationally expensive. We can also
define components of the distance as $x_j-x_i \equiv x_{ij}$ etc. for
the other axes. Recalling the form of the Lennard-Jones potential, we
can write an expression for the force (arbitrarily in the x-direction)
as:

$$\begin{aligned}
- \left ( \frac{\partial E_{LJ}(r_{ij})}{\partial x_i}\right ) &= -  \left ( \frac{\partial r_{ij}}{\partial x_i}\right )\left ( \frac{\partial E_{LJ}(r_{ij})}{\partial  r_{ij}}\right ) \\
&= -\left ( \frac{\partial [(x_j - x_i)^2 + (y_j - y_i)^2 + (z_j - z_i)^2]^{1/2}}{\partial x_i}\right ) \left ( \frac{\partial E_{LJ}( r_{ij})}{\partial  r_{ij}}\right )  \\
&= -\left (\frac{-(x_j-x_i)}{[(x_j - x_i)^2 + (y_j - y_i)^2 + (z_j - z_i)^2]^{1/2}}\right )\left ( \frac{\partial E_{LJ}( r_{ij})}{ r_{ij}}\right )  \\
&= \left (\frac{ x_{ij}}{ r_{ij}} \right )\left ( \frac{\partial E_{LJ}( r_{ij})}{\partial  r_{ij}}\right ) \\
&= \left (\frac{ x_{ij}}{r_{ij}} \right ) \frac{\partial }{\partial r_{ij}} \left (4\epsilon_{ij} \left [ \left (\frac{\sigma_{ij}}{ r_{ij}}\right )^{12} - \left (\frac{\sigma_{ij}}{ r_{ij}}\right )^6\right ] \right) \\
&= \left (\frac{ x_{ij}}{ r_{ij}} \right) \left (\frac{-48 \epsilon_{ij}}{ r_{ij}} \left [ \left (\frac{\sigma_{ij}}{ r_{ij}}\right )^{12} - \frac{1}{2}\left (\frac{\sigma_{ij}}{ r_{ij}}\right )^6\right ] \right ) \\
&=-\frac{48 \epsilon_{ij}  x_{ij}}{ r_{ij}^2} \left [ \left (\frac{\sigma_{ij}}{ r_{ij}}\right )^{12} - \frac{1}{2}\left (\frac{\sigma_{ij}}{ r_{ij}}\right )^6\right ] \\
\therefore \textbf{f}_i  &= -\sum_{j\ne i} \frac{48 \epsilon_{ij}}{ r_{ij}^2} \left [ \left (\frac{\sigma_{ij}}{ r_{ij}}\right )^{12} - \frac{1}{2}\left (\frac{\sigma_{ij}}{ r_{ij}}\right )^6\right ] \left [  x_{ij} \hat{\textbf{x}} +  y_{ij} \hat{\textbf{y}} +  z_{ij} \hat{\textbf{z}}\right ]
\end{aligned}$$

Substituting in this expression to the equation above gives us a term
that is very similar to the LJ potential (and hence can be calculated
with minimal additional computational expense). The chosen sign
convention is because of how we define the distance in the x-direction;
in Eq. 11.20, if $x_{ij} > 0$, indicating that the x-position of
particle $j$ is more positive than the x-position of particle $i$, then
the magnitude of the force will be *positive* for
$r_{ij} > 2^{1/6} \sigma$ and the sign of the force will correctly point
in the +x-direction, indicating that particle $i$ will experience a
force to move toward particle $j$. This agrees with the expectations of
an attractive potential.

Finally, recall that because we obey Newton's laws of motion, we can
calculate the forces of the entire system by summing over pairs of
particles, calculating the force on one particle due to the other one,
and using Newton's 3rd law to immediately obtain the force on the other
particle in the pair by reversing the sign of the force calculated. This
approach also reduces the number of necessary calculations. Having
defined the force calculations, in the next lecture we will continue
with algorithms to update positions.
