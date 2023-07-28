1a.
From the problem statement, the final position of the chain end, $x$,
depends on the number of steps taken in each direction. We can write the
number of steps in the positive direction as $n$, so that the number of
steps in the negative direction is $N-n$. The probability of obtaining a
particular value of $n$ is then equal to the number of possible ways
that $n$ steps can be taken out of $N$ total steps, divided by the total
number of possible ways of taking steps. The number ways of taking $n$
indistinguishable steps out of $N$ total steps is given by:

$$\Omega(n) = \frac{N!}{n!(N-n!)}$$

The total number of ways of taking steps is $2^N$, since for each of the
$N$ steps there are two possible choices. Therefore, the probability of
taking $n$ steps in the positive direction is:

$$p(n)= \frac{1}{2^N}\frac{N!}{n!(N-n)!}$$

Substituting $n = (N + x/b)/2$ we obtain a probability distribution for
$x$ instead of $n$:

$$p(x) = \frac{1}{2^N}\frac{N!}{[(N+x/b)/2]![(N-x/b)/2]!}$$

