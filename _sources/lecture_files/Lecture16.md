# Postulates of thermodynamics

## Additional Readings for the Enthusiast

{cite:ts}`tester_thermodynamics_1997`, Ch. 2 and 3

## Goals for Today's Lecture
- Establish the four postulates of classical thermodynamics

## The four postulates of classical thermodynamics

In this lecture, we will begin our study of classical thermodynamics
following a postulatory approach: we will define only four postulates
that we accept as fact, and then find that from these postulates alone
we can define the entire thermodynamic framework that we have already
been using in our study of statistical mechanics. Hopefully through
these derivations you will see the beauty of this approach and recognize
the logic and consistency that underlies these studies.

I encourage you
to review our initial [review of thermodynamics](Lecture1B).
We will start by defining the postulates of thermodynamics and begin
exploring their implications. Please note that these postulates may be
stated in various ways (and their numbering scheme may vary as well) -
we follow the postulates as defined in {cite:ts}`tester_thermodynamics_1997`.

### Postulate 0
**We assume that we have an experimental apparatus
capable of measuring system properties and of manipulating the values of
system variables as well.**


### Postulate 1: Equilibrium States
**For closed {term}`simple system`s with given internal
{term}`restraint`s, there exist stable {term}`equilibrium state`s which can be
characterized completely by the internal energy E and a set of independently
varying state functions.**

First, let's unpack some definitions here:

```{glossary}

simple system
    have no internal boundaries of any kind and are
    not acted on by external or inertial forces
    
restraint
    is a condition on a system that prevents a change to
    that system from happening. Boundaries that are rigid, adiabatic,
    etc. are examples of restraints, but restraints can also be barriers
    to phase changes or chemical changes (e.g. due to the presence of a
    chemical activation energy) that are not related to a physical
    barrier in a system. Hence, restraints is a broader term

stable phase
    a region within a simple system that has a
    uniform set of properties, although these properties may differ from
    other phases in the simple system

equilibrium
    within a system, when there is no driving force
    to change intensive variables in the system, and the system's properties
    do not change as a function of time

equilibrium state
    what a system that is at equilibrium is called

```

This postulate defines the concept of {term}`equilibrium state`s in a system as
the states of interest that we will consider throughout our studies,
just as we did in statistical mechanics. The postulate defines
equilibrium states as {term}`stable phase`s, meaning that their properties are not
time-dependent once equilibrium is reached (if no event perturbs the
system). An internal {term}`restraint` refers to a barrier (that need not be
physical) to particular processes within the system - for example, an
activation energy might exist that prevents the chemical transformation
of system components.

The statement that the system is completely
characterized by two independently variable properties means that one of
these properties can be varied while the other is held constant to
completely determine the behavior and state of a system. For example, if
you were to know the amount of material (i.e., the amount initially
charged in the system) in a simple, {term}`closed` system containing a pure
liquid in equilibrium with its vapor, the properties of the system could
be completely determined if the volume of the system and its temperature
were known as these two properties are independently variable.

However, for this system the pressure and temperature are not independently
variable (we'll learn why explicitly later, but this is a consequence of
the phase equilibrium between the vapor and liquid), so specifying these
two variables would be insufficient to determine the properties of the system.

This postulate implies that we will need to find relationships between
thermodynamic properties to determine what properties can be
independently varied and to understand how to determine the values of
other system properties based on these variations. Developing these
relations will be a major focus of our studies. If we know these
relationships, we can also use them to test for the presence of
restraints in the system. We will present examples of these
relationships as we proceed.


### Postulate 2
**All systems, both simple and composite, will change such to approach
one and only one stable equilibrium state within each subsystem,
provided there is no net effect on the environment. In the limiting
condition, the entire system is said to be at equilibrium.**

```{glossary}

composite system
    consists of two or more distinguishable
    subsystems that may be separated by boundaries, e.g. two solutions
    separated by a semipermeable membrane. Such boundaries are referred
    to as *internal* boundaries, or internal constraints/restraints
```

Postulate 2 then tells us that equilibrium states are reached if a
system is observed for a sufficiently long amount of time - that is,
each {term}`simple system` (or simple subsystems in a {term}`composite system`) evolves
toward a unique equilibrium state. Postulate 2 is only defined for an
{term}`isolated` system with a given set of internal restraints. Changing the
internal restraints (*i.e.*, removing the activation barrier in the
previous example) will change the unique equilibrium state of the system
in a predictable way (*i.e.*, the system components may undergo a
reaction). This observation underscores the importance of understanding
and identifying internal restraints in the system. Finally, note that in
composite systems, the equilibrium state of the entire system cannot be
specified by only two independent variables, but each simple subsystem
can be defined by two independent variables. The properties of the
composite system are thus defined by the collected properties of the
subsystems.

Since Postulate 1 and 2 together introduce the concept of stable
equilibrium states that are reached after the time-evolution of a
system, we now must introduce the concept of a thermodynamic
**process**.

```{glossary}

process
    the changes in the thermodynamic
    properties of a system that occur when a system has an interaction with
    the environment or internal restraints are removed or altered.

interaction
    an event that involves changes to both the
    system and its environment, such as heat flowing from the system to
    a surrounding reservoir. Most interactions occur at the walls of a
    system

event
    a situation where at least one primitive property
    changes

primitive property
    a property that can be measured (e.g., the
    temperature) without disturbing the system
```


The process includes a description of the two equilibrium end states, prior
to and after the process, the {term}`interaction`s occurring at the boundaries
of the system, and the set of states through which the system evolves,
also known as the **path**. A path can be [quasi-static](https://en.wikipedia.org/wiki/Quasistatic_process), meaning that all
intermediate states in a process are equilibrium states that can be
described with two independently variable parameters. Processes that
involve non-quasi-static paths pass through non-equilibrium states that
may require additional properties to be specified, and thus do not obey
Postulate 1.

Various types of processes can be defined. For example, an
isothermal process is one in which the temperature is constant. 


### Postulate 3
**For any states, (1) and (2), in which a {term}`closed` system
is at {term}`equilibrium`, the change of state represented by (1) $\rightarrow$
(2) and/or the reverse change (2) $\rightarrow$ (1) can occur by at
least one {term}`adiabatic/insulated` process, and the {term}`adiabatic work interaction` between
this system and its surroundings is determined uniquely by specifying
the end states (1) and (2).**

This postulate defines several important pieces of terminology that
require some investigation. First, we formally define the concept of
**work**, which we have already used repeatedly in our study of
statistical mechanics.

```{glossary}

work

    Following typical mechanical definitions, the
    work, $W$, is defined as the product of a generalized force, $f$,
    multiplied by a generalized displacement, $\Delta x$:

    $$\begin{aligned}
    W &= f \Delta x  \\
    dW &= f dx \\
    W &= \int_{x_1}^{x_2} f dx
    \end{aligned}$$

```

In its most general form, the product of the force and displacement
would be a vector product between a force vector $\vec{f}$ and a vector
displacement; we drop the vector notation for simplicity.

As in statistical mechanics, we will define the [sign convention](Lecture1A) such
that the work is positive if work is done *on* the system by the
environment. In general, for all work interactions, the work done on a
system by the environment is equal to the work done on the environment
by the system; this is a consequence of Newton's 3rd law and reflects
the conservation of energy.

Next, we will define

```{glossary}

adiabatic work interaction
    an interaction between two closed systems that does not involve a transfer of heat to
    the environment.
```

Since we have not yet formally defined heat, we can
define adiabatic work interactions in terms of an observable
experiment - namely, adiabatic work interactions can be performed by the
rise and fall of weights in an external gravitational field connected by
a frictionless pulley, which we know to be a system described entirely
by the work due to gravity.

Examples of adiabatic work interactions
include compressing a gas with a piston on a frictionless surface, which
could be accomplished by raising or lowering a weight attached to the
piston, or resistively heating a liquid by doing electrical work, which
could be accomplished by tying a rope attached to a weight around a
motor and using the motor to send current through a resistor that is
inserted in a fluid. In each case, the gas/liquid container is a closed
system on which work is done.


With these definitions, let us now consider the meaning of Postulate 3.
The postulate states that even if it is not possible to go from
state (1) to state (2) solely via adiabatic *work interactions* -
it will always be possible to either go from
state (1) to (2) via an adiabatic *process* or from state (2) to (1) by an
adiabatic *process*.

For example, consider a gas in state (1) specified by
$P_1, T_1$ and state (2) specified by $P_2, T_2$. Suppose that the gas
is in a closed system with a piston that controls the system volume. If
the gas is expanded adiabatically, the pressure drops from
$P_1 \rightarrow P_2$ and we would observe that the temperature changes
(this is due to the relationship between energy and temperature for an
ideal gas). To obtain a temperature $T_2$, we could add an electric
generator to the system that is powered by a weight; assuming
frictionless wires, this allows us to heat the system to temperature
$T_2$ with the piston fixed such that the pressure is maintained at
$P_2$. This is thus a multistep adiabatic process from state (1) to (2)
since the walls and each step is adiabatic. Moreover, the inverse
process is not possible, since we cannot cool the system adiabatically
by returning heat to the electric generator.

Since an adiabatic process is possible between any two states, Postulate
3 then defines the internal energy of the system, $\underline{U}$,
as a  {term}`derived property` (i.e. one that is not directly measurable)
equal to the work done during an adiabatic process, since the adiabatic
work is only a function of the end states:

$$\underline{U}_2 - \underline{U}_1 = \underline{W}_{1\rightarrow 2, \textrm{adiabatic}}$$


```{glossary}

derived property
    a property which cannot be measured directly by
    any method, but can be determined from changes to primitive
    properties and can characterize a system (e.g., the entropy)

```

Technically, this expression defines the change in the *total* energy of
the system, including the kinetic energy associated with center-of-mass
motion in a system, potential energy associated with body forces (i.e.
gravity), and the internal energy associated with molecular motions
(i.e. translational degrees of freedom, vibrations, rotations),
intramolecular effects (electron spin), and intermolecular interactions.
We will ignore the first two effects and treat the total energy as the
internal energy due to usage of this nomenclature throughout our study
of statistical mechanics.

So, in total, Postulate 3 defines the internal energy as a derived
parameter that is a function of the states of two stable equilibrium
systems. We refer to such a parameter as a state function. Note that
only changes in energy are meaningful; we could assign an energy to each
state, but only the energy change will matter.

While Postulate 3 states that two states can be connected by an
adiabatic process, in principle we can define any process, adiabatic or
non-adiabatic, between the two states and the change in total energy
will be unchanged (since it is uniquely defined as the work done along
the adiabatic path). This observation leads to our definition of heat

```{glossary}

heat
    the *difference* in the total energy change during a particular
    process and the actual work performed
```

We can write this as:

$$\begin{aligned}
\delta Q &= \left(\underline{U}_\textrm{2} - \underline{U}_\textrm{1} \right)- \delta \underline{W} \\
&= \underline{W}_{\textrm{adiabatic}} - \underline{W}_{\textrm{non-adiabatic}}\\
\Delta \underline{U} &= \delta \underline{Q} + \delta \underline{W}
\end{aligned}$$

This relation is referred to as the {term}`first law of thermodynamics` and
is consistent with our definition in our [earlier review](Lecture1B) -- 
the change in the energy of a system is always the sum of the heat
(which is positive if heat is added to the system) and the work (which
is positive if work is done on the system by the surroundings) during a
process. Here we use the symbol $\delta$ to indicate that the associated
parameter is path-dependent; while the energy change is a fixed
function of the initial and final state, the amount of heat and work
transferred depends on the path between the two states. Note that we
will use the phrase "transfer heat" but this just means that energy is
transferred via a heat interaction - there is no heat that is intrinsic
to a state that is transferred. For a system to undergo a heat
interaction, there must be at least one non-adiabatic or diathermal
wall, but having a {term}`diathermal` wall does not imply that a system will
necessarily undergo a heat interaction.

### Postulate 4
**If the sets of systems $A$, $B$ and $A$, $C$ each have
no heat interaction when connected across non-adiabatic walls, then there
will be no heat interaction if systems $B$ and $C$ are also so
connected.**

This postulate effectively defines the concept of {term}`thermal equilibrium` -
systems connected across non-adiabatic walls that do not have a heat
interaction are at thermal equilibrium, and thus any two systems that
are connected to a third system that all experience no heat flow must
have the same temperature (which we have not strictly defined; suffice
to say it is the quantity that its equivalent for systems for which
there is no heat transfer). This postulate thus requires the definition
of the **temperature** as an intensive parameter that is equal for two
systems connected by nonadiabatic walls that undergo no heat
interaction.

```{glossary}

thermal equilibrium
    if a system has diathermal boundaries, at
    equilibrium the temperature of the system will be equivalent to the
    temperature of the surroundings
```


## [Link to Shared Notes](https://docs.google.com/document/d/1iRWEgkMZJtCYRjKfREHdu5qsl8ZfsRqB/edit?usp=drive_link)