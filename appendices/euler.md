# Derivation of Euler integration

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