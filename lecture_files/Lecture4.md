# Canonical Ensemble Continued

## Additional Readings for the Enthusiast

-   \- Chapter 3.3-3.5

## Topics in this lecture

-   Canonical partition function

-   Thermodynamic connection for canonical ensemble

-   Revisiting the two-state system

-   Grand canonical partition function

## Announcements

-   Problem Set 1 due Thursday

-   Fill out polls for rescheduled lectures

## Derivation of canonical partition function

In the last lecture, we began deriving the equations for the canonical
ensemble, or the ensemble in which every microstate is at the same
number of particles, volume, and temperature ($NVT$). Unlike the
microcanonical ensemble, the energy of each state can vary, and in
addition the probability of finding a given state is not necessarily
equal. We thus sought to derive the probability of observing a single
state in the canonical ensemble, $p_j$, which has energy $E_j$. We also
emphasized that in general many possible microstates could have the same
energy but different microscopic configurations - thus, there is not a
one-to-one correspondence between energies and microstates. We will
eventually consider the probability of observing one of the many states
that have the same energy $E_\nu$ as opposed to the specific microstate
$j$.

To determine $p_j$, we started by defining a system (indicated by
subscripts $S$) in contact with a surrounding bath (indicated by
subscripts $B$). The total combined system (indicated by subscripts $T$)
is isolated. We assume that the energy of the total combined system can
be partitioned between the system and bath ($E_T = E_S + E_B$) where as
the number of particles and volume of both the system and bath are
identical for all microstates of the system. Macroscopically, the
ability of energy to exchange between the system and bath enforces the
thermal equilibrium criterion: $T_S = T_B$.

With this system set up, we now seek to determine $p_j$. First, we
recognize that the total combined system is isolated, so there is a
microcanonical ensemble of microstates of the total combined system and
the probability of each of these states is equal (according to the
principle of equal a priori probabilities, or Postulate 2 from Lecture
2). We also recognize that each microstate of the total combined system
can be subdivided into the energy and set of particle positions
describing the system and the energy and set of particle positions
describing the bath. We now consider placing the system in microstate
$j$ with energy $E_j$. The resulting bath energy will be
$E_B = E_T-E_j$, but there are in principle many possible bath
microstates that have this energy. Since $E_B$ is fixed by fixing the
energy $E_j$, there is thus a microcanonical ensemble of bath
microstates for which the system is in state $E_j$. Since $p_j$ is equal
to the number of total microstates for which the system is in microstate
$j$, we can thus say that $p_j$ is proportional to the degeneracy of the
microcanonical ensemble for which $E_B= E_T-E_j$.

![image](figs/fig_3_3.png){width="100%"}

From the logic above, we can write the normalized probability of finding
microstate $j$ of the system in terms of the degeneracy of the bath as:

$$\begin{aligned}
p_j &= \frac{\Omega(N_B, V_B, E_T-E_j)}{\sum_j^{\textrm{system microstates}} \Omega(N_B, V_B, E_T-E_j)} \\
&= \frac{\Omega(N_B, V_B, E_T-E_j)}{C_1}
\end{aligned}$$

That is, the probability of finding a particular microstate in the
**canonical ensemble** (of the system) is related to the degeneracy of a
bath described by a **microcanonical ensemble** with energy $E_T-E_j$.
We use the constant $C_1$ to refer to the normalization factor in the
denominator (this quantity will drop out later on in the derivation)

Our goal now is to find an expression for $p_j$ that does not depend on
properties of the bath or total combined system, since in general we
only know the properties of the system itself. To begin, we write the
logarithm of $p_j$, recognizing that $\ln \Omega(N_B, V_B, E_T-E_j)$ is
related to the Boltzmann entropy of the bath:

$$\ln p_j = \ln  \Omega(N_B, V_B, E_T-E_j) - \ln C_1$$

By construction, the energy of the bath and the energy of the total
combined system is much greater than the energy of the system of
interest ($E_T \gg E_j$). We can then write a Taylor expansion for
$\ln \Omega(N_B, V_B, E_T-E_j)$ around the point $E_T-E_j \approx E_T$.
Recall that the expression for a Taylor expansion is:

$$\begin{aligned}
f(x) &= f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 \dots 
\end{aligned}$$

For our expansion, $x = E_T-E_j$, $a = E_T$, and $x-a = -E_j$. For these
next few lines, I will use the notation
$\Omega_B(E) \equiv \Omega(N_B, V_B, E)$ to simplify the notation. The
Taylor expansion is then:

$$\begin{aligned}
\ln  \Omega_B(E_T-E_j) &\approx \ln \Omega_B(E_T) - E_j \left [\frac{\partial  \ln \Omega_B(E_T-E_j)}{\partial (E_T-E_j)} \right ]_{N_B, V_B} + \dots
\end{aligned}$$

We now substitute in the expression for the Boltzmann entropy of the
bath microcanonical ensemble,
$S_B(E_T - E_j) = k_B \ln \Omega_B(E_T - E_j)$:

$$\begin{aligned}
\ln  \Omega_B(E_T-E_j) &\approx \ln \Omega_B(E_T) - \frac{E_j}{k_B} \left [ \frac{\partial  S_B(E_T-E_j)}{\partial (E_T-E_j)} \right ]_{N_B, V_B} + \dots
\end{aligned}$$

Next, we recognize that
$\left ( \frac{\partial S_B(E_T-E_j)}{\partial (E_T-E_j)}\right )_{N_B, V_B} = \frac{1}{T_B}$
using the same thermodynamic relation from last lecture, and moreover
$1/T_B = 1/T_S$ due to the equilibrium between the system and bath:

$$\begin{aligned}
\ln  \Omega_B(E_T-E_j) &\approx \ln \Omega_B(E_T) - \frac{E_j}{k_B T_B} + \dots \\
&= \ln \Omega_B(E_T) - \frac{E_j}{k_B T_S} + \dots
\end{aligned}$$

Here, we have ignored higher order terms; the next highest order term
would be of the form:

$$\begin{aligned}
\left ( \frac{\partial^2  S_B}{\partial E_B^2} \right ) &=  \left ( \frac{\partial (1/T_B)}{\partial E_B} \right ) \propto \frac{1}{C_V}
\end{aligned}$$

Thus, the second order term is related to the inverse of the heat
capacity of the bath; we can assume that this value is negligible if the
bath is large (i.e., the temperature of the bath is a constant). This is
an assumption about the bath/combined system only, and thus is not
violated even if our system of interest is small!

We can now use this Taylor expansion, truncated at first order, to write
a new expression for the probability of obtaining a system in microstate
$j$:

$$\begin{aligned}
\ln p_j  &= \ln \Omega_B(E_T) - \frac{E_j}{k_B T_S} - \ln C_1 \\
p_j &= \frac{\Omega_B(E_T)}{C_1} e^{-E_j/k_BT_S} \\
\therefore p_j &= C_2 e^{-E_j/k_BT_S} 
\end{aligned}$$

Here, $C_2$ is a constant the combines the degeneracy of the bath for
some given energy, $\Omega_B(E_T)$, with the normalization constant
$C_1$. The value $C_2$ is equivalent for all microstates because it is a
property of our combined system, including the fictitious bath. We can
now identify an expression for $C_2$ by requiring that $\sum_j p_j = 1$
to normalize the probability distribution:

$$\begin{aligned}
\sum_j^{\textrm{microstates}} p_j &= \sum_j^{\textrm{microstates}} C_2 e^{-E_j/k_BT_S} = C_2 \sum_j^{\textrm{microstates}}  e^{-E_j/k_BT_S} = 1 \\
C_2 &= \frac{1}{\sum_j e^{-E_j/k_BT_S}}\\
\therefore &\boxed{ p_j = \frac{e^{-E_j/k_BT_S}}{\sum_j e^{-E_j/k_BT_S}}}
\end{aligned}$$

The term $\sum_j e^{-E_j/k_BT_S}$, which normalizes the probability of
finding state $j$, is called the **canonical partition function**, which
we denote by $Z$. At this point no parameters related to the bath or
total combined system remain in the expression for $p_j$ - the
probability of identifying a microstate in the canonical ensemble is
related entirely to the system properties without any contribution from
the bath as desired. We will henceforth drop all $S$ subscripts from
system properties since $N$, $V$, and $T$ are no longer ambiguous. The
partition function is then:

$$\begin{aligned}
Z &= \sum_j^{\textrm{all states}} e^{-E_j /k_B T} \\
p_j &= \frac{e^{-E_j/k_BT}}{Z}
\end{aligned}$$

The weighting term for each state, $e^{-E_j/k_BT}$, is referred to as
the **Boltzmann factor** or the **Boltzmann weight** of each state. The
factor $k_B T$ is essentially a scaling factor and is the amount of
thermal energy accessible to the system. This expression shows that the
probability that a system samples a particular microstate is related to
the relative values of $E_j$ and $k_B T$. Note that probabilities are
exponentially weighted - hence states with low (negative) energies are
exponentially more probable than high energy states. If the energy of a
state is much larger than $k_B T$, the probability of observing that
state is very low. Conversely, if the temperature of a system is very
high, the probability of any given state becomes approximately equal
since variations in $E_j$ between states will be negligible relative to
the value of $k_BT$. Often, we will also define $\beta \equiv 1/k_B T$
to simplify notation.

So far, we have focused on the energy of a particular microstate,
referring to a particular set of particle configurations and energies.
We can also write the probability $p_\nu$ of obtaining **any**
microstate of the system of interest that has an energy $E_\nu$. In
general, there are many possible microstates that have the same energy,
but have different particle configurations. The number of such states is
given by the microcanonical degeneracy $\Omega(N_S, V_S, E_\nu)$, so
$p_\nu \gg p_j$. $p_\nu$ is equal to the probability that the system of
interest is in a particular microstate with energy $E_j$ (where the
value of $E_j = E_\nu$) multiplied by the number of possible microstates
of the system for which $E_j = E_\nu$. This gives (again, dropping all
subscripts now):

$$\begin{aligned}
p_\nu &= \Omega(N,V, E_\nu) p_j \\
&= \frac{\Omega(N, V, E_\nu) e^{-\beta E_\nu}}{\sum_\nu^\textrm{energies} \Omega(N, V, E_\nu)   e^{-\beta E_\nu}} \label{canonical_probability}
\end{aligned}$$

Here, the denominator is again obtained by normalizing the expression in
the numerator. Since the sums in the denominators of the expressions for
both $p_j$ and $p_\nu$ run over all *possible* states, both are
equivalent. Thus, we can write the partition function of the system as:

$$Z = \sum_j^{\text{microstates}} e^{-\beta E_j} = \sum_\nu^{\text{energies}} \Omega(N, V, E_\nu)  e^{-\beta E_\nu} \label{canonical_probability2}$$

where again the first form has a sum that runs over all individual
microstates (indicated by the subscript $j$) while the second form has a
sum that runs over all possible energy levels (indicated by the
subscript $\nu$) and includes the degeneracy associated with each energy
level. The partition function is a constant which normalizes the
probabilities, and since it enumerates all **possible** microstates of
the system (each weighted by a corresponding Boltzmann factor), the
value of the partition function is the same regardless of whether we sum
over microstates or over energy levels. We will next connect the
partition function to macroscopic thermodynamic parameters.

## Connecting the canonical ensemble to thermodynamics

Just as we can use the relation $S = k_B \ln \Omega(N, V, E)$ to derive
relationships between the degeneracy in the microcanonical ensemble and
various thermodynamic variables through the entropy, we can relate the
canonical partition function to the Helmholtz free energy using the
relation:

$$\begin{aligned}
F &= -k_B T \ln Z (N, V, T)
\end{aligned}$$

We will show this by first deriving an expression for the
ensemble-average energy of the canonical ensemble using the expression
for the partition function. We will then show that invoking the relation
$F=-k_BT \ln Z$ allows us to equate the ensemble-average energy to the
thermodynamic relationship between the internal energy and the Helmholtz
free energy. First, we can write an expression for the ensemble-average
energy of the canonical ensemble:

$$\begin{aligned}
\langle E \rangle &= \sum_j^\text{states} p_j E_j \\
&= \sum \left ( \frac{e^{-\beta E_j}}{Z} \right ) E_j \\
&= \frac{1}{Z} \sum_j E_j e^{-\beta E_j} 
\end{aligned}$$

Here, we have used the expression for the probability of finding a
particular microstate in the canonical ensemble,
$p_j \equiv e^{-\beta E_j}/Z$. We proceed by recognizing that the
derivative of $e^{-\beta E_j}$ with respect to $\beta$ is
$-E_je^{-\beta E_j}$, allowing us to write:

$$\begin{aligned}
\langle E \rangle &= \frac{1}{Z} \sum_j - \frac{\partial}{\partial \beta}  \left (e^{-\beta E_j} \right)_{N,V} \\
&= -\frac{1}{Z} \frac{\partial}{\partial \beta}  \left (\sum_j e^{-\beta E_j}\right )_{N,V} \label{distributive_de} \\
&= - \frac{1}{Z} \left ( \frac{\partial Z}{\partial \beta}\right )_{N,V} \\
&= - \left(\frac{\partial \ln Z}{\partial \beta} \right )_{N,V} 
\end{aligned}$$

Note that we have used a few tricks to get this last result -
specifically, we note that a sum of derivatives is equivalent to the
derivative of a sum
($\sum \frac{\partial X_j}{\partial Y} = \frac{\partial}{\partial Y}\sum X_j$)
and this sum is equivalent to the partition function, then we use the
chain rule to arrive at the final result, which expresses the
ensemble-average energy in terms of a temperature deriative of the
partition function (since $\beta = 1/k_B T$, a derivative with respect
to $\beta$ is equivalent to a derivative with respect to inverse
temperature).

So far we have assumed no connection to thermodynamics at all. We now
show that deriving an equivalent expression for the internal energy in
terms of a temperature derivative of the Helmholtz free energy allows us
to relate the Helmholtz free energy to the partition function. Let us
now consider the thermodynamic relationship between the Helmholtz free
energy and internal energy from two lectures ago:

$$\begin{aligned}
F = E -TS
\end{aligned}$$

We can also write the total derivative of the Helmholtz free energy (and
substitute in the fundamental relation for $dE$) to obtain a
relationship for the entropy to eliminate it from the expression above:

$$\begin{aligned}
dF &= dE - TdS - SdT \\
dE &= TdS - PdV + \mu dN \\
dF &= -S dT - PdV + \mu dN \\\label{dF}
&= \left ( \frac{\partial F}{\partial T} \right )_{N,V} dT + \left ( \frac{\partial F}{\partial V} \right )_{N, T} dV + \left ( \frac{\partial F}{\partial N} \right )_{V, T} dN 
\end{aligned}$$

This expression then yields:

$$\begin{aligned}
S &= -\left ( \frac{\partial F}{\partial T}\right )_{N,V} \\
\therefore E &= F - T \left ( \frac{\partial F}{\partial T}\right )_{N,V}
\end{aligned}$$

Letting $T = k_B/\beta$ we can write:

$$\begin{aligned}
E &= F - \frac{k_B}{\beta} \left ( \frac{\partial F}{\partial (k_B/\beta)}\right )_{N,V} \\
%&= F - \frac{1}{\beta} \left ( \frac{\partial F}{\partial \beta}\right )_{N,V} \left ( \frac{\partial %\beta}{\partial \beta^{-1}}\right )_{N,V} \\
&= F + \beta \left ( \frac{\partial F}{\partial \beta}\right )_{N,V} 
\end{aligned}$$

We now have the two following expressions, one derived from the
canonical ensemble and one from thermodynamics:

$$\begin{aligned}
\langle E \rangle &= - \left(\frac{\partial \ln Z}{\partial \beta} \right )_{N,V} \quad \text{stat. mech} \\
E &= F + \beta \left ( \frac{\partial F}{\partial \beta}\right )_{N,V}  \quad \text{thermo}
\end{aligned}$$

From ergodicity, we also know that $\langle E \rangle = E$, meaning that
the ensemble-average value of $E$ calculated from statistical mechanics
is equivalent to the thermodynamic definition. We could equate these
expressions to find an expression for $F$. Doing so would lead to:

$$\begin{aligned}
F &= -k_B T \ln Z = -(1/\beta) \ln Z
\end{aligned}$$

We can confirm this relationship by substituting it into the first
expression to check for consistency:

$$\begin{aligned}
\langle E \rangle &= \left(\frac{\partial (\beta F)}{\partial \beta} \right )_{N,V}  \\ 
&= F + \beta \left ( \frac{\partial F}{\partial \beta}\right )_{N,V} \\
&= E \quad \text{ from thermo}
\end{aligned}$$

Therefore, substituting in our putative link between the partition
function and the Helmholtz free energy correctly derives the same
expression obtained from thermodynamics alone (given the equivalence
between ensemble-average energy and macroscopic energy according to
Postulate 1). This confirms the relationship between the Helmholtz free
energy and the canonical partition function. To summarize, our three
critical relationships for the canonical ensemble are then:

$$\begin{aligned}
Z &= \sum_j^{\text{microstates}} e^{-\beta E_j} = \sum_\nu^{\text{energies}} \Omega(N,V,E_\nu) e^{-\beta E_\nu}\\
p_j &= \frac{e^{-\beta E_j}}{Z} \\
F &= -k_B T \ln Z(N,V,T)
\end{aligned}$$

## Revisiting the two-state system

To illustrate how a judicious choice of statistical ensemble can
simplify the analysis of systems, we will repeat the example from
Lecture 2 using the canonical ensemble, instead of the microcanonical
ensemble. Recall that the system under consideration is a polymer
adsorbed to a surface with $N$ total monomers in the chain, of which $n$
are adsorbed to the surface with an energy $-\epsilon$. The total energy
of the system is then $E = -n \epsilon$ and we seek to relate the number
of adsorbed monomers to the temperature. Previously, we solved this
problem using the microcanonical ensemble by first solving for the
relationship between the entropy, $S$, and the number of adsorbed
monomers, then identifying a temperature dependence via derivative of
the entropy. If we instead treat the system using the canonical ensemble
by assuming that the energy of the system is allowed to vary (i.e., the
number of adsorbed monomers varies) and only the temperature is held
fixed, we can directly relate temperature to energy. We will solve this
problem in two ways.

In our first approach, we recognize that all monomers adsorb
independently of each other, so the number of adsorbed monomers in a
given microstate of the canonical ensemble is $n_i = N \rho$, where
$\rho$ is the probability that a single monomer adsorbs (this is
equivalent to the ensemble average of $n$ if $N=1$). Since the monomers
are independent, the probability that one monomer adsorbs does not
affect the probability that another monomer adsorbs. Therefore, we can
instead consider a single monomer as a system, in which case the
canonical ensemble for a single monomer has only two microstates: either
adsorbed or not adsorbed. For a single monomer we can write that the
probability of adsorbing in the canonical ensemble is:

$$\begin{aligned}
\rho &= \frac{e^{-\beta E_\textrm{adsorb}}}{\sum_j^\text{microstates} e^{-\beta E_j}} \\
&= \frac{e^{\beta \epsilon}}{e^{-\beta(0)} + e^{\beta(\epsilon)} }  \\
&= \frac{e^{\beta \epsilon}}{1 + e^{\beta\epsilon}} 
\end{aligned}$$

Here, we have explicitly enumerated both states in the partition
function. The ensemble-average number of adsorbed monomers is then:

$$\begin{aligned}
\langle n \rangle &= N \rho \\
&= \frac{ N  e^{\beta \epsilon}}{1 + e^{\beta\epsilon}} \\
&= \frac{N}{1 + e^{-\beta\epsilon}}
\end{aligned}$$

This result is the same expression that was derived using the
microcanonical ensemble and is obtained much more easily. Note the key
steps: we assume that the monomers are independent, we calculate the
probability of adsorbing for each monomer, then multiply this
probability by the number of monomers. This assumption of independent
treatment of a set of identical systems will be discussed further in
future lectures.

We can also obtain this result directly from the canonical partition
function. Here we will use $z$ to represent the partition function for
adsorbing a single monomer (with two terms as above) and let
$\langle \epsilon \rangle$ be the ensemble-average energy per monomer.
The ensemble-average number of adsorbed monomers is then
$\langle n \rangle = -N \langle \epsilon \rangle / \epsilon$. Using a
relation from above we can then write:

$$\begin{aligned}
\langle \epsilon \rangle &=  -\left(\frac{\partial \ln z}{\partial \beta} \right )_{N,V}  \\ 
&= -\left ( \frac{\partial \ln (1 + e^{\beta\epsilon})}{\partial \beta} \right )_{N, V} \\
&= -\frac{\epsilon e^{\beta \epsilon}}{1+e^{\beta \epsilon}} \\
 \langle n \rangle &= -N \langle \epsilon \rangle / \epsilon \\
&= \frac{N }{1 + e^{-\beta \epsilon}} \label{eq:3.37}
\end{aligned}$$

This approach again returns the same result.