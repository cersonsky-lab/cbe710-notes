# Free energy perturbation and thermodynamic integration

## Additional Readings for the Enthusiast

-   {cite:ts}`frenkel_understanding_2002` Ch. 7.1

## Goals for Today's Lecture
- Determine the free energy difference for two systems with different potential energy functions

## Free energy perturbation

So far, we have defined the potential of mean force as the change in the
free energy of a system during a process in which particle coordinates
follow some predefined reaction coordinate, and hence the overall system
potential energy function is unchanged. Computing the potential of mean
force associated with different regions of phase space is useful for
calculating the magnitude of energy barriers and identifying local
minima. However, we might also ask how to calculate the change in free
energy between two systems with different potential energy functions
entirely. Finding an algorithm to accomplish this would also be useful
in applications other than calculating a PMF along a reaction
coordinate, such as calculating the free energy change associated with
mutating the chemical identities of molecules in a simulation. This leads to

```{glossary}
[free energy perturbation](https://en.wikipedia.org/wiki/Free_energy_perturbation#:~:text=Free%20energy%20perturbation%20(FEP)%20is,Zwanzig%20in%201954.)
    a method to compute the free energy difference between two systems with different
    partition functions
```

For this calculation, we will first define two partition functions,
$Z_0$ and $Z_1$, corresponding to two different systems with potential
energy functions $E_0(\mathbf{r}^N)$ and $E_1(\mathbf{r}^N)$. Note that
while the potential energy functions are different, we assume that the
set of possible values of $\mathbf{r}^N$ are the same (*i.e.*, both
systems access the same phase space).

For example, one could imagine
computing the free energy difference between an ideal gas and a
non-ideal gas with the same number of particles, with the interactions
associated with the non-ideal gas leading to a different potential
energy function. The Helmholtz free energy change for transforming from
system 0 to 1 is then:

$$\begin{aligned}
\Delta F &= F_1 - F_0  \\ 
&= -k_BT \ln Z_1/Z_0 \\
\end{aligned}$$

How do we compute this?

### Determining the probabilities of energy differences between systems

We then define $p_1(\Delta E')$ as the probability distribution for the
energy difference
$\Delta E(\textbf{r}^N) = E_1(\mathbf{r}^N) - E_0(\mathbf{r}^N)$ with
configurations sampled using $E_1$.

In other words, we can imagine
generating a large number of configurations using $E_1$,
calculating the energy of those configurations
according to both $E_1$ and $E_0$, then finding the probability of
identifying a particular energy difference $\Delta E'$. Similarly,
$p_0(\Delta E')$ is the probability density for the same energy
difference with configurations sampled using $E_0$. We then write:

$$\begin{aligned}
p_1(\Delta E') &= \frac{\int d\mathbf{r}^N \exp \left [ -\beta E_1(\mathbf{r}^N) \right ] \delta(\Delta E(\textbf{r}^N) - \Delta E')}{Z_1}  \\
&= \frac{\int d\mathbf{r}^N \exp \left [ -\beta (E_0(\mathbf{r}^N) + \Delta E') \right ] \delta(\Delta E(\textbf{r}^N) - \Delta E')}{Z_1}  \\
&= \frac{\int d\mathbf{r}^N \exp \left [ -\beta E_0(\mathbf{r}^N) \right ] \exp \left [ -\beta \Delta E' \right ] \delta(\Delta E(\textbf{r}^N) - \Delta E')}{Z_1}
\end{aligned}$$

Here, $\Delta E'$ is a fixed value that is not a function of
$\mathbf{r}^N$ and the delta function eliminates all other possible
values of $\Delta E(\textbf{r}^N)$, so in the second line we can define
$E_1(\textbf{r}^N) = E_0(\textbf{r}^N) + \Delta E'$ and in the third
line $\exp \left [ -\beta \Delta E' \right ]$ can be removed from the
integral. We can now multiply the numerator and demoninator by $Z_0$ to
obtain:

$$\begin{aligned}
p_1(\Delta E') &= \exp \left [ -\beta \Delta E' \right ] \frac{\int d\mathbf{r}^N \exp \left [ -\beta E_0(\mathbf{r}^N) \right ]  \delta(\Delta E(\textbf{r}^N) - \Delta E')}{Z_1}   \\
&= \frac{Z_0}{Z_1} \exp \left [ -\beta \Delta E' \right ] \frac{\int d\mathbf{r}^N \exp \left [ -\beta E_0(\mathbf{r}^N) \right ]  \delta(\Delta E(\textbf{r}^N) - \Delta E')}{Z_0}   \\
&= \frac{Z_0}{Z_1} \exp \left [ -\beta \Delta E' \right ] p_0(\Delta E')
\end{aligned}$$

Huzzah! With the term of $\frac{Z_0}{Z_1}$, we have a way to relate this to our free energy difference.

$$\begin{aligned}
\frac{Z_0}{Z_1} & = \frac{p_1(\Delta E')}{ p_0(\Delta E')}\exp \left [\beta \Delta E' \right ]
\end{aligned}
$$

From this equation alone we can see that calculating the two probability
densities from simulations in both ensembles would allow for the
calculation of the free energy change $\Delta F$.

### Computing the free energy difference

We can take the log of both sides to estimate the free energy difference
using $\Delta F = -kT \ln Z_1/Z_0$:

$$\begin{aligned}
\beta\Delta F & = \log p_1(\Delta E') - \log p_0(\Delta E') + \beta \Delta E'
\end{aligned}
$$

For integration purposes, this is easier to write as

$$\begin{aligned}
p_1(\Delta E')&= p_0 (\Delta E') \exp \left [\beta \left ( \Delta F - \Delta E'\right )\right ]
\end{aligned}$$

Finally, we can
integrate both sides over all possible values of $\Delta E'$ to yield a
more concise expression:

```{math}
:label: app_a_fep_eq
\int_{-\infty}^{\infty} d\Delta E' p_1(\Delta E') &= \exp (\beta \Delta F)\int_{-\infty}^{\infty} d\Delta E' p_0(\Delta E') \exp (-\beta \Delta E')\\
1 &= \exp (\beta \Delta F) \langle \exp \left [ - \beta \Delta E \right ] \rangle_0\\
\exp \left [ -\beta \Delta F \right ]  &= \langle \exp \left [ - \beta \Delta E \right ] \rangle_0
```

Here, we integrate the probability distribution for $\Delta E'$ over all
possible energy differences sampled in system 1; since the probability
distributions is normalized, this just equals 1. The value $\Delta F$ is
independent of $\Delta E'$ so it can be removed from the integral on the
right hand side, which then is equal to the ensemble average value of
the exponential of $\Delta E'$, yielding the final expression. Note
again that this ensemble average is sampled using the energy function of
system 0.

The final free energy perturbation expression relates the free energy
change for transforming from system 0 to system 1 to the ensemble
average of the energy change for this transformation for configurations
sampled from $Z_0$. Free energy perturbation can be used directly in
molecular simulations by defining system 0 and 1, generating
configurations according to the potential energy function of system 0,
calculating the energy of the same configuration calculated using both
$E_1$ and $E_0$, then averaging $E_1 - E_0$ to get $\Delta F$ according
to eq. {eq}`app_a_fep_eq`. Note that there are *no* constraints on what
the potential energy functions of system $0$ and $1$ can be, so it is
possible to use this approach to completely change the chemical identify
of molecules during a simulation and measure the corresponding free
energy change. Such transformations are called [alchemical free energy
calculations](http://alchemistry.org/wiki/Main_Page).

Alchemical free energy calculations are often used to compute the free
energy difference between two states that have no clear reaction
coordinate connecting them, and for which only differences in energy
(and not complete free energy pathways) are necessary. A typical example
is in the design of drug inhibitors to bind proteins - free energy
perturbation can be used to calculate the free energy change between a
molecule bound to a receptor and a slightly different molecule bound to
the same receptor to quantify relative binding affinities.
Alternatively, the same technique could be used to calculate the
absolute free energy of binding by defining a difference in free energy
between the bound drug molecule and a drug molecule free in solution.

## Thermodynamic integration

We will discuss one final
method to close our discussion of molecular simulations. The final
technique we will discuss is similar in spirit to free energy
perturbation, in that it involves the calculation of the change in free
energy between two systems with distinct potential energy functions. In
the case of [thermodynamic integration](https://en.wikipedia.org/wiki/Thermodynamic_integration),
we will explicitly define a
linear interpolation between the potential energy functions for the two
systems via a coupling parameter, $\lambda$. We write:

$$\begin{aligned}
E_\lambda(\textbf{r}^N) &= (1-\lambda)E_0(\textbf{r}^N) + \lambda E_1(\textbf{r}^N) \\
&= E_0(\textbf{r}^N) + \lambda[E_1(\textbf{r}^N) - E_0(\textbf{r}^N]
\end{aligned}$$

Here, $E_0(\textbf{r}^N)$ and $E_1(\textbf{r}^N)$ refer to the two
reference states, and the value of $\lambda$ interpolates the system
potential energy function between that of $E_0$ for $\lambda = 0$ and
$E_1$ for $\lambda = 1$. We can now write the derivative of the
Helmholtz free energy with respect to $\lambda$ as follows:

$$\begin{aligned}
\left ( \frac{\partial F(\lambda)}{\partial \lambda}\right ) &=-k_BT \frac{\partial }{\partial \lambda} \ln Z(\lambda) \\
&= -\frac{k_B T}{Z(\lambda)} \frac{\partial Z(\lambda)}{\partial \lambda} \\
&= -\frac{k_BT}{Z(\lambda)} \frac{\partial }{\partial \lambda} \int d\textbf{r}^N \exp \left [ -\beta E_\lambda(\textbf{r}^N) \right ] \\
&= \frac{\int d\textbf{r}^N \left ( \partial E_\lambda(\textbf{r}^N) / \partial \lambda \right ) \exp \left [ -\beta E_\lambda(\textbf{r}^N) \right ] }{Z(\lambda)} \\
&= \left \langle \frac{\partial E_\lambda(\textbf{r}^N)}{\partial \lambda}\right \rangle_\lambda
\end{aligned}$$

This expression shows that we can relate the change in the free energy
of the system with respect to the coupling parameter to an ensemble
average of that derivative sampled from an ensemble at a particular
value of $\lambda$, as indicated by the subscript in the angular
brackets. We can then calculate the complete free energy difference
between system 0 and 1 by:

$$\begin{aligned}
F(\lambda = 1) - F(\lambda = 0) = \int_{\lambda = 0}^{\lambda = 1} \left \langle \frac{\partial E_\lambda(\textbf{r}^N)}{\partial \lambda}\right \rangle_\lambda d\lambda
\end{aligned}$$

This final integral is why the technique is called *thermodynamic
integration*. In practice, this integral is evaluated by choosing
several discrete values of $\lambda$, sampling particle configurations
according to the potential energy function $E_\lambda$, and for each
sampled configuration calculating the energy using
$E_{\lambda \pm d\lambda}$ where $d\lambda$ is some small interval. The
derivative is approximated from a finite difference between these three
values and used to calculate the ensemble average. The integral is then
evaluated by quadrature. This approach does not necessarily require a
linear coupling parameter, although in practice this is a simple method
that is commonly used. It should be noted that the coupling parameter
approach, and the division of the thermodynamic integral into multiple
discrete values of $\lambda$, can also be used with free energy
perturbation to improve convergence.

Given the similarities to free energy perturbation, thermodynamic
integration is often used for similar systems. It has been used
extensively in calculating the phase behavior of self-assembled
mixtures, in part because thermodynamic integration can be used to
calculate the free energy between two phases that differ in their
thermodynamic properties, such as temperature, via appropriate selection
of a coupling parameter (as opposed to biasing their potential
energies).

## [Link to Shared Notes](https://docs.google.com/document/d/1Tsa3jGWZJTySrWt0IZWdYpyh-ILLOko_/edit?usp=drive_link)