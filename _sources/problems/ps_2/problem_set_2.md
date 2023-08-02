# Problem Set 2 (Due XX/XX/XX)

## Question 1: Expressions for entropy

The Boltzmann entropy for the microcanonical ensemble is:

$$S(N,V,E) = k_B \ln \Omega(N,V,E)$$

where $\Omega(N,V,E)$ is the degeneracy (or number of unique
microstates) in the microcanonical ensemble. An alternative, general
definition of the entropy, referred to as the Gibbs entropy, is:

$$S = - k_B\sum_i p_i \ln p_i$$

where $p_i$ is the probability of microstate $i$ and the sum runs over
all microstates.

**(a)** Show that the Boltzmann and Gibbs entropy are equivalent for the
microcanonical ensemble.

Recall that according to the second postulate of statistical mechanics,
all microstates in the microcanonical ensemble are equally probable.
Therefore, the probability of each $p_i$ is equal and given by
$\frac{1}{\Omega(N,V,E)}$:

$$\begin{aligned}
S &= -k_B\sum_i p_i \ln p_i \\
&= -k_B\sum_i \frac{1}{\Omega(N,V,E)} \ln \frac{1}{\Omega(N,V,E)} \\
&= k_B \sum_i \frac{1}{\Omega(N,V,E)} \ln \Omega(N,V,E) \\
&=  k_B \ln \Omega(N,V,E)
\end{aligned}$$

The last relation is apparent because the sum runs over all
$\Omega(N,V,E)$ states in the microcanonical ensemble, so the
denominator drops out of the expression.

**(b)** Starting from an appropriate partial derivative of the Helmholtz
free energy, derive an expression for the entropy in terms of the
canonical partition function and the temperature.

Recognizing that the canonical partition function is related to the
Helmholtz free energy, we can start by writing an appropriate derivative
to relate the Helmholtz free energy to the entropy:

$$\begin{aligned}
dF &= -S dT - PdV + \mu_dN \\
S &= -\left ( \frac{\partial F}{\partial T} \right )_{N,V} \\
&= \left ( \frac{\partial \beta^{-1} \ln Z}{\partial T} \right )_{N,V} \\
&= \left ( \frac{\partial \beta^{-1} \ln Z}{\partial \beta} \right )_{N,V} \left ( \frac{\partial \beta }{\partial T} \right )_{N,V} \\
&= -k_B\beta^{2} \left [\beta^{-1} \left ( \frac{\partial \ln Z}{\partial \beta} \right )_{N,V} - \beta^{-2} \ln Z \right ]\\
&= -k_B\beta \left ( \frac{\partial \ln Z}{\partial \beta} \right )_{N,V} + k_B \ln Z
\end{aligned}$$

This is a straightforward expression for the entropy in terms of a
derivative of the partition function with respect to $\beta$. We can
also write this as a derivative with respect to $T$:

$$\begin{aligned}
S &= -k_B \beta \left ( \frac{\partial \ln Z}{\partial \beta} \right )_{N,V} + k_B \ln Z \\
&= k_B T\left ( \frac{\partial \ln Z}{\partial T} \right )_{N,V} + k_B \ln Z 
\end{aligned}$$

Either expression is reasonable and puts the entropy only in terms of
the canonical partition function.

**(c)** Show that the expression derived in part **b** reduces to the
Boltzmann entropy if the canonical ensemble is dominated by a single
energy level (i.e., the contributions of all other energy levels to the
partition function are negligible).

Let us assume that the energy of the system is nearly constant with a
value $E$. The partition function then reduces to:

$$\begin{aligned}
Z &= \sum_{\nu}^{\text{energies}} \Omega(E_\nu) e^{-\beta E_\nu} \\
&\approx \Omega(E) e^{-\beta E}
\end{aligned}$$

In other words, at constant energy the sum reduces to a single term that
has a prefactor of the degeneracy. We can now substitute this expression
for $Z$ directly into the formula for the entropy:

$$\begin{aligned}
S &=  -k_B\beta \left ( \frac{\partial \ln Z}{\partial \beta} \right )_{N,V} + k_B \ln Z \\
&= - k_B \beta \left ( -E\right ) + k_B \ln \Omega(E) - k_B \beta E\\
&= k_B \ln \Omega(E)
\end{aligned}$$

We regain the expression for the Boltzmann entropy and show that our
ensembles are consistent.

**(d)** Calculate the Gibbs entropy of the canonical ensemble, and show
that this expression for the entropy leads to the correct thermodynamic
expression for the Helmholtz free energy ($F=E-TS$).

We again use the expression for the Gibbs entropy explicitly, this time
setting $p_i$ to the appropriate Boltzmann factor:

$$\begin{aligned}
    S &= -k_B\sum_i p_i \ln p_i \\ 
    &= -k_B \sum_i p_i \ln \frac{e^{-E_i / k_B T}}{Z} \\
    &= -k_B \sum_i p_i  \left ( -\frac{E_i}{k_BT} - \ln Z\right ) \\
    &= k_B \sum_i p_i \left ( \frac{E_i}{k_B T} \right )  + k_B  \sum_i p_i \ln Z \\
    &= \frac{1}{T} \sum_i p_i E_i  + k_B \ln Z \sum_i p_i   \\
    &= \frac{\langle E \rangle}{T} + k_B \ln Z \\
    &= \frac{ E }{T} - \frac{F}{T} \\
    \therefore F &=  E  - TS
    
\end{aligned}$$

We regain the expected definition of the Helmholtz free energy that we
derived in lecture, and we see that we obtain the same expression for
the entropy as in part b.

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

<figure>
<img src="pset_2_pulling_polymer_fig.png" />
<figcaption>Keratin protein with a series of units of lengths <span
class="math inline"><em>a</em></span> or <span
class="math inline"><em>b</em></span> under an applied tension <span
class="math inline"><em>τ</em></span>. The total length of the protein
is <span class="math inline"><em>L</em></span>.</figcaption>
</figure>

Hint: for a system of $N$ distinguishable, independent subsystems for
which the energy of the combined system, $E$, is equal to the sum of the
energies of the subsystems, $E = \sum_i \epsilon_i$, the partition
function of the combined system, $Z$, is related to the partition
function of each subsystem, $z$, by:

$$Z = z^N$$

This relationship is true of any generalized partition function $\Phi$,
as well as the canonical partition function, $Z$.

**(a)** Using the first law of thermodynamics, write a thermodynamic
potential with natural variables of $N, V, T$ and $\tau$ and express its
differential in terms of $T$ and $\tau$.

This question is asking us to apply our recipe for constructing a
generalized ensemble. We first recognize that the natural variables of
the system, which are held constant, are $N$, $V$, $T$, and $\tau$. The
tensile force adds an additional work term of $\tau dL$ to the energy of
the system. From the first law, we can write for the change in energy:

$$\begin{aligned}
    dE = TdS - P dV  + \tau dL
    
\end{aligned}$$

We will define $B(N,V,T, \tau)$ as the thermodynamic potential that is
minimized at equilibrium in this system. We can then write for $B$:

$$\begin{aligned}
    B &= E - TS - \tau L \\
    dB &= dE - TdS - SdT - \tau dL - L d\tau \\
    dB &= TdS - PdV + \tau dL - TdS - SdT - \tau dL - Ld\tau \\
    &= - PdV - SdT - L d\tau
    
\end{aligned}$$

We thus have a differential form of $dB$ that is minimized at constant
$V, T, \tau$ and $N$.

**(b)** Derive an expression for a generalized partition function with
fixed thermodynamic parameters that correspond to the natural variables
of the potential derived in part **a**. Your result should be in terms
of $\epsilon_a$, $\epsilon_b$, $a$, $b$, $\tau$, and $N$.

Since each unit of the molecule is independent and the different units
are distinguishable, we can use the hint to factorize the partition
function and write:

$$\begin{aligned}
    \Phi &= \phi^N
    
\end{aligned}$$

Here, $\phi$ is the single-unit partition function, which we see is a
two-state model with one state characterized by energy $\epsilon_a$ and
length $a$ and the other state characterized by energy $\epsilon_b$ and
length $b$. We can use a generalized partition function, where
$-f = \tau$ and $X_j = L_j = a \text{ or } b$ to write:

$$\begin{aligned}
    \Phi &= \phi^N \\
    \phi &=  \sum_{s=\{a,b\}} e^{-\beta E_{s}}e^{\beta \tau L_s} \\
    &= e^{-\beta \epsilon_a} e^{\beta\tau a} + e^{-\beta\epsilon_b}e^{\beta \tau b} \\
    \therefore \Phi &= \left (e^{-\beta \epsilon_a} e^{\beta\tau a} + e^{-\beta\epsilon_b}e^{\beta\tau b}\right )^N
    
\end{aligned}$$

**(c)** Calculate the average length, $\langle L \rangle$, of the
molecule as a function of the applied tension, $\tau$.

From the differential form of the thermodynamic potential corresponding
to this system, we can write $L$ as:

$$\begin{aligned}
    \langle L \rangle = L = -\left ( \frac{\partial B}{\partial \tau}\right )_{V, T}
    
\end{aligned}$$

Using the relation $B = -k_B T \ln \Phi$:

$$\begin{aligned}
    \langle L \rangle &= k_B T\left ( \frac{\partial \ln \Phi}{\partial \tau}\right )_{V, T} \\
    &= \frac{Nk_B T}{\phi} \left ( \frac{\partial \phi}{\partial \tau} \right )_{V,T} \\
    &= \frac{N k_B T}{e^{-\beta (\epsilon_a - \tau a)} + e^{-\beta (\epsilon_b - \tau b)}}\left( \beta a e^{-\beta(\epsilon_a - \tau a)} + \beta b e^{-\beta(\epsilon_b - \tau b)}\right) \\
    &= N \frac{a e^{-\beta(\epsilon_a - \tau a)} + b e^{-\beta(\epsilon_b - \tau b)}}{e^{-\beta (\epsilon_a - \tau a)} + e^{-\beta (\epsilon_b - \tau b)} }
    
\end{aligned}$$

## Question 3: Magnetization of a paramagnet revisited

In Problem Set 1, we used the microcanonical ensemble to show that the
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

Derive the magnetization of the system using the canonical ensemble.

The system of interest is $N$ distinguishing, non-interacting (i.e.
independent) spins, each interacting with the magnetic field and
contributing an energy $\epsilon_i = -s_i \mu H$. We can take advantage
of the hint in Problem 3 to write a partition function for this system,
$Z$, as:

$$Z = z^N$$

where $z$ is the single-spin partition function. Since each spin can
only be in one of two states, $s_i = \pm 1$, the energy $\epsilon_i$ can
only obtain values of $\pm \mu H$. The single spin partition function is
then:

$$\begin{aligned}
    z &= \sum_i e^{-\beta \epsilon_i} \\
    &= e^{\beta \mu H} + e^{-\beta \mu H} \\
    &= 2 \cosh(\beta \mu H)
    
\end{aligned}$$

Therefore, the system partition function, $Z$, is equal to:

$$Z = z^N = \left [2 \cosh(\beta \mu H)\right] ^N$$

From the canonical partition function, we can get the energy:

$$\begin{aligned}
    \langle E \rangle = E &= -\left (  \frac{\partial \ln Z}{\partial \beta} \right )_{N, V} \\
    &= - \frac{\partial}{\partial \beta}  \left ( N \ln \left [ \exp \left (\beta \mu H \right ) + \exp \left (-\beta \mu H \right ) \right ] \right ) \\
    &= -N\mu H \left [\frac{\exp \left (\beta \mu H \right ) - \exp \left (-\beta \mu H \right )}{ \exp \left (\beta \mu H \right ) + \exp \left (-\beta \mu H \right )} \right ]\\
    &= -N \mu H \tanh(\beta \mu H)
    
\end{aligned}$$

The magnetization is then simply related to the energy by:

$$\begin{aligned}
    \langle M \rangle &= -\frac{1}{H} \langle E \rangle \\
    &= N \mu \tanh(\beta \mu H)
    
\end{aligned}$$

This approach generates the result from Problem Set 1 with much less
difficulty!

## Question 4: Numerical calculation of the magnetization of a--
paramagnet**

As an alternative to the analytical derivation of the magnetization of a
paramagnet, the **Metropolis Monte Carlo** algorithm can be used to
calculate the ensemble-average magnetization. We will derive this
algorithm in Lecture 10; in this question, you will apply the algorithm
to compare to the analytical result in ##Question 3.--

Consider a system of $N=100$ distinguishable, non-interacting spins in a
magnetic field $H$ at constant temperature. Each spin is fixed to a
lattice position such that the relative positions of spins cannot
interchange. The system can assume a set of configurations in which each
spin is either parallel to the field or antiparallel to the field, with
the energy of each configuration defined in ##Question 3. The Metropolis--
Monte Carlo algorithm for calculating the ensemble-average magnetization
consists of the following steps:

1.  Initialize the system in a random configuration.

2.  Randomly generate a new configuration, in which at least 1 spin has
    switched orientation.

3.  Calculate the energy of the new configuration, $E_{\textrm{new}}$,
    and old configuration, $E_{\textrm{old}}$.

4.  Calculate the probability of accepting the trial configuration,
    $\alpha$, using the following equation:
    $\alpha = \text{min} \left ( 1, \exp \left \{ -\beta \left [ E_{\textrm{new}} - E_{\textrm{old}} \right ] \right \} \right )$,
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

**(a)** Write a Python program that computes $\langle M \rangle$ for the
paramagnetic spin lattice described in ##Question 3 using the Metropolis--
Monte Carlo algorithm described above. Attach a copy of your code with
appropriate comments explaining your implementation.

**(b)** Perform independent Monte Carlo simulations for field strengths
of $\mu H =$ -3.0 $k_BT$ to $\mu H =$ 3.0 $k_B T$ in increments of 0.5
$k_B T$. Each simulation should include 100,000 Monte Carlo trials to
obtain accurate approximations of $\langle M \rangle$. Plot
$\langle M \rangle$ vs. $\mu H$ and compare to the analytical result
from ##Question 3.--

The Python code for part **a** and **b** is included on the Canvas
website. The plots below show the number of MC iterations necessary to
obtain converged values of the ensemble-average magnetization and the
comparison between the ensemble-average mangetization and the analytical
result from ##Question 3.--

![Convergence of ensemble-average
magnetization.](pset_2_Magnetization_convergence.png){width="70%"}

![Comparison of the ensemble-average magnetization obtained from the
Monte Carlo method to the analytical solution. Points indicate the model
calculations and the line indicates the analytical
solution.](pset_2_Magnetization_H.png){width="70%"}
