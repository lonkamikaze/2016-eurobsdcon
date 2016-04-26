Proposing a Replacement for FreeBSD's powerd
============================================

Or, how I tamed the fan of my notebook
--------------------------------------

The `powerd` CPU frequency daemon provides userland P-State (power
state) switching since 2005. Multi Core Processing has come a long
way since 2005 and the increasing number of cores and pipelines in 
modern CPUs have exposed flaws in its design that were not obvious
at the time of its conception.

The paper/talk proposes three design changes, which were implemented
in the boringly named `powerd++`, to address these flaws.

The proposed talk and paper will present the three core differences
between `powerd` and the proposed design and benchmarking `powerd++`
vs. `powerd`. 

- [Blog](http://angryswarm.blogspot.com/2016/04/powerd-better-cpu-clock-control-for.html)
- [GitHub](https://github.com/lonkamikaze/powerdxx)

