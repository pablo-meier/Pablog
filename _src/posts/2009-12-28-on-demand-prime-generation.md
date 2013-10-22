    Title: On-Demand Prime Generation
    Date:2009-12-28T18:10:00
    Tags: pablolife, engineering

Many [Project Euler][1] problems are made easier if you have a good facility
for generating and detecting prime numbers.  Usually when I see such a problem,
I would immediately switch to Haskell, but the other day a problem took about
a minute to solve (way too long), so I ported the functionality to C.

In both, I'm doing a simple trial division algorithm: a number is prime if no
other number divides it. A simple glance at Wikipedia shows you only have to
test up to and including the square root of the number you're testing, and the
nature of primes means you really only need to test factorization by other
primes.

<!-- more -->

---

In Haskell, I used [a former exercise from my CS173 class][2] that highlighted
laziness as a language feature to achieve this. First, we declare our list of
primes:

```hs
primes :: [Int]
primes = filter isPrime [1..]
```

And then we define the predicate to determine if a number is prime or not, on
which our list depends:

```hs
isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True

isPrime n = checkFactors (takeWhile (\ x -> x <= (floor $ sqrt (fromIntegral x))) primes) n

checkFactors :: [Int] -> Int -> Bool
checkFactors [] _ = True
checkFactors (x:xs) num = (num `mod` x) /= 0 && checkFactors xs num
```

For those who aren't Haskellites (even those who are, since my Haskell
probably isn't very pretty or idiomatic), the code is doing this:

* The list primes is the list of all integers beginning at 1, with all the non-primes filtered out, where non-primes are determined by the function isPrime.

* The function isPrime tests a number _x_ for primality by testing
divisibility for all prime numbers below the square root of _x_, where the
prime numbers come from the list primes.

Huh? You might have read over that a few times trying to piece it together and
couldn't, as primes depends on isPrime and isPrime depends on primes. But not
to worry, this is laziness at work :)

Laziness means that Haskell will only perform the computations it needs _as it
needs them_, so as long as isPrime only needs as many numbers as primes has
already computed, this works. Alternatively, so long as primes only needs to
generate numbers isPrime can check, we're golden.

Imagine a snake that is three feet long eating a foot of itself from its tail,
but growing a foot and a half longer as a result. It can do this continuously
and grow to indefinite size!

More concretely, suppose I want to check if 9 is prime. A call to isPrime 9
causes the following to happen:

* The takeWhile in isPrime will take all numbers from primes that are less than or equal to 3.

* The language will compute values for primes by running each integer through `isPrime`, and will do this while those values are less than or equal to 3.

* `isPrime 1` will fail, `isPrime 2` will pass, and `isPrime 3`...

* ... we're not sure, so we repeat the steps above for all numbers in primes less than the square root of three. This gives us the empty list, which by definition of isPrime tells us 3 is prime.

* We return this result, and stop taking values from primes since this is less than or equal to 3. We divide 9 by 3. This fails the predicate, so 9 is not prime.

Next to shell languages, Haskell is the only language I can think of in wide
use (if you consider Haskell in wide use...) that employs laziness by default,
and it allows you a powerful abstraction like this. The laziness allows us to
define the list of all primes to be used freely in the code as any other list,
the program will only calculate as many primes as it needs, and it can
calculate arbitrarily many primes. Furthermore, the primes are comparatively
fast to compute, since there are no 'wasted' divisibility tests.

---

And so I solved a number of Project Euler problems in Haskell just so I can
use this facility. That being said, the speed of the language itself left me
wanting, so I ported a somewhat similar abstraction to C. We'll do this in the
opposite order, first defining an isPrime:

```c
BOOL
isPrime(int num)
{
  int curr_prime, index = 0;
  double limit = sqrt(num);
  while ((curr_prime = takePrime(&index)) <= limit) {
    if (num % curr_prime == 0) return FALSE;
  }
  return TRUE;
}
```

This relies on a takePrime function, which can be called continuously to fetch
the next prime from an index value. It looks like:

```c
unsigned int
takePrime(int* indx)
{
  unsigned int val = prime_ptr[*indx];
  if (val != UNCOMPUTED) {
    ++(*indx);
    return val;
  }
  else {
    unsigned int last_prime = prime_ptr[(*indx)-1];
    unsigned int next_prime;
    for (next_prime = last_prime + 1; ; ++next_prime){
      if (isPrime(next_prime)) break;
    }
    prime_ptr[*indx] = next_prime;
    ++(*indx);
    return next_prime;
  }
}
```

Where `prime_ptr` is an array of integers, memset to some value `UNCOMPUTED`
(I've left out most of the header information, as well as the init() and
finished() calls that make this all work).

This takePrime preserves previously computed values (this is the purpose of
the first condition), so if you ever need to check the _i_-th index of a value
you've already computed, you simply return it. Otherwise, you take the last
value you've computed previously, and increment all integers above it until
you find your next prime. When you do, store it in the array and return it.

The C abstraction has a number of shortcomings over the Haskell version;
namely, you can't pass in an arbitrary index and receive a prime number
(last\_prime only checks the prime immediately behind the one you are trying to
compute. If you've only computed 6 primes and you ask for the 9th, you
Segfault). You also lose the list abstraction (prime\_ptr is static and this
set of functions is #included, so I choose not to 'export' it), and you can't
calculate arbitrarily many primes (the array has a fixed size).

All that being said, changes to correct those are pretty easy to implement;
I've never needed them. But this allowed me to brute-force a few problems that
might have had more elegant solutions. While I hate on C pretty frequently,
gcc/g++ produce some pretty slick executables.


   [1]: http://www.projecteuler.net
   [2]: http://www.cs.brown.edu/courses/csci1730/2008/Assignments/04-laziness-prog.html
