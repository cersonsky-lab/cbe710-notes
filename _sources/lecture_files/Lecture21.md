# Conditions of equilibrium

## Recommended textbooks

Tester and Modell, Ch. 5.3, 5.5, 6.2-6.4, Appendix A, Appendix C

## Topics in this lecture

-   Behavior of thermodynamic potentials at equilibrium

-   Partial derivative relationships

-   Euler's theorem

## Announcements

-   Problem Set 4 due today, Problem Set 5 assigned and due next
    Tuesday.

## Behavior of new thermodynamic potentials at equilibrium

In the last lecture, we introduced the Legendre transform which
expresses a function in terms of its tangent lines and their intercepts.
The Legendre transform of a function in which $k$ variables are
transformed is:

$$y^{(k)} = y^{(0)} - \sum_i^k q_i x_i \label{legendre_transform}$$

Here, $q_i$ is a first-order partial derivative of $y^{(0)}$ and $x_i$
is its conjugate independent variable. We used Legendre transforms of
the Fundamental Relation to derive expressions for new thermodynamic
potentials (free energies) that are a function of experimentally
accessible independent variables. For example, the Gibbs free energy is
the second Legendre transform of the Fundamental Relation in the energy
representation for which the independent variables $\underline{S}$ and
$\underline{V}$ are replaced by the conjugate variables $T$ and $-P$,
which are the slopes of tangent lines to the surface specified by the
Fundamental Relation. We wrote:

$$\begin{aligned}
y^{(0)} &= \underline{U} = f_U(x_1, x_2, x_3, x_4, \dots) \\
&= f_U(\underline{S}, \underline{V}, N_1, N_2, \dots) \\
y^{(2)} &= y^{(0)} - \sum_i^2 q_i x_i \\
&= \underline{U} - T\underline{S} + P\underline{V} \\
&\equiv \underline{G}
\end{aligned}$$

This manipulation is useful in part because it allows us to define new
behavior of these potentials at equilibrium under conditions where the
independent variables are constant. We refer to the independent
variables of a thermodynamic potential as **natural variables**.
Therefore, the natural variables of $\underline{U}$ are
$\underline{S}, \underline{V}, N_1, N_2,\dots$, the natural variables of
$\underline{G}$ are $T, P, N_1, N_2,\dots$, etc. Previously, we showed
that for a system with $\underline{U}, \underline{V}, N$ as natural
variables, the entropy is at a maximum, while for a system with
$\underline{S}, \underline{V}, N$ as natural variables, the energy is at
a minimum. Now we ask what the criterion of equilibrium is for
transformed systems with different natural variables.

Let us consider a system that is connected to two reservoirs: a thermal
reservoir, denoted by $R_T$, and a work reservoir, denoted by $R_P$.
Connecting the system to the thermal reservoir allows it to be held at
constant temperature, since heat will exchange to maintain constant
system temperature that is equal to the temperature of the thermal
reservoir when the system is at equilibrium (from Postulate 2 and
Postulate 4). Connecting the system to the work reservoir allows it to
be held at constant pressure since the system will exchange volume with
the work reservoir to maintain a constant pressure when the system is at
equilibrium (we have not yet proven that this occurs, but will do so in
two lectures). We assume that the connection to each reservoir is
controllable (i.e. interactions can be turned on or off), the thermal
reservoir is held at constant $\underline{V}$ and $N$, the work
reservoir is held at constant $\underline{S}$ and $N$, and that changes
to one reservoir do not affect the other. Finally, we place the entire
connected system in isolation, such that if we consider the system and
both reservoirs the total entropy, volume, and number of particles is
fixed. Referring to the global system as $\Sigma$, we thus hold the
system at constant
$\underline{S}^\Sigma, \underline{V}^\Sigma, N^\Sigma$. We allow the
system to come to a global equilibrium, and then consider the effect of
small perturbations from this equilibrium as we did previously in
determining the condition of equilibrium for the energy and entropy.

![image](figs/fig_21_1.png){width="100%"}

Two lectures ago, we concluded that any perturbations to a system at
equilibrium that is held at constant entropy necessarily increases the
internal energy. We can thus write for the total isolated system:

$$\Delta\underline{U}^\Sigma = \Delta\underline{U} + \Delta\underline{U}^{R_T} + \Delta\underline{U}^{R_P}  > 0$$

where $\underline{U}$ is the energy of the system, $\underline{U}^{R_T}$
is the energy of the thermal reservoir, and $\underline{U}^{R_P}$ is the
energy of the work reservoir. The entropy of the global system is
constant and the work reservoir has adiabatic walls, but heat can
exchange between the system and thermal reservoir so the entropy in
these two systems can change. We can also write:

$$\begin{aligned}
\Delta\underline{S}^\Sigma &= \Delta \underline{S} + \Delta\underline{S}^{R_T}  = 0 \\
\Delta  \underline{S}^{R_P} &= 0
\end{aligned}$$

Similarly, the volume of the thermal reservoir is fixed, the volume of
the global system is fixed, but the system under study can exchange
volume with the work reservoir:

$$\begin{aligned}
\Delta\underline{V}^\Sigma &= \Delta  \underline{V} + \Delta\underline{V}^{R_P}   = 0 \\
\Delta  \underline{V}^{R_T} &= 0
\end{aligned}$$

Finally, the number of particles is fixed in each subsystem:

$$\Delta N^\Sigma = \Delta N = \Delta N^{R_T}   = \Delta N^{R_P} = 0$$

Now we can consider variations of the system that allow us to consider
the behavior of different thermodynamic potentials.

**Case 1: No interaction with thermal reservoir, interaction with work
reservoir**. In this case, we assume that the thermal reservoir is not
part of the system so that $\Delta \underline{S}^{R_T} = 0$ and thus
$\Delta \underline{S} = 0$. However, the pressure is kept constant due
to contact with the work reservoir; the system is at constant
$\underline{S}$, $P$, and $N$. Now, we consider a perturbation to the
system such that $\Delta \underline{U}^{\Sigma} > 0$. First, we can
write the energy change of the work reservoir using the first law as:

$$\Delta \underline{U}^{R_P} = -P \Delta \underline{V}^{R_P}$$

From the volume constraint, this is equivalent to:

$$\Delta \underline{U}^{R_P} = P\Delta\underline{V}$$

Substituting into the system energy, with
$\Delta \underline{U}^{R_T} = 0$ since there is no work interaction with
the thermal reservoir, we get:

$$\begin{aligned}
\Delta \underline{U}^{\Sigma} &= \Delta  \underline{U} + \Delta\underline{U}^{R_T} + \Delta\underline{U}^{R_P}  > 0 \\
&= \Delta \underline{U} + P\Delta \underline{V}  > 0 \\
\therefore \Delta \underline{H} &> 0
\end{aligned}$$

Here, $H$ is the enthalpy of the enthalpy, which we can see is a
Legendre transform of the energy ($H = U + PV$). Therefore, any change
in the system held at constant $\underline{S}, \underline{P}, N$
increases the enthalpy; *the enthalpy is minimized for a system with
constant $\underline{S}, \underline{P}, N$ at equilibrium*.

**Case 2: Interaction with thermal reservoir, no interaction with work
reservoir**. Similar idea as above. The system of interest is now held
at constant $\underline{V}, T, N$ since interactions with the work
reservoir are not allowed, but heat can be exchanged with the thermal
reservoir to maintain constant temperature. Following the same logic as
above, we can use the first law (with $\Delta \underline{V}^{R_T} = 0$)
to write:

$$\begin{aligned}
\Delta \underline{U}^{R_T} &= T \Delta \underline{S}^{R_T} = -T\Delta\underline{S}
\end{aligned}$$

Substituting into the change in energy of the global system (with again
$\Delta \underline{U}^{R_P} = 0$ since there is no interaction with the
work reservoir) yields:

$$\begin{aligned}
\Delta \underline{U}^{\Sigma} &= \Delta \underline{U} + \Delta\underline{U}^{R_T} + \Delta\underline{U}^{R_P} > 0 \\
&= \Delta \underline{U} - T\Delta \underline{S} \\
\therefore \Delta \underline{F} > 0
\end{aligned}$$

Hence, *the Helmholtz free energy is minimized for a system with
constant $T, \underline{V}, N$ at equilibrium.*

**Case 3: Interaction with both the thermal and work reservoir**:
Finally, we consider a case in which both reservoirs interact with the
system, so the system is at constant $T, P, N$. We can combine the logic
from the two cases above to write:

$$\begin{aligned}
\Delta \underline{U}^{R_P} &= P\Delta\underline{V} \\
\Delta \underline{U}^{R_T} &= -T\Delta\underline{S} \\
\Delta \underline{U}^{\Sigma} &= \Delta  \underline{U} + \Delta \underline{U}^{R_T} + \Delta \underline{U}^{R_P} > 0 \\
&= \Delta  \underline{U} - T\Delta \underline{S} + P\Delta\underline{V}  \\
\therefore \Delta \underline{G} > 0
\end{aligned}$$

*The Gibbs free energy is minimized for a system with constant $T, P, N$
at equilibrium.*

## Relationship between partial derivatives

The introduction of new thermodynamic potentials gives rise to a series
of new partial derivatives that tend to appear in thermodynamic
relationships. For example, exact differentials of thermodynamic
potentials in terms of the natural variables of the potential lead to
relations between partial derivatives and known thermodynamic variables
(e.g. the entropy-derivative of the energy is the temperature). In other
cases, we might also define an exact differential of a thermodynamic
potential in terms of arbitrary parameters that are not the natural
variables of the potential, in which case we need methods to relate
partial derivatives to measurable quantities. Here, we briefly review
several rules for helping simplify partial derivatives, as this will be
an important aspect of solving problems when confronted with derivatives
that are not easily measurable experimentally.

### Inversion of derivatives:

$$\left ( \frac{\partial f}{\partial y}\right )_x = \frac{1}{\left ( \frac{\partial y}{\partial f}\right )_x }$$

For example:

$$\left ( \frac{\partial S}{\partial P}\right )_T = \frac{1}{\left ( \frac{\partial P}{\partial S}\right )_T }$$

### Triple product rule:

$$\left ( \frac{\partial f}{\partial x}\right )_y \left ( \frac{\partial x}{\partial y}\right )_f  \left ( \frac{\partial y}{\partial f}\right )_x  = -1$$

For example:

$$\left ( \frac{\partial H}{\partial T}\right )_P \left ( \frac{\partial T}{\partial P}\right )_H  \left ( \frac{\partial P}{\partial H}\right )_T  = -1$$

### Chain rule to add another variable:

$$\left ( \frac{\partial f}{\partial y}\right )_x = \frac{(\partial f / \partial z )_x}{(\partial y / \partial z )_x} = \left ( \frac{\partial f}{\partial z}\right )_x \left ( \frac{\partial z}{\partial y}\right )_x$$

For example:

$$\left ( \frac{\partial S}{\partial H}\right )_P = \frac{(\partial S / \partial T )_P}{(\partial H / \partial T )_P} = \frac{C_P/T}{C_P} = \frac{1}{T}$$

### The expansion rule:

This rule is a bit less obvious than the others, and is often confused
as "differentiating both sides" of an expression. That statement, while
a useful heuristic for performing this expansion, is not correct. We
will provide an example here, and proof of this rule is provided in
Appendix B:

$$\begin{aligned}
\left ( \frac{\partial f}{\partial u}\right )_{v} &= \left ( \frac{\partial f}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial u}\right )_{v} + \left ( \frac{\partial f}{\partial y}\right )_{x} \left ( \frac{\partial y}{\partial u}\right )_{v}
\end{aligned}$$

This rule is most commonly used when initially given a total derivative.
For example:

$$\begin{aligned}
dS &= \left ( \frac{\partial S}{\partial T} \right )_V dT  + \left ( \frac{\partial S}{\partial V} \right )_T dV \\
\therefore \left ( \frac{\partial S}{\partial T} \right )_P &= \left ( \frac{\partial S}{\partial T} \right )_V   \left ( \frac{\partial T}{\partial T} \right )_P  + \left ( \frac{\partial S}{\partial V} \right )_T \left ( \frac{\partial V}{\partial T} \right )_P \\
&= \left ( \frac{\partial S}{\partial T} \right )_V  + \left ( \frac{\partial S}{\partial V} \right )_T \left ( \frac{\partial V}{\partial T} \right )_P
\end{aligned}$$

In this example, it may look like I differentiated both sides of the
total derivative of $S$, but if that were so I would need to include
extra terms due to the product rule. What I have actually done is employ
the expansion rule with $f=S$, $x=T$, $y=V$, $u=T$, and $v=P$. Setting
$x=u$ removes one of the derivatives from the expression.

### Maxwell reciprocity:

$$\begin{aligned}
\left ( \frac{\partial(\partial f / \partial y )_x}{\partial x} \right )_y &= \left ( \frac{\partial(\partial f / \partial x )_y}{\partial y} \right )_x \\
f_{yx} &= f_{xy}
\end{aligned}$$

The second line illustrates alternative notation that we may use on
occasion; the key point is that mixed second derivatives are equivalent
regardless of the order of differentiation.

This last relation - Maxwell reciprocity - will pop up repeatedly by
establishing **Maxwell relations** between different thermodynamic
derivatives. We will present an example now, and later show how this
procedure can be generalized. First, consider an expression for the
Gibbs free energy in differential form:

$$\begin{aligned}
dG &= -S dT + V dP \\
&= \left ( \frac{\partial G}{\partial T}\right )_{P} dT + \left ( \frac{\partial G}{\partial P}\right )_{T} dP
\end{aligned}$$

We can now take derivatives of $-S$ and $V$ with respect to $P$ and $T$
respectively, which are equivalent according to the Maxwell reciprocity
theorem:

$$\begin{aligned}
-S &=  \left ( \frac{\partial G}{\partial T}\right )_{P} \\
V &= \left ( \frac{\partial G}{\partial P}\right )_{T} \\
\left ( \frac{\partial (\partial G/\partial T)_P}{\partial  P}\right )_{T} &= \left ( \frac{\partial (\partial G/\partial P)_T}{\partial T}\right )_{P} \\
\therefore -\left ( \frac{\partial S}{\partial P}\right )_{T} &= \left ( \frac{\partial V}{\partial T}\right )_{P}
\end{aligned}$$

Maxwell relations thus relate second derivatives of the Fundamental
Relation to each other, which is often very useful for transforming
derivatives into forms that are related to materials properties will be
demonstrated in the Problem Sets.

### Behavior of state functions:

Finally, let's remind ourselves of relationships assocated with state
functions, although we have already been performing these manipulations.
We define $B$ as a state function (*i.e.*, a derived or primative
property of a system, including the energy, thermodynamic parameters,
mechanical properties, or any parameters discussed to date excluding
heat and work). We can write $B$ as a function of three independently
variable parameters, $x$, $y$, and $z$, as:

$$\begin{aligned}
B = f(x,y,z)
\end{aligned}$$

Note that in the past we have largely assumed that $x$, $y$, and $z$ are
the natural variables when $B$ is a thermodynamic potential (*i.e.*, the
energy, entropy, or a free energy), but this is not necessary. The
difference in the value of $B$ can always be written as the difference
in $f(x,y,z)$ for any two stable equilibrium states:

$$\begin{aligned}
\Delta B = B_2 - B_1 = f(x_2, y_2, z_2) - f(x_1, y_1, z_1)
\end{aligned}$$

We can also write $B$ in differential form as an exact differential as a
function of $x$, $y$, and $z$:

$$\begin{aligned}
dB &= \left ( \frac{\partial f}{\partial x}\right)_{y, z} dx + \left ( \frac{\partial f}{\partial y}\right)_{x, z} dy  + \left ( \frac{\partial f}{\partial z}\right)_{x, y} dz
\end{aligned}$$

We can then compute the change $\Delta B$ **along a specified path** by
integrating this exact differential. The path will stipulate the limits
of integration for each variable as well as the values that are fixed.
However, the actual path chosen does not affect the value of $\Delta B$
since it is a state function, so we can integrate along any convenient
path. For example, we could calculate the change in $B$ from state 1 to
state 2 in which we proceed to $x_2$ along a constant $y_1, z_1$ path,
to $y_2$ along a constant $x_2, z_1$ path, then to $z_2$ along a
constant $x_2, y_2$ path. The corresponding integral is then:

$$\begin{aligned}
\Delta B &= \int_{x_1}^{x_2} \left ( \frac{\partial f}{\partial x}\right)_{y_1, z_1} dx + \int_{y_1}^{y_2} \left ( \frac{\partial f}{\partial y}\right)_{x_2, z_1} dy  +  \int_{z_1}^{z_2} \left ( \frac{\partial f}{\partial z}\right)_{x_2, y_2} dz
\end{aligned}$$

Note that we have to be careful about what variables are held constant,
or more specifically where in the overall phase space each of these
derivatives is evaluated.

## Euler's Theorem

We will now introduce Euler's Theorem, which will be useful for
interpreting the Fundamental Relation. Euler's theorem states that if a
function $f(a,b,x,y)$ obeys the relation:

$$f(a, b, Kx, Ky) = K^hf(a, b, x, y)$$

where $K$ and $h$ are constants, then

$$\label{eq22.17}
x \frac{\partial}{\partial x}[ f(a, b, x, y)] + y \frac{\partial}{\partial y} [f(a, b, x, y) ] = h f(a, b, x, y)$$

We describe $f(a,b,x,y)$ as homogeneous to degree $h$ in $x$ and $y$. We
can see from this definition that $a$ and $b$ correspond to intensive
variables and $x$ and $y$ to extensive variables using our
thermodynamics nomenclature, in that multiplying $x$ and $y$ by a
constant (i.e. the amount of material) changes the value of the function
by the same constant without needing to change the values of $a$ and
$b$. While we have written this expression in terms of four variables,
it can be generalized to any number of them.

We can apply this relation to the Fundamental Relation (we will use the
energy representation) by recognizing that the Fundamental Relation is
homogeneous to degree 1 ($h=1$) with respect to extensive variables. We
can then write:

$$\underline{U}(K\underline{S}, K\underline{V}, KN) = K\underline{U}(\underline{S}, \underline{V}, N)$$

This relation is apparent because each of the variables is extensive, so
multiplying all of them by $K$ is equivalent to multiplying the energy
by $K$. Comparing to Eq. [\[eq22.17\]](#eq22.17){reference-type="ref"
reference="eq22.17"}, we have $x = \underline{S}$, $y = \underline{V}$,
and a third extensive variable $z = N$. We can write a generalized
version of Eq. [\[eq22.17\]](#eq22.17){reference-type="ref"
reference="eq22.17"} for this system:

$$\begin{aligned}
&x \frac{\partial}{\partial x}[ f(x,y,z)] + y \frac{\partial}{\partial y} [f(x,y,z) ] + z \frac{\partial}{\partial z} [f(x,y,z) ] = \nonumber \\ 
& \underline{S} \left ( \frac{\partial \underline{U}(\underline{S}, \underline{V}, N)}{\partial \underline{S}} \right )_{\underline{V}, N} +  \underline{V} \left ( \frac{\partial \underline{U}(\underline{S}, \underline{V}, N)}{\partial \underline{V}} \right )_{\underline{S}, N} +  N \left ( \frac{\partial \underline{U}(\underline{S}, \underline{V}, N)}{\partial N} \right )_{\underline{S}, \underline{V}} \\ 
&= \underline{S}T - \underline{V} P + N \mu = hf(x, y, z)  \\
&\therefore \underline{U}(\underline{S}, \underline{V}, N) = T\underline{S} - P\underline{V} + N\mu \label{eq3.28}
\end{aligned}$$

This is a useful expression for the energy; we can also derive another
useful relation by taking the total differential of Eq.
[\[eq3.28\]](#eq3.28){reference-type="ref" reference="eq3.28"}:

$$\begin{aligned}
d\underline{U} = Td\underline{S} + \underline{S} dT - Pd\underline{V} - \underline{V}dP + Nd\mu + \mu dN
\end{aligned}$$

We can compare this with the combined first and second law for an open
system:

$$\begin{aligned}
d\underline{U} = Td\underline{S} - Pd\underline{V} + \mu dN
\end{aligned}$$

Equating these expressions leads to:

$$\underline{S}dT - \underline{V}dP + Nd\mu = 0$$

This expression, known as the **Gibbs-Duhem equation**, will be used
extensively in our study of multiphase systems in a generalized form.
The importance of this relation is that it places a constraint on $T$,
$P$, and $\mu$ such that they cannot all be independently variable;
indeed, in general if we have a multicomponent system with $n+2$
(always) intensive variables, we can also express any one intensive
variable in terms of the other $n+1$ intensive variables using this
relation.

We can apply Euler's theorem again to two other thermodynamic
potentials, the enthalpy ($H$) and Gibbs free energy ($G$) to illustrate
its utility. First, we define the enthalpy as:

$$\begin{aligned}
d\underline{H} &= Td\underline{S} + \underline{V} dP + \mu dN \\
\underline{H} &= \underline{H}(\underline{S}, P, N)\\
\underline{H}(K\underline{S}, P, KN) &= K\underline{H}(\underline{S}, P, N)
\end{aligned}$$

For the enthalpy, since $P$ is an intensive variable, multiplying it by
a factor of $K$ leaves it unchanged; therefore we associate $a = P$,
$x = \underline{S}$, and $y=N$ to get from Eq.
[\[eq22.17\]](#eq22.17){reference-type="ref" reference="eq22.17"}:

$$\begin{aligned}
hf(a, x, y) &= x \frac{\partial}{\partial x}[ f(a, x, y)] + y \frac{\partial}{\partial y} [f(a, x, y) ] \\
\underline{H} &= \left ( \frac{\partial \underline{H}}{\partial{S}}\right )_{P, N}  \underline{S} + \left ( \frac{\partial \underline{H}}{\partial{N}}\right )_{P, \underline{S}}  N \\
&= T\underline{S} + \mu N
\end{aligned}$$

As a last example, we consider the Gibbs free energy:

$$\begin{aligned}
d\underline{G} &= -\underline{S} dT + \underline{V} dP + \mu dN \\
\underline{G} &= \underline{G}(T, P, N)\\
\underline{G}(T, P, KN) &= K\underline{G}(T, P, N)
\end{aligned}$$

Here, $a=T$, $b=P$, and $x=N$, leading to:

$$\begin{aligned}
hf(a, b, x) &= x\frac{\partial}{\partial x}[ f(a, b, x)] \\
\underline{G} &= \left ( \frac{\partial \underline{G}}{\partial{N}}\right )_{T, P}  N \\
&= \mu N
\end{aligned}$$

This last equation is a useful one that we will return to in later
lectures. Note that we could obtain the same expression by performing a
Legendre transform of the internal energy to obtain
$\underline{G} = U - T\underline{S} + P\underline{V}$ and substituting
in the Euler integrated form of the internal energy, thus showing
consistency between our different derivations. These expressions can all
be generalized for other combinations of intensive and extensive
variables accordingly.

## Appendix A: Derivation of Euler integration

Let us start by defining $X = Kx$ and $Y=Ky$. We can then write:

$$\begin{aligned}
f(a, b, X, Y) &= K^hf(a, b, x, y) \\
F &= K^h f
\end{aligned}$$

We let $f(a, b, X, Y) \equiv F$ and $f(a, b, x, y) \equiv f$ for
simplicity. The total differential of this expression is written as:

$$\begin{aligned}
&\left ( \frac{\partial F}{\partial a} \right)_{b, X, Y} da +  \left ( \frac{\partial F}{\partial b} \right)_{a, X, Y} db +  \left ( \frac{\partial F}{\partial X} \right)_{a, b, Y} dX +  \left ( \frac{\partial F}{\partial Y} \right)_{a, b, X} dY = \\
& K^h\left ( \frac{\partial f}{\partial a} \right)_{b, x, y} da + K^h \left ( \frac{\partial f}{\partial b} \right)_{a, x, y} db + K^h \left ( \frac{\partial f}{\partial x} \right)_{a, b, y} dx +  K^h \left ( \frac{\partial f}{\partial y} \right)_{a, b, x} dy + hK^{h-1}  f dK
\end{aligned}$$

The last term on the right hand side is from the chain rule. We also
note that $dX = Kdx + xdK$ and $dY = Kdy + ydK$ from the product rule.
We can now eliminate $dX$ and $dY$ and collect like terms (this is going
to get a bit messy):

$$\begin{aligned}
&\left [ \left ( \frac{\partial F}{\partial a} \right)_{b, X, Y} - K^h\left ( \frac{\partial f}{\partial a} \right)_{b, x, y}\right ] da +  \left [ \left ( \frac{\partial F}{\partial b} \right)_{a, X, Y}  -  K^h \left ( \frac{\partial f}{\partial b} \right)_{a, x, y} \right ] db\\ 
+ &\left [ K \left ( \frac{\partial F}{\partial X} \right)_{a, b, Y} - K^h \left ( \frac{\partial f}{\partial x} \right)_{a, b, y} \right ] dx + \left [ K \left ( \frac{\partial F}{\partial Y} \right)_{a, b, X} -  K^h \left ( \frac{\partial f}{\partial y} \right)_{a, b, x} \right ] dy  \\
+ &\left [  x \left ( \frac{\partial F}{\partial X} \right)_{a, b, Y} + y \left ( \frac{\partial F}{\partial Y} \right)_{a, b, X} - hK^{h-1} f \right ] dK = 0
\end{aligned}$$

Since $a$, $b$, $x$, and $y$ are all independent variables, the only way
that this expression is guaranteed to be 0 is if each coefficient of
$dx$, $dy$, $da$, and $db$ are 0. We can thus write:

$$\begin{aligned}
\left ( \frac{\partial F}{\partial X} \right)_{a, b, Y} &= K^{h-1} \left ( \frac{\partial f}{\partial x} \right)_{a, b, y}\\
\left ( \frac{\partial F}{\partial Y} \right)_{a, b, X} &=  K^{h-1} \left ( \frac{\partial f}{\partial y} \right)_{a, b, x} \\
x \left ( \frac{\partial F}{\partial X} \right)_{a, b, Y} + y \left ( \frac{\partial F}{\partial Y} \right)_{a, b, X} &= hK^{h-1}f
\end{aligned}$$

Substituting the first two expressions into the third yields:

$$x \frac{\partial}{\partial x}[ f(a, b, x, y)] + y \frac{\partial}{\partial y} [f(a, b, x, y) ] = h f(a, b, x, y)\label{eq3.27}$$

## Appendix B: Derivation of expansion rule

Let's assume we have 5 variables, $x,y,u,v,z$, such that all 5 are state
variables and we can write an exact differentiable for any of the
quantities. Then we could write:

$$\begin{aligned}
dz &= \left ( \frac{\partial z}{\partial x}\right )_{y} dx +  \left ( \frac{\partial z}{\partial y}\right )_{x} dy \\
dz &= \left ( \frac{\partial z}{\partial u}\right )_{v} du +  \left ( \frac{\partial z}{\partial v}\right )_{u} dy 
\end{aligned}$$

Thermodynamically, if $z$ is equivalent to some thermodynamic potential,
like $H$, then $x,y,u,v$ are either intensive or extensive parameters.
We can equivalently write expressions for $x$ and $y$ in terms of $u$
and $v$:

$$\begin{aligned}
dx &= \left ( \frac{\partial x}{\partial u}\right )_{v} du +  \left ( \frac{\partial x}{\partial v}\right )_{u} dv \\
dy &= \left ( \frac{\partial y}{\partial u}\right )_{v} du +  \left ( \frac{\partial y}{\partial v}\right )_{u} dv 
\end{aligned}$$

Substituting these two expressions into the expressions for $dz$ as a
function of $dx$ and $dy$ and again collecting like terms gives:

$$\begin{aligned}
dz &= \left ( \frac{\partial z}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial u}\right )_{v} du + \left ( \frac{\partial z}{\partial x}\right )_{y} \left ( \frac{\partial x}{\partial v}\right )_{u} dv +  \left ( \frac{\partial z}{\partial y}\right )_{x} \left ( \frac{\partial y}{\partial u}\right )_{v} du  +  \left ( \frac{\partial z}{\partial y}\right )_{x}  \left ( \frac{\partial y}{\partial v}\right )_{u} dv \\
&= \left [  \left ( \frac{\partial z}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial u}\right )_{v} + \left ( \frac{\partial z}{\partial y}\right )_{x} \left ( \frac{\partial y}{\partial u}\right )_{v} \right ] du + \\\nonumber 
& \left [ \left ( \frac{\partial z}{\partial x}\right )_{y} \left ( \frac{\partial x}{\partial v}\right )_{u} +  \left ( \frac{\partial z}{\partial y}\right )_{x}  \left ( \frac{\partial y}{\partial v}\right )_{u} \right ] dv
\end{aligned}$$

Comparing this expression to the second expression for $dz$ in terms of
$du$ and $dv$, we see that:

$$\left ( \frac{\partial z}{\partial u}\right )_{v}  =  \left ( \frac{\partial z}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial u}\right )_{v} + \left ( \frac{\partial z}{\partial y}\right )_{x} \left ( \frac{\partial y}{\partial u}\right )_{v}$$

We can now find a couple of different relationships. First, assume that
there are only 4 variables under consideration, and $u = y$. Then this
expression reduces to:

$$\begin{aligned}
\left ( \frac{\partial z}{\partial y}\right )_{v} &= \left ( \frac{\partial z}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial y}\right )_{v} + \left ( \frac{\partial z}{\partial y}\right )_{x} \left ( \frac{\partial y}{\partial y}\right )_{v} \\
&= \left ( \frac{\partial z}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial y}\right )_{v} + \left ( \frac{\partial z}{\partial y}\right )_{x}
\end{aligned}$$

Note that we can also prove another relation using this same approach,
this time letting $u = y$ and $v = z$:

$$\begin{aligned}
\left ( \frac{\partial z}{\partial y}\right )_{z}  &=  \left ( \frac{\partial z}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial y}\right )_{z} + \left ( \frac{\partial z}{\partial y}\right )_{x} \left ( \frac{\partial y}{\partial y}\right )_{z} \\
0 &= \left ( \frac{\partial z}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial y}\right )_{z}  + \left ( \frac{\partial z}{\partial y}\right )_{x} \\
\left ( \frac{\partial z}{\partial y}\right )_{x}  &= -\left ( \frac{\partial z}{\partial x}\right )_{y}  \left ( \frac{\partial x}{\partial y}\right )_{z} \\
\left ( \frac{\partial z}{\partial y}\right )_{x}   \left ( \frac{\partial y}{\partial x}\right )_{z} \left ( \frac{\partial x}{\partial z}\right )_{y} &= -1
\end{aligned}$$

In this last line, we used the reciprocal relation that
$\partial x/\partial y = \frac{1}{\partial y/\partial x}$.

## Appendix C: Summary of thermodynamic potentials

  Potential                                                    Equation                                                                       Natural variables                                                                      Total derivative                                                    
  ------------- ------------------------------------------------------------------------------------------------------ ---------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------- -- -- --
  Energy                        $\underline{U} = T\underline{S} - P\underline{V} + \sum_i^n \mu_i N_i$                  $\underline{U}(\underline{S}, \underline{V}, N_1, N_2, \dots)$                 $d\underline{U} = Td\underline{S} - P d\underline{V} +  \sum_i^n \mu_i dN_i$                      
  Entropy        $\underline{S} = \frac{1}{T}\underline{U} + \frac{P}{T}\underline{V} - \sum_i^n \frac{\mu_i}{T} N_i$   $\underline{S}(\underline{U}, \underline{V}, N_1, N_2, \dots)$   $d\underline{S} = \frac{1}{T}d\underline{U} + \frac{P}{T}d\underline{V} - \sum_i^n \frac{\mu_i}{T} dN_i$        
  Enthalpy                                 $\underline{H} = \underline{U} + P\underline{V}$                                   $\underline{H}(\underline{S}, P, N_1, N_2, \dots)$                       $d\underline{H} = Td\underline{S} + \underline{V}dP +  \sum_i^n \mu_i dN_i$                       
  Helmholtz                                $\underline{F} = \underline{U} - T\underline{S}$                                   $\underline{F}(T, \underline{V}, N_1, N_2, \dots)$                       $d\underline{F} = -\underline{S}dT - Pd\underline{V} +  \sum_i^n \mu_i dN_i$                      
  Gibbs                           $\underline{G} = \underline{U} - T\underline{S} + P\underline{V}$                                 $\underline{G}(T, P, N_1, N_2, \dots)$                             $d\underline{G} = -\underline{S}dT + \underline{V}dP +  \sum_i^n \mu_i dN_i$                      
  Gibbs-Duhem                                                    N/A                                                                                 N/A                                                     $-\underline{S}dT + \underline{V}dP  - \sum_i^n N_i d\mu_i = 0$                             

  Type                           Constraints                   Behavior at equilibrium   Displacement from equilibrium        
  -------------- -------------------------------------------- ------------------------- ------------------------------- -- -- --
  Energy          Constant $\underline{S}, \underline{V}, N$          Minimized           $\Delta \underline{U} > 0$          
  Entropy         Constant $\underline{U}, \underline{V}, N$          Maximized           $\Delta \underline{S} < 0$          
  Enthalpy              Constant $\underline{S}, P, N$                Minimized           $\Delta \underline{H} > 0$          
  Helmholtz FE          Constant $T, \underline{V}, N$                Minimized           $\Delta \underline{F} > 0$          
  Gibbs FE                    Constant $T, P, N$                      Minimized           $\Delta \underline{G} > 0$          
