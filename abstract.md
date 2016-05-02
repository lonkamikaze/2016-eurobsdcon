Proposing a Replacement for FreeBSD's powerd
============================================

Or, how I tamed the fan of my notebook
--------------------------------------

The `powerd` CPU frequency daemon provides userland P-State (power
state) switching since 2005. Multi Core Processing has come a long
way since 2005 and the increasing number of cores and pipelines in 
modern CPUs have exposed flaws in powerd's design that were not obvious
at the time of its conception.

The paper/talk proposes three design changes addressing these flaws.
A daemon named `powerd++` implements this improved design.

The proposed talk and paper will present:

- Challenging load characteristics
- The three core design differences between `powerd` and `powerd++`
- Benchmarking `powerd++` vs. `powerd`

----

- [`powerd++` in my blog](http://angryswarm.blogspot.com/2016/04/powerd-better-cpu-clock-control-for.html)
- [`powerd++` on GitHub](https://github.com/lonkamikaze/powerdxx)

