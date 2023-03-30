# Vivado repository of IP

IP changed to properly cross clock domains. Also changed Makefiles to
actually work properly under both Windows and Linux.

Also contains the required clock-crossing constraints in cc_constraints.xdc.

Final implementation settings (right click on "implementation", then
"implementation settings"):

* opt_design : directive ExploreWithRemap
* place design : directive ExtraTimingOpt
* post-place phys opt design : directive AddRetime
* route design : directive AggressiveExplore

This leads to timing closure for me with good margin: the tightest
nets are all more than 60 percent route, so it doesn't need to work
super-hard.