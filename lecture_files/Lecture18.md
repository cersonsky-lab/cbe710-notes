# Entropy

## Recommended textbooks

Tester and Modell, Ch. 4.3-4.5

## Topics in this lecture

-   Efficiency of a reversible heat engine

-   Theorem of Clausius

-   Entropy

## Announcements

-   Make up lecture tomorrow (Wed, Nov 6) 1 PM - 2:15 PM EH 2540

-   No class next week(Tues Nov 12, Thurs Nov 14)

-   Simulation project due online Thurs Nov 7

-   Graded exams back tomorrow

## Efficiency of a reversible heat engine

In the last lecture, we defined a **heat engine** as a closed device
that undergoes heat interactions with systems to which it is connected
and work interactions with the environment but is always returned to its
initial state at the end of the process. We further defined a
**reversible heat engine** as one which is capable of undergoing
completely reversible processes in which there is no net effect on the
environment; in effect, reversible heat engines can undergo heat and
work interactions without dissipative losses due to friction or similar
effects. We defined the efficiency of a heat engine in terms of a Case 5
process, in which heat is transferred to the engine and work is done on
the environment, and a Case 6 process, in which work is done on the
engine and heat is transferred to an attached hot system. As a reminder,
Case 5 and Case 6 are illustrated below.

![image](figs/fig_18_1.png){width="50%"}

We used these processes to define the efficiency of the engine as:

$$\begin{aligned}
\eta = -\frac{\delta W_E}{\delta Q_A}
\end{aligned}$$

We specifically found the bounds on the efficiency as:

$$\begin{aligned}
\eta_5 \le \eta_6 < 1
\end{aligned}$$

Importantly, we found that for any reversible heat engine,
$\eta_5 = \eta_6 \equiv \eta$, indicating that both systems, the engine,
and the environment return to their initial states after performing a
cyclic process (i.e. Case 5 followed by Case 6). Finally, we note that a
reversible heat engine is the engine capable of extracting the most work
from Case 5 during a cyclic process. If we were to perform Case 5 and
then Case 6 using a non-reversible heat engine such that $\delta Q_A$
were the same in each case, then less work must be extracted during Case
5 than is returned to the system during Case 6 since $\eta_5 < \eta_6$
and these work terms can only be equal if $\eta_5 = \eta_6$ and the
engine is reversible. Therefore, a reversible heat engine is of
particular interest since it maximizes the work extracted during cyclic
processes (which will be relevant to the generation of power, for
example, when considering the theoretical efficiency of power plants).

We have now established that reversible heat engines are of interest
because they perform reversible processes, they maximize the work
extracted from a system during the operation of Case 5, and they have
the same efficiency between Case 5 and Case 6. This begs the question -
what determines the efficiency of a reversible heat engine? A chief
conclusion from the prior lecture is that the efficiency of any cycle
performed by a reversible heat engine connecting two systems must be a
constant (i.e., the efficiency of Case 5 must equal the efficiency of
Case 6) or else Case 5 and Case 6 processes could be combined in such a
way as to violate the postulates. Moreover, we saw that our case studies
enforce the directionality of heat flow in terms of the temperatures of
two systems. Here we will show that the efficiency of a reversible heat
engine depends on the temperatures of the two connected systems. First,
we will show that the efficiency cannot depend only on the temperature
of the hot system.

![image](figs/fig_17_3.png){width="100%"}

Consider operating a reversible heat engine as in Case 5 between systems
$A$ and $B$ with temperatures $T_A > T_B$ (i.e., the engine does work on
the environment and heat transfers from system $A$ to the engine to
system $B$) and a process as in Case 6 between systems $A$ and $C$ with
temperatures $T_A > T_C$ (i.e. the environment does work on the engine
and heat transfers from $C$ to the engine to $A$). In total, the
temperatures are set such that $T_A > T_B > T_C$ so that the hot
temperature is $T_A$ for each process. If the efficiency
($\eta_5 = \eta_6 = \eta$) of each reversible heat engine only depends
on the hot temperature, then each of the reversible heat engines in this
process will have the same efficiency. This means that we could run
cycles in which heat is transferred from $C$ to $A$ with some input of
work, then the same heat is transferred from $A$ to $B$ while the same
work is extracted from the engine, since the efficiencies of the engines
are the same. This process would lead to no net effect on the
environment but a net transfer of heat from $C \rightarrow B$, violating
Postulate 2. The efficiency of the reversible heat engines involved must
be a function of both temperatures to prevent this scenario, or:

$$\eta = -\frac{\delta W_E}{\delta Q_A}=f_1(T_A, T_B)$$

where $f_1(T_A, T_B)$ is an undetermined function. We can further
simplify this expression to eliminate the extracted work and place the
efficiency only in terms of the heat transferred to each system. We know
from the First Law that $\delta W_E = -(\delta Q_A + \delta Q_B)$, where
$\delta W_E$ is negative because work is done by the engine on the
environment, $\delta Q_A$ is positive because the process in Case 5
transfers heat from system $A$ to the engine, and $\delta Q_B$ is
negative because the process in Case 5 transfers heat from the engine to
system $B$. We can express the preceding equation instead as:

$$\begin{aligned}
\eta &= -\frac{\delta W_E}{\delta Q_A} \\
&= \frac{\delta Q_A + \delta Q_B}{\delta Q_A} \\
\eta -1 &= \frac{\delta Q_B}{\delta Q_A} \equiv f_2(T_A, T_B)
\end{aligned}$$

$f_2(T_A, T_B)$ is another undetermined function. We will next determine
an expression for either $f_1(T_A, T_B)$ or $f_2(T_A, T_B)$ as a means
of determining the bounds on efficiency. Let us consider two distinct
composite systems. The first system is identical to the one considered
in Case 5, and consists of a system $A$ connected to a reversible heat
engine $E_1$ connected to a system $B$, such that $T_A > T_B$. During
the process performed in Case 5, heat $\delta Q_{A1}$ transfers from
system $A$ to $E_1$, heat $\delta Q_{B1}$ transfers from $E_1$ to system
$B$, and work $\delta W_{E1}$ is done by the engine on the environment.
The second composite system has 3 subsystems, $A$, $B$, and $C$, with
two reversible heat engines, $E_2$ and $E_3$, with temperatures
$T_A > T_C > T_B$. Heat $\delta Q_{A2}$ transfers from $A$ to $E_2$,
$\delta Q_{C2}$ transfers from $E_2$ to $C$, $\delta Q_{C3}$ transfers
from $C$ to $E_3$, and $\delta Q_{B3}$ transfers from $E_3$ to $B$. Any
heat transferred to $C$ is immediately transferred to $E_3$ so that
there is no net change in the energy of $C$. The second composite system
is similar to the first other than the addition of the intermediate
system $C$.

![image](figs/fig_17_4.png){width="100%"}

If the two composite systems reduce the energy of $A$ by an equivalent
amount then the work done by $E_1$ must be equivalent to the work done
by $E_2$ and $E_3$; otherwise, one system would be run in reverse to
create cyclic process in which the state of $A$ is unchanged but work is
extracted from the system, which requires that all the heat transferred
from system $B$ is obtained as work in the environment which is
impossible. We can now use energy balances to equate the different
defined quantities:

$$\begin{aligned}
\delta Q_{A1} &= \delta Q_{A2} \\
\delta Q_{B1} &= \delta Q_{B3} \\
\delta Q_{C2} &= -\delta Q_{C3} \\
\delta W_{E1} &= \delta W_{E2} + \delta W_{E3}
\end{aligned}$$

These relations all follow from either the problem statement, the
discussion above, or an energy balance for the system (for
$\delta Q_{B1} = \delta Q_{B3}$). Using the relation
$\frac{\delta Q_B}{\delta Q_A} = f_2(T_A, T_B)$, we can write for each
engine:

$$\begin{aligned}
\frac{\delta Q_{B1}}{\delta Q_{A1}} &= f_2(T_A, T_B) \\
\frac{\delta Q_{C2}}{\delta Q_{A2}} &= f_2(T_A, T_C) \\
\frac{\delta Q_{B3}}{\delta Q_{C3}} &= f_2(T_C, T_B) 
\end{aligned}$$

We can now combine these relations and simplify according to the
expressions above:

$$\begin{aligned}
\frac{\delta Q_{C2}}{\delta Q_{A2}} \frac{\delta Q_{B3}}{\delta Q_{C3}}  &= -\frac{\delta Q_{C3}}{\delta Q_{A2}} \frac{\delta Q_{B3}}{\delta Q_{C3}}\\
&= - \frac{\delta Q_{B3}}{\delta Q_{A2}} \\
&= -\frac{\delta Q_{B1}}{\delta Q_{A1}} \\
\therefore & f_2(T_A, T_C)f_2(T_C, T_B) = -f_2(T_A, T_B)
\end{aligned}$$

Two solutions satisfy this restraint: we can write either:

$$\begin{aligned}
f_2(T_i, T_j) &= -\frac{f_3(T_i)}{f_3(T_j)} \\
\therefore \frac{f_3(T_A)}{f_3(T_C)}\frac{f_3(T_C)}{f_3(T_B)} &= \frac{f_3(T_A)}{f_3(T_B)}
\end{aligned}$$

or

$$\begin{aligned}
f_2(T_i, T_j) &= -\frac{f_4(T_j)}{f_4(T_i)} \\
\frac{f_4(T_C)}{f_4(T_A)}\frac{f_4(T_B)}{f_4(T_C)} &= \frac{f_4(T_B)}{f_4(T_A)}
\end{aligned}$$

Arbitrarily choosing the latter option, we obtain:

$$\begin{aligned}
\frac{\delta Q_{B1}}{\delta Q_{A1}}&= -\frac{f_4(T_B)}{f_4(T_A)} \\
&= \eta-1\\
\therefore \eta &= \frac{f_4(T_A)-f_4(T_B)}{f_4(T_A)}
\end{aligned}$$

This relation says that the efficiency of an arbitrary, reversible heat
engine is related to some function of the temperatures of both connected
systems, and the function $f_4$ is a function of a single temperature
only. We also know that the efficiency of a reversible heat engine
acting between two systems at the same temperature must be single-valued
(*i.e.*, unique). If I could have multiple reversible heat engines
operating with two efficiencies between the same two temperatures, then
I could imagine connecting two such heat engines, performing a
high-efficiency Case 5 process to transfer heat from the hot system and
do work on the environment, then performing a low-efficiency Case 6
process to do the same amount of work on the engine and transfer heat
back to the hot system. These two processes in series would have no net
effect on the environment and by the definition of the efficiency more
heat is transferred to the hot system in the Case 6 process than in the
Case 5 process - the net result would be a transfer of heat from the
cold system to the hot system which is impossible Therefore, the
efficiency of a reversible heat engine operating between two systems
must be unique, and thus finding any functional form for $f_3(T)$ or
$f_4(T)$ is sufficient to specify its efficiency (which is why our
arbitrary choice of $f_4$ is acceptable). In principle, we could
determine this functional form by constructing a reversible heat engine,
operating it, and measuring $\delta Q_A$ and $\delta W_E$ to obtain the
efficiency. However, perfectly reversible heat engines are impossible to
construct in practice, since real systems have friction and other
dissipative losses of energy. Instead, we will conduct a thought
experiment in which we construct a reversible heat engine using an ideal
gas and show that this leads to a particularly simple form of the
efficiency.

In this ideal cycle, we imagine a heat engine that operates between a
hot system $A$ at temperature $T_A$ and a cold system $B$ at temperature
$T_B$. We assume that the two systems are so large that heat transfers
to and from them do not change their temperatures - they are thus heat
reservoirs. The heat engine itself consists of an ideal gas that
undergoes expansions and compressions via the action of a frictionless
piston. The ideal gas is initially held at a temperature $T_A$ in state
(1) (illustrated on the $P-\underline{V}$ diagram below). The cycle
consists of four steps:

-   The heat engine is isolated from both systems and expands
    adiabatically and reversibly to a lower pressure. During this
    expansion, the ideal gas does work on the environment and its
    temperature lowers to $T_B$, thus transitioning from state (1) to
    (2).

-   The heat engine at temperature $T_B$ is then connected to system $B$
    and the gas is isothermally compressed. During this compression,
    work is done by the environment on the ideal gas and the gas
    transfers heat to system $B$ at a constant temperature $T_B$ to
    transition from state (2) to (3).

-   The heat engine is isolated from system $B$ and compressed
    adiabatically and reversibly to the original pressure. The gas
    returns to its original temperature $T_A$ and transitions from
    state (3) to (4).

-   The heat engine at temperature $T_A$ is connected to system $A$ and
    the gas is isothermally expanded. During this expansion, work is
    done on the environment and heat transfers from system $A$ at
    constant temperature $T_A$ and the engine transitions from state (4)
    to the original state (1).

The total of these four steps leads to a net transfer of heat from
system $A$ to system $B$ with work done on the environment - it is thus
a Case 5 process. We refer to this cycle as the **Carnot cycle**.

![image](figs/fig_17_5.png){width="50%"}

Using the ideal gas law, $P\underline{V} = NRT$ and analyzing the
various work and heat transfers during this cycle, it is possible to
show that the efficiency can be written as:

$$\eta = \frac{T_A - T_B}{T_A} \rightarrow f_4(T_i) = T_i$$

Proving this relationship will be performed in a problem set. This
derivation leads us to a very simple form of the efficiency of a
reversible heat engine. From this derivation, then, we have established
that the efficiency of an idealized reversible heat engine is a function
solely of the temperatures of the hot and cold systems that it connects;
although a real heat engine will have a lower efficiency due to
dissipation during its operation, the Carnot cycle efficiency puts an
upper bound on the efficiency of any real heat engine. Note that we
could choose any fluid, not just an ideal gas, to place within the heat
engine and undergo these processes and we would get the same result -
the only difference would be the equations for the heat and work
interactions along the isotherms and adiabats.

## Theorem of Clausius

The preceding discussion and derivations have established bounds on the
efficiency of reversible heat engines, thus putting bounds on what
processes are possible. We will next seek to generalize the idea of
determining if a process is possible by defining the **entropy**. First,
given our derivation of the efficiency of a reversible heat engine
performing a Carnot cycle, we can now write the relation:

$$\begin{aligned}
\eta -1 &= \frac{\delta Q_B}{\delta Q_A} = \frac{T_A - T_B}{T_A} - 1\\
\frac{\delta Q_B}{\delta Q_A} &=  -\frac{T_B}{T_A} \\
\therefore &\frac{\delta Q_A}{T_A} + \frac{\delta Q_B}{T_B} = 0\\
&\frac{dQ_A}{T_A} + \frac{dQ_B}{T_B} = 0
\end{aligned}$$

This relation again shows how the differential change in heat for a
reversible heat engine is related to the temperatures of two connected
systems.

Let us now consider a system similar to that of the Carnot cycle, in
which we have a closed, reversible heat engine containing some material
(which need not be an ideal gas). We assume that the system is able to
reversibly expand and compress so that $P-\underline{V}$ work can be
done on the system and there are no other work terms. We can imagine a
process that changes the state of our system from state (i) to state (f)
via some unspecified path that may involve a series of different events
(e.g. adiabatic expansions/compressions, isothermal
compressions/expansions, etc.) as in the Carnot cycle. We represent this
path on a state diagram in the $P-\underline{V}$ space.

![image](figs/fig_18_2.png){width="100%"}

Now, let us consider an alternative means of transitioning between state
(i) and (f) along one specific path. First, we can draw the *adiabatic
paths* on the state diagram that correspond to adiabatic expansions or
compressions (recall: no heat is transferred during these processes)
starting at either (i) or (f); following either of these paths alone
does not guarantee that we reach (f) from (i). We can also draw
*isothermal paths* on the same diagram, corresponding to isothermal
expansions/compressions (recall: both heat and work can be transferred
during these processes), such that these paths connect the adiabatic
paths drawn previously. We define states (g) and (h) as the states on
the adiabatic paths that are connected by an isothermal path. In this
way, we define a connected series of adiabatic and isothermal processes
which reaches the same state (f) as in the original process.

Now, we can analyze the transfers of heat and work along these two
alternative processes. First, we know that the work along the real path
(i) to (f) is given by:

$$\delta W_{if} = \int_{(i)}^{(f)} -P dV$$

or, in other words, the area under the $P-V$ curve. We can choose the
point (g) such that the work along the
(i)$\rightarrow$(g)$\rightarrow$(h)$\rightarrow$(f) path is equivalent
to the work along the real path, since the (g)$\rightarrow$(h) isotherm
can connect many different pairs of points along the adiabatic paths and
can be positioned freely. Since the change in energy between (i) and (f)
is independent of the path chosen (according to the First Law of
Thermodynamics), we then get that:

$$\begin{aligned}
\delta W_{if} &= \delta W_{ighf} \\
\Delta {U}_{if} &= \Delta {U}_{ighf} \\
\therefore \delta Q_{if} &= \delta Q_{ighf} =\delta Q_{gh}
\end{aligned}$$

The last expression follows from the fact that
$\delta Q_{ig} = \delta Q_{hf} = 0$ by construction along the adiabatic
paths. Together then, we see that we can decompose an arbitrary path
into a series of isothermal and adiabatic paths and use this to deduce a
relationship for the heat transfer between the two states along a
specific isothermal path. This finding is generalized as the **Theroem
of Clausius**: *Given any reversible process in which the temperature
changes in any prescribed manner, it is always possible to find a
reversible "zigzag" process consisting of adiabatic-isothermal-adiabatic
steps such that the heat interaction in the isothermal step is equal to
the heat interaction in the original process.*