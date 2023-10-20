# Derivation of expansion rule

Let's assume we have 5 variables, $x,y,u,v,z$, such that all 5 are state
variables and we can write an exact differentiable for any of the
quantities. Then we could write:

$$dz = \left ( \frac{\partial z}{\partial x}\right )_{y} dx +  \left ( \frac{\partial z}{\partial y}\right )_{x} dy $$

or

$$dz = \left ( \frac{\partial z}{\partial u}\right )_{v} du +  \left ( \frac{\partial z}{\partial v}\right )_{u} dy $$

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