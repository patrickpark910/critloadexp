1 RRR TRIGA Core - Malcolm McCarthy (2017-06-29)
c    __   ___  ___  __      __   ___  __   ___       __   __           __   ___       __  ___  __   __  
c   |__) |__  |__  |  \    |__) |__  /__` |__   /\  |__) /  ` |__|    |__) |__   /\  /  `  |  /  \ |__) 
c   |  \ |___ |___ |__/    |  \ |___ .__/ |___ /--\ |  \ \__, |  |    |  \ |___ /--\ \__,  |  \__/ |  \
c
c
c  Reed Research Reactor TRIGA input deck
c  Created by Malcolm McCarthy, SRO, Physics '18 (malcolm@malcolmm.com)
c  with help from Robert Shickler of Oregon State University
c  Edited by Patrick Park, RO, Physics '22 (ppark@reed.edu)
c  Base core geometry last updated: June 23, 2016
c
c  _____________________________________
c   Guide to reading the RRR input deck 
c
c   __________
c   Cell Cards 
c
c
c      The cell card identifiers are five-digit numbers.  The first two digits represent a region of the model:
c        
c         10 — Voids
c         11 - Upper and lower grid plate cells
c         12 - Graphite reflector and rotary specimen rack cells
c         13 - Water cells
c         14 - Central thimble cells
c         15 - 
c         16 - 
c         17 - Rabbit and in core facility cells
c         18 - Control rod cells
c         19 - Misc/general
c
c      The last three numbers of the cell card identifiers are arbitrary.
c
c
c
c      Note: The fuel cell cards identifiers are different than the rest of the cells.  
c      Their identifiers are five-digit numbers, ABBCC.
c      The first digit, A, represents the ring (2 through 6 denoting A through F), and next two digits, BB, represents the hole in the ring.
c      The last two digits, CC, are arbitrary.
c
c
c   
c   _____________
c   Surface Cards
c
c   The surface card identifiers are six-digit numbers, AABCDD.
c   The first two digits, AA, represent a region of the model:
c
c
c      10 - Voids
c
c
c   The second two digits, BC, represent the type of surface card:
c
c      Number  B  C
c
c      1       c  x
c      2       p  y
c      3       k  z
c      4       s  o
c
c
c
c   For example, if a surface's middle two digits are 12, it is a cy surface.
c   This enables the user to identify what type of surface the card is without having to scroll to the bottom of the deck.  
c   Cylindrical surfaces centered at the origin are organized from smallest to largest.  
c   Generally, x, y, and z, surfaces are organized east to west, south to north, and top to bottom respectively   (vet this)
c
c
c   Note: The fuel surface cards are different than the rest of the surfaces.  
c   The first two digits are 90 to denote the in-core area, but the last four digits are different.  
c   The third, fourth, and fifth digit represent the grid location in the core, the third digit representing the ring, 
c   and the fifth representing the hole (holes less than ten will use a zero for the fourth digit).  
c   The sixth digit will represent a cylinder, 0 being the zirconium rod, 3 being the outside of the fuel/graphite, and 9 being the outside of the cladding.  
c
c
c
c
c   __________
c   Data Cards
c
c   Material card identifiers are three digit numbers counting sequentially from 101.  
c   Fuel materials are five digit numbers, AAAAB, The first four digits representing the fuel element's serial number, the next representing which of five axial segments (one at the bottom and five at the top).
c   There is one fuel element with a 3 digit serial number which has only AAAB with the same meaning
c
c
c
c
c
c
c
c
c   --- todo ---
c   core support structure
c   center channel assy/beam
c   tank 
c   multicelled fuel burnup model (*)
c   lower grid plate water flow holes
c   guide tube holes
c   fix guide tube taper
c   fuel card generator for streamlined core configuration management (*)
c   more accurate top and tip fitting geometry (*)
c   rabbit system holes 
c
c
c
c
c
c
c
c
c
c
c
c
c -------- REPLACEMENT SURFACES FOR UNIVERSE 3-DIG TRANSFORMED SURFACE RESTRICTIONS ---------  
c
c    112302  -> TO -> 10
c    132303  -> TO -> 11
c    192300  -> TO -> 20
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c -----------------------------------------------------------------------------
c ---------------------------- CELL CARDS -------------------------------------
c -----------------------------------------------------------------------------
c --Begin Cells-- $ for NIST MCNP syntax
c
c
c
c ------------------------------
c -------- Core config ---------
c ------------------------------
c
c ------ fill = empty: 2, water: 18, graphite: 80, element replacement container (e.g. installed source): ??, fuel element: SN ------
c
c B ring
201 0 10 -11 -20 trcl=(0.00000  4.05384 0)      imp:n=1 fill=7202 $  
202 0 10 -11 -20 trcl=(3.51053  2.02692 0)      imp:n=1 fill=9678 $  
203 0 10 -11 -20 trcl=(3.51053 -2.02692 0)      imp:n=1 fill=9679 $  
204 0 10 -11 -20 trcl=( 0.00000 -4.05384 0)     imp:n=1 fill=7946 $  
205 0 10 -11 -20 trcl=(-3.51053 -2.02692 0)     imp:n=1 fill=7945 $  
206 0 10 -11 -20 trcl=(-3.51053  2.02692 0)     imp:n=1 fill=8104 $  
c
c C ring
301 0 10 -11 -20 trcl=( 0.00000  7.98068 0)     imp:n=1 fill=4086 $  
302 0 10 -11 -20 trcl=( 3.99034  6.91134 0)     imp:n=1 fill=4070 $  
303 0 10 -11 -20 trcl=( 6.91134  3.99034 0)     imp:n=1 fill=8102 $  
304 0 10 -11 -20 trcl=( 7.98068  0.00000 0)     imp:n=1 fill=3856 $  
306 0 10 -11 -20 trcl=( 3.99034 -6.91134 0)     imp:n=1 fill=8103 $  
307 0 10 -11 -20 trcl=( 0.00000 -7.98068 0)     imp:n=1 fill=4117 $  
308 0 10 -11 -20 trcl=(-3.99034 -6.91134 0)     imp:n=1 fill=8105 $  
310 0 10 -11 -20 trcl=(-7.98068  0.00000 0)     imp:n=1 fill=8736 $  
311 0 10 -11 -20 trcl=(-6.91130  3.99030 0)     imp:n=1 fill=8735 $  
312 0 10 -11 -20 trcl=(-3.99030  6.91130 0)     imp:n=1 fill=10705 $  
c
c D ring
401 0 10 -11 -20 trcl=( 0.00000  11.9456 0)     imp:n=1 fill=3679 $  
402 0 10 -11 -20 trcl=( 4.08530  11.2253 0)     imp:n=1 fill=8732 $  
403 0 10 -11 -20 trcl=( 7.67870  9.15040 0)     imp:n=1 fill=4103 $  
404 0 10 -11 -20 trcl=( 10.3449  5.97280 0)     imp:n=1 fill=8734 $  
405 0 10 -11 -20 trcl=( 11.7640  2.07370 0)     imp:n=1 fill=3685 $  
406 0 10 -11 -20 trcl=( 11.7640 -2.07370 0)     imp:n=1 fill=4095 $  
407 0 10 -11 -20 trcl=( 10.3449 -5.97280 0)     imp:n=1 fill=4104 $  
408 0 10 -11 -20 trcl=( 7.67870 -9.15040 0)     imp:n=1 fill=4054 $  
409 0 10 -11 -20 trcl=( 4.08530 -11.2253 0)     imp:n=1 fill=4118 $  
410 0 10 -11 -20 trcl=( 0.00000 -11.9456 0)     imp:n=1 fill=3677 $  
411 0 10 -11 -20 trcl=(-4.08530 -11.2253 0)     imp:n=1 fill=4131 $  
412 0 10 -11 -20 trcl=(-7.67870 -9.15040 0)     imp:n=1 fill=4065 $  
413 0 10 -11 -20 trcl=(-10.3449 -5.97280 0)     imp:n=1 fill=3851 $  
414 0 10 -11 -20 trcl=(-11.7640 -2.07370 0)     imp:n=1 fill=3866 $  
415 0 10 -11 -20 trcl=(-11.7640  2.07370 0)     imp:n=1 fill=8733 $  
416 0 10 -11 -20 trcl=(-10.3449  5.97280 0)     imp:n=1 fill=4094 $  
417 0 10 -11 -20 trcl=(-7.67870  9.15040 0)     imp:n=1 fill=4129 $  
418 0 10 -11 -20 trcl=(-4.08530  11.2253 0)     imp:n=1 fill=3874 $  
c
c E ring
502 0 10 -11 -20 trcl=( 4.1189000  15.372800 0) imp:n=1 fill=3872 $  
503 0 10 -11 -20 trcl=( 7.9578000  13.782800 0) imp:n=1 fill=4106 $  
504 0 10 -11 -20 trcl=( 11.254000  11.254000 0) imp:n=1 fill=3671 $  
505 0 10 -11 -20 trcl=( 13.874200  7.9578000 0) imp:n=1 fill=4062 $  
506 0 10 -11 -20 trcl=( 15.372800  4.1189000 0) imp:n=1 fill=4121 $  
507 0 10 -11 -20 trcl=( 15.915600  0.0000000 0) imp:n=1 fill=4114 $  
508 0 10 -11 -20 trcl=( 15.372800 -4.1189000 0) imp:n=1 fill=4077 $  
509 0 10 -11 -20 trcl=( 13.874200 -7.9578000 0) imp:n=1 fill=3674 $  
510 0 10 -11 -20 trcl=( 11.254000 -11.254000 0) imp:n=1 fill=4071 $  
511 0 10 -11 -20 trcl=( 7.9578000 -13.782800 0) imp:n=1 fill=4122 $  
512 0 10 -11 -20 trcl=( 4.1189000 -15.372800 0) imp:n=1 fill=4083 $  
513 0 10 -11 -20 trcl=( 0.0000000 -15.915600 0) imp:n=1 fill=3853 $  
514 0 10 -11 -20 trcl=(-4.1189000 -15.372800 0) imp:n=1 fill=4134 $  
515 0 10 -11 -20 trcl=(-7.9578000 -13.782800 0) imp:n=1 fill=4133 $  
516 0 10 -11 -20 trcl=(-11.254000 -11.254000 0) imp:n=1 fill=4085 $  
517 0 10 -11 -20 trcl=(-13.874200 -7.9578000 0) imp:n=1 fill=4110 $  
518 0 10 -11 -20 trcl=(-15.372800 -4.1189000 0) imp:n=1 fill=4055 $  
519 0 10 -11 -20 trcl=(-15.915600  0.0000000 0) imp:n=1 fill=3862 $  
520 0 10 -11 -20 trcl=(-15.372800  4.1189000 0) imp:n=1 fill=4064 $  
521 0 10 -11 -20 trcl=(-13.874200  7.9578000 0) imp:n=1 fill=3858 $  
522 0 10 -11 -20 trcl=(-11.254000  11.254000 0) imp:n=1 fill=4053 $  
523 0 10 -11 -20 trcl=(-7.9578000  13.782800 0) imp:n=1 fill=3748 $  
524 0 10 -11 -20 trcl=(-4.1189000  15.372800 0) imp:n=1 fill=3852 $  
c
c F ring
601 0 10 -11 -20 trcl=( 0.0000000  19.888200 0) imp:n=1 fill=4057 $  
602 0 10 -11 -20 trcl=( 4.1348660  19.452590 0) imp:n=1 fill=4125 $  
603 0 10 -11 -20 trcl=( 8.0886300  18.157860 0) imp:n=1 fill=4074 $  
604 0 10 -11 -20 trcl=( 11.690350  16.089630 0) imp:n=1 fill=4069 $  
605 0 10 -11 -20 trcl=( 14.778990  13.307314 0) imp:n=1 fill=4088 $  
606 0 10 -11 -20 trcl=( 17.223232  9.9441000 0) imp:n=1 fill=80 $  
607 0 10 -11 -20 trcl=( 18.915634  6.1455300 0) imp:n=1 fill=3868 $  
608 0 10 -11 -20 trcl=( 19.777202  2.0706080 0) imp:n=1 fill=4120 $  
c rabbit
610 0 10 -11 -20 trcl=( 18.915634 -6.1455300 0) imp:n=1 fill=80 $  
611 0 10 -11 -20 trcl=( 17.223232 -9.9441000 0) imp:n=1 fill=80 $  
612 0 10 -11 -20 trcl=( 14.778990 -13.307314 0) imp:n=1 fill=80 $  
613 0 10 -11 -20 trcl=( 11.690350 -16.089630 0) imp:n=1 fill=80 $  
614 0 10 -11 -20 trcl=( 8.0886300 -18.167858 0) imp:n=1 fill=3810 $  
615 0 10 -11 -20 trcl=( 4.1348660 -19.452590 0) imp:n=1 fill=4130 $  
616 0 10 -11 -20 trcl=( 0.0000000 -19.888200 0) imp:n=1 fill=4091 $  
617 0 10 -11 -20 trcl=(-4.1348660 -19.452590 0) imp:n=1 fill=3673 $  
618 0 10 -11 -20 trcl=(-8.0886300 -18.167858 0) imp:n=1 fill=3682 $  
619 0 10 -11 -20 trcl=(-11.690350 -16.089630 0) imp:n=1 fill=4132 $  
620 0 10 -11 -20 trcl=(-14.778990 -13.307314 0) imp:n=1 fill=4046 $  
621 0 10 -11 -20 trcl=(-17.223232 -9.9441000 0) imp:n=1 fill=3865 $  
622 0 10 -11 -20 trcl=(-18.915634 -6.1455300 0) imp:n=1 fill=3743 $  
623 0 10 -11 -20 trcl=(-19.777202 -2.0706080 0) imp:n=1 fill=80 $  
624 0 10 -11 -20 trcl=(-19.777202  2.0706080 0) imp:n=1 fill=3835 $  
625 0 10 -11 -20 trcl=(-18.915634  6.1455300 0) imp:n=1 fill=80 $  
626 0 10 -11 -20 trcl=(-17.223232  9.9441000 0) imp:n=1 fill=3676 $  
627 0 10 -11 -20 trcl=(-14.778990  13.307314 0) imp:n=1 fill=3840 $  
628 0 10 -11 -20 trcl=(-11.690350  16.089630 0) imp:n=1 fill=3854 $  
629 0 10 -11 -20 trcl=(-8.0886300  18.167858 0) imp:n=1 fill=4049 $  
630 0 10 -11 -20 trcl=(-4.1348660  19.452590 0) imp:n=1 fill=4127 $  
c
c
c
c
c
c
c
c
c ------------------------------
c --------- Universes ---------- TODO
c ------------------------------
c
c
c Graphite element (TOS210D120) universe
c
8001  104  -2.70     312300 -312301 -311302          imp:n=1 u=80  $ Lower grid plate pin
8002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=80  $ Water around lower grid plate pin
8003  104  -2.70     312301 -312302 -311305          imp:n=1 u=80  $ Bottom casing 
8004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=80  $ Water around element
8005  106  -1.56     312302 -312305 -311304          imp:n=1 u=80  $ Graphite slug
8006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=80  $ Element cladding
8007  104  -2.70     312305 -312306 -311305          imp:n=1 u=80  $ Al top cap
8008  104  -2.70     312306 -312307 -311303          imp:n=1 u=80  $ Tri-flute
8009  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=80  $ Water around tri-flute
8010  104  -2.70     312307 -312308 -311302          imp:n=1 u=80  $ Element tip
8011  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=80  $ Water around tip
8012  102  -1.00     312308 -312309 -311306          imp:n=1 u=80  $ Water above element
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c The following are universes based on 31X3XX surfaces defined in 'Fuel Surfaces' section
c 
c
c
c
c --- 18 - water universe ---
c
1801  102  -1.00     312300 -312301 -311302          imp:n=1 u=18  $ Lower grid plate pin
1802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=18  $ Water around grid plate pin 
1803  104  -1.00     312301 -312302 -311305          imp:n=1 u=18  $ Bottom casing 
1804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=18  $ Water around fuel element
1805  102  -1.56     312302 -312303 -311304          imp:n=1 u=18  $ Lower graphite slug 
1806  104  -1.00     312302 -312305  311304 -311305  imp:n=1 u=18  $ Fuel cladding
1807  108   0.042234 312303 -312304 -311301          imp:n=1 u=18  $ Zirc pin 
1808 102 -1.00 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=18 $ Fuel meat section 1
1809 102 -1.00 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=18 $ Fuel meat section 2
1810 102 -1.00 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=18 $ Fuel meat section 3
1811 102 -1.00 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=18 $ Fuel meat section 4
1812 102 -1.00 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=18 $ Fuel meat section 5
1813  102  -1.00     312304 -312305 -311304          imp:n=1 u=18  $ Upper graphite spacer
1814  102  -1.00     312305 -312306 -311305          imp:n=1 u=18  $ Al top cap 
1815  102  -1.00     312306 -312307 -311303          imp:n=1 u=18  $ Tri-flute 
1816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=18  $ Water around tri-flute 
1817  102  -1.00     312307 -312308 -311302          imp:n=1 u=18  $ Fuel tip
1818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=18  $ Water around fuel tip
1819  102  -1.00     312308 -312309 -311306          imp:n=1 u=18  $ Water above fuel element
c
c
c
c --- 3674 - Al (TOS210D130) universe ---
c
367401  104  -2.70     312300 -312301 -311302          imp:n=1 u=3674  $ Lower grid plate pin
367402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3674  $ Water around grid plate pin 
367403  104  -2.70     312301 -312302 -311305          imp:n=1 u=3674  $ Bottom casing 
367404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3674  $ Water around fuel element
367405  106  -1.56     312302 -312303 -311304          imp:n=1 u=3674  $ Lower graphite slug 
367406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3674  $ Fuel cladding
367407  108   0.042234 312303 -312304 -311301          imp:n=1 u=3674  $ Zirc pin 
367408 36741 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3674 $ Fuel meat section 1
367409 36742 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3674 $ Fuel meat section 2
367410 36743 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3674 $ Fuel meat section 3
367411 36744 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3674 $ Fuel meat section 4
367412 36745 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3674 $ Fuel meat section 5
367413  106  -1.56     312304 -312305 -311304          imp:n=1 u=3674  $ Upper graphite spacer
367414  104  -2.70     312305 -312306 -311305          imp:n=1 u=3674  $ Al top cap 
367415  104  -2.70     312306 -312307 -311303          imp:n=1 u=3674  $ Tri-flute 
367416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3674  $ Water around tri-flute 
367417  104  -2.70     312307 -312308 -311302          imp:n=1 u=3674  $ Fuel tip
367418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3674  $ Water around fuel tip
367419  102  -1.00     312308 -312309 -311306          imp:n=1 u=3674  $ Water above fuel element
c
c
c
c --- 8104 - Al (TOS210D130) universe ---
c
810401  104  -2.70     312300 -312301 -311302          imp:n=1 u=8104  $ Lower grid plate pin
810402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8104  $ Water around grid plate pin 
810403  104  -2.70     312301 -312302 -311305          imp:n=1 u=8104  $ Bottom casing 
810404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8104  $ Water around fuel element
810405  106  -1.56     312302 -312303 -311304          imp:n=1 u=8104  $ Lower graphite slug 
810406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=8104  $ Fuel cladding
810407  108   0.042234 312303 -312304 -311301          imp:n=1 u=8104  $ Zirc pin 
810408 81041 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8104 $ Fuel meat section 1
810409 81042 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8104 $ Fuel meat section 2
810410 81043 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8104 $ Fuel meat section 3
810411 81044 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8104 $ Fuel meat section 4
810412 81045 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8104 $ Fuel meat section 5
810413  106  -1.56     312304 -312305 -311304          imp:n=1 u=8104  $ Upper graphite spacer
810414  104  -2.70     312305 -312306 -311305          imp:n=1 u=8104  $ Al top cap 
810415  104  -2.70     312306 -312307 -311303          imp:n=1 u=8104  $ Tri-flute 
810416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8104  $ Water around tri-flute 
810417  104  -2.70     312307 -312308 -311302          imp:n=1 u=8104  $ Fuel tip
810418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8104  $ Water around fuel tip
810419  102  -1.00     312308 -312309 -311306          imp:n=1 u=8104  $ Water above fuel element
c
c
c
c --- 8733 - Al (TOS210D130) universe ---
c
873301  102  -1.00     312300 -312301 -311302          imp:n=1 u=8733  $ Lower grid plate pin
873302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8733  $ Water around grid plate pin 
873303  102  -1.00     312301 -312302 -311305          imp:n=1 u=8733  $ Bottom casing 
873304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8733  $ Water around fuel element
873305  102  -1.00     312302 -312303 -311304          imp:n=1 u=8733  $ Lower graphite slug 
873306  102  -1.00     312302 -312305  311304 -311305  imp:n=1 u=8733  $ Fuel cladding
873307  102   -1.00 312303 -312304 -311301          imp:n=1 u=8733  $ Zirc pin 
873308 102 -1.00 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8733 $ Fuel meat section 1
873309 102 -1.00 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8733 $ Fuel meat section 2
873310 102 -1.00 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8733 $ Fuel meat section 3
873311 102 -1.00 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8733 $ Fuel meat section 4
873312 102 -1.00 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8733 $ Fuel meat section 5
873313  102  -1.00     312304 -312305 -311304          imp:n=1 u=8733  $ Upper graphite spacer
873314  102  -1.00     312305 -312306 -311305          imp:n=1 u=8733  $ Al top cap 
873315  102  -1.00     312306 -312307 -311303          imp:n=1 u=8733  $ Tri-flute 
873316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8733  $ Water around tri-flute 
873317  102  -1.00     312307 -312308 -311302          imp:n=1 u=8733  $ Fuel tip
873318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8733  $ Water around fuel tip
873319  102  -1.00     312308 -312309 -311306          imp:n=1 u=8733  $ Water above fuel element
c
c
c
c --- 4106 - Al (TOS210D130) universe ---
c
410601  104  -2.70     312300 -312301 -311302          imp:n=1 u=4106  $ Lower grid plate pin
410602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4106  $ Water around grid plate pin 
410603  104  -2.70     312301 -312302 -311305          imp:n=1 u=4106  $ Bottom casing 
410604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4106  $ Water around fuel element
410605  106  -1.56     312302 -312303 -311304          imp:n=1 u=4106  $ Lower graphite slug 
410606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4106  $ Fuel cladding
410607  108   0.042234 312303 -312304 -311301          imp:n=1 u=4106  $ Zirc pin 
410608 41061 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4106 $ Fuel meat section 1
410609 41062 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4106 $ Fuel meat section 2
410610 41063 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4106 $ Fuel meat section 3
410611 41064 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4106 $ Fuel meat section 4
410612 41065 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4106 $ Fuel meat section 5
410613  106  -1.56     312304 -312305 -311304          imp:n=1 u=4106  $ Upper graphite spacer
410614  104  -2.70     312305 -312306 -311305          imp:n=1 u=4106  $ Al top cap 
410615  104  -2.70     312306 -312307 -311303          imp:n=1 u=4106  $ Tri-flute 
410616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4106  $ Water around tri-flute 
410617  104  -2.70     312307 -312308 -311302          imp:n=1 u=4106  $ Fuel tip
410618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4106  $ Water around fuel tip
410619  102  -1.00     312308 -312309 -311306          imp:n=1 u=4106  $ Water above fuel element
c
c
c
c --- 4117 - Al (TOS210D130) universe ---
c
411701  104  -2.70     312300 -312301 -311302          imp:n=1 u=4117  $ Lower grid plate pin
411702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4117  $ Water around grid plate pin 
411703  104  -2.70     312301 -312302 -311305          imp:n=1 u=4117  $ Bottom casing 
411704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4117  $ Water around fuel element
411705  106  -1.56     312302 -312303 -311304          imp:n=1 u=4117  $ Lower graphite slug 
411706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4117  $ Fuel cladding
411707  108   0.042234 312303 -312304 -311301          imp:n=1 u=4117  $ Zirc pin 
411708 41171 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4117 $ Fuel meat section 1
411709 41172 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4117 $ Fuel meat section 2
411710 41173 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4117 $ Fuel meat section 3
411711 41174 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4117 $ Fuel meat section 4
411712 41175 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4117 $ Fuel meat section 5
411713  106  -1.56     312304 -312305 -311304          imp:n=1 u=4117  $ Upper graphite spacer
411714  104  -2.70     312305 -312306 -311305          imp:n=1 u=4117  $ Al top cap 
411715  104  -2.70     312306 -312307 -311303          imp:n=1 u=4117  $ Tri-flute 
411716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4117  $ Water around tri-flute 
411717  104  -2.70     312307 -312308 -311302          imp:n=1 u=4117  $ Fuel tip
411718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4117  $ Water around fuel tip
411719  102  -1.00     312308 -312309 -311306          imp:n=1 u=4117  $ Water above fuel element
c
c
c
c --- 3671 - Al (TOS210D130) universe ---
c
367101  104  -2.70     312300 -312301 -311302          imp:n=1 u=3671  $ Lower grid plate pin
367102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3671  $ Water around grid plate pin 
367103  104  -2.70     312301 -312302 -311305          imp:n=1 u=3671  $ Bottom casing 
367104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3671  $ Water around fuel element
367105  106  -1.56     312302 -312303 -311304          imp:n=1 u=3671  $ Lower graphite slug 
367106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3671  $ Fuel cladding
367107  108   0.042234 312303 -312304 -311301          imp:n=1 u=3671  $ Zirc pin 
367108 36711 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3671 $ Fuel meat section 1
367109 36712 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3671 $ Fuel meat section 2
367110 36713 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3671 $ Fuel meat section 3
367111 36714 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3671 $ Fuel meat section 4
367112 36715 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3671 $ Fuel meat section 5
367113  106  -1.56     312304 -312305 -311304          imp:n=1 u=3671  $ Upper graphite spacer
367114  104  -2.70     312305 -312306 -311305          imp:n=1 u=3671  $ Al top cap 
367115  104  -2.70     312306 -312307 -311303          imp:n=1 u=3671  $ Tri-flute 
367116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3671  $ Water around tri-flute 
367117  104  -2.70     312307 -312308 -311302          imp:n=1 u=3671  $ Fuel tip
367118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3671  $ Water around fuel tip
367119  102  -1.00     312308 -312309 -311306          imp:n=1 u=3671  $ Water above fuel element
c
c
c
c --- 8732 - Al (TOS210D130) universe ---
c
873201  104  -2.70     312300 -312301 -311302          imp:n=1 u=8732  $ Lower grid plate pin
873202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8732  $ Water around grid plate pin 
873203  104  -2.70     312301 -312302 -311305          imp:n=1 u=8732  $ Bottom casing 
873204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8732  $ Water around fuel element
873205  106  -1.56     312302 -312303 -311304          imp:n=1 u=8732  $ Lower graphite slug 
873206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=8732  $ Fuel cladding
873207  108   0.042234 312303 -312304 -311301          imp:n=1 u=8732  $ Zirc pin 
873208 87321 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8732 $ Fuel meat section 1
873209 87322 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8732 $ Fuel meat section 2
873210 87323 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8732 $ Fuel meat section 3
873211 87324 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8732 $ Fuel meat section 4
873212 87325 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8732 $ Fuel meat section 5
873213  106  -1.56     312304 -312305 -311304          imp:n=1 u=8732  $ Upper graphite spacer
873214  104  -2.70     312305 -312306 -311305          imp:n=1 u=8732  $ Al top cap 
873215  104  -2.70     312306 -312307 -311303          imp:n=1 u=8732  $ Tri-flute 
873216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8732  $ Water around tri-flute 
873217  104  -2.70     312307 -312308 -311302          imp:n=1 u=8732  $ Fuel tip
873218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8732  $ Water around fuel tip
873219  102  -1.00     312308 -312309 -311306          imp:n=1 u=8732  $ Water above fuel element
c
c
c
c --- 8105 - Al (TOS210D130) universe ---
c
810501  104  -2.70     312300 -312301 -311302          imp:n=1 u=8105  $ Lower grid plate pin
810502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8105  $ Water around grid plate pin 
810503  104  -2.70     312301 -312302 -311305          imp:n=1 u=8105  $ Bottom casing 
810504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8105  $ Water around fuel element
810505  106  -1.56     312302 -312303 -311304          imp:n=1 u=8105  $ Lower graphite slug 
810506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=8105  $ Fuel cladding
810507  108   0.042234 312303 -312304 -311301          imp:n=1 u=8105  $ Zirc pin 
810508 81051 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8105 $ Fuel meat section 1
810509 81052 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8105 $ Fuel meat section 2
810510 81053 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8105 $ Fuel meat section 3
810511 81054 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8105 $ Fuel meat section 4
810512 81055 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8105 $ Fuel meat section 5
810513  106  -1.56     312304 -312305 -311304          imp:n=1 u=8105  $ Upper graphite spacer
810514  104  -2.70     312305 -312306 -311305          imp:n=1 u=8105  $ Al top cap 
810515  104  -2.70     312306 -312307 -311303          imp:n=1 u=8105  $ Tri-flute 
810516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8105  $ Water around tri-flute 
810517  104  -2.70     312307 -312308 -311302          imp:n=1 u=8105  $ Fuel tip
810518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8105  $ Water around fuel tip
810519  102  -1.00     312308 -312309 -311306          imp:n=1 u=8105  $ Water above fuel element
c
c
c
c --- 4062 - Al (TOS210D130) universe ---
c
406201  104  -2.70     312300 -312301 -311302          imp:n=1 u=4062  $ Lower grid plate pin
406202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4062  $ Water around grid plate pin 
406203  104  -2.70     312301 -312302 -311305          imp:n=1 u=4062  $ Bottom casing 
406204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4062  $ Water around fuel element
406205  106  -1.56     312302 -312303 -311304          imp:n=1 u=4062  $ Lower graphite slug 
406206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4062  $ Fuel cladding
406207  108   0.042234 312303 -312304 -311301          imp:n=1 u=4062  $ Zirc pin 
406208 40621 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4062 $ Fuel meat section 1
406209 40622 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4062 $ Fuel meat section 2
406210 40623 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4062 $ Fuel meat section 3
406211 40624 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4062 $ Fuel meat section 4
406212 40625 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4062 $ Fuel meat section 5
406213  106  -1.56     312304 -312305 -311304          imp:n=1 u=4062  $ Upper graphite spacer
406214  104  -2.70     312305 -312306 -311305          imp:n=1 u=4062  $ Al top cap 
406215  104  -2.70     312306 -312307 -311303          imp:n=1 u=4062  $ Tri-flute 
406216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4062  $ Water around tri-flute 
406217  104  -2.70     312307 -312308 -311302          imp:n=1 u=4062  $ Fuel tip
406218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4062  $ Water around fuel tip
406219  102  -1.00     312308 -312309 -311306          imp:n=1 u=4062  $ Water above fuel element
c
c
c
c --- 9678 - Al (TOS210D130) universe ---
c
967801  104  -2.70     312300 -312301 -311302          imp:n=1 u=9678  $ Lower grid plate pin
967802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=9678  $ Water around grid plate pin 
967803  104  -2.70     312301 -312302 -311305          imp:n=1 u=9678  $ Bottom casing 
967804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=9678  $ Water around fuel element
967805  106  -1.56     312302 -312303 -311304          imp:n=1 u=9678  $ Lower graphite slug 
967806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=9678  $ Fuel cladding
967807  108   0.042234 312303 -312304 -311301          imp:n=1 u=9678  $ Zirc pin 
967808 96781 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=9678 $ Fuel meat section 1
967809 96782 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=9678 $ Fuel meat section 2
967810 96783 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=9678 $ Fuel meat section 3
967811 96784 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=9678 $ Fuel meat section 4
967812 96785 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=9678 $ Fuel meat section 5
967813  106  -1.56     312304 -312305 -311304          imp:n=1 u=9678  $ Upper graphite spacer
967814  104  -2.70     312305 -312306 -311305          imp:n=1 u=9678  $ Al top cap 
967815  104  -2.70     312306 -312307 -311303          imp:n=1 u=9678  $ Tri-flute 
967816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=9678  $ Water around tri-flute 
967817  104  -2.70     312307 -312308 -311302          imp:n=1 u=9678  $ Fuel tip
967818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=9678  $ Water around fuel tip
967819  102  -1.00     312308 -312309 -311306          imp:n=1 u=9678  $ Water above fuel element
c
c
c
c --- 4103 - Al (TOS210D130) universe ---
c
410301  104  -2.70     312300 -312301 -311302          imp:n=1 u=4103  $ Lower grid plate pin
410302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4103  $ Water around grid plate pin 
410303  104  -2.70     312301 -312302 -311305          imp:n=1 u=4103  $ Bottom casing 
410304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4103  $ Water around fuel element
410305  106  -1.56     312302 -312303 -311304          imp:n=1 u=4103  $ Lower graphite slug 
410306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4103  $ Fuel cladding
410307  108   0.042234 312303 -312304 -311301          imp:n=1 u=4103  $ Zirc pin 
410308 41031 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4103 $ Fuel meat section 1
410309 41032 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4103 $ Fuel meat section 2
410310 41033 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4103 $ Fuel meat section 3
410311 41034 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4103 $ Fuel meat section 4
410312 41035 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4103 $ Fuel meat section 5
410313  106  -1.56     312304 -312305 -311304          imp:n=1 u=4103  $ Upper graphite spacer
410314  104  -2.70     312305 -312306 -311305          imp:n=1 u=4103  $ Al top cap 
410315  104  -2.70     312306 -312307 -311303          imp:n=1 u=4103  $ Tri-flute 
410316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4103  $ Water around tri-flute 
410317  104  -2.70     312307 -312308 -311302          imp:n=1 u=4103  $ Fuel tip
410318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4103  $ Water around fuel tip
410319  102  -1.00     312308 -312309 -311306          imp:n=1 u=4103  $ Water above fuel element
c
c
c
c --- 9679 - Al (TOS210D130) universe ---
c
967901  104  -2.70     312300 -312301 -311302          imp:n=1 u=9679  $ Lower grid plate pin
967902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=9679  $ Water around grid plate pin 
967903  104  -2.70     312301 -312302 -311305          imp:n=1 u=9679  $ Bottom casing 
967904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=9679  $ Water around fuel element
967905  106  -1.56     312302 -312303 -311304          imp:n=1 u=9679  $ Lower graphite slug 
967906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=9679  $ Fuel cladding
967907  108   0.042234 312303 -312304 -311301          imp:n=1 u=9679  $ Zirc pin 
967908 96791 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=9679 $ Fuel meat section 1
967909 96792 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=9679 $ Fuel meat section 2
967910 96793 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=9679 $ Fuel meat section 3
967911 96794 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=9679 $ Fuel meat section 4
967912 96795 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=9679 $ Fuel meat section 5
967913  106  -1.56     312304 -312305 -311304          imp:n=1 u=9679  $ Upper graphite spacer
967914  104  -2.70     312305 -312306 -311305          imp:n=1 u=9679  $ Al top cap 
967915  104  -2.70     312306 -312307 -311303          imp:n=1 u=9679  $ Tri-flute 
967916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=9679  $ Water around tri-flute 
967917  104  -2.70     312307 -312308 -311302          imp:n=1 u=9679  $ Fuel tip
967918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=9679  $ Water around fuel tip
967919  102  -1.00     312308 -312309 -311306          imp:n=1 u=9679  $ Water above fuel element
c
c
c
c --- 8736 - Al (TOS210D130) universe ---
c
873601  102  -1.00     312300 -312301 -311302          imp:n=1 u=8736  $ Lower grid plate pin
873602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8736  $ Water around grid plate pin 
873603  102  -1.00     312301 -312302 -311305          imp:n=1 u=8736  $ Bottom casing 
873604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8736  $ Water around fuel element
873605  102  -1.00     312302 -312303 -311304          imp:n=1 u=8736  $ Lower graphite slug 
873606  102  -1.00     312302 -312305  311304 -311305  imp:n=1 u=8736  $ Fuel cladding
873607  102   -1.00 312303 -312304 -311301          imp:n=1 u=8736  $ Zirc pin 
873608 102 -1.00 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8736 $ Fuel meat section 1
873609 102 -1.00 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8736 $ Fuel meat section 2
873610 102 -1.00 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8736 $ Fuel meat section 3
873611 102 -1.00 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8736 $ Fuel meat section 4
873612 102 -1.00 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8736 $ Fuel meat section 5
873613  102  -1.00     312304 -312305 -311304          imp:n=1 u=8736  $ Upper graphite spacer
873614  102  -1.00     312305 -312306 -311305          imp:n=1 u=8736  $ Al top cap 
873615  102  -1.00     312306 -312307 -311303          imp:n=1 u=8736  $ Tri-flute 
873616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8736  $ Water around tri-flute 
873617  102  -1.00     312307 -312308 -311302          imp:n=1 u=8736  $ Fuel tip
873618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8736  $ Water around fuel tip
873619  102  -1.00     312308 -312309 -311306          imp:n=1 u=8736  $ Water above fuel element
c
c
c
c --- 8734 - Al (TOS210D130) universe ---
c
873401  104  -2.70     312300 -312301 -311302          imp:n=1 u=8734  $ Lower grid plate pin
873402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8734  $ Water around grid plate pin 
873403  104  -2.70     312301 -312302 -311305          imp:n=1 u=8734  $ Bottom casing 
873404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8734  $ Water around fuel element
873405  106  -1.56     312302 -312303 -311304          imp:n=1 u=8734  $ Lower graphite slug 
873406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=8734  $ Fuel cladding
873407  108   0.042234 312303 -312304 -311301          imp:n=1 u=8734  $ Zirc pin 
873408 87341 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8734 $ Fuel meat section 1
873409 87342 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8734 $ Fuel meat section 2
873410 87343 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8734 $ Fuel meat section 3
873411 87344 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8734 $ Fuel meat section 4
873412 87345 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8734 $ Fuel meat section 5
873413  106  -1.56     312304 -312305 -311304          imp:n=1 u=8734  $ Upper graphite spacer
873414  104  -2.70     312305 -312306 -311305          imp:n=1 u=8734  $ Al top cap 
873415  104  -2.70     312306 -312307 -311303          imp:n=1 u=8734  $ Tri-flute 
873416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8734  $ Water around tri-flute 
873417  104  -2.70     312307 -312308 -311302          imp:n=1 u=8734  $ Fuel tip
873418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8734  $ Water around fuel tip
873419  102  -1.00     312308 -312309 -311306          imp:n=1 u=8734  $ Water above fuel element
c
c
c
c --- 4121 - Al (TOS210D130) universe ---
c
412101  104  -2.70     312300 -312301 -311302          imp:n=1 u=4121  $ Lower grid plate pin
412102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4121  $ Water around grid plate pin 
412103  104  -2.70     312301 -312302 -311305          imp:n=1 u=4121  $ Bottom casing 
412104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4121  $ Water around fuel element
412105  106  -1.56     312302 -312303 -311304          imp:n=1 u=4121  $ Lower graphite slug 
412106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4121  $ Fuel cladding
412107  108   0.042234 312303 -312304 -311301          imp:n=1 u=4121  $ Zirc pin 
412108 41211 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4121 $ Fuel meat section 1
412109 41212 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4121 $ Fuel meat section 2
412110 41213 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4121 $ Fuel meat section 3
412111 41214 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4121 $ Fuel meat section 4
412112 41215 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4121 $ Fuel meat section 5
412113  106  -1.56     312304 -312305 -311304          imp:n=1 u=4121  $ Upper graphite spacer
412114  104  -2.70     312305 -312306 -311305          imp:n=1 u=4121  $ Al top cap 
412115  104  -2.70     312306 -312307 -311303          imp:n=1 u=4121  $ Tri-flute 
412116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4121  $ Water around tri-flute 
412117  104  -2.70     312307 -312308 -311302          imp:n=1 u=4121  $ Fuel tip
412118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4121  $ Water around fuel tip
412119  102  -1.00     312308 -312309 -311306          imp:n=1 u=4121  $ Water above fuel element
c
c
c
c --- 10705 - Al (TOS210D130) universe ---
c
1070501  104  -2.70     312300 -312301 -311302          imp:n=1 u=10705  $ Lower grid plate pin
1070502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=10705  $ Water around grid plate pin 
1070503  104  -2.70     312301 -312302 -311305          imp:n=1 u=10705  $ Bottom casing 
1070504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=10705  $ Water around fuel element
1070505  106  -1.56     312302 -312303 -311304          imp:n=1 u=10705  $ Lower graphite slug 
1070506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=10705  $ Fuel cladding
1070507  108   0.042234 312303 -312304 -311301          imp:n=1 u=10705  $ Zirc pin 
1070508 107051 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=10705 $ Fuel meat section 1
1070509 107052 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=10705 $ Fuel meat section 2
1070510 107053 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=10705 $ Fuel meat section 3
1070511 107054 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=10705 $ Fuel meat section 4
1070512 107055 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=10705 $ Fuel meat section 5
1070513  106  -1.56     312304 -312305 -311304          imp:n=1 u=10705  $ Upper graphite spacer
1070514  104  -2.70     312305 -312306 -311305          imp:n=1 u=10705  $ Al top cap 
1070515  104  -2.70     312306 -312307 -311303          imp:n=1 u=10705  $ Tri-flute 
1070516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=10705  $ Water around tri-flute 
1070517  104  -2.70     312307 -312308 -311302          imp:n=1 u=10705  $ Fuel tip
1070518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=10705  $ Water around fuel tip
1070519  102  -1.00     312308 -312309 -311306          imp:n=1 u=10705  $ Water above fuel element
c
c
c
c --- 3685 - Al (TOS210D130) universe ---
c
368501  104  -2.70     312300 -312301 -311302          imp:n=1 u=3685  $ Lower grid plate pin
368502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3685  $ Water around grid plate pin 
368503  104  -2.70     312301 -312302 -311305          imp:n=1 u=3685  $ Bottom casing 
368504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3685  $ Water around fuel element
368505  106  -1.56     312302 -312303 -311304          imp:n=1 u=3685  $ Lower graphite slug 
368506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3685  $ Fuel cladding
368507  108   0.042234 312303 -312304 -311301          imp:n=1 u=3685  $ Zirc pin 
368508 36851 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3685 $ Fuel meat section 1
368509 36852 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3685 $ Fuel meat section 2
368510 36853 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3685 $ Fuel meat section 3
368511 36854 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3685 $ Fuel meat section 4
368512 36855 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3685 $ Fuel meat section 5
368513  106  -1.56     312304 -312305 -311304          imp:n=1 u=3685  $ Upper graphite spacer
368514  104  -2.70     312305 -312306 -311305          imp:n=1 u=3685  $ Al top cap 
368515  104  -2.70     312306 -312307 -311303          imp:n=1 u=3685  $ Tri-flute 
368516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3685  $ Water around tri-flute 
368517  104  -2.70     312307 -312308 -311302          imp:n=1 u=3685  $ Fuel tip
368518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3685  $ Water around fuel tip
368519  102  -1.00     312308 -312309 -311306          imp:n=1 u=3685  $ Water above fuel element
c
c
c
c --- 4095 - Al (TOS210D130) universe ---
c
409501  104  -2.70     312300 -312301 -311302          imp:n=1 u=4095  $ Lower grid plate pin
409502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4095  $ Water around grid plate pin 
409503  104  -2.70     312301 -312302 -311305          imp:n=1 u=4095  $ Bottom casing 
409504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4095  $ Water around fuel element
409505  106  -1.56     312302 -312303 -311304          imp:n=1 u=4095  $ Lower graphite slug 
409506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4095  $ Fuel cladding
409507  108   0.042234 312303 -312304 -311301          imp:n=1 u=4095  $ Zirc pin 
409508 40951 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4095 $ Fuel meat section 1
409509 40952 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4095 $ Fuel meat section 2
409510 40953 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4095 $ Fuel meat section 3
409511 40954 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4095 $ Fuel meat section 4
409512 40955 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4095 $ Fuel meat section 5
409513  106  -1.56     312304 -312305 -311304          imp:n=1 u=4095  $ Upper graphite spacer
409514  104  -2.70     312305 -312306 -311305          imp:n=1 u=4095  $ Al top cap 
409515  104  -2.70     312306 -312307 -311303          imp:n=1 u=4095  $ Tri-flute 
409516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4095  $ Water around tri-flute 
409517  104  -2.70     312307 -312308 -311302          imp:n=1 u=4095  $ Fuel tip
409518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4095  $ Water around fuel tip
409519  102  -1.00     312308 -312309 -311306          imp:n=1 u=4095  $ Water above fuel element
c
c
c
c --- 4086 - Al (TOS210D130) universe ---
c
408601  104  -2.70     312300 -312301 -311302          imp:n=1 u=4086  $ Lower grid plate pin
408602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4086  $ Water around grid plate pin 
408603  104  -2.70     312301 -312302 -311305          imp:n=1 u=4086  $ Bottom casing 
408604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4086  $ Water around fuel element
408605  106  -1.56     312302 -312303 -311304          imp:n=1 u=4086  $ Lower graphite slug 
408606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4086  $ Fuel cladding
408607  108   0.042234 312303 -312304 -311301          imp:n=1 u=4086  $ Zirc pin 
408608 40861 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4086 $ Fuel meat section 1
408609 40862 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4086 $ Fuel meat section 2
408610 40863 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4086 $ Fuel meat section 3
408611 40864 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4086 $ Fuel meat section 4
408612 40865 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4086 $ Fuel meat section 5
408613  106  -1.56     312304 -312305 -311304          imp:n=1 u=4086  $ Upper graphite spacer
408614  104  -2.70     312305 -312306 -311305          imp:n=1 u=4086  $ Al top cap 
408615  104  -2.70     312306 -312307 -311303          imp:n=1 u=4086  $ Tri-flute 
408616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4086  $ Water around tri-flute 
408617  104  -2.70     312307 -312308 -311302          imp:n=1 u=4086  $ Fuel tip
408618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4086  $ Water around fuel tip
408619  102  -1.00     312308 -312309 -311306          imp:n=1 u=4086  $ Water above fuel element
c
c
c
c --- 7202 - Al (TOS210D130) universe ---
c
720201  104  -2.70     312300 -312301 -311302          imp:n=1 u=7202  $ Lower grid plate pin
720202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=7202  $ Water around grid plate pin 
720203  104  -2.70     312301 -312302 -311305          imp:n=1 u=7202  $ Bottom casing 
720204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=7202  $ Water around fuel element
720205  106  -1.56     312302 -312303 -311304          imp:n=1 u=7202  $ Lower graphite slug 
720206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=7202  $ Fuel cladding
720207  108   0.042234 312303 -312304 -311301          imp:n=1 u=7202  $ Zirc pin 
720208 72021 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=7202 $ Fuel meat section 1
720209 72022 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=7202 $ Fuel meat section 2
720210 72023 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=7202 $ Fuel meat section 3
720211 72024 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=7202 $ Fuel meat section 4
720212 72025 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=7202 $ Fuel meat section 5
720213  106  -1.56     312304 -312305 -311304          imp:n=1 u=7202  $ Upper graphite spacer
720214  104  -2.70     312305 -312306 -311305          imp:n=1 u=7202  $ Al top cap 
720215  104  -2.70     312306 -312307 -311303          imp:n=1 u=7202  $ Tri-flute 
720216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=7202  $ Water around tri-flute 
720217  104  -2.70     312307 -312308 -311302          imp:n=1 u=7202  $ Fuel tip
720218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=7202  $ Water around fuel tip
720219  102  -1.00     312308 -312309 -311306          imp:n=1 u=7202  $ Water above fuel element
c
c
c
c --- 4114 - Al (TOS210D130) universe ---
c
411401  104  -2.70     312300 -312301 -311302          imp:n=1 u=4114  $ Lower grid plate pin
411402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4114  $ Water around grid plate pin 
411403  104  -2.70     312301 -312302 -311305          imp:n=1 u=4114  $ Bottom casing 
411404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4114  $ Water around fuel element
411405  106  -1.56     312302 -312303 -311304          imp:n=1 u=4114  $ Lower graphite slug 
411406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4114  $ Fuel cladding
411407  108   0.042234 312303 -312304 -311301          imp:n=1 u=4114  $ Zirc pin 
411408 41141 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4114 $ Fuel meat section 1
411409 41142 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4114 $ Fuel meat section 2
411410 41143 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4114 $ Fuel meat section 3
411411 41144 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4114 $ Fuel meat section 4
411412 41145 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4114 $ Fuel meat section 5
411413  106  -1.56     312304 -312305 -311304          imp:n=1 u=4114  $ Upper graphite spacer
411414  104  -2.70     312305 -312306 -311305          imp:n=1 u=4114  $ Al top cap 
411415  104  -2.70     312306 -312307 -311303          imp:n=1 u=4114  $ Tri-flute 
411416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4114  $ Water around tri-flute 
411417  104  -2.70     312307 -312308 -311302          imp:n=1 u=4114  $ Fuel tip
411418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4114  $ Water around fuel tip
411419  102  -1.00     312308 -312309 -311306          imp:n=1 u=4114  $ Water above fuel element
c
c
c
c --- 4077 - Al (TOS210D130) universe ---
c
407701  104  -2.70     312300 -312301 -311302          imp:n=1 u=4077  $ Lower grid plate pin
407702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4077  $ Water around grid plate pin 
407703  104  -2.70     312301 -312302 -311305          imp:n=1 u=4077  $ Bottom casing 
407704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4077  $ Water around fuel element
407705  106  -1.56     312302 -312303 -311304          imp:n=1 u=4077  $ Lower graphite slug 
407706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4077  $ Fuel cladding
407707  108   0.042234 312303 -312304 -311301          imp:n=1 u=4077  $ Zirc pin 
407708 40771 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4077 $ Fuel meat section 1
407709 40772 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4077 $ Fuel meat section 2
407710 40773 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4077 $ Fuel meat section 3
407711 40774 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4077 $ Fuel meat section 4
407712 40775 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4077 $ Fuel meat section 5
407713  106  -1.56     312304 -312305 -311304          imp:n=1 u=4077  $ Upper graphite spacer
407714  104  -2.70     312305 -312306 -311305          imp:n=1 u=4077  $ Al top cap 
407715  104  -2.70     312306 -312307 -311303          imp:n=1 u=4077  $ Tri-flute 
407716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4077  $ Water around tri-flute 
407717  104  -2.70     312307 -312308 -311302          imp:n=1 u=4077  $ Fuel tip
407718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4077  $ Water around fuel tip
407719  102  -1.00     312308 -312309 -311306          imp:n=1 u=4077  $ Water above fuel element
c
c
c
c --- 4070 - Al (TOS210D130) universe ---
c
407001  104  -2.70     312300 -312301 -311302          imp:n=1 u=4070  $ Lower grid plate pin
407002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4070  $ Water around grid plate pin 
407003  104  -2.70     312301 -312302 -311305          imp:n=1 u=4070  $ Bottom casing 
407004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4070  $ Water around fuel element
407005  106  -1.56     312302 -312303 -311304          imp:n=1 u=4070  $ Lower graphite slug 
407006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4070  $ Fuel cladding
407007  108   0.042234 312303 -312304 -311301          imp:n=1 u=4070  $ Zirc pin 
407008 40701 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4070 $ Fuel meat section 1
407009 40702 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4070 $ Fuel meat section 2
407010 40703 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4070 $ Fuel meat section 3
407011 40704 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4070 $ Fuel meat section 4
407012 40705 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4070 $ Fuel meat section 5
407013  106  -1.56     312304 -312305 -311304          imp:n=1 u=4070  $ Upper graphite spacer
407014  104  -2.70     312305 -312306 -311305          imp:n=1 u=4070  $ Al top cap 
407015  104  -2.70     312306 -312307 -311303          imp:n=1 u=4070  $ Tri-flute 
407016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4070  $ Water around tri-flute 
407017  104  -2.70     312307 -312308 -311302          imp:n=1 u=4070  $ Fuel tip
407018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4070  $ Water around fuel tip
407019  102  -1.00     312308 -312309 -311306          imp:n=1 u=4070  $ Water above fuel element
c
c
c
c --- 4104 - Al (TOS210D130) universe ---
c
410401  104  -2.70     312300 -312301 -311302          imp:n=1 u=4104  $ Lower grid plate pin
410402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4104  $ Water around grid plate pin 
410403  104  -2.70     312301 -312302 -311305          imp:n=1 u=4104  $ Bottom casing 
410404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4104  $ Water around fuel element
410405  106  -1.56     312302 -312303 -311304          imp:n=1 u=4104  $ Lower graphite slug 
410406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4104  $ Fuel cladding
410407  108   0.042234 312303 -312304 -311301          imp:n=1 u=4104  $ Zirc pin 
410408 41041 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4104 $ Fuel meat section 1
410409 41042 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4104 $ Fuel meat section 2
410410 41043 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4104 $ Fuel meat section 3
410411 41044 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4104 $ Fuel meat section 4
410412 41045 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4104 $ Fuel meat section 5
410413  106  -1.56     312304 -312305 -311304          imp:n=1 u=4104  $ Upper graphite spacer
410414  104  -2.70     312305 -312306 -311305          imp:n=1 u=4104  $ Al top cap 
410415  104  -2.70     312306 -312307 -311303          imp:n=1 u=4104  $ Tri-flute 
410416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4104  $ Water around tri-flute 
410417  104  -2.70     312307 -312308 -311302          imp:n=1 u=4104  $ Fuel tip
410418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4104  $ Water around fuel tip
410419  102  -1.00     312308 -312309 -311306          imp:n=1 u=4104  $ Water above fuel element
c
c
c
c --- 3679 - Al (TOS210D130) universe ---
c
367901  104  -2.70     312300 -312301 -311302          imp:n=1 u=3679  $ Lower grid plate pin
367902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3679  $ Water around grid plate pin 
367903  104  -2.70     312301 -312302 -311305          imp:n=1 u=3679  $ Bottom casing 
367904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3679  $ Water around fuel element
367905  106  -1.56     312302 -312303 -311304          imp:n=1 u=3679  $ Lower graphite slug 
367906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3679  $ Fuel cladding
367907  108   0.042234 312303 -312304 -311301          imp:n=1 u=3679  $ Zirc pin 
367908 36791 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3679 $ Fuel meat section 1
367909 36792 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3679 $ Fuel meat section 2
367910 36793 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3679 $ Fuel meat section 3
367911 36794 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3679 $ Fuel meat section 4
367912 36795 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3679 $ Fuel meat section 5
367913  106  -1.56     312304 -312305 -311304          imp:n=1 u=3679  $ Upper graphite spacer
367914  104  -2.70     312305 -312306 -311305          imp:n=1 u=3679  $ Al top cap 
367915  104  -2.70     312306 -312307 -311303          imp:n=1 u=3679  $ Tri-flute 
367916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3679  $ Water around tri-flute 
367917  104  -2.70     312307 -312308 -311302          imp:n=1 u=3679  $ Fuel tip
367918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3679  $ Water around fuel tip
367919  102  -1.00     312308 -312309 -311306          imp:n=1 u=3679  $ Water above fuel element
c
c
c
c --- 8102 - Al (TOS210D130) universe ---
c
810201  104  -2.70     312300 -312301 -311302          imp:n=1 u=8102  $ Lower grid plate pin
810202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8102  $ Water around grid plate pin 
810203  104  -2.70     312301 -312302 -311305          imp:n=1 u=8102  $ Bottom casing 
810204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8102  $ Water around fuel element
810205  106  -1.56     312302 -312303 -311304          imp:n=1 u=8102  $ Lower graphite slug 
810206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=8102  $ Fuel cladding
810207  108   0.042234 312303 -312304 -311301          imp:n=1 u=8102  $ Zirc pin 
810208 81021 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8102 $ Fuel meat section 1
810209 81022 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8102 $ Fuel meat section 2
810210 81023 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8102 $ Fuel meat section 3
810211 81024 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8102 $ Fuel meat section 4
810212 81025 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8102 $ Fuel meat section 5
810213  106  -1.56     312304 -312305 -311304          imp:n=1 u=8102  $ Upper graphite spacer
810214  104  -2.70     312305 -312306 -311305          imp:n=1 u=8102  $ Al top cap 
810215  104  -2.70     312306 -312307 -311303          imp:n=1 u=8102  $ Tri-flute 
810216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8102  $ Water around tri-flute 
810217  104  -2.70     312307 -312308 -311302          imp:n=1 u=8102  $ Fuel tip
810218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8102  $ Water around fuel tip
810219  102  -1.00     312308 -312309 -311306          imp:n=1 u=8102  $ Water above fuel element
c
c
c
c --- 4054 - Al (TOS210D130) universe ---
c
405401  104  -2.70     312300 -312301 -311302          imp:n=1 u=4054  $ Lower grid plate pin
405402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4054  $ Water around grid plate pin 
405403  104  -2.70     312301 -312302 -311305          imp:n=1 u=4054  $ Bottom casing 
405404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4054  $ Water around fuel element
405405  106  -1.56     312302 -312303 -311304          imp:n=1 u=4054  $ Lower graphite slug 
405406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4054  $ Fuel cladding
405407  108   0.042234 312303 -312304 -311301          imp:n=1 u=4054  $ Zirc pin 
405408 40541 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4054 $ Fuel meat section 1
405409 40542 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4054 $ Fuel meat section 2
405410 40543 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4054 $ Fuel meat section 3
405411 40544 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4054 $ Fuel meat section 4
405412 40545 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4054 $ Fuel meat section 5
405413  106  -1.56     312304 -312305 -311304          imp:n=1 u=4054  $ Upper graphite spacer
405414  104  -2.70     312305 -312306 -311305          imp:n=1 u=4054  $ Al top cap 
405415  104  -2.70     312306 -312307 -311303          imp:n=1 u=4054  $ Tri-flute 
405416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4054  $ Water around tri-flute 
405417  104  -2.70     312307 -312308 -311302          imp:n=1 u=4054  $ Fuel tip
405418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4054  $ Water around fuel tip
405419  102  -1.00     312308 -312309 -311306          imp:n=1 u=4054  $ Water above fuel element
c
c
c
c --- 4122 - Al (TOS210D130) universe ---
c
412201  104  -2.70     312300 -312301 -311302          imp:n=1 u=4122  $ Lower grid plate pin
412202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4122  $ Water around grid plate pin 
412203  104  -2.70     312301 -312302 -311305          imp:n=1 u=4122  $ Bottom casing 
412204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4122  $ Water around fuel element
412205  106  -1.56     312302 -312303 -311304          imp:n=1 u=4122  $ Lower graphite slug 
412206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4122  $ Fuel cladding
412207  108   0.042234 312303 -312304 -311301          imp:n=1 u=4122  $ Zirc pin 
412208 41221 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4122 $ Fuel meat section 1
412209 41222 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4122 $ Fuel meat section 2
412210 41223 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4122 $ Fuel meat section 3
412211 41224 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4122 $ Fuel meat section 4
412212 41225 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4122 $ Fuel meat section 5
412213  106  -1.56     312304 -312305 -311304          imp:n=1 u=4122  $ Upper graphite spacer
412214  104  -2.70     312305 -312306 -311305          imp:n=1 u=4122  $ Al top cap 
412215  104  -2.70     312306 -312307 -311303          imp:n=1 u=4122  $ Tri-flute 
412216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4122  $ Water around tri-flute 
412217  104  -2.70     312307 -312308 -311302          imp:n=1 u=4122  $ Fuel tip
412218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4122  $ Water around fuel tip
412219  102  -1.00     312308 -312309 -311306          imp:n=1 u=4122  $ Water above fuel element
c
c
c
c --- 4118 - Al (TOS210D130) universe ---
c
411801  104  -2.70     312300 -312301 -311302          imp:n=1 u=4118  $ Lower grid plate pin
411802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4118  $ Water around grid plate pin 
411803  104  -2.70     312301 -312302 -311305          imp:n=1 u=4118  $ Bottom casing 
411804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4118  $ Water around fuel element
411805  106  -1.56     312302 -312303 -311304          imp:n=1 u=4118  $ Lower graphite slug 
411806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4118  $ Fuel cladding
411807  108   0.042234 312303 -312304 -311301          imp:n=1 u=4118  $ Zirc pin 
411808 41181 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4118 $ Fuel meat section 1
411809 41182 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4118 $ Fuel meat section 2
411810 41183 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4118 $ Fuel meat section 3
411811 41184 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4118 $ Fuel meat section 4
411812 41185 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4118 $ Fuel meat section 5
411813  106  -1.56     312304 -312305 -311304          imp:n=1 u=4118  $ Upper graphite spacer
411814  104  -2.70     312305 -312306 -311305          imp:n=1 u=4118  $ Al top cap 
411815  104  -2.70     312306 -312307 -311303          imp:n=1 u=4118  $ Tri-flute 
411816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4118  $ Water around tri-flute 
411817  104  -2.70     312307 -312308 -311302          imp:n=1 u=4118  $ Fuel tip
411818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4118  $ Water around fuel tip
411819  102  -1.00     312308 -312309 -311306          imp:n=1 u=4118  $ Water above fuel element
c
c
c
c --- 3872 - Al (TOS210D130) universe ---
c
387201  104  -2.70     312300 -312301 -311302          imp:n=1 u=3872  $ Lower grid plate pin
387202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3872  $ Water around grid plate pin 
387203  104  -2.70     312301 -312302 -311305          imp:n=1 u=3872  $ Bottom casing 
387204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3872  $ Water around fuel element
387205  106  -1.56     312302 -312303 -311304          imp:n=1 u=3872  $ Lower graphite slug 
387206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3872  $ Fuel cladding
387207  108   0.042234 312303 -312304 -311301          imp:n=1 u=3872  $ Zirc pin 
387208 38721 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3872 $ Fuel meat section 1
387209 38722 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3872 $ Fuel meat section 2
387210 38723 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3872 $ Fuel meat section 3
387211 38724 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3872 $ Fuel meat section 4
387212 38725 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3872 $ Fuel meat section 5
387213  106  -1.56     312304 -312305 -311304          imp:n=1 u=3872  $ Upper graphite spacer
387214  104  -2.70     312305 -312306 -311305          imp:n=1 u=3872  $ Al top cap 
387215  104  -2.70     312306 -312307 -311303          imp:n=1 u=3872  $ Tri-flute 
387216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3872  $ Water around tri-flute 
387217  104  -2.70     312307 -312308 -311302          imp:n=1 u=3872  $ Fuel tip
387218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3872  $ Water around fuel tip
387219  102  -1.00     312308 -312309 -311306          imp:n=1 u=3872  $ Water above fuel element
c
c
c
c --- 4083 - Al (TOS210D130) universe ---
c
408301  104  -2.70     312300 -312301 -311302          imp:n=1 u=4083  $ Lower grid plate pin
408302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4083  $ Water around grid plate pin 
408303  104  -2.70     312301 -312302 -311305          imp:n=1 u=4083  $ Bottom casing 
408304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4083  $ Water around fuel element
408305  106  -1.56     312302 -312303 -311304          imp:n=1 u=4083  $ Lower graphite slug 
408306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4083  $ Fuel cladding
408307  108   0.042234 312303 -312304 -311301          imp:n=1 u=4083  $ Zirc pin 
408308 40831 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4083 $ Fuel meat section 1
408309 40832 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4083 $ Fuel meat section 2
408310 40833 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4083 $ Fuel meat section 3
408311 40834 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4083 $ Fuel meat section 4
408312 40835 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4083 $ Fuel meat section 5
408313  106  -1.56     312304 -312305 -311304          imp:n=1 u=4083  $ Upper graphite spacer
408314  104  -2.70     312305 -312306 -311305          imp:n=1 u=4083  $ Al top cap 
408315  104  -2.70     312306 -312307 -311303          imp:n=1 u=4083  $ Tri-flute 
408316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4083  $ Water around tri-flute 
408317  104  -2.70     312307 -312308 -311302          imp:n=1 u=4083  $ Fuel tip
408318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4083  $ Water around fuel tip
408319  102  -1.00     312308 -312309 -311306          imp:n=1 u=4083  $ Water above fuel element
c
c
c
c --- 7946 - Al (TOS210D130) universe ---
c
794601  104  -2.70     312300 -312301 -311302          imp:n=1 u=7946  $ Lower grid plate pin
794602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=7946  $ Water around grid plate pin 
794603  104  -2.70     312301 -312302 -311305          imp:n=1 u=7946  $ Bottom casing 
794604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=7946  $ Water around fuel element
794605  106  -1.56     312302 -312303 -311304          imp:n=1 u=7946  $ Lower graphite slug 
794606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=7946  $ Fuel cladding
794607  108   0.042234 312303 -312304 -311301          imp:n=1 u=7946  $ Zirc pin 
794608 79461 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=7946 $ Fuel meat section 1
794609 79462 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=7946 $ Fuel meat section 2
794610 79463 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=7946 $ Fuel meat section 3
794611 79464 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=7946 $ Fuel meat section 4
794612 79465 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=7946 $ Fuel meat section 5
794613  106  -1.56     312304 -312305 -311304          imp:n=1 u=7946  $ Upper graphite spacer
794614  104  -2.70     312305 -312306 -311305          imp:n=1 u=7946  $ Al top cap 
794615  104  -2.70     312306 -312307 -311303          imp:n=1 u=7946  $ Tri-flute 
794616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=7946  $ Water around tri-flute 
794617  104  -2.70     312307 -312308 -311302          imp:n=1 u=7946  $ Fuel tip
794618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=7946  $ Water around fuel tip
794619  102  -1.00     312308 -312309 -311306          imp:n=1 u=7946  $ Water above fuel element
c
c
c
c --- 3853 - Al (TOS210D130) universe ---
c
385301  104  -2.70     312300 -312301 -311302          imp:n=1 u=3853  $ Lower grid plate pin
385302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3853  $ Water around grid plate pin 
385303  104  -2.70     312301 -312302 -311305          imp:n=1 u=3853  $ Bottom casing 
385304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3853  $ Water around fuel element
385305  106  -1.56     312302 -312303 -311304          imp:n=1 u=3853  $ Lower graphite slug 
385306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3853  $ Fuel cladding
385307  108   0.042234 312303 -312304 -311301          imp:n=1 u=3853  $ Zirc pin 
385308 38531 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3853 $ Fuel meat section 1
385309 38532 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3853 $ Fuel meat section 2
385310 38533 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3853 $ Fuel meat section 3
385311 38534 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3853 $ Fuel meat section 4
385312 38535 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3853 $ Fuel meat section 5
385313  106  -1.56     312304 -312305 -311304          imp:n=1 u=3853  $ Upper graphite spacer
385314  104  -2.70     312305 -312306 -311305          imp:n=1 u=3853  $ Al top cap 
385315  104  -2.70     312306 -312307 -311303          imp:n=1 u=3853  $ Tri-flute 
385316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3853  $ Water around tri-flute 
385317  104  -2.70     312307 -312308 -311302          imp:n=1 u=3853  $ Fuel tip
385318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3853  $ Water around fuel tip
385319  102  -1.00     312308 -312309 -311306          imp:n=1 u=3853  $ Water above fuel element
c
c
c
c --- 3856 - Al (TOS210D130) universe ---
c
385601  104  -2.70     312300 -312301 -311302          imp:n=1 u=3856  $ Lower grid plate pin
385602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3856  $ Water around grid plate pin 
385603  104  -2.70     312301 -312302 -311305          imp:n=1 u=3856  $ Bottom casing 
385604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3856  $ Water around fuel element
385605  106  -1.56     312302 -312303 -311304          imp:n=1 u=3856  $ Lower graphite slug 
385606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3856  $ Fuel cladding
385607  108   0.042234 312303 -312304 -311301          imp:n=1 u=3856  $ Zirc pin 
385608 38561 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3856 $ Fuel meat section 1
385609 38562 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3856 $ Fuel meat section 2
385610 38563 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3856 $ Fuel meat section 3
385611 38564 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3856 $ Fuel meat section 4
385612 38565 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3856 $ Fuel meat section 5
385613  106  -1.56     312304 -312305 -311304          imp:n=1 u=3856  $ Upper graphite spacer
385614  104  -2.70     312305 -312306 -311305          imp:n=1 u=3856  $ Al top cap 
385615  104  -2.70     312306 -312307 -311303          imp:n=1 u=3856  $ Tri-flute 
385616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3856  $ Water around tri-flute 
385617  104  -2.70     312307 -312308 -311302          imp:n=1 u=3856  $ Fuel tip
385618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3856  $ Water around fuel tip
385619  102  -1.00     312308 -312309 -311306          imp:n=1 u=3856  $ Water above fuel element
c
c
c
c --- 4134 - Al (TOS210D130) universe ---
c
413401  104  -2.70     312300 -312301 -311302          imp:n=1 u=4134  $ Lower grid plate pin
413402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4134  $ Water around grid plate pin 
413403  104  -2.70     312301 -312302 -311305          imp:n=1 u=4134  $ Bottom casing 
413404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4134  $ Water around fuel element
413405  106  -1.56     312302 -312303 -311304          imp:n=1 u=4134  $ Lower graphite slug 
413406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4134  $ Fuel cladding
413407  108   0.042234 312303 -312304 -311301          imp:n=1 u=4134  $ Zirc pin 
413408 41341 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4134 $ Fuel meat section 1
413409 41342 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4134 $ Fuel meat section 2
413410 41343 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4134 $ Fuel meat section 3
413411 41344 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4134 $ Fuel meat section 4
413412 41345 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4134 $ Fuel meat section 5
413413  106  -1.56     312304 -312305 -311304          imp:n=1 u=4134  $ Upper graphite spacer
413414  104  -2.70     312305 -312306 -311305          imp:n=1 u=4134  $ Al top cap 
413415  104  -2.70     312306 -312307 -311303          imp:n=1 u=4134  $ Tri-flute 
413416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4134  $ Water around tri-flute 
413417  104  -2.70     312307 -312308 -311302          imp:n=1 u=4134  $ Fuel tip
413418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4134  $ Water around fuel tip
413419  102  -1.00     312308 -312309 -311306          imp:n=1 u=4134  $ Water above fuel element
c
c
c
c --- 4133 - Al (TOS210D130) universe ---
c
413301  104  -2.70     312300 -312301 -311302          imp:n=1 u=4133  $ Lower grid plate pin
413302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4133  $ Water around grid plate pin 
413303  104  -2.70     312301 -312302 -311305          imp:n=1 u=4133  $ Bottom casing 
413304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4133  $ Water around fuel element
413305  106  -1.56     312302 -312303 -311304          imp:n=1 u=4133  $ Lower graphite slug 
413306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4133  $ Fuel cladding
413307  108   0.042234 312303 -312304 -311301          imp:n=1 u=4133  $ Zirc pin 
413308 41331 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4133 $ Fuel meat section 1
413309 41332 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4133 $ Fuel meat section 2
413310 41333 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4133 $ Fuel meat section 3
413311 41334 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4133 $ Fuel meat section 4
413312 41335 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4133 $ Fuel meat section 5
413313  106  -1.56     312304 -312305 -311304          imp:n=1 u=4133  $ Upper graphite spacer
413314  104  -2.70     312305 -312306 -311305          imp:n=1 u=4133  $ Al top cap 
413315  104  -2.70     312306 -312307 -311303          imp:n=1 u=4133  $ Tri-flute 
413316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4133  $ Water around tri-flute 
413317  104  -2.70     312307 -312308 -311302          imp:n=1 u=4133  $ Fuel tip
413318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4133  $ Water around fuel tip
413319  102  -1.00     312308 -312309 -311306          imp:n=1 u=4133  $ Water above fuel element
c
c
c
c --- 4085 - Al (TOS210D130) universe ---
c
408501  104  -2.70     312300 -312301 -311302          imp:n=1 u=4085  $ Lower grid plate pin
408502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4085  $ Water around grid plate pin 
408503  104  -2.70     312301 -312302 -311305          imp:n=1 u=4085  $ Bottom casing 
408504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4085  $ Water around fuel element
408505  106  -1.56     312302 -312303 -311304          imp:n=1 u=4085  $ Lower graphite slug 
408506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4085  $ Fuel cladding
408507  108   0.042234 312303 -312304 -311301          imp:n=1 u=4085  $ Zirc pin 
408508 40851 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4085 $ Fuel meat section 1
408509 40852 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4085 $ Fuel meat section 2
408510 40853 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4085 $ Fuel meat section 3
408511 40854 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4085 $ Fuel meat section 4
408512 40855 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4085 $ Fuel meat section 5
408513  106  -1.56     312304 -312305 -311304          imp:n=1 u=4085  $ Upper graphite spacer
408514  104  -2.70     312305 -312306 -311305          imp:n=1 u=4085  $ Al top cap 
408515  104  -2.70     312306 -312307 -311303          imp:n=1 u=4085  $ Tri-flute 
408516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4085  $ Water around tri-flute 
408517  104  -2.70     312307 -312308 -311302          imp:n=1 u=4085  $ Fuel tip
408518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4085  $ Water around fuel tip
408519  102  -1.00     312308 -312309 -311306          imp:n=1 u=4085  $ Water above fuel element
c
c
c
c --- 4110 - Al (TOS210D130) universe ---
c
411001  104  -2.70     312300 -312301 -311302          imp:n=1 u=4110  $ Lower grid plate pin
411002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4110  $ Water around grid plate pin 
411003  104  -2.70     312301 -312302 -311305          imp:n=1 u=4110  $ Bottom casing 
411004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4110  $ Water around fuel element
411005  106  -1.56     312302 -312303 -311304          imp:n=1 u=4110  $ Lower graphite slug 
411006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4110  $ Fuel cladding
411007  108   0.042234 312303 -312304 -311301          imp:n=1 u=4110  $ Zirc pin 
411008 41101 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4110 $ Fuel meat section 1
411009 41102 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4110 $ Fuel meat section 2
411010 41103 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4110 $ Fuel meat section 3
411011 41104 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4110 $ Fuel meat section 4
411012 41105 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4110 $ Fuel meat section 5
411013  106  -1.56     312304 -312305 -311304          imp:n=1 u=4110  $ Upper graphite spacer
411014  104  -2.70     312305 -312306 -311305          imp:n=1 u=4110  $ Al top cap 
411015  104  -2.70     312306 -312307 -311303          imp:n=1 u=4110  $ Tri-flute 
411016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4110  $ Water around tri-flute 
411017  104  -2.70     312307 -312308 -311302          imp:n=1 u=4110  $ Fuel tip
411018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4110  $ Water around fuel tip
411019  102  -1.00     312308 -312309 -311306          imp:n=1 u=4110  $ Water above fuel element
c
c
c
c --- 3677 - Al (TOS210D130) universe ---
c
367701  104  -2.70     312300 -312301 -311302          imp:n=1 u=3677  $ Lower grid plate pin
367702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3677  $ Water around grid plate pin 
367703  104  -2.70     312301 -312302 -311305          imp:n=1 u=3677  $ Bottom casing 
367704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3677  $ Water around fuel element
367705  106  -1.56     312302 -312303 -311304          imp:n=1 u=3677  $ Lower graphite slug 
367706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3677  $ Fuel cladding
367707  108   0.042234 312303 -312304 -311301          imp:n=1 u=3677  $ Zirc pin 
367708 36771 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3677 $ Fuel meat section 1
367709 36772 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3677 $ Fuel meat section 2
367710 36773 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3677 $ Fuel meat section 3
367711 36774 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3677 $ Fuel meat section 4
367712 36775 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3677 $ Fuel meat section 5
367713  106  -1.56     312304 -312305 -311304          imp:n=1 u=3677  $ Upper graphite spacer
367714  104  -2.70     312305 -312306 -311305          imp:n=1 u=3677  $ Al top cap 
367715  104  -2.70     312306 -312307 -311303          imp:n=1 u=3677  $ Tri-flute 
367716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3677  $ Water around tri-flute 
367717  104  -2.70     312307 -312308 -311302          imp:n=1 u=3677  $ Fuel tip
367718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3677  $ Water around fuel tip
367719  102  -1.00     312308 -312309 -311306          imp:n=1 u=3677  $ Water above fuel element
c
c
c
c --- 4131 - Al (TOS210D130) universe ---
c
413101  104  -2.70     312300 -312301 -311302          imp:n=1 u=4131  $ Lower grid plate pin
413102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4131  $ Water around grid plate pin 
413103  104  -2.70     312301 -312302 -311305          imp:n=1 u=4131  $ Bottom casing 
413104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4131  $ Water around fuel element
413105  106  -1.56     312302 -312303 -311304          imp:n=1 u=4131  $ Lower graphite slug 
413106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4131  $ Fuel cladding
413107  108   0.042234 312303 -312304 -311301          imp:n=1 u=4131  $ Zirc pin 
413108 41311 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4131 $ Fuel meat section 1
413109 41312 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4131 $ Fuel meat section 2
413110 41313 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4131 $ Fuel meat section 3
413111 41314 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4131 $ Fuel meat section 4
413112 41315 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4131 $ Fuel meat section 5
413113  106  -1.56     312304 -312305 -311304          imp:n=1 u=4131  $ Upper graphite spacer
413114  104  -2.70     312305 -312306 -311305          imp:n=1 u=4131  $ Al top cap 
413115  104  -2.70     312306 -312307 -311303          imp:n=1 u=4131  $ Tri-flute 
413116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4131  $ Water around tri-flute 
413117  104  -2.70     312307 -312308 -311302          imp:n=1 u=4131  $ Fuel tip
413118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4131  $ Water around fuel tip
413119  102  -1.00     312308 -312309 -311306          imp:n=1 u=4131  $ Water above fuel element
c
c
c
c --- 4065 - Al (TOS210D130) universe ---
c
406501  104  -2.70     312300 -312301 -311302          imp:n=1 u=4065  $ Lower grid plate pin
406502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4065  $ Water around grid plate pin 
406503  104  -2.70     312301 -312302 -311305          imp:n=1 u=4065  $ Bottom casing 
406504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4065  $ Water around fuel element
406505  106  -1.56     312302 -312303 -311304          imp:n=1 u=4065  $ Lower graphite slug 
406506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4065  $ Fuel cladding
406507  108   0.042234 312303 -312304 -311301          imp:n=1 u=4065  $ Zirc pin 
406508 40651 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4065 $ Fuel meat section 1
406509 40652 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4065 $ Fuel meat section 2
406510 40653 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4065 $ Fuel meat section 3
406511 40654 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4065 $ Fuel meat section 4
406512 40655 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4065 $ Fuel meat section 5
406513  106  -1.56     312304 -312305 -311304          imp:n=1 u=4065  $ Upper graphite spacer
406514  104  -2.70     312305 -312306 -311305          imp:n=1 u=4065  $ Al top cap 
406515  104  -2.70     312306 -312307 -311303          imp:n=1 u=4065  $ Tri-flute 
406516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4065  $ Water around tri-flute 
406517  104  -2.70     312307 -312308 -311302          imp:n=1 u=4065  $ Fuel tip
406518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4065  $ Water around fuel tip
406519  102  -1.00     312308 -312309 -311306          imp:n=1 u=4065  $ Water above fuel element
c
c
c
c --- 3851 - Al (TOS210D130) universe ---
c
385101  104  -2.70     312300 -312301 -311302          imp:n=1 u=3851  $ Lower grid plate pin
385102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3851  $ Water around grid plate pin 
385103  104  -2.70     312301 -312302 -311305          imp:n=1 u=3851  $ Bottom casing 
385104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3851  $ Water around fuel element
385105  106  -1.56     312302 -312303 -311304          imp:n=1 u=3851  $ Lower graphite slug 
385106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3851  $ Fuel cladding
385107  108   0.042234 312303 -312304 -311301          imp:n=1 u=3851  $ Zirc pin 
385108 38511 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3851 $ Fuel meat section 1
385109 38512 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3851 $ Fuel meat section 2
385110 38513 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3851 $ Fuel meat section 3
385111 38514 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3851 $ Fuel meat section 4
385112 38515 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3851 $ Fuel meat section 5
385113  106  -1.56     312304 -312305 -311304          imp:n=1 u=3851  $ Upper graphite spacer
385114  104  -2.70     312305 -312306 -311305          imp:n=1 u=3851  $ Al top cap 
385115  104  -2.70     312306 -312307 -311303          imp:n=1 u=3851  $ Tri-flute 
385116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3851  $ Water around tri-flute 
385117  104  -2.70     312307 -312308 -311302          imp:n=1 u=3851  $ Fuel tip
385118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3851  $ Water around fuel tip
385119  102  -1.00     312308 -312309 -311306          imp:n=1 u=3851  $ Water above fuel element
c
c
c
c --- 4055 - Al (TOS210D130) universe ---
c
405501  104  -2.70     312300 -312301 -311302          imp:n=1 u=4055  $ Lower grid plate pin
405502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4055  $ Water around grid plate pin 
405503  104  -2.70     312301 -312302 -311305          imp:n=1 u=4055  $ Bottom casing 
405504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4055  $ Water around fuel element
405505  106  -1.56     312302 -312303 -311304          imp:n=1 u=4055  $ Lower graphite slug 
405506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4055  $ Fuel cladding
405507  108   0.042234 312303 -312304 -311301          imp:n=1 u=4055  $ Zirc pin 
405508 40551 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4055 $ Fuel meat section 1
405509 40552 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4055 $ Fuel meat section 2
405510 40553 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4055 $ Fuel meat section 3
405511 40554 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4055 $ Fuel meat section 4
405512 40555 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4055 $ Fuel meat section 5
405513  106  -1.56     312304 -312305 -311304          imp:n=1 u=4055  $ Upper graphite spacer
405514  104  -2.70     312305 -312306 -311305          imp:n=1 u=4055  $ Al top cap 
405515  104  -2.70     312306 -312307 -311303          imp:n=1 u=4055  $ Tri-flute 
405516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4055  $ Water around tri-flute 
405517  104  -2.70     312307 -312308 -311302          imp:n=1 u=4055  $ Fuel tip
405518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4055  $ Water around fuel tip
403862  102  -1.00     312308 -312309 -311306          imp:n=1 u=4055  $ Water above fuel element
c
c
c
c --- 3862 - Al (TOS210D130) universe ---
c
386201  102  -1.00     312300 -312301 -311302          imp:n=1 u=3862  $ Lower grid plate pin
386202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3862  $ Water around grid plate pin 
386203  102  -1.00     312301 -312302 -311305          imp:n=1 u=3862  $ Bottom casing 
386204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3862  $ Water around fuel element
386205  102  -1.00     312302 -312303 -311304          imp:n=1 u=3862  $ Lower graphite slug 
386206  102  -1.00     312302 -312305  311304 -311305  imp:n=1 u=3862  $ Fuel cladding
386207  102   -1.00 312303 -312304 -311301          imp:n=1 u=3862  $ Zirc pin 
386208 102 -1.00 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3862 $ Fuel meat section 1
386209 102 -1.00 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3862 $ Fuel meat section 2
386210 102 -1.00 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3862 $ Fuel meat section 3
386211 102 -1.00 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3862 $ Fuel meat section 4
386212 102 -1.00 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3862 $ Fuel meat section 5
386213  102  -1.00     312304 -312305 -311304          imp:n=1 u=3862  $ Upper graphite spacer
386214  102  -1.00     312305 -312306 -311305          imp:n=1 u=3862  $ Al top cap 
386215  102  -1.00     312306 -312307 -311303          imp:n=1 u=3862  $ Tri-flute 
386216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3862  $ Water around tri-flute 
386217  102  -1.00     312307 -312308 -311302          imp:n=1 u=3862  $ Fuel tip
386218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3862  $ Water around fuel tip
386219  102  -1.00     312308 -312309 -311306          imp:n=1 u=3862  $ Water above fuel element
c
c
c
c --- 4064 - Al (TOS210D130) universe ---
c
406401  104  -2.70     312300 -312301 -311302          imp:n=1 u=4064  $ Lower grid plate pin
406402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4064  $ Water around grid plate pin 
406403  104  -2.70     312301 -312302 -311305          imp:n=1 u=4064  $ Bottom casing 
406404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4064  $ Water around fuel element
406405  106  -1.56     312302 -312303 -311304          imp:n=1 u=4064  $ Lower graphite slug 
406406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4064  $ Fuel cladding
406407  108   0.042234 312303 -312304 -311301          imp:n=1 u=4064  $ Zirc pin 
406408 40641 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4064 $ Fuel meat section 1
406409 40642 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4064 $ Fuel meat section 2
406410 40643 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4064 $ Fuel meat section 3
406411 40644 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4064 $ Fuel meat section 4
406412 40645 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4064 $ Fuel meat section 5
406413  106  -1.56     312304 -312305 -311304          imp:n=1 u=4064  $ Upper graphite spacer
406414  104  -2.70     312305 -312306 -311305          imp:n=1 u=4064  $ Al top cap 
406415  104  -2.70     312306 -312307 -311303          imp:n=1 u=4064  $ Tri-flute 
406416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4064  $ Water around tri-flute 
406417  104  -2.70     312307 -312308 -311302          imp:n=1 u=4064  $ Fuel tip
406418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4064  $ Water around fuel tip
406419  102  -1.00     312308 -312309 -311306          imp:n=1 u=4064  $ Water above fuel element
c
c
c
c --- 3858 - Al (TOS210D130) universe ---
c
385801  104  -2.70     312300 -312301 -311302          imp:n=1 u=3858  $ Lower grid plate pin
385802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3858  $ Water around grid plate pin 
385803  104  -2.70     312301 -312302 -311305          imp:n=1 u=3858  $ Bottom casing 
385804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3858  $ Water around fuel element
385805  106  -1.56     312302 -312303 -311304          imp:n=1 u=3858  $ Lower graphite slug 
385806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3858  $ Fuel cladding
385807  108   0.042234 312303 -312304 -311301          imp:n=1 u=3858  $ Zirc pin 
385808 38581 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3858 $ Fuel meat section 1
385809 38582 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3858 $ Fuel meat section 2
385810 38583 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3858 $ Fuel meat section 3
385811 38584 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3858 $ Fuel meat section 4
385812 38585 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3858 $ Fuel meat section 5
385813  106  -1.56     312304 -312305 -311304          imp:n=1 u=3858  $ Upper graphite spacer
385814  104  -2.70     312305 -312306 -311305          imp:n=1 u=3858  $ Al top cap 
385815  104  -2.70     312306 -312307 -311303          imp:n=1 u=3858  $ Tri-flute 
385816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3858  $ Water around tri-flute 
385817  104  -2.70     312307 -312308 -311302          imp:n=1 u=3858  $ Fuel tip
385818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3858  $ Water around fuel tip
385819  102  -1.00     312308 -312309 -311306          imp:n=1 u=3858  $ Water above fuel element
c
c
c
c --- 4053 - Al (TOS210D130) universe ---
c
405301  104  -2.70     312300 -312301 -311302          imp:n=1 u=4053  $ Lower grid plate pin
405302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4053  $ Water around grid plate pin 
405303  104  -2.70     312301 -312302 -311305          imp:n=1 u=4053  $ Bottom casing 
405304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4053  $ Water around fuel element
405305  106  -1.56     312302 -312303 -311304          imp:n=1 u=4053  $ Lower graphite slug 
405306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4053  $ Fuel cladding
405307  108   0.042234 312303 -312304 -311301          imp:n=1 u=4053  $ Zirc pin 
405308 40531 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4053 $ Fuel meat section 1
405309 40532 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4053 $ Fuel meat section 2
405310 40533 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4053 $ Fuel meat section 3
405311 40534 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4053 $ Fuel meat section 4
405312 40535 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4053 $ Fuel meat section 5
405313  106  -1.56     312304 -312305 -311304          imp:n=1 u=4053  $ Upper graphite spacer
405314  104  -2.70     312305 -312306 -311305          imp:n=1 u=4053  $ Al top cap 
405315  104  -2.70     312306 -312307 -311303          imp:n=1 u=4053  $ Tri-flute 
405316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4053  $ Water around tri-flute 
405317  104  -2.70     312307 -312308 -311302          imp:n=1 u=4053  $ Fuel tip
405318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4053  $ Water around fuel tip
405319  102  -1.00     312308 -312309 -311306          imp:n=1 u=4053  $ Water above fuel element
c
c
c
c --- 8735 - Al (TOS210D130) universe ---
c
873501  102  -1.00     312300 -312301 -311302          imp:n=1 u=8735  $ Lower grid plate pin
873502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8735  $ Water around grid plate pin 
873503  102  -1.00     312301 -312302 -311305          imp:n=1 u=8735  $ Bottom casing 
873504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8735  $ Water around fuel element
873505  102  -1.00     312302 -312303 -311304          imp:n=1 u=8735  $ Lower graphite slug 
873506  102  -1.00     312302 -312305  311304 -311305  imp:n=1 u=8735  $ Fuel cladding
873507  102   -1.00 312303 -312304 -311301          imp:n=1 u=8735  $ Zirc pin 
873508 102 -1.00 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8735 $ Fuel meat section 1
873509 102 -1.00 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8735 $ Fuel meat section 2
873510 102 -1.00 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8735 $ Fuel meat section 3
873511 102 -1.00 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8735 $ Fuel meat section 4
873512 102 -1.00 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8735 $ Fuel meat section 5
873513  102  -1.00     312304 -312305 -311304          imp:n=1 u=8735  $ Upper graphite spacer
873514  102  -1.00     312305 -312306 -311305          imp:n=1 u=8735  $ Al top cap 
873515  102  -1.00     312306 -312307 -311303          imp:n=1 u=8735  $ Tri-flute 
873516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8735  $ Water around tri-flute 
873517  102  -1.00     312307 -312308 -311302          imp:n=1 u=8735  $ Fuel tip
873518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8735  $ Water around fuel tip
873519  102  -1.00     312308 -312309 -311306          imp:n=1 u=8735  $ Water above fuel element
c
c
c
c --- 3748 - Al (TOS210D130) universe ---
c
374801  104  -2.70     312300 -312301 -311302          imp:n=1 u=3748  $ Lower grid plate pin
374802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3748  $ Water around grid plate pin 
374803  104  -2.70     312301 -312302 -311305          imp:n=1 u=3748  $ Bottom casing 
374804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3748  $ Water around fuel element
374805  106  -1.56     312302 -312303 -311304          imp:n=1 u=3748  $ Lower graphite slug 
374806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3748  $ Fuel cladding
374807  108   0.042234 312303 -312304 -311301          imp:n=1 u=3748  $ Zirc pin 
374808 37481 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3748 $ Fuel meat section 1
374809 37482 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3748 $ Fuel meat section 2
374810 37483 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3748 $ Fuel meat section 3
374811 37484 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3748 $ Fuel meat section 4
374812 37485 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3748 $ Fuel meat section 5
374813  106  -1.56     312304 -312305 -311304          imp:n=1 u=3748  $ Upper graphite spacer
374814  104  -2.70     312305 -312306 -311305          imp:n=1 u=3748  $ Al top cap 
374815  104  -2.70     312306 -312307 -311303          imp:n=1 u=3748  $ Tri-flute 
374816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3748  $ Water around tri-flute 
374817  104  -2.70     312307 -312308 -311302          imp:n=1 u=3748  $ Fuel tip
374818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3748  $ Water around fuel tip
374819  102  -1.00     312308 -312309 -311306          imp:n=1 u=3748  $ Water above fuel element
c
c
c
c --- 7945 - Al (TOS210D130) universe ---
c
794501  104  -2.70     312300 -312301 -311302          imp:n=1 u=7945  $ Lower grid plate pin
794502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=7945  $ Water around grid plate pin 
794503  104  -2.70     312301 -312302 -311305          imp:n=1 u=7945  $ Bottom casing 
794504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=7945  $ Water around fuel element
794505  106  -1.56     312302 -312303 -311304          imp:n=1 u=7945  $ Lower graphite slug 
794506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=7945  $ Fuel cladding
794507  108   0.042234 312303 -312304 -311301          imp:n=1 u=7945  $ Zirc pin 
794508 79451 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=7945 $ Fuel meat section 1
794509 79452 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=7945 $ Fuel meat section 2
794510 79453 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=7945 $ Fuel meat section 3
794511 79454 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=7945 $ Fuel meat section 4
794512 79455 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=7945 $ Fuel meat section 5
794513  106  -1.56     312304 -312305 -311304          imp:n=1 u=7945  $ Upper graphite spacer
794514  104  -2.70     312305 -312306 -311305          imp:n=1 u=7945  $ Al top cap 
794515  104  -2.70     312306 -312307 -311303          imp:n=1 u=7945  $ Tri-flute 
794516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=7945  $ Water around tri-flute 
794517  104  -2.70     312307 -312308 -311302          imp:n=1 u=7945  $ Fuel tip
794518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=7945  $ Water around fuel tip
794519  102  -1.00     312308 -312309 -311306          imp:n=1 u=7945  $ Water above fuel element
c
c
c
c --- 3866 - Al (TOS210D130) universe ---
c
386601  102  -1.00     312300 -312301 -311302          imp:n=1 u=3866  $ Lower grid plate pin
386602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3866  $ Water around grid plate pin 
386603  102  -1.00     312301 -312302 -311305          imp:n=1 u=3866  $ Bottom casing 
386604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3866  $ Water around fuel element
386605  102  -1.00     312302 -312303 -311304          imp:n=1 u=3866  $ Lower graphite slug 
386606  102  -1.00     312302 -312305  311304 -311305  imp:n=1 u=3866  $ Fuel cladding
386607  102   -1.00 312303 -312304 -311301          imp:n=1 u=3866  $ Zirc pin 
386608 102 -1.00 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3866 $ Fuel meat section 1
386609 102 -1.00 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3866 $ Fuel meat section 2
386610 102 -1.00 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3866 $ Fuel meat section 3
386611 102 -1.00 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3866 $ Fuel meat section 4
386612 102 -1.00 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3866 $ Fuel meat section 5
386613  102  -1.00     312304 -312305 -311304          imp:n=1 u=3866  $ Upper graphite spacer
386614  102  -1.00     312305 -312306 -311305          imp:n=1 u=3866  $ Al top cap 
386615  102  -1.00     312306 -312307 -311303          imp:n=1 u=3866  $ Tri-flute 
386616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3866  $ Water around tri-flute 
386617  102  -1.00     312307 -312308 -311302          imp:n=1 u=3866  $ Fuel tip
386618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3866  $ Water around fuel tip
386619  102  -1.00     312308 -312309 -311306          imp:n=1 u=3866  $ Water above fuel element
c
c
c
c --- 3852 - Al (TOS210D130) universe ---
c
385201  104  -2.70     312300 -312301 -311302          imp:n=1 u=3852  $ Lower grid plate pin
385202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3852  $ Water around grid plate pin 
385203  104  -2.70     312301 -312302 -311305          imp:n=1 u=3852  $ Bottom casing 
385204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3852  $ Water around fuel element
385205  106  -1.56     312302 -312303 -311304          imp:n=1 u=3852  $ Lower graphite slug 
385206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3852  $ Fuel cladding
385207  108   0.042234 312303 -312304 -311301          imp:n=1 u=3852  $ Zirc pin 
385208 38521 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3852 $ Fuel meat section 1
385209 38522 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3852 $ Fuel meat section 2
385210 38523 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3852 $ Fuel meat section 3
385211 38524 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3852 $ Fuel meat section 4
385212 38525 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3852 $ Fuel meat section 5
385213  106  -1.56     312304 -312305 -311304          imp:n=1 u=3852  $ Upper graphite spacer
385214  104  -2.70     312305 -312306 -311305          imp:n=1 u=3852  $ Al top cap 
385215  104  -2.70     312306 -312307 -311303          imp:n=1 u=3852  $ Tri-flute 
385216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3852  $ Water around tri-flute 
385217  104  -2.70     312307 -312308 -311302          imp:n=1 u=3852  $ Fuel tip
385218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3852  $ Water around fuel tip
385219  102  -1.00     312308 -312309 -311306          imp:n=1 u=3852  $ Water above fuel element
c
c
c
c --- 4071 - Al (TOS210D130) universe ---
c
407101  104  -2.70     312300 -312301 -311302          imp:n=1 u=4071  $ Lower grid plate pin
407102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4071  $ Water around grid plate pin 
407103  104  -2.70     312301 -312302 -311305          imp:n=1 u=4071  $ Bottom casing 
407104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4071  $ Water around fuel element
407105  106  -1.56     312302 -312303 -311304          imp:n=1 u=4071  $ Lower graphite slug 
407106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4071  $ Fuel cladding
407107  108   0.042234 312303 -312304 -311301          imp:n=1 u=4071  $ Zirc pin 
407108 40711 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4071 $ Fuel meat section 1
407109 40712 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4071 $ Fuel meat section 2
407110 40713 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4071 $ Fuel meat section 3
407111 40714 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4071 $ Fuel meat section 4
407112 40715 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4071 $ Fuel meat section 5
407113  106  -1.56     312304 -312305 -311304          imp:n=1 u=4071  $ Upper graphite spacer
407114  104  -2.70     312305 -312306 -311305          imp:n=1 u=4071  $ Al top cap 
407115  104  -2.70     312306 -312307 -311303          imp:n=1 u=4071  $ Tri-flute 
407116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4071  $ Water around tri-flute 
407117  104  -2.70     312307 -312308 -311302          imp:n=1 u=4071  $ Fuel tip
407118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4071  $ Water around fuel tip
407119  102  -1.00     312308 -312309 -311306          imp:n=1 u=4071  $ Water above fuel element
c
c
c
c --- 4094 - Al (TOS210D130) universe ---
c
409401  102  -1.00     312300 -312301 -311302          imp:n=1 u=4094  $ Lower grid plate pin
409402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4094  $ Water around grid plate pin 
409403  102  -1.00     312301 -312302 -311305          imp:n=1 u=4094  $ Bottom casing 
409404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4094  $ Water around fuel element
409405  102  -1.00     312302 -312303 -311304          imp:n=1 u=4094  $ Lower graphite slug 
409406  102  -1.00     312302 -312305  311304 -311305  imp:n=1 u=4094  $ Fuel cladding
409407  102   -1.00 312303 -312304 -311301          imp:n=1 u=4094  $ Zirc pin 
409408 102 -1.00 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4094 $ Fuel meat section 1
409409 102 -1.00 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4094 $ Fuel meat section 2
409410 102 -1.00 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4094 $ Fuel meat section 3
409411 102 -1.00 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4094 $ Fuel meat section 4
409412 102 -1.00 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4094 $ Fuel meat section 5
409413  102  -1.00     312304 -312305 -311304          imp:n=1 u=4094  $ Upper graphite spacer
409414  102  -1.00     312305 -312306 -311305          imp:n=1 u=4094  $ Al top cap 
409415  102  -1.00     312306 -312307 -311303          imp:n=1 u=4094  $ Tri-flute 
409416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4094  $ Water around tri-flute 
409417  102  -1.00     312307 -312308 -311302          imp:n=1 u=4094  $ Fuel tip
409418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4094  $ Water around fuel tip
409419  102  -1.00     312308 -312309 -311306          imp:n=1 u=4094  $ Water above fuel element
c
c
c
c --- 4129 - Al (TOS210D130) universe ---
c
412901  104  -2.70     312300 -312301 -311302          imp:n=1 u=4129  $ Lower grid plate pin
412902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4129  $ Water around grid plate pin 
412903  104  -2.70     312301 -312302 -311305          imp:n=1 u=4129  $ Bottom casing 
412904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4129  $ Water around fuel element
412905  106  -1.56     312302 -312303 -311304          imp:n=1 u=4129  $ Lower graphite slug 
412906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4129  $ Fuel cladding
412907  108   0.042234 312303 -312304 -311301          imp:n=1 u=4129  $ Zirc pin 
412908 41291 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4129 $ Fuel meat section 1
412909 41292 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4129 $ Fuel meat section 2
412910 41293 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4129 $ Fuel meat section 3
412911 41294 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4129 $ Fuel meat section 4
412912 41295 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4129 $ Fuel meat section 5
412913  106  -1.56     312304 -312305 -311304          imp:n=1 u=4129  $ Upper graphite spacer
412914  104  -2.70     312305 -312306 -311305          imp:n=1 u=4129  $ Al top cap 
412915  104  -2.70     312306 -312307 -311303          imp:n=1 u=4129  $ Tri-flute 
412916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4129  $ Water around tri-flute 
412917  104  -2.70     312307 -312308 -311302          imp:n=1 u=4129  $ Fuel tip
412918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4129  $ Water around fuel tip
412919  102  -1.00     312308 -312309 -311306          imp:n=1 u=4129  $ Water above fuel element
c
c
c
c --- 3874 - Al (TOS210D130) universe ---
c
387401  104  -2.70     312300 -312301 -311302          imp:n=1 u=3874  $ Lower grid plate pin
387402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3874  $ Water around grid plate pin 
387403  104  -2.70     312301 -312302 -311305          imp:n=1 u=3874  $ Bottom casing 
387404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3874  $ Water around fuel element
387405  106  -1.56     312302 -312303 -311304          imp:n=1 u=3874  $ Lower graphite slug 
387406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3874  $ Fuel cladding
387407  108   0.042234 312303 -312304 -311301          imp:n=1 u=3874  $ Zirc pin 
387408 38741 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=3874 $ Fuel meat section 1
387409 38742 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=3874 $ Fuel meat section 2
387410 38743 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=3874 $ Fuel meat section 3
387411 38744 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=3874 $ Fuel meat section 4
387412 38745 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=3874 $ Fuel meat section 5
387413  106  -1.56     312304 -312305 -311304          imp:n=1 u=3874  $ Upper graphite spacer
387414  104  -2.70     312305 -312306 -311305          imp:n=1 u=3874  $ Al top cap 
387415  104  -2.70     312306 -312307 -311303          imp:n=1 u=3874  $ Tri-flute 
387416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3874  $ Water around tri-flute 
387417  104  -2.70     312307 -312308 -311302          imp:n=1 u=3874  $ Fuel tip
387418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3874  $ Water around fuel tip
387419  102  -1.00     312308 -312309 -311306          imp:n=1 u=3874  $ Water above fuel element
c
c
c
c --- 8103 - Al (TOS210D130) universe ---
c
810301  104  -2.70     312300 -312301 -311302          imp:n=1 u=8103  $ Lower grid plate pin
810302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=8103  $ Water around grid plate pin 
810303  104  -2.70     312301 -312302 -311305          imp:n=1 u=8103  $ Bottom casing 
810304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=8103  $ Water around fuel element
810305  106  -1.56     312302 -312303 -311304          imp:n=1 u=8103  $ Lower graphite slug 
810306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=8103  $ Fuel cladding
810307  108   0.042234 312303 -312304 -311301          imp:n=1 u=8103  $ Zirc pin 
810308 81031 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=8103 $ Fuel meat section 1
810309 81032 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=8103 $ Fuel meat section 2
810310 81033 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=8103 $ Fuel meat section 3
810311 81034 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=8103 $ Fuel meat section 4
810312 81035 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=8103 $ Fuel meat section 5
810313  106  -1.56     312304 -312305 -311304          imp:n=1 u=8103  $ Upper graphite spacer
810314  104  -2.70     312305 -312306 -311305          imp:n=1 u=8103  $ Al top cap 
810315  104  -2.70     312306 -312307 -311303          imp:n=1 u=8103  $ Tri-flute 
810316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=8103  $ Water around tri-flute 
810317  104  -2.70     312307 -312308 -311302          imp:n=1 u=8103  $ Fuel tip
810318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=8103  $ Water around fuel tip
810319  102  -1.00     312308 -312309 -311306          imp:n=1 u=8103  $ Water above fuel element
c
c
c  F RING ELEMENTS
c
c --- F1 - 4057 - Al (TOS210D130) universe ---
c
405701  104  -2.70     312300 -312301 -311302          imp:n=1 u=4057  $ Lower grid plate pin
405702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4057  $ Water around grid plate pin 
405703  104  -2.70     312301 -312302 -311305          imp:n=1 u=4057  $ Bottom casing 
405704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4057  $ Water around fuel element
405705  106  -1.56     312302 -312303 -311304          imp:n=1 u=4057  $ Lower graphite slug 
405706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4057  $ Fuel cladding
405707  108   0.042234 312303 -312304 -311301          imp:n=1 u=4057  $ Zirc pin 
405708 40571 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4057  $ Fuel meat section 1
405709 40572 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4057  $ Fuel meat section 2
405710 40573 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4057  $ Fuel meat section 3
405711 40574 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4057  $ Fuel meat section 4
405712 40575 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4057  $ Fuel meat section 5
405713  106  -1.56     312304 -312305 -311304          imp:n=1 u=4057  $ Upper graphite spacer
405714  104  -2.70     312305 -312306 -311305          imp:n=1 u=4057  $ Al top cap 
405715  104  -2.70     312306 -312307 -311303          imp:n=1 u=4057  $ Tri-flute 
405716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4057  $ Water around tri-flute 
405717  104  -2.70     312307 -312308 -311302          imp:n=1 u=4057  $ Fuel tip
405718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4057  $ Water around fuel tip
405719  102  -1.00     312308 -312309 -311306          imp:n=1 u=4057  $ Water above fuel element
c
c
c
c --- F2 - 4125 - Al (TOS210D130) universe ---
c
412501  104  -2.70     312300 -312301 -311302          imp:n=1 u=4125  $ Lower grid plate pin
412502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4125  $ Water around grid plate pin 
412503  104  -2.70     312301 -312302 -311305          imp:n=1 u=4125  $ Bottom casing 
412504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4125  $ Water around fuel element
412505  106  -1.56     312302 -312303 -311304          imp:n=1 u=4125  $ Lower graphite slug 
412506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4125  $ Fuel cladding
412507  108   0.042234 312303 -312304 -311301          imp:n=1 u=4125  $ Zirc pin 
412508 41251 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4125  $ Fuel meat section 1
412509 41252 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4125  $ Fuel meat section 2
412510 41253 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4125  $ Fuel meat section 3
412511 41254 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4125  $ Fuel meat section 4
412512 41255 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4125  $ Fuel meat section 5
412513  106  -1.56     312304 -312305 -311304          imp:n=1 u=4125  $ Upper graphite spacer
412514  104  -2.70     312305 -312306 -311305          imp:n=1 u=4125  $ Al top cap 
412515  104  -2.70     312306 -312307 -311303          imp:n=1 u=4125  $ Tri-flute 
412516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4125  $ Water around tri-flute 
412517  104  -2.70     312307 -312308 -311302          imp:n=1 u=4125  $ Fuel tip
412518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4125  $ Water around fuel tip
412519  102  -1.00     312308 -312309 -311306          imp:n=1 u=4125  $ Water above fuel element
c
c
c
c --- F3 - 4074 - Al (TOS210D130) universe ---
c
407401  104  -2.70     312300 -312301 -311302          imp:n=1 u=4074  $ Lower grid plate pin
407402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4074  $ Water around grid plate pin 
407403  104  -2.70     312301 -312302 -311305          imp:n=1 u=4074  $ Bottom casing 
407404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4074  $ Water around fuel element
407405  106  -1.56     312302 -312303 -311304          imp:n=1 u=4074  $ Lower graphite slug 
407406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4074  $ Fuel cladding
407407  108   0.042234 312303 -312304 -311301          imp:n=1 u=4074  $ Zirc pin 
407408 40741 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4074  $ Fuel meat section 1
407409 40742 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4074  $ Fuel meat section 2
407410 40743 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4074  $ Fuel meat section 3
407411 40744 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4074  $ Fuel meat section 4
407412 40745 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4074  $ Fuel meat section 5
407413  106  -1.56     312304 -312305 -311304          imp:n=1 u=4074  $ Upper graphite spacer
407414  104  -2.70     312305 -312306 -311305          imp:n=1 u=4074  $ Al top cap 
407415  104  -2.70     312306 -312307 -311303          imp:n=1 u=4074  $ Tri-flute 
407416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4074  $ Water around tri-flute 
407417  104  -2.70     312307 -312308 -311302          imp:n=1 u=4074  $ Fuel tip
407418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4074  $ Water around fuel tip
407419  102  -1.00     312308 -312309 -311306          imp:n=1 u=4074  $ Water above fuel element
c
c
c
c --- F4 - 4069 - Al (TOS210D130) universe ---
c
406901  104  -2.70     312300 -312301 -311302          imp:n=1 u=4069  $ Lower grid plate pin
406902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4069  $ Water around grid plate pin 
406903  104  -2.70     312301 -312302 -311305          imp:n=1 u=4069  $ Bottom casing 
406904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4069  $ Water around fuel element
406905  106  -1.56     312302 -312303 -311304          imp:n=1 u=4069  $ Lower graphite slug 
406906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4069  $ Fuel cladding
406907  108   0.042234 312303 -312304 -311301          imp:n=1 u=4069  $ Zirc pin 
406908 40691 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4069  $ Fuel meat section 1
406909 40692 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4069  $ Fuel meat section 2
406910 40693 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4069  $ Fuel meat section 3
406911 40694 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4069  $ Fuel meat section 4
406912 40695 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4069  $ Fuel meat section 5
406913  106  -1.56     312304 -312305 -311304          imp:n=1 u=4069  $ Upper graphite spacer
406914  104  -2.70     312305 -312306 -311305          imp:n=1 u=4069  $ Al top cap 
406915  104  -2.70     312306 -312307 -311303          imp:n=1 u=4069  $ Tri-flute 
406916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4069  $ Water around tri-flute 
406917  104  -2.70     312307 -312308 -311302          imp:n=1 u=4069  $ Fuel tip
406918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4069  $ Water around fuel tip
406919  102  -1.00     312308 -312309 -311306          imp:n=1 u=4069  $ Water above fuel element
c
c
c
c --- F5 - 4088 - Al (TOS210D130) universe ---
c
408801  104  -2.70     312300 -312301 -311302          imp:n=1 u=4088  $ Lower grid plate pin
408802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4088  $ Water around grid plate pin 
408803  104  -2.70     312301 -312302 -311305          imp:n=1 u=4088  $ Bottom casing 
408804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4088  $ Water around fuel element
408805  106  -1.56     312302 -312303 -311304          imp:n=1 u=4088  $ Lower graphite slug 
408806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4088  $ Fuel cladding
408807  108   0.042234 312303 -312304 -311301          imp:n=1 u=4088  $ Zirc pin 
408808 40881 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4088  $ Fuel meat section 1
408809 40882 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4088  $ Fuel meat section 2
408810 40883 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4088  $ Fuel meat section 3
408811 40884 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4088  $ Fuel meat section 4
408812 40885 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4088  $ Fuel meat section 5
408813  106  -1.56     312304 -312305 -311304          imp:n=1 u=4088  $ Upper graphite spacer
408814  104  -2.70     312305 -312306 -311305          imp:n=1 u=4088  $ Al top cap 
408815  104  -2.70     312306 -312307 -311303          imp:n=1 u=4088  $ Tri-flute 
408816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4088  $ Water around tri-flute 
408817  104  -2.70     312307 -312308 -311302          imp:n=1 u=4088  $ Fuel tip
408818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4088  $ Water around fuel tip
408819  102  -1.00     312308 -312309 -311306          imp:n=1 u=4088  $ Water above fuel element
c
c
c
c --- F6 - Graphite ---
c
c
c
c
c --- F7 - 3868 - Al (TOS210D130) universe ---
c
386801  104  -2.70     312300 -312301 -311302          imp:n=1 u=3868  $ Lower grid plate pin
386802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3868  $ Water around grid plate pin 
386803  104  -2.70     312301 -312302 -311305          imp:n=1 u=3868  $ Bottom casing 
386804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3868  $ Water around fuel element
386805  106  -1.56     312302 -312303 -311304          imp:n=1 u=3868  $ Lower graphite slug 
386806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3868  $ Fuel cladding
386807  108   0.042234 312303 -312304 -311301          imp:n=1 u=3868  $ Zirc pin 
386808 38681 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3868  $ Fuel meat section 1
386809 38682 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3868  $ Fuel meat section 2
386810 38683 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3868  $ Fuel meat section 3
386811 38684 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3868  $ Fuel meat section 4
386812 38685 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3868  $ Fuel meat section 5
386813  106  -1.56     312304 -312305 -311304          imp:n=1 u=3868  $ Upper graphite spacer
386814  104  -2.70     312305 -312306 -311305          imp:n=1 u=3868  $ Al top cap 
386815  104  -2.70     312306 -312307 -311303          imp:n=1 u=3868  $ Tri-flute 
386816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3868  $ Water around tri-flute 
386817  104  -2.70     312307 -312308 -311302          imp:n=1 u=3868  $ Fuel tip
386818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3868  $ Water around fuel tip
386819  102  -1.00     312308 -312309 -311306          imp:n=1 u=3868  $ Water above fuel element
c
c
c
c --- F8 - 4120 - Al (TOS210D130) universe ---
c
412001  104  -2.70     312300 -312301 -311302          imp:n=1 u=4120  $ Lower grid plate pin
412002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4120  $ Water around grid plate pin 
412003  104  -2.70     312301 -312302 -311305          imp:n=1 u=4120  $ Bottom casing 
412004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4120  $ Water around fuel element
412005  106  -1.56     312302 -312303 -311304          imp:n=1 u=4120  $ Lower graphite slug 
412006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4120  $ Fuel cladding
412007  108   0.042234 312303 -312304 -311301          imp:n=1 u=4120  $ Zirc pin 
412008 41201 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4120  $ Fuel meat section 1
412009 41202 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4120  $ Fuel meat section 2
412010 41203 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4120  $ Fuel meat section 3
412011 41204 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4120  $ Fuel meat section 4
412012 41205 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4120  $ Fuel meat section 5
412013  106  -1.56     312304 -312305 -311304          imp:n=1 u=4120  $ Upper graphite spacer
412014  104  -2.70     312305 -312306 -311305          imp:n=1 u=4120  $ Al top cap 
412015  104  -2.70     312306 -312307 -311303          imp:n=1 u=4120  $ Tri-flute 
412016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4120  $ Water around tri-flute 
412017  104  -2.70     312307 -312308 -311302          imp:n=1 u=4120  $ Fuel tip
412018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4120  $ Water around fuel tip
412019  102  -1.00     312308 -312309 -311306          imp:n=1 u=4120  $ Water above fuel element
c
c
c
c --- F9 - Rabbit ---
c
c
c
c
c --- F10 - Graphite ---
c
c
c
c
c --- F11 - Graphite ---
c
c
c
c
c --- F12 - Graphite ---
c
c
c
c
c --- F13 - Graphite ---
c
c
c
c
c --- F14 - 3810 - Al (TOS210D130) universe ---
c
381001  104  -2.70     312300 -312301 -311302          imp:n=1 u=3810  $ Lower grid plate pin
381002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3810  $ Water around grid plate pin 
381003  104  -2.70     312301 -312302 -311305          imp:n=1 u=3810  $ Bottom casing 
381004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3810  $ Water around fuel element
381005  106  -1.56     312302 -312303 -311304          imp:n=1 u=3810  $ Lower graphite slug 
381006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3810  $ Fuel cladding
381007  108   0.042234 312303 -312304 -311301          imp:n=1 u=3810  $ Zirc pin 
381008 38101 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3810  $ Fuel meat section 1
381009 38102 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3810  $ Fuel meat section 2
381010 38103 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3810  $ Fuel meat section 3
381011 38104 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3810  $ Fuel meat section 4
381012 38105 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3810  $ Fuel meat section 5
381013  106  -1.56     312304 -312305 -311304          imp:n=1 u=3810  $ Upper graphite spacer
381014  104  -2.70     312305 -312306 -311305          imp:n=1 u=3810  $ Al top cap 
381015  104  -2.70     312306 -312307 -311303          imp:n=1 u=3810  $ Tri-flute 
381016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3810  $ Water around tri-flute 
381017  104  -2.70     312307 -312308 -311302          imp:n=1 u=3810  $ Fuel tip
381018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3810  $ Water around fuel tip
381019  102  -1.00     312308 -312309 -311306          imp:n=1 u=3810  $ Water above fuel element
c
c
c
c --- F15 - 4130 - Al (TOS210D130) universe ---
c
413001  104  -2.70     312300 -312301 -311302          imp:n=1 u=4130  $ Lower grid plate pin
413002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4130  $ Water around grid plate pin 
413003  104  -2.70     312301 -312302 -311305          imp:n=1 u=4130  $ Bottom casing 
413004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4130  $ Water around fuel element
413005  106  -1.56     312302 -312303 -311304          imp:n=1 u=4130  $ Lower graphite slug 
413006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4130  $ Fuel cladding
413007  108   0.042234 312303 -312304 -311301          imp:n=1 u=4130  $ Zirc pin 
413008 41301 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4130  $ Fuel meat section 1
413009 41302 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4130  $ Fuel meat section 2
413010 41303 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4130  $ Fuel meat section 3
413011 41304 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4130  $ Fuel meat section 4
413012 41305 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4130  $ Fuel meat section 5
413013  106  -1.56     312304 -312305 -311304          imp:n=1 u=4130  $ Upper graphite spacer
413014  104  -2.70     312305 -312306 -311305          imp:n=1 u=4130  $ Al top cap 
413015  104  -2.70     312306 -312307 -311303          imp:n=1 u=4130  $ Tri-flute 
413016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4130  $ Water around tri-flute 
413017  104  -2.70     312307 -312308 -311302          imp:n=1 u=4130  $ Fuel tip
413018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4130  $ Water around fuel tip
413019  102  -1.00     312308 -312309 -311306          imp:n=1 u=4130  $ Water above fuel element
c
c
c
c --- F16 - 4091 - Al (TOS210D130) universe ---
c
409101  104  -2.70     312300 -312301 -311302          imp:n=1 u=4091  $ Lower grid plate pin
409102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4091  $ Water around grid plate pin 
409103  104  -2.70     312301 -312302 -311305          imp:n=1 u=4091  $ Bottom casing 
409104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4091  $ Water around fuel element
409105  106  -1.56     312302 -312303 -311304          imp:n=1 u=4091  $ Lower graphite slug 
409106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4091  $ Fuel cladding
409107  108   0.042234 312303 -312304 -311301          imp:n=1 u=4091  $ Zirc pin 
409108 40911 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4091  $ Fuel meat section 1
409109 40912 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4091  $ Fuel meat section 2
409110 40913 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4091  $ Fuel meat section 3
409111 40914 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4091  $ Fuel meat section 4
409112 40915 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4091  $ Fuel meat section 5
409113  106  -1.56     312304 -312305 -311304          imp:n=1 u=4091  $ Upper graphite spacer
409114  104  -2.70     312305 -312306 -311305          imp:n=1 u=4091  $ Al top cap 
409115  104  -2.70     312306 -312307 -311303          imp:n=1 u=4091  $ Tri-flute 
409116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4091  $ Water around tri-flute 
409117  104  -2.70     312307 -312308 -311302          imp:n=1 u=4091  $ Fuel tip
409118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4091  $ Water around fuel tip
409119  102  -1.00     312308 -312309 -311306          imp:n=1 u=4091  $ Water above fuel element
c
c
c
c --- F17 - 3673 - Al (TOS210D130) universe ---
c
367301  104  -2.70     312300 -312301 -311302          imp:n=1 u=3673  $ Lower grid plate pin
367302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3673  $ Water around grid plate pin 
367303  104  -2.70     312301 -312302 -311305          imp:n=1 u=3673  $ Bottom casing 
367304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3673  $ Water around fuel element
367305  106  -1.56     312302 -312303 -311304          imp:n=1 u=3673  $ Lower graphite slug 
367306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3673  $ Fuel cladding
367307  108   0.042234 312303 -312304 -311301          imp:n=1 u=3673  $ Zirc pin 
367308 36731 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3673  $ Fuel meat section 1
367309 36732 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3673  $ Fuel meat section 2
367310 36733 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3673  $ Fuel meat section 3
367311 36734 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3673  $ Fuel meat section 4
367312 36735 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3673  $ Fuel meat section 5
367313  106  -1.56     312304 -312305 -311304          imp:n=1 u=3673  $ Upper graphite spacer
367314  104  -2.70     312305 -312306 -311305          imp:n=1 u=3673  $ Al top cap 
367315  104  -2.70     312306 -312307 -311303          imp:n=1 u=3673  $ Tri-flute 
367316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3673  $ Water around tri-flute 
367317  104  -2.70     312307 -312308 -311302          imp:n=1 u=3673  $ Fuel tip
367318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3673  $ Water around fuel tip
367319  102  -1.00     312308 -312309 -311306          imp:n=1 u=3673  $ Water above fuel element
c
c
c
c --- F18 - 3682 - Al (TOS210D130) universe ---
c
368201  104  -2.70     312300 -312301 -311302          imp:n=1 u=3682  $ Lower grid plate pin
368202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3682  $ Water around grid plate pin 
368203  104  -2.70     312301 -312302 -311305          imp:n=1 u=3682  $ Bottom casing 
368204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3682  $ Water around fuel element
368205  106  -1.56     312302 -312303 -311304          imp:n=1 u=3682  $ Lower graphite slug 
368206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3682  $ Fuel cladding
368207  108   0.042234 312303 -312304 -311301          imp:n=1 u=3682  $ Zirc pin 
368208 36821 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3682  $ Fuel meat section 1
368209 36822 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3682  $ Fuel meat section 2
368210 36823 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3682  $ Fuel meat section 3
368211 36824 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3682  $ Fuel meat section 4
368212 36825 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3682  $ Fuel meat section 5
368213  106  -1.56     312304 -312305 -311304          imp:n=1 u=3682  $ Upper graphite spacer
368214  104  -2.70     312305 -312306 -311305          imp:n=1 u=3682  $ Al top cap 
368215  104  -2.70     312306 -312307 -311303          imp:n=1 u=3682  $ Tri-flute 
368216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3682  $ Water around tri-flute 
368217  104  -2.70     312307 -312308 -311302          imp:n=1 u=3682  $ Fuel tip
368218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3682  $ Water around fuel tip
368219  102  -1.00     312308 -312309 -311306          imp:n=1 u=3682  $ Water above fuel element
c
c
c
c --- F19 - 4132 - Al (TOS210D130) universe ---
c
413201  104  -2.70     312300 -312301 -311302          imp:n=1 u=4132  $ Lower grid plate pin
413202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4132  $ Water around grid plate pin 
413203  104  -2.70     312301 -312302 -311305          imp:n=1 u=4132  $ Bottom casing 
413204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4132  $ Water around fuel element
413205  106  -1.56     312302 -312303 -311304          imp:n=1 u=4132  $ Lower graphite slug 
413206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4132  $ Fuel cladding
413207  108   0.042234 312303 -312304 -311301          imp:n=1 u=4132  $ Zirc pin 
413208 41321 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4132  $ Fuel meat section 1
413209 41322 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4132  $ Fuel meat section 2
413210 41323 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4132  $ Fuel meat section 3
413211 41324 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4132  $ Fuel meat section 4
413212 41325 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4132  $ Fuel meat section 5
413213  106  -1.56     312304 -312305 -311304          imp:n=1 u=4132  $ Upper graphite spacer
413214  104  -2.70     312305 -312306 -311305          imp:n=1 u=4132  $ Al top cap 
413215  104  -2.70     312306 -312307 -311303          imp:n=1 u=4132  $ Tri-flute 
413216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4132  $ Water around tri-flute 
413217  104  -2.70     312307 -312308 -311302          imp:n=1 u=4132  $ Fuel tip
413218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4132  $ Water around fuel tip
413219  102  -1.00     312308 -312309 -311306          imp:n=1 u=4132  $ Water above fuel element
c
c
c
c --- F20 - 4046 - Al (TOS210D130) universe ---
c
404601  102  -1.00     312300 -312301 -311302          imp:n=1 u=4046  $ Lower grid plate pin
404602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4046  $ Water around grid plate pin 
404603  102  -1.00     312301 -312302 -311305          imp:n=1 u=4046  $ Bottom casing 
404604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4046  $ Water around fuel element
404605  102  -1.00     312302 -312303 -311304          imp:n=1 u=4046  $ Lower graphite slug 
404606  102  -1.00     312302 -312305  311304 -311305  imp:n=1 u=4046  $ Fuel cladding
404607  102   -1.00 312303 -312304 -311301          imp:n=1 u=4046  $ Zirc pin 
404608 102 -1.00    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4046  $ Fuel meat section 1
404609 102 -1.00    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4046  $ Fuel meat section 2
404610 102 -1.00    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4046  $ Fuel meat section 3
404611 102 -1.00    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4046  $ Fuel meat section 4
404612 102 -1.00    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4046  $ Fuel meat section 5
404613  102  -1.00     312304 -312305 -311304          imp:n=1 u=4046  $ Upper graphite spacer
404614  102  -1.00     312305 -312306 -311305          imp:n=1 u=4046  $ Al top cap 
404615  102  -1.00     312306 -312307 -311303          imp:n=1 u=4046  $ Tri-flute 
404616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4046  $ Water around tri-flute 
404617  102  -1.00     312307 -312308 -311302          imp:n=1 u=4046  $ Fuel tip
404618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4046  $ Water around fuel tip
404619  102  -1.00     312308 -312309 -311306          imp:n=1 u=4046  $ Water above fuel element
c
c
c
c --- F21 - 3865 - Al (TOS210D130) universe ---
c
386501  102  -1.00     312300 -312301 -311302          imp:n=1 u=3865  $ Lower grid plate pin
386502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3865  $ Water around grid plate pin 
386503  102  -1.00     312301 -312302 -311305          imp:n=1 u=3865  $ Bottom casing 
386504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3865  $ Water around fuel element
386505  102  -1.00     312302 -312303 -311304          imp:n=1 u=3865  $ Lower graphite slug 
386506  102  -1.00     312302 -312305  311304 -311305  imp:n=1 u=3865  $ Fuel cladding
386507  102   -1.00 312303 -312304 -311301          imp:n=1 u=3865  $ Zirc pin 
386508 102 -1.00    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3865  $ Fuel meat section 1
386509 102 -1.00    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3865  $ Fuel meat section 2
386510 102 -1.00    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3865  $ Fuel meat section 3
386511 102 -1.00    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3865  $ Fuel meat section 4
386512 102 -1.00    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3865  $ Fuel meat section 5
386513  102  -1.00     312304 -312305 -311304          imp:n=1 u=3865  $ Upper graphite spacer
386514  102  -1.00     312305 -312306 -311305          imp:n=1 u=3865  $ Al top cap 
386515  102  -1.00     312306 -312307 -311303          imp:n=1 u=3865  $ Tri-flute 
386516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3865  $ Water around tri-flute 
386517  102  -1.00     312307 -312308 -311302          imp:n=1 u=3865  $ Fuel tip
386518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3865  $ Water around fuel tip
386519  102  -1.00     312308 -312309 -311306          imp:n=1 u=3865  $ Water above fuel element
c
c
c
c --- F22 - 3743 - Al (TOS210D130) universe ---
c
374301  104  -2.70     312300 -312301 -311302          imp:n=1 u=3743  $ Lower grid plate pin
374302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3743  $ Water around grid plate pin 
374303  104  -2.70     312301 -312302 -311305          imp:n=1 u=3743  $ Bottom casing 
374304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3743  $ Water around fuel element
374305  106  -1.56     312302 -312303 -311304          imp:n=1 u=3743  $ Lower graphite slug 
374306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3743  $ Fuel cladding
374307  108   0.042234 312303 -312304 -311301          imp:n=1 u=3743  $ Zirc pin 
374308 37431 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3743  $ Fuel meat section 1
374309 37432 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3743  $ Fuel meat section 2
374310 37433 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3743  $ Fuel meat section 3
374311 37434 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3743  $ Fuel meat section 4
374312 37435 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3743  $ Fuel meat section 5
374313  106  -1.56     312304 -312305 -311304          imp:n=1 u=3743  $ Upper graphite spacer
374314  104  -2.70     312305 -312306 -311305          imp:n=1 u=3743  $ Al top cap 
374315  104  -2.70     312306 -312307 -311303          imp:n=1 u=3743  $ Tri-flute 
374316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3743  $ Water around tri-flute 
374317  104  -2.70     312307 -312308 -311302          imp:n=1 u=3743  $ Fuel tip
374318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3743  $ Water around fuel tip
374319  102  -1.00     312308 -312309 -311306          imp:n=1 u=3743  $ Water above fuel element
c
c
c
c --- F23 - AmBe Source ---
c
c
c
c
c --- F24 - 3835 - Al (TOS210D130) universe ---
c
383501  104  -2.70     312300 -312301 -311302          imp:n=1 u=3835  $ Lower grid plate pin
383502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3835  $ Water around grid plate pin 
383503  104  -2.70     312301 -312302 -311305          imp:n=1 u=3835  $ Bottom casing 
383504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3835  $ Water around fuel element
383505  106  -1.56     312302 -312303 -311304          imp:n=1 u=3835  $ Lower graphite slug 
383506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3835  $ Fuel cladding
383507  108   0.042234 312303 -312304 -311301          imp:n=1 u=3835  $ Zirc pin 
383508 38351 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3835  $ Fuel meat section 1
383509 38352 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3835  $ Fuel meat section 2
383510 38353 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3835  $ Fuel meat section 3
383511 38354 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3835  $ Fuel meat section 4
383512 38355 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3835  $ Fuel meat section 5
383513  106  -1.56     312304 -312305 -311304          imp:n=1 u=3835  $ Upper graphite spacer
383514  104  -2.70     312305 -312306 -311305          imp:n=1 u=3835  $ Al top cap 
383515  104  -2.70     312306 -312307 -311303          imp:n=1 u=3835  $ Tri-flute 
383516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3835  $ Water around tri-flute 
383517  104  -2.70     312307 -312308 -311302          imp:n=1 u=3835  $ Fuel tip
383518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3835  $ Water around fuel tip
383519  102  -1.00     312308 -312309 -311306          imp:n=1 u=3835  $ Water above fuel element
c
c
c
c --- F25 - Ir-192 Source ---
c
c
c
c
c --- F26 - 3676 - Al (TOS210D130) universe ---
c
367601  104  -2.70     312300 -312301 -311302          imp:n=1 u=3676  $ Lower grid plate pin
367602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3676  $ Water around grid plate pin 
367603  104  -2.70     312301 -312302 -311305          imp:n=1 u=3676  $ Bottom casing 
367604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3676  $ Water around fuel element
367605  106  -1.56     312302 -312303 -311304          imp:n=1 u=3676  $ Lower graphite slug 
367606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3676  $ Fuel cladding
367607  108   0.042234 312303 -312304 -311301          imp:n=1 u=3676  $ Zirc pin 
367608 36761 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3676  $ Fuel meat section 1
367609 36762 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3676  $ Fuel meat section 2
367610 36763 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3676  $ Fuel meat section 3
367611 36764 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3676  $ Fuel meat section 4
367612 36765 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3676  $ Fuel meat section 5
367613  106  -1.56     312304 -312305 -311304          imp:n=1 u=3676  $ Upper graphite spacer
367614  104  -2.70     312305 -312306 -311305          imp:n=1 u=3676  $ Al top cap 
367615  104  -2.70     312306 -312307 -311303          imp:n=1 u=3676  $ Tri-flute 
367616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3676  $ Water around tri-flute 
367617  104  -2.70     312307 -312308 -311302          imp:n=1 u=3676  $ Fuel tip
367618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3676  $ Water around fuel tip
367619  102  -1.00     312308 -312309 -311306          imp:n=1 u=3676  $ Water above fuel element
c
c
c
c --- F27 - 3840 - Al (TOS210D130) universe ---
c
384001  104  -2.70     312300 -312301 -311302          imp:n=1 u=3840  $ Lower grid plate pin
384002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3840  $ Water around grid plate pin 
384003  104  -2.70     312301 -312302 -311305          imp:n=1 u=3840  $ Bottom casing 
384004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3840  $ Water around fuel element
384005  106  -1.56     312302 -312303 -311304          imp:n=1 u=3840  $ Lower graphite slug 
384006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3840  $ Fuel cladding
384007  108   0.042234 312303 -312304 -311301          imp:n=1 u=3840  $ Zirc pin 
384008 38401 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3840  $ Fuel meat section 1
384009 38402 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3840  $ Fuel meat section 2
384010 38403 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3840  $ Fuel meat section 3
384011 38404 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3840  $ Fuel meat section 4
384012 38405 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3840  $ Fuel meat section 5
384013  106  -1.56     312304 -312305 -311304          imp:n=1 u=3840  $ Upper graphite spacer
384014  104  -2.70     312305 -312306 -311305          imp:n=1 u=3840  $ Al top cap 
384015  104  -2.70     312306 -312307 -311303          imp:n=1 u=3840  $ Tri-flute 
384016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3840  $ Water around tri-flute 
384017  104  -2.70     312307 -312308 -311302          imp:n=1 u=3840  $ Fuel tip
384018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3840  $ Water around fuel tip
384019  102  -1.00     312308 -312309 -311306          imp:n=1 u=3840  $ Water above fuel element
c
c
c
c --- F28 - 3854 - Al (TOS210D130) universe ---
c
385401  104  -2.70     312300 -312301 -311302          imp:n=1 u=3854  $ Lower grid plate pin
385402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=3854  $ Water around grid plate pin 
385403  104  -2.70     312301 -312302 -311305          imp:n=1 u=3854  $ Bottom casing 
385404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=3854  $ Water around fuel element
385405  106  -1.56     312302 -312303 -311304          imp:n=1 u=3854  $ Lower graphite slug 
385406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=3854  $ Fuel cladding
385407  108   0.042234 312303 -312304 -311301          imp:n=1 u=3854  $ Zirc pin 
385408 38541 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=3854  $ Fuel meat section 1
385409 38542 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=3854  $ Fuel meat section 2
385410 38543 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=3854  $ Fuel meat section 3
385411 38544 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=3854  $ Fuel meat section 4
385412 38545 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=3854  $ Fuel meat section 5
385413  106  -1.56     312304 -312305 -311304          imp:n=1 u=3854  $ Upper graphite spacer
385414  104  -2.70     312305 -312306 -311305          imp:n=1 u=3854  $ Al top cap 
385415  104  -2.70     312306 -312307 -311303          imp:n=1 u=3854  $ Tri-flute 
385416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=3854  $ Water around tri-flute 
385417  104  -2.70     312307 -312308 -311302          imp:n=1 u=3854  $ Fuel tip
385418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=3854  $ Water around fuel tip
385419  102  -1.00     312308 -312309 -311306          imp:n=1 u=3854  $ Water above fuel element
c
c
c
c --- F29 - 4049 - Al (TOS210D130) universe ---
c
404901  104  -2.70     312300 -312301 -311302          imp:n=1 u=4049  $ Lower grid plate pin
404902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4049  $ Water around grid plate pin 
404903  104  -2.70     312301 -312302 -311305          imp:n=1 u=4049  $ Bottom casing 
404904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4049  $ Water around fuel element
404905  106  -1.56     312302 -312303 -311304          imp:n=1 u=4049  $ Lower graphite slug 
404906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4049  $ Fuel cladding
404907  108   0.042234 312303 -312304 -311301          imp:n=1 u=4049  $ Zirc pin 
404908 40491 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4049  $ Fuel meat section 1
404909 40492 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4049  $ Fuel meat section 2
404910 40493 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4049  $ Fuel meat section 3
404911 40494 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4049  $ Fuel meat section 4
404912 40495 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4049  $ Fuel meat section 5
404913  106  -1.56     312304 -312305 -311304          imp:n=1 u=4049  $ Upper graphite spacer
404914  104  -2.70     312305 -312306 -311305          imp:n=1 u=4049  $ Al top cap 
404915  104  -2.70     312306 -312307 -311303          imp:n=1 u=4049  $ Tri-flute 
404916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4049  $ Water around tri-flute 
404917  104  -2.70     312307 -312308 -311302          imp:n=1 u=4049  $ Fuel tip
404918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4049  $ Water around fuel tip
404919  102  -1.00     312308 -312309 -311306          imp:n=1 u=4049  $ Water above fuel element
c
c
c
c --- F30 - 4127 - Al (TOS210D130) universe ---
c
412701  104  -2.70     312300 -312301 -311302          imp:n=1 u=4127  $ Lower grid plate pin
412702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4127  $ Water around grid plate pin 
412703  104  -2.70     312301 -312302 -311305          imp:n=1 u=4127  $ Bottom casing 
412704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4127  $ Water around fuel element
412705  106  -1.56     312302 -312303 -311304          imp:n=1 u=4127  $ Lower graphite slug 
412706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4127  $ Fuel cladding
412707  108   0.042234 312303 -312304 -311301          imp:n=1 u=4127  $ Zirc pin 
412708 41271 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=4127  $ Fuel meat section 1
412709 41272 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=4127  $ Fuel meat section 2
412710 41273 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=4127  $ Fuel meat section 3
412711 41274 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=4127  $ Fuel meat section 4
412712 41275 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=4127  $ Fuel meat section 5
412713  106  -1.56     312304 -312305 -311304          imp:n=1 u=4127  $ Upper graphite spacer
412714  104  -2.70     312305 -312306 -311305          imp:n=1 u=4127  $ Al top cap 
412715  104  -2.70     312306 -312307 -311303          imp:n=1 u=4127  $ Tri-flute 
412716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4127  $ Water around tri-flute 
412717  104  -2.70     312307 -312308 -311302          imp:n=1 u=4127  $ Fuel tip
412718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4127  $ Water around fuel tip
412719  102  -1.00     312308 -312309 -311306          imp:n=1 u=4127  $ Water above fuel element
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
2000 102 -1.0 312300 -312309 -311306 imp:n=1 u=2 $ Water test cell
c
c
c
c
c ------------------------------
c --------- Void cells ---------
c ------------------------------
c
10001  0  -192399                  imp:n=0  $ void below model
10002  0   192399 -192301  191301  imp:n=0  $ void around model
10003  0   192301                  imp:n=0  $ void above model
c
c
c
c ------------------------------
c --------- Grid plates --------
c ------------------------------
c
c
c ------------- upper grid plate -------------
c
11001   103  -2.70  112304 -112305 -132008 -132034  111300 -131302
      902019                                                         imp:n=1  $ Upper grid plate above B1
c
11002   103  -2.70  112304 -112305  132008 -132021  111300 -131302  
      902029  111312                                                 imp:n=1  $ Upper grid plate above B2
c
11003   103  -2.70  112304 -112305 -132034  132021  111300 -131302  
      902039  111312  111307  111306                                 imp:n=1  $ Upper grid plate above B3
c
11004   103  -2.70  112304 -112305  132008  132034  111300 -131302
      902049                                                         imp:n=1  $ Upper grid plate above B4
c
11005   103  -2.70  112304 -112305 -132008  132021  111300 -131302  
      902059  111301                                                 imp:n=1  $ Upper grid plate above B5
c
11006   103  -2.70  112304 -112305  132034 -132021  111300 -131302  
      902069  111301                                                 imp:n=1  $ Upper grid plate above B6
c
c
c
c
11007   103  -2.70  112304 -112305 -132037 -132005  131302 -131303
      903019                                                         imp:n=1  $ Upper grid plate above C1
c
11008   103  -2.70  112304 -112305  132005 -132011  131302 -131303
      903029                                                         imp:n=1  $ Upper grid plate above C2
c
11009   103  -2.70  112304 -112305  132011 -132018  131302 -131303
      903039                                                         imp:n=1  $ Upper grid plate above C3
c
11010   103  -2.70  112304 -112305  132018 -132024  131302 -131303
      903049  111307                                                 imp:n=1  $ Upper grid plate above C4
c
11011   103  -2.70  112304 -112305  132024 -132031  131302 -131303
      903059  111306  111307  111308                                 imp:n=1  $ Upper grid plate above C5
c
11012   103  -2.70  112304 -112305  132031 -132037  131302 -131303
      903069  111306                                                 imp:n=1  $ Upper grid plate above C6
c
11013   103  -2.70  112304 -112305  132037  132005  131302 -131303
      903079                                                         imp:n=1  $ Upper grid plate above C7
c
11014   103  -2.70  112304 -112305 -132005  132011  131302 -131303
      903089                                                         imp:n=1  $ Upper grid plate above C8
c
11015   103  -2.70  112304 -112305 -132011  132018  131302 -131303
      903099                                                         imp:n=1  $ Upper grid plate above C9
c
11016   103  -2.70  112304 -112305 -132018  132024  131302 -131303
      903109                                                         imp:n=1  $ Upper grid plate above C10
c
11017   103  -2.70  112304 -112305 -132024  132031  131302 -131303
      903119                                                         imp:n=1  $ Upper grid plate above C11
c
11018   103  -2.70  112304 -112305 -132031  132037  131302 -131303
      903129                                                         imp:n=1  $ Upper grid plate above C12
c
c
c
c
11019   103  -2.70  112304 -112305 -132004 -132038  131303 -131304
      904019                                                         imp:n=1  $ Upper grid plate above D1
c
11020   103  -2.70  112304 -112305  132004 -132008  131303 -131304
      904029                                                         imp:n=1  $ Upper grid plate above D2
c
11021   103  -2.70  112304 -112305  132008 -132012  131303 -131304
      904039                                                         imp:n=1  $ Upper grid plate above D3
c
11022   103  -2.70  112304 -112305  132012 -132017  131303 -131304
      904049                                                         imp:n=1  $ Upper grid plate above D4
c
11023   103  -2.70  112304 -112305  132017 -132021  131303 -131304
      904059  111313  111314                                         imp:n=1  $ Upper grid plate above D5
c
11024   103  -2.70  112304 -112305  132021 -132025  131303 -131304
      904069  111308  111309  111313  111314                         imp:n=1  $ Upper grid plate above D6
c
11025   103  -2.70  112304 -112305  132025 -132030  131303 -131304
      904079  111308  111309                                         imp:n=1  $ Upper grid plate above D7
c
11026   103  -2.70  112304 -112305  132030 -132034  131303 -131304
      904089                                                         imp:n=1  $ Upper grid plate above D8
c
11027   103  -2.70  112304 -112305  132034 -132038  131303 -131304
      904099                                                         imp:n=1  $ Upper grid plate above D9
c
11028   103  -2.70  112304 -112305  132004  132038  131303 -131304
      904109                                                         imp:n=1  $ Upper grid plate above D10
c
11029   103  -2.70  112304 -112305 -132004  132008  131303 -131304
      904119                                                         imp:n=1  $ Upper grid plate above D11
c
11030   103  -2.70  112304 -112305 -132008  132012  131303 -131304
      904129                                                         imp:n=1  $ Upper grid plate above D12
c
11031   103  -2.70  112304 -112305 -132012  132017  131303 -131304
      904139                                                         imp:n=1  $ Upper grid plate above D13
c
11032   103  -2.70  112304 -112305 -132017  132021  131303 -131304
      904149  111302  111303                                         imp:n=1  $ Upper grid plate above D14
c
11033   103  -2.70  112304 -112305 -132021  132025  131303 -131304
      904159  111302  111303                                         imp:n=1  $ Upper grid plate above D15
c
11034   103  -2.70  112304 -112305 -132025  132030  131303 -131304
      904169                                                         imp:n=1  $ Upper grid plate above D16
c
11035   103  -2.70  112304 -112305 -132030  132034  131303 -131304
      904179                                                         imp:n=1  $ Upper grid plate above D17
c
11036   103  -2.70  112304 -112305 -132034  132038  131303 -131304
      904189                                                         imp:n=1  $ Upper grid plate above D18
c
c
c
c
11037   103  -2.70  112304 -112305 -132003 -132039  131304 -131305
      905019                                                         imp:n=1  $ Upper grid plate above E1
c
11038   103  -2.70  112304 -112305  132003 -132007  131304 -131305
      905029                                                         imp:n=1  $ Upper grid plate above E2
c
11039   103  -2.70  112304 -112305  132007 -132009  131304 -131305
      905039                                                         imp:n=1  $ Upper grid plate above E3
c
11040   103  -2.70  112304 -112305  132009 -132013  131304 -131305
      905049                                                         imp:n=1  $ Upper grid plate above E4
c
11041   103  -2.70  112304 -112305  132013 -132016  131304 -131305
      905059                                                         imp:n=1  $ Upper grid plate above E5
c
11042   103  -2.70  112304 -112305  132016 -132020  131304 -131305
      905069                                                         imp:n=1  $ Upper grid plate above E6
c
11043   103  -2.70  112304 -112305  132020 -132022  131304 -131305
      905079                                                         imp:n=1  $ Upper grid plate above E7
c
11044   103  -2.70  112304 -112305  132022 -132026  131304 -131305
      905089  111309  111310                                         imp:n=1  $ Upper grid plate above E8
c
11045   103  -2.70  112304 -112305  132026 -132029  131304 -131305
      905099  111309  111310                                         imp:n=1  $ Upper grid plate above E9
c
11046   103  -2.70  112304 -112305  132029 -132033  131304 -131305
      905109                                                         imp:n=1  $ Upper grid plate above E10
c
11047   103  -2.70  112304 -112305  132033 -132035  131304 -131305
      905119                                                         imp:n=1  $ Upper grid plate above E11
c
11048   103  -2.70  112304 -112305  132035 -132039  131304 -131305
      905129                                                         imp:n=1  $ Upper grid plate above E12
c
11049   103  -2.70  112304 -112305  132003  132039  131304 -131305
      905139                                                         imp:n=1  $ Upper grid plate above E13
c
11050   103  -2.70  112304 -112305 -132003  132007  131304 -131305
      905149                                                         imp:n=1  $ Upper grid plate above E14
c
11051   103  -2.70  112304 -112305 -132007  132009  131304 -131305
      905159                                                         imp:n=1  $ Upper grid plate above E15
c
11052   103  -2.70  112304 -112305 -132009  132013  131304 -131305
      905169                                                         imp:n=1  $ Upper grid plate above E16
c
11053   103  -2.70  112304 -112305 -132013  132016  131304 -131305
      905179                                                         imp:n=1  $ Upper grid plate above E17
c
11054   103  -2.70  112304 -112305 -132016  132020  131304 -131305
      905189                                                         imp:n=1  $ Upper grid plate above E18
c
11055   103  -2.70  112304 -112305 -132020  132022  131304 -131305
      905199                                                         imp:n=1  $ Upper grid plate above E19
c
11056   103  -2.70  112304 -112305 -132022  132026  131304 -131305
      905209                                                         imp:n=1  $ Upper grid plate above E20
c
11057   103  -2.70  112304 -112305 -132026  132029  131304 -131305
      905219                                                         imp:n=1  $ Upper grid plate above E21
c
11058   103  -2.70  112304 -112305 -132029  132033  131304 -131305
      905229                                                         imp:n=1  $ Upper grid plate above E22
c
11059   103  -2.70  112304 -112305 -132033  132035  131304 -131305
      905239                                                         imp:n=1  $ Upper grid plate above E23
c
11060   103  -2.70  112304 -112305 -132035  132039  131304 -131305
      905249                                                         imp:n=1  $ Upper grid plate above E24
c
c
c
c
11061   103  -2.70  112304 -112305 -132040 -132002  131305 -111399
      906019                                                         imp:n=1  $ Upper grid plate above F1
c
11062   103  -2.70  112304 -112305  132002 -132006  131305 -111399
      906029                                                         imp:n=1  $ Upper grid plate above F2
c
11063   103  -2.70  112304 -112305  132006 -132008  131305 -111399
      906039                                                         imp:n=1  $ Upper grid plate above F3
c
11064   103  -2.70  112304 -112305  132008 -132010  131305 -111399
      906049                                                         imp:n=1  $ Upper grid plate above F4
c
11065   103  -2.70  112304 -112305  132010 -132014  131305 -111399
      906059                                                         imp:n=1  $ Upper grid plate above F5
c
11066   103  -2.70  112304 -112305  132014 -132015  131305 -111399
      906069                                                         imp:n=1  $ Upper grid plate above F6
c
11067   103  -2.70  112304 -112305  132015 -132019  131305 -111399
      906079  111316                                                 imp:n=1  $ Upper grid plate above F7
c
11068   103  -2.70  112304 -112305  132019 -132021  131305 -111399
      906089  111315  111316                                         imp:n=1  $ Upper grid plate above F8
c
11069   103  -2.70  112304 -112305  132021 -132023  131305 -111399
      906099  111315                                                 imp:n=1  $ Upper grid plate above F9
c
11070   103  -2.70  112304 -112305  132023 -132027  131305 -111399
      906109  111310  111311                                         imp:n=1  $ Upper grid plate above F10
c
11071   103  -2.70  112304 -112305  132027 -132028  131305 -111399
      906119  111310  111311                                         imp:n=1  $ Upper grid plate above F11
c
11072   103  -2.70  112304 -112305  132028 -132032  131305 -111399
      906129                                                         imp:n=1  $ Upper grid plate above F12
c
11073   103  -2.70  112304 -112305  132032 -132034  131305 -111399
      906139                                                         imp:n=1  $ Upper grid plate above F13
c
11074   103  -2.70  112304 -112305  132034 -132036  131305 -111399
      906149                                                         imp:n=1  $ Upper grid plate above F14
c
11075   103  -2.70  112304 -112305  132036 -132040  131305 -111399
      906159                                                         imp:n=1  $ Upper grid plate above F15
c
11076   103  -2.70  112304 -112305  132040  132002  131305 -111399
      906169                                                         imp:n=1  $ Upper grid plate above F16
c
11077   103  -2.70  112304 -112305 -132002  132006  131305 -111399
      906179                                                         imp:n=1  $ Upper grid plate above F17
c
11078   103  -2.70  112304 -112305 -132006  132008  131305 -111399
      906189                                                         imp:n=1  $ Upper grid plate above F18
c
11079   103  -2.70  112304 -112305 -132008  132010  131305 -111399
      906199                                                         imp:n=1  $ Upper grid plate above F19
c
11080   103  -2.70  112304 -112305 -132010  132014  131305 -111399
      906209                                                         imp:n=1  $ Upper grid plate above F20
c
11081   103  -2.70  112304 -112305 -132014  132015  131305 -111399
      906219                                                         imp:n=1  $ Upper grid plate above F21
c
11082   103  -2.70  112304 -112305 -132015  132019  131305 -111399
      906229  111305                                                 imp:n=1  $ Upper grid plate above F22
c
11083   103  -2.70  112304 -112305 -132019  132021  131305 -111399
      906239  111304  111305                                         imp:n=1  $ Upper grid plate above F23
c
11084   103  -2.70  112304 -112305 -132021  132023  131305 -111399  
      906249  111304                                                 imp:n=1  $ Upper grid plate above F24
c
11085   103  -2.70  112304 -112305 -132023  132027  131305 -111399
      906259                                                         imp:n=1  $ Upper grid plate above F25
c
11086   103  -2.70  112304 -112305 -132027  132028  131305 -111399
      906269                                                         imp:n=1  $ Upper grid plate above F26
c
11087   103  -2.70  112304 -112305 -132028  132032  131305 -111399
      906279                                                         imp:n=1  $ Upper grid plate above F27
c
11088   103  -2.70  112304 -112305 -132032  132034  131305 -111399
      906289                                                         imp:n=1  $ Upper grid plate above F28
c
11089   103  -2.70  112304 -112305 -132034  132036  131305 -111399
      906299                                                         imp:n=1  $ Upper grid plate above F20
c
11090   103  -2.70  112304 -112305 -132036  132040  131305 -111399
      906309                                                         imp:n=1  $ Upper grid plate above F30
c
c
c  ---- alternate lower grid plate for error reduction ----
c
77001  103  -2.70  112301 -10  111397 -131302   imp:n=1   $ Lower grid plate B ring
77002  103  -2.70  112301 -10  131302 -131303   imp:n=1   $ Lower grid plate C ring
77003  103  -2.70  112301 -10  131303 -131304   imp:n=1   $ Lower grid plate D ring
77004  103  -2.70  112301 -10  131304 -131305   imp:n=1   $ Lower grid plate E ring
77005  103  -2.70  112301 -10  131305 -111398   imp:n=1   $ Lower grid plate E ring
c
c
c
c ------------------------------
c ----- Graphite reflector -----
c ------------------------------
c
12001  106  -1.60      122302 -122305  121302 -121303   imp:n=1  $ Inner graphite blank
12002  106  -1.60      122302 -122303  121303 -121306   imp:n=1  $ LS channel region graphite blank
12003  106  -1.60      122302 -122305  121306 -121307   imp:n=1  $ Outer graphite blank
c
12004  103  -2.70      122301 -122306  121301 -121302   imp:n=1  $ Inner reflector container wall
12005  103  -2.70      122303 -122306  121303 -121304   imp:n=1  $ Inner LS channel container wall
12006  103  -2.70      122303 -122306  121305 -121306   imp:n=1  $ Outer LS channel container wall
12007  103  -2.70      122301 -122306  121307 -121308   imp:n=1  $ Outer reclector assembly container wall
c
12008  103  -2.70      122301 -122302  121302 -121307   imp:n=1  $ Reflector assembly bottom container annulus 
12009  103  -2.70      122305 -122306  121302 -121303   imp:n=1  $ Reflector assembly top inner container annulus
12010  103  -2.70      122303 -122304  121304 -121305   imp:n=1  $ LS channel bottom container annulus
12011  103  -2.70      122305 -122306  121306 -121307   imp:n=1  $ Reflector assembly top outer container annulus
c
c
c
c ------------------------------
c ---- Rotary specimen rack ----
c ------------------------------
c
c
c ------ Rotary rack enclosure ------
c
12012  103  -2.70      122309 -122310  121390 -121305   imp:n=1   $ Top cap of enclosure
12013  103  -2.70      122306 -122309  121390 -121391   imp:n=1   $ Lip wall of enclosure
12014  103  -2.70      122304 -122309  121392 -121305   imp:n=1   $ Outer wall of enclosure
12015  103  -2.70      122306 -122308  121391 -121393   imp:n=1   $ Bottom of LS lip
12016  103  -2.70      122304 -122306  121304 -121393   imp:n=1   $ Inner wall of enclosure
12017  103  -2.70      122304 -122307  121393 -121392   imp:n=1   $ Bottom wall of enclosure
c
12018  101  -0.001225  122307 -122311  121393 -121392   imp:n=1   $ Air under specimen holders
12019  101  -0.001225  122315 -122309  121391 -121392   imp:n=1   $ Air above rotary rack
12020  101  -0.001225  122313 -122315  121395 -121392   imp:n=1   $ Air around rack 
12021  101  -0.001225  122308 -122313  121391 -121393   imp:n=1   $ Air under rack support annulus
c
12022  103  -2.70      122313 -122315  121391 -121394   imp:n=1   $ Rack support annulus
c
c
c ------- Specimen holders ------- 
c
c ---- Position 1 ----
c
12101  101  -0.001225    122312 -122314 -121310            imp:n=1   $ Air inside sample tube
12201  103  -2.70        122311 -122312 -121310            imp:n=1   $ Bottom cap of tube  
12301  103  -2.70        122311 -122314  121310 -121311    imp:n=1   $ Sample tube         
c
12401  103  -2.70        122313  123301  121394 -121395  
                         122001 -122315  122020  121311    imp:n=1   $ Sample ring around position
c
12501  101  -0.001225    122314 -122315 -123301  121394 
                        -121395  122001  122020            imp:n=1   $ air above sample tube bevel
c
12601  101  -0.001225    122311 -122313  121393 -121392  
                         121311  122001  122020            imp:n=1   $ air around sample tube
c
c
c ---- Position 2 ----
c
12102  101  -0.001225    122312 -122314 -121350            imp:n=1   $ Air inside sample tube
12202  103  -2.70        122311 -122312 -121350            imp:n=1   $ Bottom cap of tube  
12302  103  -2.70        122311 -122314  121350 -121351    imp:n=1   $ Sample tube         
c
12402  103  -2.70        122313  123321  121394 -121395  
                        -122020 -122315  122019  121351    imp:n=1   $ Sample ring around position
c
12502  101  -0.001225    122314 -122315 -123321  121394 
                        -121395 -122020  122019            imp:n=1   $ air above sample tube bevel
c
12602  101  -0.001225    122311 -122313  121393 -121392  
                         121351 -122020  122019            imp:n=1   $ air around sample tube
c
c
c ---- Position 3 ----
c
12103  101  -0.001225    122312 -122314 -121312            imp:n=1   $ Air inside sample tube
12203  103  -2.70        122311 -122312 -121312            imp:n=1   $ Bottom cap of tube  
12303  103  -2.70        122311 -122314  121312 -121313    imp:n=1   $ Sample tube         
c
12403  103  -2.70        122313  123302  121394 -121395  
                        -122019 -122315  122018  121313    imp:n=1   $ Sample ring around position
c
12503  101  -0.001225    122314 -122315 -123302  121394 
                        -121395 -122019  122018            imp:n=1   $ air above sample tube bevel
c
12603  101  -0.001225    122311 -122313  121393 -121392  
                         121313 -122019  122018            imp:n=1   $ air around sample tube
c
c
c ---- Position 4 ----
c
12104  101  -0.001225    122312 -122314 -121352            imp:n=1   $ Air inside sample tube
12204  103  -2.70        122311 -122312 -121352            imp:n=1   $ Bottom cap of tube  
12304  103  -2.70        122311 -122314  121352 -121353    imp:n=1   $ Sample tube         
c
12404  103  -2.70        122313  123322  121394 -121395  
                        -122018 -122315  122017  121353    imp:n=1   $ Sample ring around position
c
12504  101  -0.001225    122314 -122315 -123322  121394 
                        -121395 -122018  122017            imp:n=1   $ air above sample tube bevel
c
12604  101  -0.001225    122311 -122313  121393 -121392  
                         121353 -122018  122017            imp:n=1   $ air around sample tube
c
c
c ---- Position 5 ----
c
12105  101  -0.001225    122312 -122314 -121314            imp:n=1   $ Air inside sample tube
12205  103  -2.70        122311 -122312 -121314            imp:n=1   $ Bottom cap of tube  
12305  103  -2.70        122311 -122314  121314 -121315    imp:n=1   $ Sample tube         
c
12405  103  -2.70        122313  123303  121394 -121395  
                        -122017 -122315  122016  121315    imp:n=1   $ Sample ring around position
c
12505  101  -0.001225    122314 -122315 -123303  121394 
                        -121395 -122017  122016            imp:n=1   $ air above sample tube bevel
c
12605  101  -0.001225    122311 -122313  121393 -121392  
                         121315 -122017  122016            imp:n=1   $ air around sample tube
c
c
c ---- Position 6 ----
c
12106  101  -0.001225    122312 -122314 -121354            imp:n=1   $ Air inside sample tube
12206  103  -2.70        122311 -122312 -121354            imp:n=1   $ Bottom cap of tube  
12306  103  -2.70        122311 -122314  121354 -121355    imp:n=1   $ Sample tube         
c
12406  103  -2.70        122313  123323  121394 -121395  
                        -122016 -122315  122015  121355    imp:n=1   $ Sample ring around position
c
12506  101  -0.001225    122314 -122315 -123323  121394 
                        -121395 -122016  122015            imp:n=1   $ air above sample tube bevel
c
12606  101  -0.001225    122311 -122313  121393 -121392  
                         121355 -122016  122015            imp:n=1   $ air around sample tube
c
c
c ---- Position 7 ----
c
12107  101  -0.001225    122312 -122314 -121316            imp:n=1   $ Air inside sample tube
12207  103  -2.70        122311 -122312 -121316            imp:n=1   $ Bottom cap of tube  
12307  103  -2.70        122311 -122314  121316 -121317    imp:n=1   $ Sample tube         
c
12407  103  -2.70        122313  123304  121394 -121395  
                        -122015 -122315  122014  121317    imp:n=1   $ Sample ring around position
c
12507  101  -0.001225    122314 -122315 -123304  121394 
                        -121395 -122015  122014            imp:n=1   $ air above sample tube bevel
c
12607  101  -0.001225    122311 -122313  121393 -121392  
                         121317 -122015  122014            imp:n=1   $ air around sample tube
c
c
c ---- Position 8 ----
c
12108  101  -0.001225    122312 -122314 -121356            imp:n=1   $ Air inside sample tube
12208  103  -2.70        122311 -122312 -121356            imp:n=1   $ Bottom cap of tube  
12308  103  -2.70        122311 -122314  121356 -121357    imp:n=1   $ Sample tube         
c
12408  103  -2.70        122313  123324  121394 -121395  
                        -122014 -122315  122013  121357    imp:n=1   $ Sample ring around position
c
12508  101  -0.001225    122314 -122315 -123324  121394 
                        -121395 -122014  122013            imp:n=1   $ air above sample tube bevel
c
12608  101  -0.001225    122311 -122313  121393 -121392  
                         121357 -122014  122013            imp:n=1   $ air around sample tube
c
c
c ---- Position 9 ----
c
12109  101  -0.001225    122312 -122314 -121318            imp:n=1   $ Air inside sample tube
12209  103  -2.70        122311 -122312 -121318            imp:n=1   $ Bottom cap of tube  
12309  103  -2.70        122311 -122314  121318 -121319    imp:n=1   $ Sample tube         
c
12409  103  -2.70        122313  123305  121394 -121395  
                        -122013 -122315  122012  121319    imp:n=1   $ Sample ring around position
c
12509  101  -0.001225    122314 -122315 -123305  121394 
                        -121395 -122013  122012            imp:n=1   $ air above sample tube bevel
c
12609  101  -0.001225    122311 -122313  121393 -121392  
                         121319 -122013  122012            imp:n=1   $ air around sample tube
c
c
c ---- Position 10 ----
c
12110  101  -0.001225    122312 -122314 -121358            imp:n=1   $ Air inside sample tube
12210  103  -2.70        122311 -122312 -121358            imp:n=1   $ Bottom cap of tube  
12310  103  -2.70        122311 -122314  121358 -121359    imp:n=1   $ Sample tube         
c
12410  103  -2.70        122313  123325  121394 -121395  
                        -122012 -122315  122011  121359    imp:n=1   $ Sample ring around position
c
12510  101  -0.001225    122314 -122315 -123325  121394 
                        -121395 -122012  122011            imp:n=1   $ air above sample tube bevel
c
12610  101  -0.001225    122311 -122313  121393 -121392  
                         121359 -122012  122011            imp:n=1   $ air around sample tube
c
c
c ---- Position 11 ----
c
12111  101  -0.001225    122312 -122314 -121320            imp:n=1   $ Air inside sample tube
12211  103  -2.70        122311 -122312 -121320            imp:n=1   $ Bottom cap of tube  
12311  103  -2.70        122311 -122314  121320 -121321    imp:n=1   $ Sample tube         
c
12411  103  -2.70        122313  123306  121394 -121395  
                        -122011 -122315  122010  121321    imp:n=1   $ Sample ring around position
c
12511  101  -0.001225    122314 -122315 -123306  121394 
                        -121395 -122011  122010            imp:n=1   $ air above sample tube bevel
c
12611  101  -0.001225    122311 -122313  121393 -121392  
                         121321 -122011  122010            imp:n=1   $ air around sample tube
c
c
c ---- Position 12 ----
c
12112  101  -0.001225    122312 -122314 -121360            imp:n=1   $ Air inside sample tube
12212  103  -2.70        122311 -122312 -121360            imp:n=1   $ Bottom cap of tube  
12312  103  -2.70        122311 -122314  121360 -121361    imp:n=1   $ Sample tube         
c
12412  103  -2.70        122313  123326  121394 -121395  
                        -122010 -122315  122009  121361    imp:n=1   $ Sample ring around position
c
12512  101  -0.001225    122314 -122315 -123326  121394 
                        -121395 -122010  122009            imp:n=1   $ air above sample tube bevel
c
12612  101  -0.001225    122311 -122313  121393 -121392  
                         121361 -122010  122009            imp:n=1   $ air around sample tube
c
c
c ---- Position 13 ----
c
12113  101  -0.001225    122312 -122314 -121322            imp:n=1   $ Air inside sample tube
12213  103  -2.70        122311 -122312 -121322            imp:n=1   $ Bottom cap of tube  
12313  103  -2.70        122311 -122314  121322 -121323    imp:n=1   $ Sample tube         
c
12413  103  -2.70        122313  123307  121394 -121395  
                        -122009 -122315  122008  121323    imp:n=1   $ Sample ring around position
c
12513  101  -0.001225    122314 -122315 -123307  121394 
                        -121395 -122009  122008            imp:n=1   $ air above sample tube bevel
c
12613  101  -0.001225    122311 -122313  121393 -121392  
                         121323 -122009  122008            imp:n=1   $ air around sample tube
c
c
c ---- Position 14 ----
c
12114  101  -0.001225    122312 -122314 -121362            imp:n=1   $ Air inside sample tube
12214  103  -2.70        122311 -122312 -121362            imp:n=1   $ Bottom cap of tube  
12314  103  -2.70        122311 -122314  121362 -121363    imp:n=1   $ Sample tube         
c
12414  103  -2.70        122313  123327  121394 -121395  
                        -122008 -122315  122007  121363    imp:n=1   $ Sample ring around position
c
12514  101  -0.001225    122314 -122315 -123327  121394 
                        -121395 -122008  122007            imp:n=1   $ air above sample tube bevel
c
12614  101  -0.001225    122311 -122313  121393 -121392  
                         121363 -122008  122007            imp:n=1   $ air around sample tube
c
c
c ---- Position 15 ----
c
12115  101  -0.001225    122312 -122314 -121324            imp:n=1   $ Air inside sample tube
12215  103  -2.70        122311 -122312 -121324            imp:n=1   $ Bottom cap of tube  
12315  103  -2.70        122311 -122314  121324 -121325    imp:n=1   $ Sample tube         
c
12415  103  -2.70        122313  123308  121394 -121395  
                        -122007 -122315  122006  121325    imp:n=1   $ Sample ring around position
c
12515  101  -0.001225    122314 -122315 -123308  121394 
                        -121395 -122007  122006            imp:n=1   $ air above sample tube bevel
c
12615  101  -0.001225    122311 -122313  121393 -121392  
                         121325 -122007  122006            imp:n=1   $ air around sample tube
c
12715  103  -2.70       -122314  121325 -123308  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 16 ----
c
12116  101  -0.001225    122312 -122314 -121364            imp:n=1   $ Air inside sample tube
12216  103  -2.70        122311 -122312 -121364            imp:n=1   $ Bottom cap of tube  
12316  103  -2.70        122311 -122314  121364 -121365    imp:n=1   $ Sample tube         
c
12416  103  -2.70        122313  123328  121394 -121395  
                        -122006 -122315  122005  121365    imp:n=1   $ Sample ring around position
c
12516  101  -0.001225    122314 -122315 -123328  121394 
                        -121395 -122006  122005            imp:n=1   $ air above sample tube bevel
c
12616  101  -0.001225    122311 -122313  121393 -121392  
                         121365 -122006  122005            imp:n=1   $ air around sample tube
c
12716  103  -2.70       -122314  121365 -123328  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 17 ----
c
12117  101  -0.001225    122312 -122314 -121326            imp:n=1   $ Air inside sample tube
12217  103  -2.70        122311 -122312 -121326            imp:n=1   $ Bottom cap of tube  
12317  103  -2.70        122311 -122314  121326 -121327    imp:n=1   $ Sample tube         
c
12417  103  -2.70        122313  123309  121394 -121395  
                        -122005 -122315  122004  121327    imp:n=1   $ Sample ring around position
c
12517  101  -0.001225    122314 -122315 -123309  121394 
                        -121395 -122005  122004            imp:n=1   $ air above sample tube bevel
c
12617  101  -0.001225    122311 -122313  121393 -121392  
                         121327 -122005  122004            imp:n=1   $ air around sample tube
c
12717  103  -2.70       -122314  121327 -123309  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 18 ----
c
12118  101  -0.001225    122312 -122314 -121366            imp:n=1   $ Air inside sample tube
12218  103  -2.70        122311 -122312 -121366            imp:n=1   $ Bottom cap of tube  
12318  103  -2.70        122311 -122314  121366 -121367    imp:n=1   $ Sample tube         
c
12418  103  -2.70        122313  123329  121394 -121395  
                        -122004 -122315  122003  121367    imp:n=1   $ Sample ring around position
c
12518  101  -0.001225    122314 -122315 -123329  121394 
                        -121395 -122004  122003            imp:n=1   $ air above sample tube bevel
c
12618  101  -0.001225    122311 -122313  121393 -121392  
                         121367 -122004  122003            imp:n=1   $ air around sample tube
c
12718  103  -2.70       -122314  121367 -123329  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 19 ----
c
12119  101  -0.001225    122312 -122314 -121328            imp:n=1   $ Air inside sample tube
12219  103  -2.70        122311 -122312 -121328            imp:n=1   $ Bottom cap of tube  
12319  103  -2.70        122311 -122314  121328 -121329    imp:n=1   $ Sample tube         
c
12419  103  -2.70        122313  123310  121394 -121395  
                        -122003 -122315  122002  121329    imp:n=1   $ Sample ring around position
c
12519  101  -0.001225    122314 -122315 -123310  121394 
                        -121395 -122003  122002            imp:n=1   $ air above sample tube bevel
c
12619  101  -0.001225    122311 -122313  121393 -121392  
                         121329 -122003  122002            imp:n=1   $ air around sample tube
c
12719  103  -2.70       -122314  121329 -123310  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 20 ----
c
12120  101  -0.001225    122312 -122314 -121368            imp:n=1   $ Air inside sample tube
12220  103  -2.70        122311 -122312 -121368            imp:n=1   $ Bottom cap of tube  
12320  103  -2.70        122311 -122314  121368 -121369    imp:n=1   $ Sample tube         
c
12420  103  -2.70        122313  123330  121394 -121395  
                        -122002 -122315  122001  121369    imp:n=1   $ Sample ring around position
c
12520  101  -0.001225    122314 -122315 -123330  121394 
                        -121395 -122002  122001            imp:n=1   $ air above sample tube bevel
c
12620  101  -0.001225    122311 -122313  121393 -121392  
                         121369 -122002  122001            imp:n=1   $ air around sample tube
c
12720  103  -2.70       -122314  121369 -123330  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 21 ----
c
12121  101  -0.001225    122312 -122314 -121330            imp:n=1   $ Air inside sample tube
12221  103  -2.70        122311 -122312 -121330            imp:n=1   $ Bottom cap of tube  
12321  103  -2.70        122311 -122314  121330 -121331    imp:n=1   $ Sample tube         
c
12421  103  -2.70        122313  123311  121394 -121395  
                        -122001 -122315 -122020  121331    imp:n=1   $ Sample ring around position
c
12521  101  -0.001225    122314 -122315 -123311  121394 
                        -121395 -122001 -122020            imp:n=1   $ air above sample tube bevel
c
12621  101  -0.001225    122311 -122313  121393 -121392  
                         121331 -122001 -122020            imp:n=1   $ air around sample tube
c
12721  103  -2.70       -122314  121331 -123311  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 22 ----
c
12122  101  -0.001225    122312 -122314 -121370            imp:n=1   $ Air inside sample tube
12222  103  -2.70        122311 -122312 -121370            imp:n=1   $ Bottom cap of tube  
12322  103  -2.70        122311 -122314  121370 -121371    imp:n=1   $ Sample tube         
c
12422  103  -2.70        122313  123331  121394 -121395  
                         122020 -122315 -122019  121371    imp:n=1   $ Sample ring around position
c
12522  101  -0.001225    122314 -122315 -123331  121394 
                        -121395  122020 -122019            imp:n=1   $ air above sample tube bevel
c
12622  101  -0.001225    122311 -122313  121393 -121392  
                         121371  122020 -122019            imp:n=1   $ air around sample tube
c
12722  103  -2.70       -122314  121371 -123331  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 23 ----
c
12123  101  -0.001225    122312 -122314 -121332            imp:n=1   $ Air inside sample tube
12223  103  -2.70        122311 -122312 -121332            imp:n=1   $ Bottom cap of tube  
12323  103  -2.70        122311 -122314  121332 -121333    imp:n=1   $ Sample tube         
c
12423  103  -2.70        122313  123312  121394 -121395  
                         122019 -122315 -122018  121333    imp:n=1   $ Sample ring around position
c
12523  101  -0.001225    122314 -122315 -123312  121394 
                        -121395  122019 -122018            imp:n=1   $ air above sample tube bevel
c
12623  101  -0.001225    122311 -122313  121393 -121392  
                         121333  122019 -122018            imp:n=1   $ air around sample tube
c
12723  103  -2.70       -122314  121333 -123312  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 24 ----
c
12124  101  -0.001225    122312 -122314 -121372            imp:n=1   $ Air inside sample tube
12224  103  -2.70        122311 -122312 -121372            imp:n=1   $ Bottom cap of tube  
12324  103  -2.70        122311 -122314  121372 -121373    imp:n=1   $ Sample tube         
c
12424  103  -2.70        122313  123332  121394 -121395  
                         122018 -122315 -122017  121373    imp:n=1   $ Sample ring around position
c
12524  101  -0.001225    122314 -122315 -123332  121394 
                        -121395  122018 -122017            imp:n=1   $ air above sample tube bevel
c
12624  101  -0.001225    122311 -122313  121393 -121392  
                         121373  122018 -122017            imp:n=1   $ air around sample tube
c
12724  103  -2.70       -122314  121373 -123332  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 25 ----
c
12125  101  -0.001225    122312 -122314 -121334            imp:n=1   $ Air inside sample tube
12225  103  -2.70        122311 -122312 -121334            imp:n=1   $ Bottom cap of tube  
12325  103  -2.70        122311 -122314  121334 -121335    imp:n=1   $ Sample tube         
c
12425  103  -2.70        122313  123313  121394 -121395  
                         122017 -122315 -122016  121335    imp:n=1   $ Sample ring around position
c
12525  101  -0.001225    122314 -122315 -123313  121394 
                        -121395  122017 -122016            imp:n=1   $ air above sample tube bevel
c
12625  101  -0.001225    122311 -122313  121393 -121392  
                         121335  122017 -122016            imp:n=1   $ air around sample tube
c
12725  103  -2.70       -122314  121335 -123313  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 26 ----
c
12126  101  -0.001225    122312 -122314 -121374            imp:n=1   $ Air inside sample tube
12226  103  -2.70        122311 -122312 -121374            imp:n=1   $ Bottom cap of tube  
12326  103  -2.70        122311 -122314  121374 -121375    imp:n=1   $ Sample tube         
c
12426  103  -2.70        122313  123333  121394 -121395  
                         122016 -122315 -122015  121375    imp:n=1   $ Sample ring around position
c
12526  101  -0.001225    122314 -122315 -123333  121394 
                        -121395  122016 -122015            imp:n=1   $ air above sample tube bevel
c
12626  101  -0.001225    122311 -122313  121393 -121392  
                         121375  122016 -122015            imp:n=1   $ air around sample tube
c
12726  103  -2.70       -122314  121375 -123333  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 27 ----
c
12127  101  -0.001225    122312 -122314 -121336            imp:n=1   $ Air inside sample tube
12227  103  -2.70        122311 -122312 -121336            imp:n=1   $ Bottom cap of tube  
12327  103  -2.70        122311 -122314  121336 -121337    imp:n=1   $ Sample tube         
c
12427  103  -2.70        122313  123314  121394 -121395  
                         122015 -122315 -122014  121337    imp:n=1   $ Sample ring around position
c
12527  101  -0.001225    122314 -122315 -123314  121394 
                        -121395  122015 -122014            imp:n=1   $ air above sample tube bevel
c
12627  101  -0.001225    122311 -122313  121393 -121392  
                         121337  122015 -122014            imp:n=1   $ air around sample tube
c
12727  103  -2.70       -122314  121337 -123314  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 28 ----
c
12128  101  -0.001225    122312 -122314 -121376            imp:n=1   $ Air inside sample tube
12228  103  -2.70        122311 -122312 -121376            imp:n=1   $ Bottom cap of tube  
12328  103  -2.70        122311 -122314  121376 -121377    imp:n=1   $ Sample tube         
c
12428  103  -2.70        122313  123334  121394 -121395  
                         122014 -122315 -122013  121377    imp:n=1   $ Sample ring around position
c
12528  101  -0.001225    122314 -122315 -123334  121394 
                        -121395  122014 -122013            imp:n=1   $ air above sample tube bevel
c
12628  101  -0.001225    122311 -122313  121393 -121392  
                         121377  122014 -122013            imp:n=1   $ air around sample tube
c
12728  103  -2.70       -122314  121377 -123334  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 29 ----
c
12129  101  -0.001225    122312 -122314 -121338            imp:n=1   $ Air inside sample tube
12229  103  -2.70        122311 -122312 -121338            imp:n=1   $ Bottom cap of tube  
12329  103  -2.70        122311 -122314  121338 -121339    imp:n=1   $ Sample tube         
c
12429  103  -2.70        122313  123315  121394 -121395  
                         122013 -122315 -122012  121339    imp:n=1   $ Sample ring around position
c
12529  101  -0.001225    122314 -122315 -123315  121394 
                        -121395  122013 -122012            imp:n=1   $ air above sample tube bevel
c
12629  101  -0.001225    122311 -122313  121393 -121392  
                         121339  122013 -122012            imp:n=1   $ air around sample tube
c
12729  103  -2.70       -122314  121339 -123315  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 30 ----
c
12130  101  -0.001225    122312 -122314 -121378            imp:n=1   $ Air inside sample tube
12230  103  -2.70        122311 -122312 -121378            imp:n=1   $ Bottom cap of tube  
12330  103  -2.70        122311 -122314  121378 -121379    imp:n=1   $ Sample tube         
c
12430  103  -2.70        122313  123335  121394 -121395  
                         122012 -122315 -122011  121379    imp:n=1   $ Sample ring around position
c
12530  101  -0.001225    122314 -122315 -123335  121394 
                        -121395  122012 -122011            imp:n=1   $ air above sample tube bevel
c
12630  101  -0.001225    122311 -122313  121393 -121392  
                         121379  122012 -122011            imp:n=1   $ air around sample tube
c
12730  103  -2.70       -122314  121379 -123335  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 31 ----
c
12131  101  -0.001225    122312 -122314 -121340            imp:n=1   $ Air inside sample tube
12231  103  -2.70        122311 -122312 -121340            imp:n=1   $ Bottom cap of tube  
12331  103  -2.70        122311 -122314  121340 -121341    imp:n=1   $ Sample tube         
c
12431  103  -2.70        122313  123316  121394 -121395  
                         122011 -122315 -122010  121341    imp:n=1   $ Sample ring around position
c
12531  101  -0.001225    122314 -122315 -123316  121394 
                        -121395  122011 -122010            imp:n=1   $ air above sample tube bevel
c
12631  101  -0.001225    122311 -122313  121393 -121392  
                         121341  122011 -122010            imp:n=1   $ air around sample tube
c
12731  103  -2.70       -122314  121341 -123316  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 32 ----
c
12132  101  -0.001225    122312 -122314 -121380             imp:n=1   $ Air inside sample tube
12232  103  -2.70        122311 -122312 -121380            imp:n=1   $ Bottom cap of tube  
12332  103  -2.70        122311 -122314  121380 -121381    imp:n=1   $ Sample tube         
c
12432  103  -2.70        122313  123336  121394 -121395  
                         122010 -122315 -122009  121381    imp:n=1   $ Sample ring around position
c
12532  101  -0.001225    122314 -122315 -123336  121394 
                        -121395  122010 -122009            imp:n=1   $ air above sample tube bevel
c
12632  101  -0.001225    122311 -122313  121393 -121392  
                         121381  122010 -122009            imp:n=1   $ air around sample tube
c
12732  103  -2.70       -122314  121381 -123336  192350    imp:n=1   $ sample tube hole fix
c
c ---- Position 33 ----
c
12133  101  -0.001225    122312 -122314 -121342            imp:n=1   $ Air inside sample tube
12233  103  -2.70        122311 -122312 -121342            imp:n=1   $ Bottom cap of tube  
12333  103  -2.70        122311 -122314  121342 -121343    imp:n=1   $ Sample tube         
c
12433  103  -2.70        122313  123317  121394 -121395  
                         122009 -122315 -122008  121343    imp:n=1   $ Sample ring around position
c
12533  101  -0.001225    122314 -122315 -123317  121394 
                        -121395  122009 -122008            imp:n=1   $ air above sample tube bevel
c
12633  101  -0.001225    122311 -122313  121393 -121392  
                         121343  122009 -122008            imp:n=1   $ air around sample tube
c
12733  103  -2.70       -122314  121343 -123317  192350    imp:n=1   $ sample tube hole fix
c
c ---- Position 34 ----
c
12134  101  -0.001225    122312 -122314 -121382            imp:n=1   $ Air inside sample tube
12234  103  -2.70        122311 -122312 -121382            imp:n=1   $ Bottom cap of tube  
12334  103  -2.70        122311 -122314  121382 -121383    imp:n=1   $ Sample tube         
c
12434  103  -2.70        122313  123337  121394 -121395  
                         122008 -122315 -122007  121383    imp:n=1   $ Sample ring around position
c
12534  101  -0.001225    122314 -122315 -123337  121394 
                        -121395  122008 -122007            imp:n=1   $ air above sample tube bevel
c
12634  101  -0.001225    122311 -122313  121393 -121392  
                         121383  122008 -122007            imp:n=1   $ air around sample tube
c
12734  103  -2.70       -122314  121383 -123337  192350    imp:n=1   $ sample tube hole fix
c
c ---- Position 35 ----
c
12135  101  -0.001225    122312 -122314 -121344            imp:n=1   $ Air inside sample tube
12235  103  -2.70        122311 -122312 -121344            imp:n=1   $ Bottom cap of tube  
12335  103  -2.70        122311 -122314  121344 -121345    imp:n=1   $ Sample tube         
c
12435  103  -2.70        122313  123318  121394 -121395  
                         122007 -122315 -122006  121345    imp:n=1   $ Sample ring around position
c
12535  101  -0.001225    122314 -122315 -123318  121394 
                        -121395  122007 -122006            imp:n=1   $ air above sample tube bevel
c
12635  101  -0.001225    122311 -122313  121393 -121392  
                         121345  122007 -122006            imp:n=1   $ air around sample tube
c
12735  103  -2.70       -122314  121345 -123318  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 36 ----
c
12136  101  -0.001225    122312 -122314 -121384            imp:n=1   $ Air inside sample tube
12236  103  -2.70        122311 -122312 -121384            imp:n=1   $ Bottom cap of tube  
12336  103  -2.70        122311 -122314  121384 -121385    imp:n=1   $ Sample tube         
c
12436  103  -2.70        122313  123338  121394 -121395  
                         122006 -122315 -122005  121385    imp:n=1   $ Sample ring around position
c
12536  101  -0.001225    122314 -122315 -123338  121394 
                        -121395  122006 -122005            imp:n=1   $ air above sample tube bevel
c
12636  101  -0.001225    122311 -122313  121393 -121392  
                         121385  122006 -122005            imp:n=1   $ air around sample tube
c
12736  103  -2.70       -122314  121385 -123338  192350    imp:n=1   $ sample tube hole fix
c
c ---- Position 37 ----
c
12137  101  -0.001225    122312 -122314 -121346            imp:n=1   $ Air inside sample tube
12237  103  -2.70        122311 -122312 -121346            imp:n=1   $ Bottom cap of tube  
12337  103  -2.70        122311 -122314  121346 -121347    imp:n=1   $ Sample tube         
c
12437  103  -2.70        122313  123319  121394 -121395  
                         122005 -122315 -122004  121347    imp:n=1   $ Sample ring around position
c
12537  101  -0.001225    122314 -122315 -123319  121394 
                        -121395  122005 -122004            imp:n=1   $ air above sample tube bevel
c
12637  101  -0.001225    122311 -122313  121393 -121392  
                         121347  122005 -122004            imp:n=1   $ air around sample tube
c
12737  103  -2.70       -122314  121347 -123319  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 38 ----
c
12138  101  -0.001225    122312 -122314 -121386            imp:n=1   $ Air inside sample tube
12238  103  -2.70        122311 -122312 -121386            imp:n=1   $ Bottom cap of tube  
12338  103  -2.70        122311 -122314  121386 -121387    imp:n=1   $ Sample tube         
c
12438  103  -2.70        122313  123339  121394 -121395  
                         122004 -122315 -122003  121387    imp:n=1   $ Sample ring around position
c
12538  101  -0.001225    122314 -122315 -123339  121394 
                        -121395  122004 -122003            imp:n=1   $ air above sample tube bevel
c
12638  101  -0.001225    122311 -122313  121393 -121392  
                         121387  122004 -122003            imp:n=1   $ air around sample tube
c
12738  103  -2.70       -122314  121387 -123339  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 39 ----
c
12139  101  -0.001225    122312 -122314 -121348            imp:n=1   $ Air inside sample tube
12239  103  -2.70        122311 -122312 -121348            imp:n=1   $ Bottom cap of tube  
12339  103  -2.70        122311 -122314  121348 -121349    imp:n=1   $ Sample tube         
c
12439  103  -2.70        122313  123320  121394 -121395  
                         122003 -122315 -122002  121349    imp:n=1   $ Sample ring around position
c
12539  101  -0.001225    122314 -122315 -123320  121394 
                        -121395  122003 -122002            imp:n=1   $ air above sample tube bevel
c
12639  101  -0.001225    122311 -122313  121393 -121392  
                         121349  122003 -122002            imp:n=1   $ air around sample tube
c
12739  103  -2.70       -122314  121349 -123320  192350    imp:n=1   $ sample tube hole fix
c
c
c ---- Position 40 ----
c
12140  101  -0.001225    122312 -122314 -121388            imp:n=1   $ Air inside sample tube
12240  103  -2.70        122311 -122312 -121388            imp:n=1   $ Bottom cap of tube  
12340  103  -2.70        122311 -122314  121388 -121389    imp:n=1   $ Sample tube         
c
12440  103  -2.70        122313  123340  121394 -121395  
                         122002 -122315 -122001  121389    imp:n=1   $ Sample ring around position
c
12540  101  -0.001225    122314 -122315 -123340  121394 
                        -121395  122002 -122001            imp:n=1   $ air above sample tube bevel
c
12640  101  -0.001225    122311 -122313  121393 -121392  
                         121389  122002 -122001            imp:n=1   $ air around sample tube
c
12740  103  -2.70       -122314  121389 -123340  192350    imp:n=1   $ sample tube hole fix
c
c
c
c ------------------------------
c --------- Core water ---------
c ------------------------------
c
c  ---- replacement water for debugging ----
c
13501  102  -1.0   10     -112304  111397 -131302
                   902019  902029  902039  902049  902059  902069   imp:n=1   $ Inner core water B ring
c
c
13502  102  -1.0   10     -112304  131302 -131303
                   903019  903029  903039  903049  903059  903069
                   903079  903089  903099  903109  903119  903129   imp:n=1   $ Inner core water C ring
c
c
13503  102  -1.0   10     -112304  131303 -131304
                   904019  904029  904039  904049  904059  904069
                   904079  904089  904099  904109  904119  904129
                   904139  904149  904159  904169  904179  904189   imp:n=1   $ Inner core water D ring
c
c
13504  102  -1.0   10     -112304  131304 -131305
                   905019  905029  905039  905049  905059  905069
                   905079  905089  905099  905109  905119  905129
                   905139  905149  905159  905169  905179  905189
                   905199  905209  905219  905229  905239  905249   imp:n=1   $ Inner core water E ring
c
c
13505  102  -1.0   10     -112304  131305 -121301
                   906019  906029  906039  906049  906059  906069
                   906079  906089  906099  906109  906119  906129
                   906139  906149  906159  906169  906179  906189
                   906199  906209  906219  906229  906239  906249
                   906259  906269  906279  906289  906299  906309   imp:n=1   $ Inner core water E ring
c
c
c
c
c
13601  102  -1.0   112305 -11      111397 -131302
                   902019  902029  902039  902049  902059  902069   imp:n=1   $ upper core water B ring
c
c
13602  102  -1.0   112305 -11      131302 -131303
                   903019  903029  903039  903049  903059  903069
                   903079  903089  903099  903109  903119  903129   imp:n=1   $ upper core water C ring
c
c
13603  102  -1.0   112305 -11      131303 -131304
                   904019  904029  904039  904049  904059  904069
                   904079  904089  904099  904109  904119  904129
                   904139  904149  904159  904169  904179  904189   imp:n=1   $ upper core water D ring
c
c
13604  102  -1.0   112305 -11      131304 -131305  501307
                   905019  905029  905039  905049  905059  905069
                   905079  905089  905099  905109  905119  905129
                   905139  905149  905159  905169  905179  905189
                   905199  905209  905219  905229  905239  905249   imp:n=1   $ upper core water E ring
c
c
13605  102  -1.0   112305 -11      131305 -121390
                   906019  906029  906039  906049  906059  906069
                   906079  906089  501307  906109  906119  906129
                   906139  906149  906159  906169  906179  906189
                   906199  906209  906219  906229  906239  906249
                   906259  906269  906279  906289  906299  906309   imp:n=1   $ upper core water E ring
c
c
c
c
c
c ------ Main outer core water cells ------- 
c
c
13301  102  -1.0  11     -192301  111397 -121390  
                  903059  903099  905019  501307   imp:n=1   $ Water above upper grid plate
c
13302  102  -1.0  122306 -112304  121301 -121390   imp:n=1   $ Water under upper grid plate
13303  102  -1.0  112304 -112305  111399 -121390   imp:n=1   $ Water above upper grid plate
c
13304  102  -1.0  122310 -192301  121390 -121305   imp:n=1   $ Water above LS assy
13305  102  -1.0  122306 -192301  121305 -121308   imp:n=1   $ Water above outer section of reflector assy
13306  102  -1.0  192399 -192301  121308 -191301   imp:n=1   $ Water around reflector assy
c
13307  102  -1.0  192399 -112301  111397 -121308   imp:n=1   $ Water below lower grid plate
13308  102  -1.0  112301 -122301  121301 -121308   imp:n=1   $ Water below reflector assy
13309  102  -1.0  112301 -10      111398 -121301   imp:n=1   $ Water around lower grid plate
c
c
c
c ------------------------------
c ------ Central Thimble -------
c ------------------------------
c
14000  103  -2.7   142302 -192301  141300 -111300   imp:n=1   $ Central thimble main tube
14001  102  -1.0   142302 -142303 -141300           imp:n=1   $ Central thimble inevacuable water
c
14002  102  -1.0   142303 -192301 -141300           imp:n=1   $ Central thimble evacuable water      ------ change material to air to open beam ------
c
14003  103  -2.7   142301 -142302 -111300           imp:n=1   $ Central thimble bottom cap
14004  102  -1.0   142301 -112304  111300 -111397   imp:n=1   $ Water around central thimble below upper grid plate
14005  102  -1.0   112305 -192301  111300 -111397   imp:n=1   $ Water around central thimble above upper grid plate
14006  102  -1.0   192399 -142301 -111397           imp:n=1   $ Water below central thimble
c
c
c
c ------------------------------
c --------- Flux wires ---------
c ------------------------------
c
17001  102  -1.00  -111301  112304 -112305  imp:n=1  $ Flux wire insertion hole A  upper grid area
17002  102  -1.00  -111302  112304 -112305  imp:n=1  $ Flux wire insertion hole B  upper grid area
17003  102  -1.00  -111303  112304 -112305  imp:n=1  $ Flux wire insertion hole C  upper grid area
17004  102  -1.00  -111304  112304 -112305  imp:n=1  $ Flux wire insertion hole D  upper grid area
17005  102  -1.00  -111305  112304 -112305  imp:n=1  $ Flux wire insertion hole E  upper grid area
17006  102  -1.00  -111306  112304 -112305  imp:n=1  $ Flux wire insertion hole F  upper grid area
17007  102  -1.00  -111307  112304 -112305  imp:n=1  $ Flux wire insertion hole G  upper grid area
17008  102  -1.00  -111308  112304 -112305  imp:n=1  $ Flux wire insertion hole H  upper grid area
17009  102  -1.00  -111309  112304 -112305  imp:n=1  $ Flux wire insertion hole J  upper grid area
17010  102  -1.00  -111310  112304 -112305  imp:n=1  $ Flux wire insertion hole K  upper grid area
17011  102  -1.00  -111311  112304 -112305  imp:n=1  $ Flux wire insertion hole L  upper grid area
17012  102  -1.00  -111312  112304 -112305  imp:n=1  $ Flux wire insertion hole A1 upper grid area
17013  102  -1.00  -111313  112304 -112305  imp:n=1  $ Flux wire insertion hole B1 upper grid area
17014  102  -1.00  -111314  112304 -112305  imp:n=1  $ Flux wire insertion hole C1 upper grid area
17015  102  -1.00  -111315  112304 -112305  imp:n=1  $ Flux wire insertion hole D1 upper grid area
17016  102  -1.00  -111316  112304 -112305  imp:n=1  $ Flux wire insertion hole E1 upper grid area
c
c
c
c ------------------------------
c ----------- Rabbit -----------
c ------------------------------
c
c ----- Alumunum components -----
c
60901  103  -2.70  10     -502301 -503301   imp:n=1   $ Lower taper 
60902  103  -2.70  502301 -502302 -501306   imp:n=1   $ Lower section
60903  103  -2.70  502302 -502303 -503302   imp:n=1   $ Lower section upper taper
c
60904  103  -2.70  502303 -502304 -503303   imp:n=1   $ Mid section lower taper
60905  103  -2.70  502304 -502305 -501306   imp:n=1   $ Mid section
60906  103  -2.70  502305 -502306 -503304   imp:n=1   $ Mid section upper taper
60907  103  -2.70  502306 -502307 -501301   imp:n=1   $ Upper post
60908  103  -2.70  503304 -502306 -501301   imp:n=1   $ Upper post correction             ------ big problems here ---- 
c
c
60909  103  -2.70  502307 -502308 -501306           imp:n=1   $ Main section lower portion
60910  103  -2.70  502308 -502309  501304 -501306   imp:n=1   $ Main section lower bezel
60911  103  -2.70  502309 -502310  501305 -501306   imp:n=1   $ Main section thin tube
60912  103  -2.70  502310 -192301  501305 -501307   imp:n=1   $ Main section thick tube    ------ big problems here ----  
c
60913  103  -2.70  502311 -502312  501308 -501303   imp:n=1   $ Sample holder annulus
60914  103  -2.70  502312 -192301  501302 -501303   imp:n=1   $ Inner tube
c
c 
c ----- Water components -----
c
60920  102  -1.0   10     -502301  503301 -906099          imp:n=1   $ Water around lower bevel
60921  102  -1.0   502301 -502302  501306 -906099          imp:n=1   $ Water around lower section
60922  102  -1.0   502302 -502303  503302 -906099          imp:n=1   $ Water around lower section upper bevel
60923  102  -1.0   502303 -502304  503303 -906099          imp:n=1   $ Water around mid section lower bevel
60924  102  -1.0   502304 -502305  501306 -906099          imp:n=1   $ Water around mid section
60925  102  -1.0   502305 -502306  503304 -906099  501301  imp:n=1   $ Water around mid section upper bevel
60926  102  -1.0   502306 -502307  501301 -906099          imp:n=1   $ Water around post
60927  102  -1.0   502307 -502310  501306 -906099          imp:n=1   $ Water around rabbit tube
60928  102  -1.0   112305 -502310  906099 -501307          imp:n=1   $ Water above upper grid plate around thin tube    ----- so many problems ----- 
c
c
c ----- Air elements ---- 
c
60930  101  -0.001225   502308 -502309 -501304           imp:n=1   $ Air in bezel
60931  101  -0.001225   502309 -502311 -501305           imp:n=1   $ Air under sample holder
60932  101  -0.001225   502311 -502312 -501308           imp:n=1   $ Air in sample holder 
60933  101  -0.001225   502311 -192301  501303 -501305   imp:n=1   $ Air b/w inside and outside tube
c
42069  101  -0.001225   552305 -552307 -501311           imp:n=1   $ Air inside inner vial    ----- this is the cell on which to do the F4 tally -----
60935  101  -0.001225   552303 -552308  501312 -501313   imp:n=1   $ Air around inner vial
60936  101  -0.001225   552308 -552309 -501313           imp:n=1   $ Air inside outer vial
60937  101  -0.001225   552310 -552314 -501308           imp:n=1   $ Air inside rabbit tube
c
60950  101  -0.001225   502312 -552304  553301 -501302           imp:n=1   $ Air around lower bevel lower section
60951  101  -0.001225   552304 -552306  553302 -501302           imp:n=1   $ Air around lower bevel upper section
60952  101  -0.001225   552306 -502313  501301 -501302           imp:n=1   $ Air around rabbit tube
60953  101  -0.001225   502313 -552311  501301  553303 -501302   imp:n=1   $ Air around upper bevel lower section
60954  101  -0.001225   552311  553303 -501302 -552313           imp:n=1   $ Air around upper bevel mid section
60955  101  -0.001225   501317 -552313 -553303  552311 -501302   imp:n=1   $ Air around upper bevel top section
60956  101  -0.001225   552313 -552315  501318 -501302           imp:n=1   $ Air around rabbit tube cap
60957  101  -0.001225   552315 -192301 -501302                   imp:n=1   $ Air in rabbit
c
c
c
c ---- Poly elements -----  (Comment out to make empty rabbit terminus)
c
c 60940  109  -0.97   502312 -552302 -501308                   imp:n=1   $ bottom of rabbit tube
c 60941  109  -0.97   502312 -552312  501308 -501301           imp:n=1   $ Main section rabbit tube
c 60942  109  -0.97   502312 -552304  501301 -501318 -553301   imp:n=1   $ Rabbit tube lower bevel lower section
c 60943  109  -0.97   552304 -552306  501301 -501318 -553302   imp:n=1   $ Rabbit tube lower bevel upper section
c 60944  109  -0.97  -552312  501301 -553303  552310 -501317   imp:n=1   $ Rabbit tube upper bevel
c 60945  109  -0.97   552312 -552313  501308 -501317           imp:n=1   $ Rabbit tube upper section
c 60946  109  -0.97   552314 -552315 -501318                   imp:n=1   $ Rabbit tube cap upper section
c 60947  109  -0.97   552313 -552314  501308 -501318           imp:n=1   $ Rabbit tube tube
c
c 60960  109  -0.97   552302 -552303 -501308                   imp:n=1   $ Outer vial bottom
c 60961  109  -0.97   552303 -552309  501313 -501308           imp:n=1   $ Outer vial tube
c 60962  109  -0.97   552309 -552310 -501308                   imp:n=1   $ Outer vial top
c
c 60963  109  -0.97   552303 -552305 -501312                   imp:n=1   $ Inner vial bottom
c 60964  109  -0.97   552305 -552307  501311 -501312           imp:n=1   $ Inner vial tube
c 60965  109  -0.97   552307 -552308 -501312                   imp:n=1   $ Inner vial top
c
c
c
c ----- Air replacement elements ----- (Comment out to make put sample in terminus)
c
60940  101  -0.001225   502312 -552302 -501308                   imp:n=1   $ bottom of rabbit tube
60941  101  -0.001225   502312 -552312  501308 -501301           imp:n=1   $ Main section rabbit tube
60942  101  -0.001225   502312 -552304  501301 -501318 -553301   imp:n=1   $ Rabbit tube lower bevel lower section
60943  101  -0.001225   552304 -552306  501301 -501318 -553302   imp:n=1   $ Rabbit tube lower bevel upper section
60944  101  -0.001225  -552312  501301 -553303  552310 -501317   imp:n=1   $ Rabbit tube upper bevel
60945  101  -0.001225   552312 -552313  501308 -501317           imp:n=1   $ Rabbit tube upper section
60946  101  -0.001225   552314 -552315 -501318                   imp:n=1   $ Rabbit tube cap upper section
60947  101  -0.001225   552313 -552314  501308 -501318           imp:n=1   $ Rabbit tube tube
c
60960  101  -0.001225   552302 -552303 -501308                   imp:n=1   $ Outer vial bottom
60961  101  -0.001225   552303 -552309  501313 -501308           imp:n=1   $ Outer vial tube
60962  101  -0.001225   552309 -552310 -501308                   imp:n=1   $ Outer vial top
  c
60963  101  -0.001225   552303 -552305 -501312                   imp:n=1   $ Inner vial bottom
60964  101  -0.001225   552305 -552307  501311 -501312           imp:n=1   $ Inner vial tube
60965  101  -0.001225   552307 -552308 -501312                   imp:n=1   $ Inner vial top
c
c
c
c
c
c
c 
c 
c 
c 
c 
c 
c 
c 
c 
c 
c 
c 
c 
c 
c 
c 
c 
c
c
c
c
c c
c c
c c ------------------------------
c c ------ Installed sources -----
c c ------------------------------
c c
c c
c c
c c
c c
c c
c c
c c ---- AmBe source (F23) ----
c c
c 62301   103  -2.7        -172303  172302 -171301           imp:n=1   $ cylindrical section beneath cavity
c 62302   103  -2.7        -172304  172303 -171301  173301   imp:n=1   $ cylindrical section containing bottommost cavity cone
c 62303   103  -2.7        -172305  172304 -171301  171302   imp:n=1   $ aluminum encasing cylindrical part of cavity
c 62304   101  -0.0012922  -172306  172305 -173302           imp:n=1   $ half cone atop source cavity
c 62305   103  -2.7        -172306  172305 -171301  173302   imp:n=1   $ aluminum around half cone part of cavity
c 62306   101  -0.0012922  -172308  172306 -171303           imp:n=1   $ cylinder component of source cavity cap
c 62307   103  -2.7        -172308  172306 -171301  171303   imp:n=1   $ aluminum around cylindrical component of source cavity cap
c 62308   101  -2.7        -172309  172308 -173303           imp:n=1   $ cone on top of cavity cap
c 62309   103  -2.7        -172309  172308 -171301  173303   imp:n=1   $ aluminum encasing cone on top of cavity cap
c 62310   101  -0.0012922  -172305  172304 -171302           imp:n=1   $ inner cavity cylinder
c 62311   101  -0.0012922  -172304  172303 -173301           imp:n=1   $ inner cavity bottom cone
c 62312   103  -2.7        -172311  172309 -171301           imp:n=1   $ source holder above cavity
c 62313   103  -2.7        -172312  172311 -906239           imp:n=1   $ cap on source holder that rests on grid plate
c 62314   103  -2.7        -172313  172312 -171305           imp:n=1   $ cylindrical base on knob
c 62315   103  -2.7        -172314  172313 -173304           imp:n=1   $ lower half of corset on knob
c 62316   103  -2.7        -172315  172314 -173305           imp:n=1   $ upper half of corset on knob
c 62317   103  -2.7        -172316  172315 -171305           imp:n=1   $ upper cylindrical part of knob
c 62318   103  -2.7        -172317  172316 -173306           imp:n=1   $ upper cone on knob
c 62319   102  -1.0        -172314  172313 -171305  173304   imp:n=1   $ water in nook of bottom half of corset on knob 
c 62320   102  -1.0        -172315  172314 -171305  173305   imp:n=1   $ water in nook of top half of corset on knob
c 62321   102  -1.0        -172317  172316 -171305  173306   imp:n=1   $ water around cone on end of knob
c 62322   102  -1.0         172302 -112305  171301 -906239   imp:n=1   $ water around source
c 62323   102  -1.0         10 -172302 -906239           imp:n=1   $ water below source
c 62324   102  -1.0         172312 -11  171305 -906239   imp:n=1   $ Water around top
c 62325   102  -1.0         172317 -11 -171305           imp:n=1   $ Water above top
c c
c c
c c
c c ---- IR-192 source (F25) ----
c c
c 62501   103  -2.7        -172303  172302 -171310          imp:n=1  $ cylindrical section beneath cavity
c 62502   103  -2.7        -172304  172303 -171310  173310  imp:n=1  $ cylindrical section containing bottommost cavity cone
c 62503   103  -2.7        -172305  172304 -171310  171311  imp:n=1  $ aluminum encasing cylindrical part of cavity
c 62504   101  -0.0012922  -172306  172305 -173311          imp:n=1  $ half cone atop source cavity
c 62505   103  -2.7        -172306  172305 -171310  173311  imp:n=1  $ aluminum around half cone part of cavity
c 62506   101  -0.0012922  -172308  172306 -171312          imp:n=1  $ cylinder component of source cavity cap
c 62507   103  -2.7        -172308  172306 -171310  171312  imp:n=1  $ aluminum around cylindrical component of source cavity cap
c 62508   101  -2.7        -172309  172308 -173312          imp:n=1  $ cone on top of cavity cap
c 62509   103  -2.7        -172309  172308 -171310  173312  imp:n=1  $ aluminum encasing cone on top of cavity cap
c 62510   101  -0.0012922  -172305  172304 -171311          imp:n=1  $ inner cavity cylinder
c 62511   101  -0.0012922  -172304  172303 -173310          imp:n=1  $ inner cavity bottom cone
c 62512   103  -2.7        -172311  172309 -171310          imp:n=1  $ source holder above cavity
c 62513   103  -2.7        -172312  172311 -906259          imp:n=1  $ cap on source holder that rests on grid plate
c 62514   103  -2.7        -172313  172312 -171314          imp:n=1  $ cylindrical base on knob
c 62515   103  -2.7        -172314  172313 -173313          imp:n=1  $ lower half of corset on knob
c 62516   103  -2.7        -172315  172314 -173314          imp:n=1  $ upper half of corset on knob
c 62517   103  -2.7        -172316  172315 -171314          imp:n=1  $ upper cylindrical part of knob
c 62518   103  -2.7        -172317  172316 -173315          imp:n=1  $ upper cone on knob
c 62519   102  -1.0        -172314  172313 -171314  173313  imp:n=1  $ water in nook of bottom half of corset on knob 
c 62520   102  -1.0        -172315  172314 -171314  173314  imp:n=1  $ water in nook of top half of corset on knob
c 62521   102  -1.0        -172317  172316 -171314  173315  imp:n=1  $ water around cone on end of knob
c 62522   102  -1.0         172302 -112305  171310 -906259  imp:n=1  $ water around source
c 62523   102  -1.0         10 -172302 -906259          imp:n=1  $ water below source
c 62524   102  -1.0         172312 -11  171314 -906259  imp:n=1  $ Water around top
c 62525   102  -1.0         172317 -11 -171314          imp:n=1  $ Water above top
c c
c c
c c
c c
c
c
c
c
c
c
c
c
c
c
c ------------------------------
c -------- Control rods --------
c ------------------------------
c
c
c
c
c --- safe rod ---
c
30501   103  -2.7      -192301  812301 -811301                  imp:n=1  $ control rod connecting rod
30502   102  -1.0      -192301  812301 -811304  811301          imp:n=1  $ water ring above control rod
30503   102  -1.0       812302 -812301 -811304  811302  813301  imp:n=1  $ water above upper bevel
30504   103  -2.7       812302 -812301 -811304  811302 -813301  imp:n=1  $ control rod upper bevel
30505   103  -2.7      -812301  812302 -811302                  imp:n=1  $ top control rod inactive region
30506   103  -2.7      -812302  812303 -811304                  imp:n=1  $ upper control rod inactive region
c
30507   107  -1.72066  -811303 -812303  812304                  imp:n=1  $ control rod poison section
30508   103  -2.7       812305 -812303  811303 -811304          imp:n=1  $ control rod cladding
c
30509   103  -2.7      -812304  812305 -811303                  imp:n=1  $ lower control rod inactive section
30510   103  -2.7      -812305  812306 -811302                  imp:n=1  $ bottom control rod inactive section
30511   103  -2.7       811302 -811304 -812305  812306 -813302  imp:n=1  $ Outer lower bevel  
30512   103  -2.7      -811302 -812306  812307 -813303          imp:n=1  $ inner lower bevel  
30513   102  -1.0       811302 -811304 -812305  812306  813302  imp:n=1  $ water around outer lower bevel   
30514   102  -1.0      -811302 -812306  812307  813303          imp:n=1  $ water around inner lower bevel  
30515   102  -1.0       811302 -811304  812307 -812306          imp:n=1  $ water under control rod bevels
c
30516   102  -1.0      -812307  902301 -811304                  imp:n=1  $ water under control rod
c
30517   102  -1.0       811304 -903057  902303 -192301          imp:n=1  $ water between safe rod and gride tube
30518   103  -2.7       903057 -903058  902303 -902399          imp:n=1  $ control rod guide tube main section
30519   102  -1.0       903057 -903058  902399 -192301          imp:n=1  $ water above guide tube
30520   102  -1.0       903058 -903059  10     -192301          imp:n=1  $ water around guide tube
30521   103  -2.7       811304 -903058  902301 -902303          imp:n=1  $ guide tube thick section
30522   103  -2.7      -903058  10     -902301                  imp:n=1  $ guide tube grid plate adapter
c
c
c
c
c --- shim rod ---
c
30901   103  -2.7      -192301  822301 -821301                  imp:n=1  $ control rod connecting rod
30902   102  -1.0      -192301  822301 -821304  821301          imp:n=1  $ water ring above control rod
30903   102  -1.0       822302 -822301 -821304  821302  823301  imp:n=1  $ water above upper bevel
30904   103  -2.7       822302 -822301 -821304  821302 -823301  imp:n=1  $ control rod upper bevel
30905   103  -2.7      -822301  822302 -821302                  imp:n=1  $ top control rod inactive region
30906   103  -2.7      -822302  822303 -821304                  imp:n=1  $ upper control rod inactive region
c
30907   107  -1.72066  -821303 -822303  822304                  imp:n=1  $ control rod poison section
30908   103  -2.7       822305 -822303  821303 -821304          imp:n=1  $ control rod cladding
c
30909   103  -2.7      -822304  822305 -821303                  imp:n=1  $ lower control rod inactive section
30910   103  -2.7      -822305  822306 -821302                  imp:n=1  $ bottom control rod inactive section
30911   103  -2.7       821302 -821304 -822305  822306 -823302  imp:n=1  $ Outer lower bevel  
30912   103  -2.7      -821302 -822306  822307 -823303          imp:n=1  $ inner lower bevel  
30913   102  -1.0       821302 -821304 -822305  822306  823302  imp:n=1  $ water around outer lower bevel   
30914   102  -1.0      -821302 -822306  822307  823303          imp:n=1  $ water around inner lower bevel  
30915   102  -1.0       821302 -821304  822307 -822306          imp:n=1  $ water under control rod bevels
c
30916   102  -1.0      -822307  902301 -821304                  imp:n=1  $ water under control rod
c
30917   102  -1.0       821304 -903097  902303 -192301          imp:n=1  $ water between safe rod and gride tube
30918   103  -2.7       903097 -903098  902303 -902399          imp:n=1  $ control rod guide tube main section
30919   102  -1.0       903097 -903098  902399 -192301          imp:n=1  $ water above guide tube
30920   102  -1.0       903098 -903099  10     -192301          imp:n=1  $ water around guide tube
30921   103  -2.7       821304 -903098  902301 -902303          imp:n=1  $ guide tube thick section
30922   103  -2.7      -903098  10     -902301                  imp:n=1  $ guide tube grid plate adapter
c
c
c
c --- reg rod ---
c
50101   103  -2.7      -192301  832301 -831301                  imp:n=1  $ control rod connecting rod
50102   102  -1.0      -192301  832301 -831304  831301          imp:n=1  $ water ring above control rod
50103   102  -1.0       832302 -832301 -831304  831302  833301  imp:n=1  $ water above upper bevel
50104   103  -2.7       832302 -832301 -831304  831302 -833301  imp:n=1  $ control rod upper bevel
50105   103  -2.7      -832301  832302 -831302                  imp:n=1  $ top control rod inactive region
50106   103  -2.7      -832302  832303 -831304                  imp:n=1  $ upper control rod inactive region
c
50107   107  -1.72066  -831303 -832303  832304                  imp:n=1  $ control rod poison section
50108   103  -2.7       832305 -832303  831303 -831304          imp:n=1  $ control rod cladding
c
50109   103  -2.7      -832304  832305 -831303                  imp:n=1  $ lower control rod inactive section
50110   103  -2.7      -832305  832306 -831302                  imp:n=1  $ bottom control rod inactive section
50111   103  -2.7       831302 -831304 -832305  832306 -833302  imp:n=1  $ Outer lower bevel  
50112   103  -2.7      -831302 -832306  832307 -833303          imp:n=1  $ inner lower bevel  
50113   102  -1.0       831302 -831304 -832305  832306  833302  imp:n=1  $ water around outer lower bevel   
50114   102  -1.0      -831302 -832306  832307  833303          imp:n=1  $ water around inner lower bevel  
50115   102  -1.0       831302 -831304  832307 -832306          imp:n=1  $ water under control rod bevels
c
50116   102  -1.0      -832307  902301 -831304                  imp:n=1  $ water under control rod
c
50117   102  -1.0       831304 -905017  902303 -192301          imp:n=1  $ water between safe rod and gride tube
50118   103  -2.7       905017 -905018  902303 -902399          imp:n=1  $ control rod guide tube main section
50119   102  -1.0       905017 -905018  902399 -192301          imp:n=1  $ water above guide tube
50120   102  -1.0       905018 -905019  10     -192301          imp:n=1  $ water around guide tube
50121   103  -2.7       831304 -905018  902301 -902303          imp:n=1  $ guide tube thick section
50122   103  -2.7      -905018  10     -902301                  imp:n=1  $ guide tube grid plate adapter    FIXME (probably not actually broken, just the last cell)
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c -----------------------------------------------------------------------------
c -----------------------------------------------------------------------------

c -----------------------------------------------------------------------------
c -------------------------- SURFACE CARDS ------------------------------------
c -----------------------------------------------------------------------------
c --Begin Surfaces-- $ for NIST MCNP syntax
c
c
c
c
c
c
c ------------------------------
c ------------ Model -----------
c ------------------------------
c
c
192301  pz   170  $ Top of model    --- malcolm make this bigger when adding the center channel assy ---
192399  pz  -100  $ Bottom of model
c
191301  cz   150  $ Outer limit of model
c
192350  pz  66.8336  $ temporary rabbit fix 
c
20  cz  1.914525 $ Generic fuel supercell 
c
c
c ------------------------------
c --------- Grid plates --------
c ------------------------------
c
c ---------- Upper grid plate ----------
c
111300  cz  1.90500  $ central thimble hole
c
111399  cz  24.6888  $ upper grid plate radius
c
112304  pz  64.7700  $ bottom of upper grid plate
112305  pz  66.6750  $ top of upper grid plate
c
c
c --- Upper grid plate fuel assembly holes ---
c
902019       c/z  0.00000  4.05384  1.914525         $ upper grid plate hole - B1
902029       c/z  3.51053  2.02692  1.914525         $ upper grid plate hole - B2   ---- problem ---- 
902039       c/z  3.51053 -2.02692  1.914525         $ upper grid plate hole - B3
902049       c/z  0.00000 -4.05384  1.914525         $ upper grid plate hole - B4 
902059       c/z -3.51053 -2.02692  1.914525         $ upper grid plate hole - B5 
902069       c/z -3.51053  2.02692  1.914525         $ upper grid plate hole - B6 
c
903019       c/z  0.00000  7.98068  1.914525         $ upper grid plate hole - C1
903029       c/z  3.99034  6.91134  1.914525         $ upper grid plate hole - C2 
903039       c/z  6.91134  3.99034  1.914525         $ upper grid plate hole - C3
903049       c/z  7.98068  0.00000  1.914525         $ upper grid plate hole - C4
903059       c/z  6.91134 -3.99034  1.914525         $ upper grid plate hole - C5
903069       c/z  3.99034 -6.91134  1.914525         $ upper grid plate hole - C6 
903079       c/z  0.00000 -7.98068  1.914525         $ upper grid plate hole - C7 
903089       c/z -3.99034 -6.91134  1.914525         $ upper grid plate hole - C8  
903099       c/z -6.91134 -3.99034  1.914525         $ upper grid plate hole - C9
903109       c/z -7.98068  0.00000  1.914525         $ upper grid plate hole - C10
903119       c/z -6.91130  3.99030  1.914525         $ upper grid plate hole - C11 
903129       c/z -3.99030  6.91130  1.914525         $ upper grid plate hole - C12 
c
904019       c/z  0.00000  11.9456  1.914525         $ upper grid plate hole - D1
904029       c/z  4.08530  11.2253  1.914525         $ upper grid plate hole - D2 
904039       c/z  7.67870  9.15040  1.914525         $ upper grid plate hole - D3 
904049       c/z  10.3449  5.97280  1.914525         $ upper grid plate hole - D4 
904059       c/z  11.7640  2.07370  1.914525         $ upper grid plate hole - D5 
904069       c/z  11.7640 -2.07370  1.914525         $ upper grid plate hole - D6 
904079       c/z  10.3449 -5.97280  1.914525         $ upper grid plate hole - D7
904089       c/z  7.67870 -9.15040  1.914525         $ upper grid plate hole - D8 
904099       c/z  4.08530 -11.2253  1.914525         $ upper grid plate hole - D9
904109       c/z  0.00000 -11.9456  1.914525         $ upper grid plate hole - D10
904119       c/z -4.08530 -11.2253  1.914525         $ upper grid plate hole - D11 
904129       c/z -7.67870 -9.15040  1.914525         $ upper grid plate hole - D12 
904139       c/z -10.3449 -5.97280  1.914525         $ upper grid plate hole - D13 
904149       c/z -11.7640 -2.07370  1.914525         $ upper grid plate hole - D14 
904159       c/z -11.7640  2.07370  1.914525         $ upper grid plate hole - D15
904169       c/z -10.3449  5.97280  1.914525         $ upper grid plate hole - D16 
904179       c/z -7.67870  9.15040  1.914525         $ upper grid plate hole - D17 
904189       c/z -4.08530  11.2253  1.914525         $ upper grid plate hole - D18 
c
905019       c/z  0.0000000  15.915600 1.914525      $ upper grid plate hole - E1
905029       c/z  4.1189000  15.372800 1.914525      $ upper grid plate hole - E2
905039       c/z  7.9578000  13.782800 1.914525      $ upper grid plate hole - E3
905049       c/z  11.254000  11.254000 1.914525      $ upper grid plate hole - E4 
905059       c/z  13.874200  7.9578000 1.914525      $ upper grid plate hole - E5 
905069       c/z  15.372800  4.1189000 1.914525      $ upper grid plate hole - E6 
905079       c/z  15.915600  0.0000000 1.914525      $ upper grid plate hole - E7 
905089       c/z  15.372800 -4.1189000 1.914525      $ upper grid plate hole - E8 
905099       c/z  13.874200 -7.9578000 1.914525      $ upper grid plate hole - E9 
905109       c/z  11.254000 -11.254000 1.914525      $ upper grid plate hole - E10 
905119       c/z  7.9578000 -13.782800 1.914525      $ upper grid plate hole - E11 
905129       c/z  4.1189000 -15.372800 1.914525      $ upper grid plate hole - E12 
905139       c/z  0.0000000 -15.915600 1.914525      $ upper grid plate hole - E13 
905149       c/z -4.1189000 -15.372800 1.914525      $ upper grid plate hole - E14 
905159       c/z -7.9578000 -13.782800 1.914525      $ upper grid plate hole - E15 
905169       c/z -11.254000 -11.254000 1.914525      $ upper grid plate hole - E16 
905179       c/z -13.874200 -7.9578000 1.914525      $ upper grid plate hole - E17
905189       c/z -15.372800 -4.1189000 1.914525      $ upper grid plate hole - E18
905199       c/z -15.915600  0.0000000 1.914525      $ upper grid plate hole - E19 
905209       c/z -15.372800  4.1189000 1.914525      $ upper grid plate hole - E20
905219       c/z -13.874200  7.9578000 1.914525      $ upper grid plate hole - E21
905229       c/z -11.254000  11.254000 1.914525      $ upper grid plate hole - E22 
905239       c/z -7.9578000  13.782800 1.914525      $ upper grid plate hole - E23
905249       c/z -4.1189000  15.372800 1.914525      $ upper grid plate hole - E24 
c
906019       c/z  0.0000000  19.888200 1.914525      $ upper grid plate hole - F1
906029       c/z  4.1348660  19.452590 1.914525      $ upper grid plate hole - F2 
906039       c/z  8.0886300  18.157860 1.914525      $ upper grid plate hole - F3 
906049       c/z  11.690350  16.089630 1.914525      $ upper grid plate hole - F4 
906059       c/z  14.778990  13.307314 1.914525      $ upper grid plate hole - F5
906069       c/z  17.223232  9.9441000 1.914525      $ upper grid plate hole - F6    
906079       c/z  18.915634  6.1455300 1.914525      $ upper grid plate hole - F7 
906089       c/z  19.777202  2.0706080 1.914525      $ upper grid plate hole - F8 
906099       c/z  19.777202 -2.0706080 1.914525      $ upper grid plate hole - F9 
906109       c/z  18.915634 -6.1455300 1.914525      $ upper grid plate hole - F10 
906119       c/z  17.223232 -9.9441000 1.914525      $ upper grid plate hole - F11 
906129       c/z  14.778990 -13.307314 1.914525      $ upper grid plate hole - F12
906139       c/z  11.690350 -16.089630 1.914525      $ upper grid plate hole - F13 
906149       c/z  8.0886300 -18.167858 1.914525      $ upper grid plate hole - F14 
906159       c/z  4.1348660 -19.452590 1.914525      $ upper grid plate hole - F15 
906169       c/z  0.0000000 -19.888200 1.914525      $ upper grid plate hole - F16 
906179       c/z -4.1348660 -19.452590 1.914525      $ upper grid plate hole - F17
906189       c/z -8.0886300 -18.167858 1.914525      $ upper grid plate hole - F18 
906199       c/z -11.690350 -16.089630 1.914525      $ upper grid plate hole - F19 
906209       c/z -14.778990 -13.307314 1.914525      $ upper grid plate hole - F20 
906219       c/z -17.223232 -9.9441000 1.914525      $ upper grid plate hole - F21 
906229       c/z -18.915634 -6.1455300 1.914525      $ upper grid plate hole - F22
906239       c/z -19.777202 -2.0706080 1.914525      $ upper grid plate hole - F23 
906249       c/z -19.777202  2.0706080 1.914525      $ upper grid plate hole - F24 
906259       c/z -18.915634  6.1455300 1.914525      $ upper grid plate hole - F25 
906269       c/z -17.223232  9.9441000 1.914525      $ upper grid plate hole - F26 
906279       c/z -14.778990  13.307314 1.914525      $ upper grid plate hole - F27 
906289       c/z -11.690350  16.089630 1.914525      $ upper grid plate hole - F28 
906299       c/z -8.0886300  18.167858 1.914525      $ upper grid plate hole - F29
906309       c/z -4.1348660  19.452590 1.914525      $ upper grid plate hole - F30 
c
c
c --- Flux wire insertion holes ---
c
111301  c/z  -5.265420  0.000000  0.400685  $ Flux wire insertion hole A 
111302  c/z  -10.46226  0.000000  0.400685  $ Flux wire insertion hole B
111303  c/z  -13.35786  0.000000  0.400685  $ Flux wire insertion hole C
111304  c/z  -18.39468  0.000000  0.400685  $ Flux wire insertion hole D
111305  c/z  -21.06930 -4.480560  0.400685  $ Flux wire insertion hole E
111306  c/z   4.206240 -4.445000  0.400685  $ Flux wire insertion hole F
111307  c/z   5.991860 -1.478280  0.400685  $ Flux wire insertion hole G
111308  c/z   9.372600 -3.068320  0.400685  $ Flux wire insertion hole H
111309  c/z   12.90828 -5.080000  0.400685  $ Flux wire insertion hole J
111310  c/z   16.36522 -7.048500  0.400685  $ Flux wire insertion hole K
111311  c/z   19.66976 -8.768080  0.400685  $ Flux wire insertion hole L
111312  c/z   5.265420  0.000000  0.400685  $ Flux wire insertion hole A1 
111313  c/z   10.46226  0.000000  0.400685  $ Flux wire insertion hole B1
111314  c/z   13.35786  0.000000  0.400685  $ Flux wire insertion hole C1
111315  c/z   18.39468  0.000000  0.400685  $ Flux wire insertion hole D1
111316  c/z   21.06930  4.480560  0.400685  $ Flux wire insertion hole E1
c
c
c ---------- Lower grid plate ----------
c
111398  cz   21.14550   $ lower grid plate radius
c
111397  cz   1.983740   $ Lower grid plate CT holes
c
112301  pz  -1.905000   $ Bottom of lower grid plate
10  pz   0.1   $ Top of lower grid plate
c
c
c  --- Disabled for 2016 TRTR model ---
c
c  111360  c/z  0.000000  2.997200  0.793750  $ Lower grid plate water hole A1
c  111361  c/z  2.595651  1.498600  0.793750  $ Lower grid plate water hole A2
c  111362  c/z  2.595651 -1.498600  0.793750  $ Lower grid plate water hole A3
c  111363  c/z  0.000000 -2.997200  0.793750  $ Lower grid plate water hole A4
c  111364  c/z -2.595651 -1.498600  0.793750  $ Lower grid plate water hole A5
c  111365  c/z -2.595651  1.498600  0.793750  $ Lower grid plate water hole A6
c  c
c  111366  c/z  0.000000  6.019800  0.793750  $ Lower grid plate water hole B1
c  111367  c/z  3.538350  4.870121  0.793750  $ Lower grid plate water hole B2
c  111368  c/z  5.725170  1.860220  0.793750  $ Lower grid plate water hole B3
c  111369  c/z  5.725170 -1.860220  0.793750  $ Lower grid plate water hole B4
c  111370  c/z  3.538350 -4.870121  0.793750  $ Lower grid plate water hole B5
c  111371  c/z  0.000000 -6.019800  0.793750  $ Lower grid plate water hole B6
c  111372  c/z -3.538350 -4.870121  0.793750  $ Lower grid plate water hole B7
c  111373  c/z -5.725170 -1.860220  0.793750  $ Lower grid plate water hole B8
c  111374  c/z -5.725170  1.860220  0.793750  $ Lower grid plate water hole B9
c  111375  c/z -3.538350  4.870121  0.793750  $ Lower grid plate water hole B10
c  c
c  111376  c/z  0.000000  8.890000  0.793750  $ Lower grid plate water hole C1
c  111377  c/z  3.615944  8.121396  0.793750  $ Lower grid plate water hole C2
c  111378  c/z  6.606540  5.948680  0.793750  $ Lower grid plate water hole C3
c  111379  c/z  8.454898  2.747264  0.793750  $ Lower grid plate water hole C4
c  111380  c/z  8.841232 -0.929132  0.793750  $ Lower grid plate water hole C5
c  111381  c/z  7.698994 -4.445000  0.793750  $ Lower grid plate water hole C6
c  111382  c/z  5.225288 -7.192264  0.793750  $ Lower grid plate water hole C7
c  111383  c/z  1.848358 -8.695690  0.793750  $ Lower grid plate water hole C8
c  111384  c/z -1.848358 -8.695690  0.793750  $ Lower grid plate water hole C9
c  111385  c/z -5.225288 -7.192264  0.793750  $ Lower grid plate water hole C10
c  111386  c/z -7.698994 -4.445000  0.793750  $ Lower grid plate water hole C11
c  111387  c/z -8.841232 -0.929132  0.793750  $ Lower grid plate water hole C12
c  111388  c/z -8.454898  2.747264  0.793750  $ Lower grid plate water hole C13
c  111389  c/z -6.606540  5.948680  0.793750  $ Lower grid plate water hole C14
c  111390  c/z -3.615944  8.121396  0.793750  $ Lower grid plate water hole C15
c
c
c
c ------------------------------
c ----- Graphite reflector -----
c ------------------------------
c
121301  cz  22.0980  $ Reflector assembly inner radius
121302  cz  22.7330  $ Graphite blank inner radius
c
121303  cz  29.5656  $ inner radius of graphite blank annulus in LS region
121304  cz  30.2006  $ inner radius of LS channel in reflector assembly
c
121305  cz  36.6395  $ outer radius of LS channel in reflector assembly
121306  cz  37.2745  $ outer radius of graphite blank annulus in LS region   
c
121307  cz  53.3400  $ Graphite blank outer radius
121308  cz  54.6100  $ Reflector assembly outer radius
c
c
c
122301  pz   7.6200  $ Bottom of reflector assembly
122302  pz   8.8900  $ Bottom of graphite blank
c
122303  pz  35.7886  $ top of graphite blank in LS channel region
122304  pz  36.4236  $ bottom of reflector assembly LS channel
c
122305  pz  62.2300  $ Top of graphite blank
122306  pz  63.5000  $ Top of reflector assembly
c
c
c
c ------------------------------
c ---- Rotary specimen rack ----
c ------------------------------
c
c -- pz surfaces --
c
122307  pz  37.05860  $ Bottom of inner LS container
122308  pz  64.77001  $ Top of reflector container lip annulus
122309  pz  72.54875  $ Top of inside of reflector container
122310  pz  73.18375  $ Top of reflector container
c
122311  pz  38.64610  $ Bottom of specimen holder
122312  pz  38.80485  $ Bottom of inner specimen holder
c
122313  pz  65.72250  $ Bottom of sepcimen ring
122314  pz  66.83375  $ Top of sample tube
122315  pz  67.62750  $ Top of specimen ring
c
c 122316  pz  67.46875  $ top of beveling
c 
c
c -- cz surfaces --
c
121390  cz  26.70810  $ Ouside of LS lip
121391  cz  27.34310  $ Inside of LS lip
c
121392  cz  36.00450  $ Outer wall of inside of rotary rack enclosure
121393  cz  30.83560  $ Inner wall of inside of rotary rack enclosure
c
121394  cz  30.63875  $ Outer radius of sample tube annulus
121395  cz  35.08375  $ Inner radius of sample tube annulus
c
c
c
c
c -- specimen container c/z surfaces --    malcolm, reminder, renumber rhis
c
121310  c/z  0.0000000  33.020000  1.58750  $ Pos. 1 inner radius 
121311  c/z  0.0000000  33.020000  1.74625  $ Pos. 1 outer radius
c
121312  c/z  10.203688  31.403798  1.58750  $ Pos. 3 inner radius 
121313  c/z  10.203688  31.403798  1.74625  $ Pos. 3 outer radius
c
121314  c/z  19.408648  26.713688  1.58750  $ Pos. 5 inner radius 
121315  c/z  19.408648  26.713688  1.74625  $ Pos. 5 outer radius
c
121316  c/z  26.713688  19.408648  1.58750  $ Pos. 7 inner radius 
121317  c/z  26.713688  19.408648  1.74625  $ Pos. 7 outer radius
c
121318  c/z  31.403798  10.203688  1.58750  $ Pos. 9 inner radius 
121319  c/z  31.403798  10.203688  1.74625  $ Pos. 9 outer radius
c
121320  c/z  33.020000  00.000000  1.58750  $ Pos. 11 inner radius 
121321  c/z  33.020000  00.000000  1.74625  $ Pos. 11 outer radius
c
121322  c/z  31.403798 -10.203688  1.58750  $ Pos. 13 inner radius 
121323  c/z  31.403798 -10.203688  1.74625  $ Pos. 13 outer radius
c
121324  c/z  26.713688 -19.408648  1.51750  $ Pos. 15 inner radius 
121325  c/z  26.713688 -19.408648  1.74620  $ Pos. 15 outer radius
c
121326  c/z  19.408648 -26.713688  1.51750  $ Pos. 17 inner radius 
121327  c/z  19.408648 -26.713688  1.74620  $ Pos. 17 outer radius
c
121328  c/z  10.203688 -31.403798  1.51750  $ Pos. 19 inner radius 
121329  c/z  10.203688 -31.403798  1.74620  $ Pos. 19 outer radius
c
121330  c/z  0.0000000 -33.020000  1.51750  $ Pos. 21 inner radius 
121331  c/z  0.0000000 -33.020000  1.74620  $ Pos. 21 outer radius
c
121332  c/z -10.203688 -31.403798  1.51750  $ Pos. 23 inner radius 
121333  c/z -10.203688 -31.403798  1.74620  $ Pos. 23 outer radius
c
121334  c/z -19.408648 -26.713688  1.51750  $ Pos. 25 inner radius 
121335  c/z -19.408648 -26.713688  1.74620  $ Pos. 25 outer radius
c
121336  c/z -26.713688 -19.408648  1.51750  $ Pos. 27 inner radius 
121337  c/z -26.713688 -19.408648  1.74620  $ Pos. 27 outer radius
c
121338  c/z -31.403798 -10.203688  1.51750  $ Pos. 29 inner radius 
121339  c/z -31.403798 -10.203688  1.74620  $ Pos. 29 outer radius
c
121340  c/z -33.020000  00.000000  1.51750  $ Pos. 31 inner radius 
121341  c/z -33.020000  00.000000  1.74620  $ Pos. 31 outer radius
c
121342  c/z -31.403798  10.203688  1.51750  $ Pos. 33 inner radius 
121343  c/z -31.403798  10.203688  1.74620  $ Pos. 33 outer radius
c
121344  c/z -26.713688  19.408648  1.51750  $ Pos. 35 inner radius 
121345  c/z -26.713688  19.408648  1.74620  $ Pos. 35 outer radius
c
121346  c/z -19.408648  26.713688  1.51750  $ Pos. 37 inner radius 
121347  c/z -19.408648  26.713688  1.74620  $ Pos. 37 outer radius
c
121348  c/z -10.203688  31.403798  1.51750  $ Pos. 39 inner radius 
121349  c/z -10.203688  31.403798  1.74620  $ Pos. 39 outer radius
c
c
c
121350  c/z   05.1655   32.6135  1.58750  $ Pos. 2 inner radius 
121351  c/z   05.1655   32.6135  1.74625  $ Pos. 2 outer radius
c
121352  c/z   14.9908   29.4210  1.58750  $ Pos. 4 inner radius 
121353  c/z   14.9908   29.4210  1.74625  $ Pos. 4 outer radius
c
121354  c/z   23.3487   23.3487  1.58750  $ Pos. 6 inner radius 
121355  c/z   23.3487   23.3487  1.74625  $ Pos. 6 outer radius
c
121356  c/z   29.4210   14.9908  1.58750  $ Pos. 8 inner radius 
121357  c/z   29.4210   14.9908  1.74625  $ Pos. 8 outer radius
c
121358  c/z   32.6135   05.1655  1.58750  $ Pos. 10 inner radius 
121359  c/z   32.6135   05.1655  1.74625  $ Pos. 10 outer radius
c
121360  c/z   32.6135  -05.1655  1.58750  $ Pos. 12 inner radius 
121361  c/z   32.6135  -05.1655  1.74625  $ Pos. 12 outer radius
c
121362  c/z   29.4210  -14.9908  1.58750  $ Pos. 14 inner radius 
121363  c/z   29.4210  -14.9908  1.74625  $ Pos. 14 outer radius
c
121364  c/z   23.3487  -23.3487  1.51750  $ Pos. 16 inner radius 
121365  c/z   23.3487  -23.3487  1.74620  $ Pos. 16 outer radius
c
121366  c/z   14.9908  -29.4210  1.51750  $ Pos. 18 inner radius 
121367  c/z   14.9908  -29.4210  1.74620  $ Pos. 18 outer radius
c
121368  c/z   05.1655  -32.6135  1.51750  $ Pos. 20 inner radius 
121369  c/z   05.1655  -32.6135  1.74620  $ Pos. 20 outer radius
c
121370  c/z  -05.1655  -32.6135  1.51750  $ Pos. 22 inner radius 
121371  c/z  -05.1655  -32.6135  1.74620  $ Pos. 22 outer radius
c
121372  c/z  -14.9908  -29.4210  1.51750  $ Pos. 24 inner radius 
121373  c/z  -14.9908  -29.4210  1.74620  $ Pos. 24 outer radius
c
121374  c/z  -23.3487  -23.3487  1.51750  $ Pos. 26 inner radius 
121375  c/z  -23.3487  -23.3487  1.74620  $ Pos. 26 outer radius
c
121376  c/z  -29.4210  -14.9908  1.51750  $ Pos. 28 inner radius 
121377  c/z  -29.4210  -14.9908  1.74620  $ Pos. 28 outer radius
c
121378  c/z  -32.6135  -5.16550  1.51750  $ Pos. 30 inner radius 
121379  c/z  -32.6135  -5.16550  1.74620  $ Pos. 30 outer radius
c
121380  c/z  -32.6135   05.1655  1.51750  $ Pos. 32 inner radius 
121381  c/z  -32.6135   05.1655  1.74620  $ Pos. 32 outer radius
c
121382  c/z  -29.4210   14.9908  1.51750  $ Pos. 34 inner radius 
121383  c/z  -29.4210   14.9908  1.74620  $ Pos. 34 outer radius
c
121384  c/z  -23.3487   23.3487  1.51750  $ Pos. 36 inner radius 
121385  c/z  -23.3487   23.3487  1.74620  $ Pos. 36 outer radius
c
121386  c/z  -14.9908   29.4210  1.51750  $ Pos. 38 inner radius 
121387  c/z  -14.9908   29.4210  1.74620  $ Pos. 38 outer radius
c
121388  c/z  -05.1655   32.6135  1.51750  $ Pos. 40 inner radius 
121389  c/z  -05.1655   32.6135  1.74620  $ Pos. 40 outer radius
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c -- specimen container k/z surfaces --
c
123301  k/z   00.000000   33.020000   65.08750  1  $ Sample container top bevel Pos. 1
123302  k/z   10.203688   31.403798   65.08750  1  $ Sample container top bevel Pos. 3
123303  k/z   19.408648   26.713688   65.08750  1  $ Sample container top bevel Pos. 5
123304  k/z   26.713688   19.408648   65.08750  1  $ Sample container top bevel Pos. 7
123305  k/z   31.403798   10.203688   65.08750  1  $ Sample container top bevel Pos. 9
123306  k/z   33.020000   00.000000   65.08750  1  $ Sample container top bevel Pos. 11
123307  k/z   31.403798  -10.203688   65.08750  1  $ Sample container top bevel Pos. 13
123308  k/z   26.713688  -19.408648   65.08750  1  $ Sample container top bevel Pos. 15
123309  k/z   19.408648  -26.713688   65.08750  1  $ Sample container top bevel Pos. 17
123310  k/z   10.203688  -31.403798   65.08750  1  $ Sample container top bevel Pos. 19
123311  k/z   00.000000  -33.020000   65.08750  1  $ Sample container top bevel Pos. 21
123312  k/z  -10.203688  -31.403798   65.08750  1  $ Sample container top bevel Pos. 23
123313  k/z  -19.408648  -26.713688   65.08750  1  $ Sample container top bevel Pos. 25
123314  k/z  -26.713688  -19.408648   65.08750  1  $ Sample container top bevel Pos. 27
123315  k/z  -31.403798  -10.203688   65.08750  1  $ Sample container top bevel Pos. 29
123316  k/z  -33.020000   00.000000   65.08750  1  $ Sample container top bevel Pos. 31
123317  k/z  -31.403798   10.203688   65.08750  1  $ Sample container top bevel Pos. 33
123318  k/z  -26.713688   19.408648   65.08750  1  $ Sample container top bevel Pos. 35
123319  k/z  -19.408648   26.713688   65.08750  1  $ Sample container top bevel Pos. 37
123320  k/z  -10.203688   31.403798   65.08750  1  $ Sample container top bevel Pos. 39
c
123321  k/z   05.1655     32.6135     65.08750  1  $ Sample container top bevel Pos. 2
123322  k/z   14.9908     29.4210     65.08750  1  $ Sample container top bevel Pos. 4
123323  k/z   23.3487     23.3487     65.08750  1  $ Sample container top bevel Pos. 6
123324  k/z   29.4210     14.9908     65.08750  1  $ Sample container top bevel Pos. 8
123325  k/z   32.6135     05.1655     65.08750  1  $ Sample container top bevel Pos. 10
123326  k/z   32.6135    -05.1655     65.08750  1  $ Sample container top bevel Pos. 12
123327  k/z   29.4210    -14.9908     65.08750  1  $ Sample container top bevel Pos. 14
123328  k/z   23.3487    -23.3487     65.08750  1  $ Sample container top bevel Pos. 16
123329  k/z   14.9908    -29.4210     65.08750  1  $ Sample container top bevel Pos. 18
123330  k/z   05.1655    -32.6135     65.08750  1  $ Sample container top bevel Pos. 20
123331  k/z  -5.16550    -32.6135     65.08750  1  $ Sample container top bevel Pos. 22
123332  k/z  -14.9908    -29.4210     65.08750  1  $ Sample container top bevel Pos. 24
123333  k/z  -23.3487    -23.3487     65.08750  1  $ Sample container top bevel Pos. 26
123334  k/z  -29.4210    -14.9908     65.08750  1  $ Sample container top bevel Pos. 28
123335  k/z  -32.6135    -5.16550     65.08750  1  $ Sample container top bevel Pos. 30
123336  k/z  -32.6135     05.1655     65.08750  1  $ Sample container top bevel Pos. 32
123337  k/z  -29.4210     14.9908     65.08750  1  $ Sample container top bevel Pos. 34
123338  k/z  -23.3487     23.3487     65.08750  1  $ Sample container top bevel Pos. 36
123339  k/z  -14.9908     29.4210     65.08750  1  $ Sample container top bevel Pos. 38
123340  k/z  -5.16550     32.6135     65.08750  1  $ Sample container top bevel Pos. 40
c
c
c
c
c
c
c
c
c
c
c
c
c
c ------- Rotary rack radial planes -------
c
122001  p    16.4591    01.2954  0  0  $ Annular rack plane 1
122002  p    16.0538    03.8542  0  0  $ Annular rack plane 2
122003  p    15.2533    06.3181  0  0  $ Annular rack plane 3
122004  p    14.0771    08.6265  0  0  $ Annular rack plane 4
122005  p    12.5543    10.7224  0  0  $ Annular rack plane 5
122006  p    10.7224    12.5543  0  0  $ Annular rack plane 6
122007  p    08.6265    14.0771  0  0  $ Annular rack plane 7
122008  p    06.3181    15.2533  0  0  $ Annular rack plane 8
122009  p    03.8542    16.0538  0  0  $ Annular rack plane 9
122010  p    01.2954    16.4591  0  0  $ Annular rack plane 10
122011  p   -01.2954    16.4591  0  0  $ Annular rack plane 11
122012  p   -03.8542    16.0538  0  0  $ Annular rack plane 12
122013  p   -06.3181    15.2533  0  0  $ Annular rack plane 13
122014  p   -08.6265    14.0771  0  0  $ Annular rack plane 14
122015  p   -10.7224    12.5543  0  0  $ Annular rack plane 15
122016  p   -12.5543    10.7224  0  0  $ Annular rack plane 16
122017  p   -14.0771    08.6265  0  0  $ Annular rack plane 17
122018  p   -15.2533    06.3181  0  0  $ Annular rack plane 18
122019  p   -16.0538    03.8542  0  0  $ Annular rack plane 19
122020  p   -16.4591    01.2954  0  0  $ Annular rack plane 20
c 122021  p   -16.4591   -1.29540  0  0  $ Annular rack plane 21
c 122022  p   -16.0538   -3.85420  0  0  $ Annular rack plane 22
c 122023  p   -15.2533   -6.31810  0  0  $ Annular rack plane 23
c 122024  p   -14.0771   -8.62650  0  0  $ Annular rack plane 24
c 122025  p   -12.5543   -10.7224  0  0  $ Annular rack plane 25
c 122026  p   -10.7224   -12.5543  0  0  $ Annular rack plane 26
c 122027  p   -08.6265   -14.0771  0  0  $ Annular rack plane 27
c 122028  p   -06.3181   -15.2533  0  0  $ Annular rack plane 28
c 122029  p   -03.8542   -16.0538  0  0  $ Annular rack plane 29
c 122030  p   -01.2954   -16.4591  0  0  $ Annular rack plane 30
c 122031  p    01.2954   -16.4591  0  0  $ Annular rack plane 31
c 122032  p    03.8542   -16.0538  0  0  $ Annular rack plane 32
c 122033  p    06.3181   -15.2533  0  0  $ Annular rack plane 33
c 122034  p    08.6265   -14.0771  0  0  $ Annular rack plane 34
c 122035  p    10.7224   -12.5543  0  0  $ Annular rack plane 35
c 122036  p    12.5543   -10.7224  0  0  $ Annular rack plane 36
c 122037  p    14.0771   -8.62650  0  0  $ Annular rack plane 37
c 122038  p    15.2533   -6.31810  0  0  $ Annular rack plane 38
c 122039  p    16.0538   -3.85420  0  0  $ Annular rack plane 39
c 122040  p    16.4591   -1.29540  0  0  $ Annular rack plane 40
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c ------------------------------
c --------- Core water ---------
c ------------------------------
c
c
c
c ---------- Core water cylinders ----------
c
c 131301  cz   1.51750   $ A ring outer diameter water 
131302  cz   6.01726   $ B ring outer diameter water
131303  cz   9.96315   $ C ring outer diameter water 
131304  cz  13.93063   $ D ring outer diameter water
131305  cz  17.94200   $ E ring outer diameter water
c
c 1.914525 radius holes
c
c CT has 1.927225
c
c
c
c ---------- Core water axial planes ----------
c
c 132301  pz  21.5900  $ core water axial plane 1
c 132302  pz  43.1800  $ core water axial plane 2
c
11  pz  76.2000  $ top plane of fuel assembly supercells 
c
c
c
c ---------- Core radial planes ----------
c
c
c 132001  p   1.000000  0.000000  0 0   $ angular grid plane  1  (000.0 degrees)  This one's proabably going to be a px surface
132002  p   0.994522 -0.104528  0 0   $ angular grid plane  2  (006.0 degrees)
132003  p   0.991445 -0.130526  0 0   $ angular grid plane  3  (007.5 degrees)
132004  p   0.984808 -0.173648  0 0   $ angular grid plane  4  (010.0 degrees)
132005  p   0.965926 -0.258819  0 0   $ angular grid plane  5  (015.0 degrees)
132006  p   0.951057 -0.309017  0 0   $ angular grid plane  6  (018.0 degrees)
132007  p   0.923880 -0.382683  0 0   $ angular grid plane  7  (022.5 degrees)
132008  p   0.866025 -0.500000  0 0   $ angular grid plane  8  (030.0 degrees)  --- problem ---
132009  p   0.793353 -0.608761  0 0   $ angular grid plane  9  (037.5 degrees)
132010  p   0.743145 -0.669131  0 0   $ angular grid plane 10  (042.0 degrees)
132011  p   0.707107 -0.707107  0 0   $ angular grid plane 11  (045.0 degrees)
132012  p   0.642788 -0.766044  0 0   $ angular grid plane 12  (050.0 degrees)
132013  p   0.608761 -0.793353  0 0   $ angular grid plane 13  (052.5 degrees)
132014  p   0.587785 -0.809017  0 0   $ angular grid plane 14  (052.5 degrees)
132015  p   0.406737 -0.913545  0 0   $ angular grid plane 15  (066.0 degrees)
132016  p   0.382683 -0.923880  0 0   $ angular grid plane 16  (067.5 degrees)
132017  p   0.342020 -0.939693  0 0   $ angular grid plane 17  (070.0 degrees)
132018  p   0.258819 -0.965926  0 0   $ angular grid plane 18  (075.0 degrees)
132019  p   0.207912 -0.978148  0 0   $ angular grid plane 19  (078.0 degrees)
132020  p   0.130526 -0.991445  0 0   $ angular grid plane 20  (082.5 degrees)
132021  p   0.000000 -1.000000  0 0   $ angular grid plane 21  (090.0 degrees)  This one's also probably going to be a px surface   --- problem ----
132022  p  -0.130526 -0.991445  0 0   $ angular grid plane 22  (097.5 degrees)
132023  p  -0.207912 -0.978148  0 0   $ angular grid plane 23  (102.0 degrees)
132024  p  -0.258819 -0.965926  0 0   $ angular grid plane 24  (105.0 degrees)
132025  p  -0.342020 -0.939693  0 0   $ angular grid plane 25  (110.0 degrees)
132026  p  -0.382683 -0.923880  0 0   $ angular grid plane 26  (112.5 degrees)
132027  p  -0.406737 -0.913545  0 0   $ angular grid plane 27  (114.0 degrees)
132028  p  -0.587785 -0.809017  0 0   $ angular grid plane 28  (126.0 degrees)
132029  p  -0.608761 -0.793353  0 0   $ angular grid plane 29  (127.5 degrees)
132030  p  -0.642788 -0.766044  0 0   $ angular grid plane 30  (130.0 degrees)
132031  p  -0.707107 -0.707107  0 0   $ angular grid plane 31  (135.0 degrees)
132032  p  -0.743145 -0.669131  0 0   $ angular grid plane 32  (138.0 degrees)
132033  p  -0.793353 -0.608761  0 0   $ angular grid plane 33  (142.5 degrees)
132034  p  -0.866025 -0.500000  0 0   $ angular grid plane 34  (150.0 degrees)
132035  p  -0.923880 -0.382683  0 0   $ angular grid plane 35  (157.5 degrees)
132036  p  -0.951057 -0.309017  0 0   $    grid plane 36  (162.0 degrees)
132037  p  -0.965926 -0.258819  0 0   $ angular grid plane 37  (165.0 degrees)
132038  p  -0.984808 -0.173648  0 0   $ angular grid plane 38  (170.0 degrees)
132039  p  -0.991445 -0.130526  0 0   $ angular grid plane 39  (172.5 degrees)
132040  p  -0.994522 -0.104528  0 0   $ angular grid plane 40  (174.0 degrees)
c
c
c
c
c
c ------------------------------
c ------ Central Thimble -------
c ------------------------------
c
141300  cz  1.69418   $ Central thimble inner diameter
c
142301  pz -20.9550   $ Bottom of central thimble bottom cap
142302  pz -19.0500   $ Top of central thimble bottom cap
c
142303  pz  52.7050   $ Central thimble evacuable waterline
c
c
c
c
c
c c
c c
c c
c c ------------------------------
c c ------ Installed sources -----
c c ------------------------------
c c
c c
c c
c c ---- p/z surfaces ----
c c
c 172302     pz  0.285         $ bottom of source holder
c 172303     pz  40.245        $ bottom of lower cavity cone
c 172304     pz  40.745        $ bottom of main cavity cylinder
c 172305     pz  48.445        $ top of main cavity cylinder
c 172306     pz  48.695        $ top of half-cone directly above cavity cylinder
c 172308     pz  49.395        $ top of cylinder on cavity cap
c 172309     pz  49.595        $ top of upper cavity cone
c 172311     pz  66.675        $ top of top grid plate
c 172312     pz  66.975        $ top of upper source body cap
c 172313     pz  73.575        $ top of lower cylindrical component of source knob
c 172314     pz  74.075        $ midsection of corset componenet on source knob
c 172315     pz  74.575        $ top of corset bit/bottom of upper cylindrical component on source knob
c 172316     pz  75.075        $ top of upper cylindrical component on source knob
c 172317     pz  75.825        $ top of source knob 
c c 
c c
c c
c c ---- AmBe c/z and k/z surfaces ----
c c
c 171301       c/z  -19.777202  -2.070608  1.9                 $ cylinder body of source holder
c 171302       c/z  -19.777202  -2.070608  1.25                $ main cylinder part of source cavity
c 171303       c/z  -19.777202  -2.070608  0.3                 $ top cap cylinder part of source cavity
c 171305       c/z  -19.777202  -2.070608  0.75                $ cylinder component on knob
c c
c 173301       k/z  -19.777202  -2.070608  40.245  4.0804      $ cone on bottom of cavity
c 173302       k/z  -19.777202  -2.070608  48.945  1.44        $ imaginary cone on top of cavity
c 173303       k/z  -19.777202  -2.070608  49.595  2.25        $ cone on tip of cavity cap
c 173304       k/z  -19.777202  -2.070608  76.575  0.0625      $ bottom cone half of corset
c 173305       k/z  -19.777202  -2.070608  71.575  0.0625      $ top cone half of corset
c 173306       k/z  -19.777202  -2.070608  75.825  1           $ cone on end of knob
c c
c c
c c
c c
c c ---- IR-192 c/z and k/z surfaces ----
c c
c 171310       c/z  -18.915634  6.1455300  1.9                 $ cylinder body of source holder
c 171311       c/z  -18.915634  6.1455300  1.25                $ main cylinder part of source cavity
c 171312       c/z  -18.915634  6.1455300  0.3                 $ top cap cylinder part of source cavity
c c 171313       c/z  -18.915634  6.1455300  2                   $ lip of source that rests on grid plate
c 171314       c/z  -18.915634  6.1455300  0.75                $ cylinder component on knob
c c
c 173310       k/z  -18.915634  6.1455300  40.245  4.0804      $ cone on bottom of cavity
c 173311       k/z  -18.915634  6.1455300  48.945  1.44        $ imaginary cone on top of cavity
c 173312       k/z  -18.915634  6.1455300  49.595  2.25        $ cone on tip of cavity cap
c 173313       k/z  -18.915634  6.1455300  76.575  0.0625      $ bottom cone half of corset
c 173314       k/z  -18.915634  6.1455300  71.575  0.0625      $ top cone half of corset
c 173315       k/z  -18.915634  6.1455300  75.825  1           $ cone on end of knob
c c
c c
c
c
c
c
c
c ------------------------------
c ----------- Rabbit -----------
c ------------------------------
c
c
c ---- pz surfaces ----
c
502301  pz   1.2700  $ Top of lower section lower taper
502302  pz   8.2550  $ Bottom of lower section upper taper
502303  pz   8.8900  $ Top of lower section upper taper  -- 
502304  pz   9.5250  $ Top of mid section lower taper
502305  pz  25.4000  $ Bottom of mid section upper taper
502306  pz  26.3525  $ Top of mid section upper taper
c
502307  pz  26.6700  $ Bottom of main section
502308  pz  28.5750  $ Lower divit main section
502309  pz  29.2100  $ Main section divit bezel
c
502310  pz  69.5325  $ Top of thinner outer tube section
c
502311  pz  30.4800  $ Bottom of sample holder
502312  pz  31.7500  $ Top of sample holder
c
502313  pz  39.6725  $ Sketchy bottom of upper bevel
c
c
c
c
c ----- Rabbit terminus -----
c
c --- c/z surfaces ---
c
501301  c/z  19.777202 -2.0706080  0.95250  $ Main section lower post outer radius
501302  c/z  19.777202 -2.0706080  1.31191  $ Shock absorber inner radius
501303  c/z  19.777202 -2.0706080  1.47066  $ Shock absorber outer radius
501304  c/z  19.777202 -2.0706080  1.48590  $ Divit outer radius 
501305  c/z  19.777202 -2.0706080  1.72720  $ Main section tube inner radius
501306  c/z  19.777202 -2.0706080  1.88595  $ Lower, mid, and main sections outer radii
501307  c/z  19.777202 -2.0706080  2.04470  $ Thick section outer radius
c
501308  c/z  19.777202 -2.0706080  0.79375  $ Sample holder inner radius
c
c
c --- k/z surfaces ---
c
503301  k/z  19.777202 -2.0706080  -0.61595  1  $ Lower taper
503302  k/z  19.777202 -2.0706080  10.14095  1  $ Taper b/w lower and mid section lower cone
503303  k/z  19.777202 -2.0706080   7.63905  1  $ Taper b/w lower and mid section upper cone
503304  k/z  19.777202 -2.0706080  27.28595  1  $ Upper taper mid section
c
c
c
c
c
c
c
c
c
c
c
c ----- Sample vials ----- 
c
c --- c/z surfaces ---
c
501311   c/z   19.777202 -2.0706080   0.50800       $ inner radius of inner irradiation vial
501312   c/z   19.777202 -2.0706080   0.61341       $ outer radius of inner irradiation vial
c
501313   c/z   19.777202 -2.0706080   0.72390       $ inner radius of outer irradiation vial
c
501317   c/z   19.777202 -2.0706080   1.11125       $ outer radius of rabbit vial top
501318   c/z   19.777202 -2.0706080   1.19063       $ outer radius of rabbit vial cap
c
c
c --- k/z surfaces ---
c
553301   k/z   19.777202 -2.0706080  26.6700  0.03515625  $ -2.2225 - 6.35 lower rabbit vial bevel lower portion
553302   k/z   19.777202 -2.0706080  39.3700  0.03515625  $ -2.2225 + 6.35 lower rabbit vial bevel upper portion
553303   k/z   19.777202 -2.0706080  34.9250  0.04000000  $ upper rabbit vial bevel
c
c
c --- pz surfaces ----
c
552302   pz   31.90875              $ -3.4925 + 0.15875 -- bottom of inside of rabbit vial
c
552303   pz   32.16910              $ -3.4925 + 0.15875 + 0.26035           -- bottom of inside of outer irradiation vial
552304   pz   33.02000              $ 1.27 -3.4925                          -- center of lower bevel of rabbit vial    %%%%%%%
552305   pz   32.33547              $ -3.4925 + 0.15875 + 0.26035 + 0.16637 -- bottom of inside of inner irradiation vial
c
552306   pz   34.29000              $ 2.54 + -3.4925  -- top of lower bevel of rabbit vial
c
552307   pz   34.54527              $ + 2.2098 -- top of inside of inner irradiation vial
552308   pz   34.70402              $ + 0.15875 -- top of outside of inner irradiation vial
552309   pz   37.47770              $ -3.07340 + 5.3086 top of inside of outer irradiation vial
c
552310   pz   37.63645              $ -3.33375 + 5.7277  -- top of outside of outer irradiation vial
c
552311   pz   40.32250              $ -3.4925 + 8.57250 -- top of lower portion of rabbit vial
552312   pz   41.11625              $ 5.08000 + 0.79375 -- top of upper bevel of rabbit vial
552313   pz   41.27500              $ 5.87375 + 0.15875 -- top of upper portion of rabbit vial
552314   pz   41.90975              $ 4.14375 - 0.47625 -- top of inner rabbit vial
552315   pz   42.38625              $ 6.0325  + 1.11125 -- top of cap of rabbit vial
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c ------------------------------
c --------- Control Rods -------
c ------------------------------
c
c
c --- control rod guide tubes ---
c
c -- general --
c
c
902301  pz  2.22250   $ top plane of rod guide tube grid plate adapter
c
c 902302  pz  4.44500   $ bottom plane of (1/4)" to (1/16)" taper
902303  pz  5.23875   $ middle of taper
c 902304  pz  6.03250   $ top plane of (1/4)" to (1/16)" taper
c
902399  pz  92.7100   $ top of control rod guide tubes
c
c
c
c
c
c -- safe rod --
c
903058   c/z   6.91134  -3.99034  1.90500   $ rod guide tube outer diameter
903057   c/z   6.91134  -3.99034  1.74625   $ rod guide tube inner diameter
c
c
c
c -- shim rod --
c
903098   c/z  -6.91134  -3.99034  1.90500   $ rod guide tube outer diameter
903097   c/z  -6.91134  -3.99034  1.74625   $ rod guide tube inner diameter
c
c
c
c -- reg rod --
c
905018   c/z   0.00000  15.91560  1.90500   $ rod guide tube outer diameter
905017   c/z   0.00000  15.91560  1.74625   $ rod guide tube inner diameter
c
c
c
c
c
c
c
c -------------------
c ---- COPY HERE ----
c
c ROD HEIGHTS
c the "bottom of control rod" has z-position 5.120640 at 0 % and 53.2694 at 100 %
c
c Safe Rod (0 % Withdrawn)
c
c
c c/z surfaces
c
811301   c/z   6.91134   -3.99034   0.508   $ Upper connecting rod cylinder
811302   c/z   6.91134   -3.99034   1.2573   $ Lower conic section cylinder
811303   c/z   6.91134   -3.99034   1.4224   $ Poison section cylinder 
811304   c/z   6.91134   -3.99034   1.5875   $ Outer diameter
c
c
c pz surfaces
c
812301   pz    54.19344   $ top of control rod
812302   pz    53.43144   $ top of main section
812303   pz    52.79644   $ top of poison portion
812304   pz     6.72084   $ bottom of poison portion
812305   pz     6.08584   $ bottom of main section
812306   pz     5.67944   $ bottom of outer lower cone
812307   pz     5.120640   $ bottom of control rod
c
c
c k/z surfaces
c
813301   k/z  6.91134   -3.99034   57.09490154   0.1877777777   $ upper beveling
813302   k/z  6.91134   -3.99034    4.13199   0.66015625   $ lower outer beveling
813303   k/z  6.91134   -3.99034    5.120640   5.0625   $ lower inner beveling
c
c
c
c
c
c
c
c Shim Rod (0% Withdrawn)
c
c
c c/z surfaces
c
821301   c/z   -6.91134   -3.99034   0.508   $ Upper connecting rod cylinder
821302   c/z   -6.91134   -3.99034   1.2573   $ Lower conic section cylinder
821303   c/z   -6.91134   -3.99034   1.4224   $ Poison section cylinder 
821304   c/z   -6.91134   -3.99034   1.5875   $ Outer diameter
c
c
c pz surfaces
c
822301   pz    54.19344   $ top of control rod
822302   pz    53.43144   $ top of main section
822303   pz    52.79644   $ top of poison portion
822304   pz     6.72084   $ bottom of poison portion
822305   pz     6.08584   $ bottom of main section
822306   pz     5.67944   $ bottom of outer lower cone
822307   pz     5.120640   $ bottom of control rod
c
c
c k/z surfaces
c
823301   k/z  -6.91134   -3.99034   57.09490154    0.1877777777   $ upper beveling
823302   k/z  -6.91134   -3.99034    4.13199   0.66015625   $ lower outer beveling
823303   k/z  -6.91134   -3.99034    5.120640   5.0625   $ lower inner beveling
c
c
c
c
c
c
c
c Reg Rod (0% Withdrawn)
c
c
c c/z surfaces
c
831301   c/z   0   15.9156   0.508   $ Upper connecting rod cylinder
831302   c/z   0   15.9156   1.2573   $ Lower conic section cylinder
831303   c/z   0   15.9156   1.4224   $ Poison section cylinder 
831304   c/z   0   15.9156   1.5875   $ Outer diameter
c
c
c pz surfaces
c
832301   pz    54.19344   $ top of control rod
832302   pz    53.43144   $ top of main section
832303   pz    52.79644   $ top of poison portion
832304   pz     6.72084   $ bottom of poison portion
832305   pz     6.08584   $ bottom of main section
832306   pz     5.67944   $ bottom of outer lower cone
832307   pz     5.120640   $ bottom of control rod
c
c
c k/z surfaces
c
833301   k/z  0   15.9156   57.09490154    0.1877777777   $ upper beveling
833302   k/z  0   15.9156    4.13199   0.66015625   $ lower outer beveling
833303   k/z  0   15.9156    5.120640   5.0625   $ lower inner beveling
c
c
c
c
c
c KEEP FOR REFERENCE
c Safe Rod (90% Withdrawn)
c
c
c c/z surfaces
c
c 811301   c/z   6.91134   -3.99034   0.508   $ Upper connecting rod cylinder
c 811302   c/z   6.91134   -3.99034   1.2573   $ Lower conic section cylinder
c 811303   c/z   6.91134   -3.99034   1.4224   $ Poison section cylinder 
c 811304   c/z   6.91134   -3.99034   1.5875   $ Outer diameter
c
c
c pz surfaces
c
c 812301   pz    97.0153   $ top of control rod
c 812302   pz    96.2533   $ top of main section
c 812303   pz    95.6183   $ top of poison portion
c 812304   pz    49.5427   $ bottom of poison portion
c 812305   pz    48.9077   $ bottom of main section
c 812306   pz    48.5013   $ bottom of outer lower cone
c 812307   pz    47.9425   $ bottom of control rod
c
c
c k/z surfaces
c
c 813301   k/z  6.91134   -3.99034   99.9167615385   0.1877777777   $ upper beveling
c 813302   k/z  6.91134   -3.99034   46.95385   0.66015625   $ lower outer beveling
c 813303   k/z  6.91134   -3.99034   47.9425   5.0625   $ lower inner beveling
c
c
c
c
c
c
c
c Shim Rod (90% Withdrawn)
c
c
c c/z surfaces
c
c 821301   c/z   -6.91134   -3.99034   0.508   $ Upper connecting rod cylinder
c 821302   c/z   -6.91134   -3.99034   1.2573   $ Lower conic section cylinder
c 821303   c/z   -6.91134   -3.99034   1.4224   $ Poison section cylinder 
c 821304   c/z   -6.91134   -3.99034   1.5875   $ Outer diameter
c
c
c pz surfaces
c
c 822301   pz    97.0153   $ top of control rod
c 822302   pz    96.2533   $ top of main section
c 822303   pz    95.6183   $ top of poison portion
c 822304   pz    49.5427   $ bottom of poison portion
c 822305   pz    48.9077   $ bottom of main section
c 822306   pz    48.5013   $ bottom of outer lower cone
c 822307   pz    47.9425   $ bottom of control rod
c
c
c k/z surfaces
c
c 823301   k/z  -6.91134   -3.99034   99.9167615385   0.1877777777   $ upper beveling
c 823302   k/z  -6.91134   -3.99034   46.95385   0.66015625   $ lower outer beveling
c 823303   k/z  -6.91134   -3.99034   47.9425   5.0625   $ lower inner beveling
c
c
c
c
c
c
c
c Reg Rod (90% Withdrawn)
c
c
c c/z surfaces
c
c 831301   c/z   0   15.9156   0.508   $ Upper connecting rod cylinder
c 831302   c/z   0   15.9156   1.2573   $ Lower conic section cylinder
c 831303   c/z   0   15.9156   1.4224   $ Poison section cylinder 
c 831304   c/z   0   15.9156   1.5875   $ Outer diameter
c
c
c pz surfaces
c
c 832301   pz    97.0153   $ top of control rod
c 832302   pz    96.2533   $ top of main section
c 832303   pz    95.6183   $ top of poison portion
c 832304   pz    49.5427   $ bottom of poison portion
c 832305   pz    48.9077   $ bottom of main section
c 832306   pz    48.5013   $ bottom of outer lower cone
c 832307   pz    47.9425   $ bottom of control rod
c
c
c k/z surfaces
c
c 833301   k/z  0   15.9156   99.9167615385   0.1877777777   $ upper beveling
c 833302   k/z  0   15.9156   46.95385   0.66015625   $ lower outer beveling
c 833303   k/z  0   15.9156   47.9425   5.0625   $ lower inner beveling
c
c
c
c
c
c ---- COPY HERE ----
c -------------------
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c ------------------------------
c -------- Fuel Surfaces ------- TODO 
c ------------------------------
c
c
c ------- Active section surfaces -------
c
c 302301  pz  17.89684  $ Fuel meat 1"
c 302302  pz  20.43684  $ Fuel meat 2"
302303  pz  22.97684  $ Fuel meat 3"
c 302304  pz  25.51684  $ Fuel meat 4"
c 302305  pz  28.05684  $ Fuel meat 5"
302306  pz  30.59684  $ Fuel meat 6"
c 302307  pz  33.13684  $ Fuel meat 7"
c 302308  pz  35.67684  $ Fuel meat 8"
302309  pz  38.21684  $ Fuel meat 9"
c 302310  pz  40.75684  $ Fuel meat 10"
c 302311  pz  43.29684  $ Fuel meat 11"
302312  pz  45.83684  $ Fuel meat 12"
c 302313  pz  48.37684  $ Fuel meat 13"
c 302314  pz  50.91684  $ Fuel meat 14"
c
c
c Al element (TOS210D130) (done)
c 
311301  cz  0.285750  $ Zirc pin outer radius (0.225" DIA)
311302  cz  0.793750  $ Top and bottom fitting outer radii (0.625" DIA)
311303  cz  1.587500  $ Tri-flute effective outer radius (1.250" DIA)
311304  cz  1.797050  $ Fuel active section outer radius (1.415" DIA)
311305  cz  1.873250  $ Cladding outer radius (1.475" DIA)
311306  cz  1.92  $
c
312300  pz  0         $ Bottom of lower grid plate (with rounding correction)
312301  pz  5.120640  $ Top of lower grid plate pin
312302  pz  6.390640  $ Top of bottom fitting casing
312303  pz  15.35684  $ Bottom of active section
312304  pz  53.45684  $ Top of active section 
312305  pz  62.42304  $ Top of upper graphite spacer
312306  pz  63.69304  $ Top of Al top cap 
312307  pz  66.55054  $ Top of tri-flute  
312308  pz  70.36054  $ Top of fuel 
312309  pz  76.40000  $ top plane of fuel assembly supercells
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c -----------------------------------------------------------------------------
c -----------------------------------------------------------------------------

c -----------------------------------------------------------------------------
c -------------------------- DATA CARDS ---------------------------------------
c -----------------------------------------------------------------------------
c --Begin Options-- $ for NIST MCNP syntax
c
c
c
c
c ------------------------------
c ---------- Tallies -----------
c ------------------------------
c
c
c -----------------------------------------------------------------------------
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c 
c ------------------------------
c ----- General materials ------
c ------------------------------
c 
c ------- Air -------
c 
c   Air inside rabbit, LS, or CT if beam IR    
c   Assumed to be 75.2290% Nitrogen, 23.1781% Oxygen, 0.0124% Carbon, and 1.2827% Argon (mass percentage) by NIST standard
c
m101   6000.80c -0.000124   7014.80c -0.752290   7015.80c  -0.002977
                            8016.80c -0.231153   8017.80c  -0.000094
                                                 18000.59c -0.012827
c
c
c
c
c ------- Water -------
c
c   Water inside and outside the core, under the control rods, and inside the CT
c   Assumed to be (1/3) Oxygen and (2/3) Hydrogen
c
c
m102   1001.80c 0.6667   8016.80c 0.3333 
c
mt102  lwtr.10t 
c
c
c
c
c ------- 6061-T6 Aluminum ------
c
c   6061-T6 Aluminum alloy used in the core structure (Grid plates, reflector cladding, etc.)
c   Assumed to be 
c   Thanks to Rob Schickler of OSU for providing this m card
c
c
m103    5010.80c 2.3945E-7 12024.80c 5.3511E-4 12025.80c 6.5030E-5 
       12026.80c 6.8851E-5 13027.80c 5.9015E-2 14028.80c 3.2153E-4
       14029.80c 1.5771E-5 14030.80c 1.0062E-5 24050.80c 2.6872E-6
       24052.80c 4.9830E-5 24053.80c 5.5435E-6 24054.80c 1.3544E-6
       29063.80c 5.0017E-5 29065.80c 2.1628E-5
c
mt103  al27.22t
c
c
c
c ------- 1100F Aluminum -------
c
c   1100F Aluminum used in the cladding of graphite elements or old alumunum fuel elements
c   Assumed to be 99.6% aluminum, 0.95% iron, 0.95% silicon, 0.125% copper, 0.05% manganese
c
c
m104   13027.80c 0.996   26054.80c 0.0056  26056.80c 0.0871   
       14028.80c 0.0871  14029.80c 0.004   14030.80c 0.003  
       29063.80c 0.0086  29065.80c 0.0039  25055.80c 0.0005  
c
c
c c ------- Type 304 Stainless steel -------
c c
c c   Type 304 Stainless steel used as fuel element cladding
c c   Assumed to be    
c c   Thanks to Rob Schickler of OSU for providing this m card
c c
c c
c m105   6000.80c 0.00031519 24050.80c 7.8200E-4 24052.80c 1.4501E-2 
c        24053.80c 1.6130E-3 24054.80c 3.9400E-4 26054.80c 3.5540E-3
c        26056.80c 5.5110E-2 26057.80c 1.2570E-3 26058.80c 1.6600E-4
c        28058.80c 5.5580E-3 28060.80c 2.0700E-3 28061.80c 8.8500E-5
c        28062.80c 2.7800E-4 28064.80c 6.8500E-5 
c c
c
c
c ------- Graphite -------
c
c   Graphite used as the material for the reflector blank as well as the fuel element upper and lower spacers
c   Assumed to be pure elemental carbon
c
c
m106    6000.80c 1.0 
c
mt106   grph.10t 
c
c
c
c
c ------- 25% mass b4c and Grapite 5% depleted -------
c
c
c
c
c
m107   5010.80c  0.0035454  5011.80c  0.01427   
       6000.80c  0.0693901                     $ 25% mass b4c and Grapite 5% depleted   
c
c
c
c
c ------- Zirconium -------
c
c
c
c
c
m108   40090.80c 0.5219 40091.80c 0.1125 40092.80c 0.1702 
       40094.80c 0.1688 40096.80c 0.0266
c
c
c
c c ------- Prime polyethylene -------
c c
c c
c c
c c
c c
c m109    1001.80c  0.666590  1002.80c  0.000077  6000.80c 0.333333
c mt109   poly.10t
c c
c
c
c
c
c
c
c
c
c ------------------------------
c ------- Fuel materials -------
c ------------------------------
c
c
c
c
c
c
c
m36741  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02  
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03  
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt36741 h/zr.10t zr/h.10t
c
c
m36742  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt36742 h/zr.10t zr/h.10t
c
c
m36743  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt36743 h/zr.10t zr/h.10t
c
c
m36744  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt36744 h/zr.10t zr/h.10t
c
c
m36745  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt36745 h/zr.10t zr/h.10t
c
c
c
c
c
m81041  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81041 h/zr.10t zr/h.10t
c
c
m81042  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81042 h/zr.10t zr/h.10t
c
c
m81043  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81043 h/zr.10t zr/h.10t
c
c
m81044  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81044 h/zr.10t zr/h.10t
c
c
m81045  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81045 h/zr.10t zr/h.10t
c
c
c
c
c
m87331  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87331 h/zr.10t zr/h.10t
c
c
m87332  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87332 h/zr.10t zr/h.10t
c
c
m87333  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87333 h/zr.10t zr/h.10t
c
c
m87334  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87334 h/zr.10t zr/h.10t
c
c
m87335  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87335 h/zr.10t zr/h.10t
c
c
c
c
c
m41061  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41061 h/zr.10t zr/h.10t
c
c
m41062  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41062 h/zr.10t zr/h.10t
c
c
m41063  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41063 h/zr.10t zr/h.10t
c
c
m41064  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41064 h/zr.10t zr/h.10t
c
c
m41065  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41065 h/zr.10t zr/h.10t
c
c
c
c
c
m41171  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41171 h/zr.10t zr/h.10t
c
c
m41172  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41172 h/zr.10t zr/h.10t
c
c
m41173  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41173 h/zr.10t zr/h.10t
c
c
m41174  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41174 h/zr.10t zr/h.10t
c
c
m41175  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41175 h/zr.10t zr/h.10t
c
c
c
c
c
m36711  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36711 h/zr.10t zr/h.10t
c
c
m36712  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36712 h/zr.10t zr/h.10t
c
c
m36713  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36713 h/zr.10t zr/h.10t
c
c
m36714  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36714 h/zr.10t zr/h.10t
c
c
m36715  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36715 h/zr.10t zr/h.10t
c
c
c
c
c
m87321  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87321 h/zr.10t zr/h.10t
c
c
m87322  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87322 h/zr.10t zr/h.10t
c
c
m87323  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87323 h/zr.10t zr/h.10t
c
c
m87324  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87324 h/zr.10t zr/h.10t
c
c
m87325  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87325 h/zr.10t zr/h.10t
c
c
c
c
c
m81051  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt81051 h/zr.10t zr/h.10t
c
c
m81052  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt81052 h/zr.10t zr/h.10t
c
c
m81053  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt81053 h/zr.10t zr/h.10t
c
c
m81054  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt81054 h/zr.10t zr/h.10t
c
c
m81055  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt81055 h/zr.10t zr/h.10t
c
c
c
c
c
m40621  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40621 h/zr.10t zr/h.10t
c
c
m40622  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40622 h/zr.10t zr/h.10t
c
c
m40623  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40623 h/zr.10t zr/h.10t
c
c
m40624  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40624 h/zr.10t zr/h.10t
c
c
m40625  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40625 h/zr.10t zr/h.10t
c
c
c
c
c
m96781  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96781 h/zr.10t zr/h.10t
c
c
m96782  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96782 h/zr.10t zr/h.10t
c
c
m96783  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96783 h/zr.10t zr/h.10t
c
c
m96784  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96784 h/zr.10t zr/h.10t
c
c
m96785  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96785 h/zr.10t zr/h.10t
c
c
c
c
c
m41031  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41031 h/zr.10t zr/h.10t
c
c
m41032  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41032 h/zr.10t zr/h.10t
c
c
m41033  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41033 h/zr.10t zr/h.10t
c
c
m41034  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41034 h/zr.10t zr/h.10t
c
c
m41035  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41035 h/zr.10t zr/h.10t
c
c
c
c
c
m96791  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96791 h/zr.10t zr/h.10t
c
c
m96792  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96792 h/zr.10t zr/h.10t
c
c
m96793  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96793 h/zr.10t zr/h.10t
c
c
m96794  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96794 h/zr.10t zr/h.10t
c
c
m96795  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt96795 h/zr.10t zr/h.10t
c
c
c
c
c
m87361  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87361 h/zr.10t zr/h.10t
c
c
m87362  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87362 h/zr.10t zr/h.10t
c
c
m87363  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87363 h/zr.10t zr/h.10t
c
c
m87364  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87364 h/zr.10t zr/h.10t
c
c
m87365  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87365 h/zr.10t zr/h.10t
c
c
c
c
c
m87341  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87341 h/zr.10t zr/h.10t
c
c
m87342  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87342 h/zr.10t zr/h.10t
c
c
m87343  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87343 h/zr.10t zr/h.10t
c
c
m87344  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87344 h/zr.10t zr/h.10t
c
c
m87345  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt87345 h/zr.10t zr/h.10t
c
c
c
c
c
m41211  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41211 h/zr.10t zr/h.10t
c
c
m41212  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41212 h/zr.10t zr/h.10t
c
c
m41213  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41213 h/zr.10t zr/h.10t
c
c
m41214  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41214 h/zr.10t zr/h.10t
c
c
m41215  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41215 h/zr.10t zr/h.10t
c
c
c
c
c
m107051  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt107051 h/zr.10t zr/h.10t
c
c
m107052  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt107052 h/zr.10t zr/h.10t
c
c
m107053  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt107053 h/zr.10t zr/h.10t
c
c
m107054  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt107054 h/zr.10t zr/h.10t
c
c
m107055  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt107055 h/zr.10t zr/h.10t
c
c
c
c
c
m36851  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36851 h/zr.10t zr/h.10t
c
c
m36852  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36852 h/zr.10t zr/h.10t
c
c
m36853  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36853 h/zr.10t zr/h.10t
c
c
m36854  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36854 h/zr.10t zr/h.10t
c
c
m36855  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36855 h/zr.10t zr/h.10t
c
c
c
c
c
m40951  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40951 h/zr.10t zr/h.10t
c
c
m40952  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40952 h/zr.10t zr/h.10t
c
c
m40953  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40953 h/zr.10t zr/h.10t
c
c
m40954  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40954 h/zr.10t zr/h.10t
c
c
m40955  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40955 h/zr.10t zr/h.10t
c
c
c
c
c
m40861  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40861 h/zr.10t zr/h.10t
c
c
m40862  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40862 h/zr.10t zr/h.10t
c
c
m40863  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40863 h/zr.10t zr/h.10t
c
c
m40864  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40864 h/zr.10t zr/h.10t
c
c
m40865  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40865 h/zr.10t zr/h.10t
c
c
c
c
c
m72021  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt72021 h/zr.10t zr/h.10t
c
c
m72022  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt72022 h/zr.10t zr/h.10t
c
c
m72023  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt72023 h/zr.10t zr/h.10t
c
c
m72024  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt72024 h/zr.10t zr/h.10t
c
c
m72025  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt72025 h/zr.10t zr/h.10t
c
c
c
c
c
m41141  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41141 h/zr.10t zr/h.10t
c
c
m41142  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41142 h/zr.10t zr/h.10t
c
c
m41143  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41143 h/zr.10t zr/h.10t
c
c
m41144  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41144 h/zr.10t zr/h.10t
c
c
m41145  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41145 h/zr.10t zr/h.10t
c
c
c
c
c
m40771  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40771 h/zr.10t zr/h.10t
c
c
m40772  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40772 h/zr.10t zr/h.10t
c
c
m40773  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40773 h/zr.10t zr/h.10t
c
c
m40774  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40774 h/zr.10t zr/h.10t
c
c
m40775  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40775 h/zr.10t zr/h.10t
c
c
c
c
c
m40701  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40701 h/zr.10t zr/h.10t
c
c
m40702  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40702 h/zr.10t zr/h.10t
c
c
m40703  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40703 h/zr.10t zr/h.10t
c
c
m40704  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40704 h/zr.10t zr/h.10t
c
c
m40705  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt40705 h/zr.10t zr/h.10t
c
c
c
c
c
m41041  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41041 h/zr.10t zr/h.10t
c
c
m41042  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41042 h/zr.10t zr/h.10t
c
c
m41043  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41043 h/zr.10t zr/h.10t
c
c
m41044  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41044 h/zr.10t zr/h.10t
c
c
m41045  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41045 h/zr.10t zr/h.10t
c
c
c
c
c
m36791  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt36791 h/zr.10t zr/h.10t
c
c
m36792  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt36792 h/zr.10t zr/h.10t
c
c
m36793  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt36793 h/zr.10t zr/h.10t
c
c
m36794  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt36794 h/zr.10t zr/h.10t
c
c
m36795  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt36795 h/zr.10t zr/h.10t
c
c
c
c
c
m81021  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81021 h/zr.10t zr/h.10t
c
c
m81022  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81022 h/zr.10t zr/h.10t
c
c
m81023  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81023 h/zr.10t zr/h.10t
c
c
m81024  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81024 h/zr.10t zr/h.10t
c
c
m81025  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81025 h/zr.10t zr/h.10t
c
c
c
c
c
m40541  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40541 h/zr.10t zr/h.10t
c
c
m40542  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40542 h/zr.10t zr/h.10t
c
c
m40543  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40543 h/zr.10t zr/h.10t
c
c
m40544  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40544 h/zr.10t zr/h.10t
c
c
m40545  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40545 h/zr.10t zr/h.10t
c
c
c
c
c
m41221  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41221 h/zr.10t zr/h.10t
c
c
m41222  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41222 h/zr.10t zr/h.10t
c
c
m41223  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41223 h/zr.10t zr/h.10t
c
c
m41224  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41224 h/zr.10t zr/h.10t
c
c
m41225  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41225 h/zr.10t zr/h.10t
c
c
c
c
c
m41181  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41181 h/zr.10t zr/h.10t
c
c
m41182  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41182 h/zr.10t zr/h.10t
c
c
m41183  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41183 h/zr.10t zr/h.10t
c
c
m41184  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41184 h/zr.10t zr/h.10t
c
c
m41185  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41185 h/zr.10t zr/h.10t
c
c
c
c
c
m38721  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38721 h/zr.10t zr/h.10t
c
c
m38722  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38722 h/zr.10t zr/h.10t
c
c
m38723  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38723 h/zr.10t zr/h.10t
c
c
m38724  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38724 h/zr.10t zr/h.10t
c
c
m38725  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38725 h/zr.10t zr/h.10t
c
c
c
c
c
m40831  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40831 h/zr.10t zr/h.10t
c
c
m40832  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40832 h/zr.10t zr/h.10t
c
c
m40833  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40833 h/zr.10t zr/h.10t
c
c
m40834  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40834 h/zr.10t zr/h.10t
c
c
m40835  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40835 h/zr.10t zr/h.10t
c
c
c
c
c
m79461  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79461 h/zr.10t zr/h.10t
c
c
m79462  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79462 h/zr.10t zr/h.10t
c
c
m79463  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79463 h/zr.10t zr/h.10t
c
c
m79464  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79464 h/zr.10t zr/h.10t
c
c
m79465  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79465 h/zr.10t zr/h.10t
c
c
c
c
c
m38531  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38531 h/zr.10t zr/h.10t
c
c
m38532  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38532 h/zr.10t zr/h.10t
c
c
m38533  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38533 h/zr.10t zr/h.10t
c
c
m38534  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38534 h/zr.10t zr/h.10t
c
c
m38535  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38535 h/zr.10t zr/h.10t
c
c
c
c
c
m38561  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38561 h/zr.10t zr/h.10t
c
c
m38562  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38562 h/zr.10t zr/h.10t
c
c
m38563  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38563 h/zr.10t zr/h.10t
c
c
m38564  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38564 h/zr.10t zr/h.10t
c
c
m38565  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt38565 h/zr.10t zr/h.10t
c
c
c
c
c
m41341  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41341 h/zr.10t zr/h.10t
c
c
m41342  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41342 h/zr.10t zr/h.10t
c
c
m41343  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41343 h/zr.10t zr/h.10t
c
c
m41344  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41344 h/zr.10t zr/h.10t
c
c
m41345  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41345 h/zr.10t zr/h.10t
c
c
c
c
c
m41331  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41331 h/zr.10t zr/h.10t
c
c
m41332  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41332 h/zr.10t zr/h.10t
c
c
m41333  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41333 h/zr.10t zr/h.10t
c
c
m41334  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41334 h/zr.10t zr/h.10t
c
c
m41335  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41335 h/zr.10t zr/h.10t
c
c
c
c
c
m40851  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40851 h/zr.10t zr/h.10t
c
c
m40852  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40852 h/zr.10t zr/h.10t
c
c
m40853  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40853 h/zr.10t zr/h.10t
c
c
m40854  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40854 h/zr.10t zr/h.10t
c
c
m40855  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40855 h/zr.10t zr/h.10t
c
c
c
c
c
m41101  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41101 h/zr.10t zr/h.10t
c
c
m41102  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41102 h/zr.10t zr/h.10t
c
c
m41103  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41103 h/zr.10t zr/h.10t
c
c
m41104  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41104 h/zr.10t zr/h.10t
c
c
m41105  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41105 h/zr.10t zr/h.10t
c
c
c
c
c
m36771  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36771 h/zr.10t zr/h.10t
c
c
m36772  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36772 h/zr.10t zr/h.10t
c
c
m36773  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36773 h/zr.10t zr/h.10t
c
c
m36774  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36774 h/zr.10t zr/h.10t
c
c
m36775  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt36775 h/zr.10t zr/h.10t
c
c
c
c
c
m41311  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41311 h/zr.10t zr/h.10t
c
c
m41312  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41312 h/zr.10t zr/h.10t
c
c
m41313  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41313 h/zr.10t zr/h.10t
c
c
m41314  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41314 h/zr.10t zr/h.10t
c
c
m41315  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt41315 h/zr.10t zr/h.10t
c
c
c
c
c
m40651  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt40651 h/zr.10t zr/h.10t
c
c
m40652  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt40652 h/zr.10t zr/h.10t
c
c
m40653  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt40653 h/zr.10t zr/h.10t
c
c
m40654  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt40654 h/zr.10t zr/h.10t
c
c
m40655  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt40655 h/zr.10t zr/h.10t
c
c
c
c
c
m38511  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt38511 h/zr.10t zr/h.10t
c
c
m38512  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt38512 h/zr.10t zr/h.10t
c
c
m38513  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt38513 h/zr.10t zr/h.10t
c
c
m38514  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt38514 h/zr.10t zr/h.10t
c
c
m38515  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt38515 h/zr.10t zr/h.10t
c
c
c
c
c
m40551  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40551 h/zr.10t zr/h.10t
c
c
m40552  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40552 h/zr.10t zr/h.10t
c
c
m40553  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40553 h/zr.10t zr/h.10t
c
c
m40554  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40554 h/zr.10t zr/h.10t
c
c
m40555  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40555 h/zr.10t zr/h.10t
c
c
c
c
c
m38621  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38621 h/zr.10t zr/h.10t
c
c
m38622  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38622 h/zr.10t zr/h.10t
c
c
m38623  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38623 h/zr.10t zr/h.10t
c
c
m38624  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38624 h/zr.10t zr/h.10t
c
c
m38625  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38625 h/zr.10t zr/h.10t
c
c
c
c
c
m40641  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40641 h/zr.10t zr/h.10t
c
c
m40642  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40642 h/zr.10t zr/h.10t
c
c
m40643  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40643 h/zr.10t zr/h.10t
c
c
m40644  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40644 h/zr.10t zr/h.10t
c
c
m40645  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40645 h/zr.10t zr/h.10t
c
c
c
c
c
m38581  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38581 h/zr.10t zr/h.10t
c
c
m38582  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38582 h/zr.10t zr/h.10t
c
c
m38583  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38583 h/zr.10t zr/h.10t
c
c
m38584  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38584 h/zr.10t zr/h.10t
c
c
m38585  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38585 h/zr.10t zr/h.10t
c
c
c
c
c
m40531  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40531 h/zr.10t zr/h.10t
c
c
m40532  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40532 h/zr.10t zr/h.10t
c
c
m40533  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40533 h/zr.10t zr/h.10t
c
c
m40534  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40534 h/zr.10t zr/h.10t
c
c
m40535  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40535 h/zr.10t zr/h.10t
c
c
c
c
c
m87351  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87351 h/zr.10t zr/h.10t
c
c
m87352  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87352 h/zr.10t zr/h.10t
c
c
m87353  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87353 h/zr.10t zr/h.10t
c
c
m87354  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87354 h/zr.10t zr/h.10t
c
c
m87355  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt87355 h/zr.10t zr/h.10t
c
c
c
c
c
m37481  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt37481 h/zr.10t zr/h.10t
c
c
m37482  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt37482 h/zr.10t zr/h.10t
c
c
m37483  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt37483 h/zr.10t zr/h.10t
c
c
m37484  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt37484 h/zr.10t zr/h.10t
c
c
m37485  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt37485 h/zr.10t zr/h.10t
c
c
c
c
c
m79451  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79451 h/zr.10t zr/h.10t
c
c
m79452  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79452 h/zr.10t zr/h.10t
c
c
m79453  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79453 h/zr.10t zr/h.10t
c
c
m79454  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79454 h/zr.10t zr/h.10t
c
c
m79455  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt79455 h/zr.10t zr/h.10t
c
c
c
c
c
m38661  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38661 h/zr.10t zr/h.10t
c
c
m38662  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38662 h/zr.10t zr/h.10t
c
c
m38663  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38663 h/zr.10t zr/h.10t
c
c
m38664  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38664 h/zr.10t zr/h.10t
c
c
m38665  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38665 h/zr.10t zr/h.10t
c
c
c
c
c
m38521  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38521 h/zr.10t zr/h.10t
c
c
m38522  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38522 h/zr.10t zr/h.10t
c
c
m38523  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38523 h/zr.10t zr/h.10t
c
c
m38524  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38524 h/zr.10t zr/h.10t
c
c
m38525  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38525 h/zr.10t zr/h.10t
c
c
c
c
c
m40711  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40711 h/zr.10t zr/h.10t
c
c
m40712  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40712 h/zr.10t zr/h.10t
c
c
m40713  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40713 h/zr.10t zr/h.10t
c
c
m40714  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40714 h/zr.10t zr/h.10t
c
c
m40715  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40715 h/zr.10t zr/h.10t
c
c
c
c
c
m40941  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40941 h/zr.10t zr/h.10t
c
c
m40942  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40942 h/zr.10t zr/h.10t
c
c
m40943  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40943 h/zr.10t zr/h.10t
c
c
m40944  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40944 h/zr.10t zr/h.10t
c
c
m40945  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt40945 h/zr.10t zr/h.10t
c
c
c
c
c
m41291  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41291 h/zr.10t zr/h.10t
c
c
m41292  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41292 h/zr.10t zr/h.10t
c
c
m41293  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41293 h/zr.10t zr/h.10t
c
c
m41294  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41294 h/zr.10t zr/h.10t
c
c
m41295  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt41295 h/zr.10t zr/h.10t
c
c
c
c
c
m38741  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38741 h/zr.10t zr/h.10t
c
c
m38742  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38742 h/zr.10t zr/h.10t
c
c
m38743  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38743 h/zr.10t zr/h.10t
c
c
m38744  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38744 h/zr.10t zr/h.10t
c
c
m38745  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt38745 h/zr.10t zr/h.10t
c
c
c
c
c
m81031  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81031 h/zr.10t zr/h.10t
c
c
m81032  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81032 h/zr.10t zr/h.10t
c
c
m81033  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81033 h/zr.10t zr/h.10t
c
c
m81034  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81034 h/zr.10t zr/h.10t
c
c
m81035  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt81035 h/zr.10t zr/h.10t
c
c
c
c
c
c
c --- F ring ---
c
c --- F1 - 4057 ---
c 
m40571  92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40571 h/zr.10t zr/h.10t
c
c
m40572  92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40572 h/zr.10t zr/h.10t
c
c
m40573  92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40573 h/zr.10t zr/h.10t
c
c
m40574  92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40574 h/zr.10t zr/h.10t
c
c
m40575  92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40575 h/zr.10t zr/h.10t
c
c
c
c --- F2 - 4125 ---
c 
m41251  92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41251 h/zr.10t zr/h.10t
c
c
m41252   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41252  h/zr.10t zr/h.10t
c
c
m41253   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41253  h/zr.10t zr/h.10t
c
c
m41254   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41254  h/zr.10t zr/h.10t
c
c
m41255   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41255  h/zr.10t zr/h.10t
c
c
c
c --- F3 - 4074 ---
c 
m40741   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
         40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
         40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40741  h/zr.10t zr/h.10t
c
c
m40742   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40742  h/zr.10t zr/h.10t
c
c
m40743   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40743  h/zr.10t zr/h.10t
c
c
m40744   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40744  h/zr.10t zr/h.10t
c
c
m40745   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40745  h/zr.10t zr/h.10t
c
c
c
c --- F4 - 4069 ---
c 
m40691   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40691  h/zr.10t zr/h.10t
c
c
m40692   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40692  h/zr.10t zr/h.10t
c
c
m40693   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40693  h/zr.10t zr/h.10t
c
c
m40694   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40694  h/zr.10t zr/h.10t
c
c
m40695   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40695  h/zr.10t zr/h.10t
c
c
c
c --- F5 - 4088 ---
c 
m40881   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40881  h/zr.10t zr/h.10t
c
c
m40882   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40882  h/zr.10t zr/h.10t
c
c
m40883   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40883  h/zr.10t zr/h.10t
c
c
m40884   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40884  h/zr.10t zr/h.10t
c
c
m40885   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40885  h/zr.10t zr/h.10t
c
c
c
c --- F7 - 3868 ---
c 
m38681   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38681  h/zr.10t zr/h.10t
c
c
m38682   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38682  h/zr.10t zr/h.10t
c
c
m38683   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38683  h/zr.10t zr/h.10t
c
c
m38684   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38684  h/zr.10t zr/h.10t
c
c
m38685   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38685  h/zr.10t zr/h.10t
c
c
c
c --- F8 - 4120 ---
c 
m41201   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41201  h/zr.10t zr/h.10t
c
c
m41202   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41202  h/zr.10t zr/h.10t
c
c
m41203   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41203  h/zr.10t zr/h.10t
c
c
m41204   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41204  h/zr.10t zr/h.10t
c
c
m41205   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41205  h/zr.10t zr/h.10t
c
c
c
c --- F14 - 3810 ---
c 
m38101   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38101  h/zr.10t zr/h.10t
c
c
m38102   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38102  h/zr.10t zr/h.10t
c
c
m38103   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38103  h/zr.10t zr/h.10t
c
c
m38104   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38104  h/zr.10t zr/h.10t
c
c
m38105   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38105  h/zr.10t zr/h.10t
c
c
c
c --- F15 - 4130 ---
c 
m41301   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41301  h/zr.10t zr/h.10t
c
c
m41302   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41302  h/zr.10t zr/h.10t
c
c
m41303   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41303  h/zr.10t zr/h.10t
c
c
m41304   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41304  h/zr.10t zr/h.10t
c
c
m41305   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41305  h/zr.10t zr/h.10t
c
c
c
c --- F16 - 4091 ---
c 
m40911   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40911  h/zr.10t zr/h.10t
c
c
m40912   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40912  h/zr.10t zr/h.10t
c
c
m40913   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40913  h/zr.10t zr/h.10t
c
c
m40914   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40914  h/zr.10t zr/h.10t
c
c
m40915   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40915  h/zr.10t zr/h.10t
c
c
c
c --- F17 - 3673 ---
c 
m36731   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36731  h/zr.10t zr/h.10t
c
c
m36732   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36732  h/zr.10t zr/h.10t
c
c
m36733   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36733  h/zr.10t zr/h.10t
c
c
m36734   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36734  h/zr.10t zr/h.10t
c
c
m36735   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36735  h/zr.10t zr/h.10t
c
c
c
c --- F18 - 3682 ---
c 
m36821   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36821  h/zr.10t zr/h.10t
c
c
m36822   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36822  h/zr.10t zr/h.10t
c
c
m36823   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36823  h/zr.10t zr/h.10t
c
c
m36824   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36824  h/zr.10t zr/h.10t
c
c
m36825   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36825  h/zr.10t zr/h.10t
c
c
c
c --- F19 - 4132 ---
c 
m41321   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41321  h/zr.10t zr/h.10t
c
c
m41322   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41322  h/zr.10t zr/h.10t
c
c
m41323   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41323  h/zr.10t zr/h.10t
c
c
m41324   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41324  h/zr.10t zr/h.10t
c
c
m41325   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41325  h/zr.10t zr/h.10t
c
c
c
c --- F20 - 4046 ---
c 
m40461   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40461  h/zr.10t zr/h.10t
c
c
m40462   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40462  h/zr.10t zr/h.10t
c
c
m40463   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40463  h/zr.10t zr/h.10t
c
c
m40464   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40464  h/zr.10t zr/h.10t
c
c
m40465   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40465  h/zr.10t zr/h.10t
c
c
c
c --- F21 - 3865 ---
c 
m38651   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38651  h/zr.10t zr/h.10t
c
c
m38652   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38652  h/zr.10t zr/h.10t
c
c
m38653   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38653  h/zr.10t zr/h.10t
c
c
m38654   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38654  h/zr.10t zr/h.10t
c
c
m38655   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38655  h/zr.10t zr/h.10t
c
c
c
c --- F22 - 3743 ---
c 
m37431   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt37431  h/zr.10t zr/h.10t
c
c
m37432   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt37432  h/zr.10t zr/h.10t
c
c
m37433   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt37433  h/zr.10t zr/h.10t
c
c
m37434   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt37434  h/zr.10t zr/h.10t
c
c
m37435   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt37435  h/zr.10t zr/h.10t
c
c
c
c --- F24 - 3835 ---
c 
m38351   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38351  h/zr.10t zr/h.10t
c
c
m38352   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38352  h/zr.10t zr/h.10t
c
c
m38353   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38353  h/zr.10t zr/h.10t
c
c
m38354   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38354  h/zr.10t zr/h.10t
c
c
m38355   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38355  h/zr.10t zr/h.10t
c
c
c
c --- F26 - 3676 ---
c 
m36761   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36761  h/zr.10t zr/h.10t
c
c
m36762   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36762  h/zr.10t zr/h.10t
c
c
m36763   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36763  h/zr.10t zr/h.10t
c
c
m36764   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36764  h/zr.10t zr/h.10t
c
c
m36765   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt36765  h/zr.10t zr/h.10t
c
c
c
c --- F27 - 3840 ---
c 
m38401   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38401  h/zr.10t zr/h.10t
c
c
m38402   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38402  h/zr.10t zr/h.10t
c
c
m38403   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38403  h/zr.10t zr/h.10t
c
c
m38404   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38404  h/zr.10t zr/h.10t
c
c
m38405   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38405  h/zr.10t zr/h.10t
c
c
c
c --- F28 - 3854 ---
c 
m38541   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38541  h/zr.10t zr/h.10t
c
c
m38542   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38542  h/zr.10t zr/h.10t
c
c
m38543   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38543  h/zr.10t zr/h.10t
c
c
m38544   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38544  h/zr.10t zr/h.10t
c
c
m38545   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt38545  h/zr.10t zr/h.10t
c
c
c
c --- F29 - 4049 ---
c 
m40491   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40491  h/zr.10t zr/h.10t
c
c
m40492   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40492  h/zr.10t zr/h.10t
c
c
m40493   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40493  h/zr.10t zr/h.10t
c
c
m40494   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40494  h/zr.10t zr/h.10t
c
c
m40495   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt40495  h/zr.10t zr/h.10t
c
c
c
c --- F30 - 4127 ---
c 
m41271   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41271  h/zr.10t zr/h.10t
c
c
m41272   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41272  h/zr.10t zr/h.10t
c
c
m41273   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41273  h/zr.10t zr/h.10t
c
c
m41274   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41274  h/zr.10t zr/h.10t
c
c
m41275   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt41275  h/zr.10t zr/h.10t
c
c
c
c
c
c --- Fuel storage - cards commented out bc FE is no longer in core ---
c
c FE 277 originally in F16 in 2017, no longer in core as of 2020, fuel data now used as F ring FE burnup
c 
c m2771   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
c         40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
c         40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
c mt2771  h/zr.10t zr/h.10t
c
c
c m2772   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
c         40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
c         40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
c mt2772  h/zr.10t zr/h.10t
c
c
c m2773   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
c         40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
c         40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
c mt2773  h/zr.10t zr/h.10t
c
c
c m2774   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
c         40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
c         40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
c mt2774  h/zr.10t zr/h.10t
c
c
c m2775   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
c         40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
c         40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
c mt2775  h/zr.10t zr/h.10t
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c ------------------------------
c ----- Source definitions -----
c ------------------------------
c
c
ksrc       4.9828    2.87700   34.29 
          4.98280   -1.17690   34.29 
         -4.98280   -2.87700   34.29 
         -4.98280    1.17690   24.29
          4.84040    8.38360   34.29 
          8.38360    4.84040   34.29 
          9.68070    0.00000   34.29 
          8.38360   -3.14030   34.29 
          4.84040   -5.43910   44.29
         -4.84040   -8.38360   34.29 
         -8.38360   -4.84040   34.29 
         -9.68070    0.00000   34.29 
         -8.38350    3.14030   24.29
         -4.84030    5.43910   34.29 
          4.66670    12.8228   34.29 
          8.77150    10.4526   34.29 
          11.8171    6.82280   34.29 
          13.4382    2.36880   24.29
          13.4382   -1.77860   34.29 
          11.8171   -5.12280   34.29 
          8.77150   -7.84820   34.29 
          4.66670   -9.62780   34.29 
         -4.66670   -12.8228   24.29
         -8.77150   -10.4526   44.29
         -11.8171   -6.82280   34.29 
         -13.4382   -2.36880   34.29 
         -13.4382    1.77860   34.29 
         -11.8171    5.12280   34.29 
         -8.77150    7.84820   34.29 
         -4.66670    9.62780   34.29 
          4.55890    17.0149   34.29 
          8.80780    15.2550   34.29 
          12.4561    12.4561   34.29 
          15.3489    8.80360   44.29
          17.0149    4.55890   24.29
          17.6156    0.00000   24.29
          17.0149   -3.67890   44.29
          15.3489   -7.11200   34.29 
          12.4561   -10.0519   34.29 
          8.80780   -12.3106   34.29 
          4.55890   -13.7307   34.29 
         -4.55890   -17.0149   34.29 
         -8.80780   -15.2550   34.29 
         -12.4561   -12.4561   44.29
         -15.3489   -8.80360   24.29
         -17.0149   -4.55890   34.29 
         -17.6156    0.00000   34.29 
         -17.0149    3.67890   34.29 
         -15.3489    7.11200   34.29 
         -12.4561    10.0519   34.29 
         -8.80780    12.3106   34.29 
         -4.55890    13.7307   34.29 
          4.48830    21.1154   44.29
          8.78040    19.7108   34.29 
          12.6896    17.4649   34.29 
          16.0423    14.4448   34.29 
          18.6955    10.7941   34.29 
          20.5324    6.67080   34.29 
          21.4680    2.24760   34.29 
          21.4680   -1.89360   44.29
          20.5324   -5.62020   34.29 
          18.6955   -9.09410   34.29 
          16.0423   -12.1698   24.29
          12.6896   -14.7143   34.29 
          8.78010   -16.6148   34.29 
          4.48830   -17.7897   34.29 
         -4.48830   -21.1154   24.29
         -8.78010   -19.7209   34.29 
         -12.6896   -17.4649   34.29 
         -16.0423   -14.4448   24.29
         -18.6955   -10.7941   34.29 
         -20.5324   -6.67080   24.29
         -21.4680   -2.24760   24.29
         -21.4680    1.89360   34.29 
         -20.5324    5.62020   34.29 
         -18.6955    9.09410   34.29 
         -16.0423    12.1698   34.29 
         -12.6896    14.7143   44.29
         -8.78010    16.6148   34.29 
         -4.48830    17.7897   34.29 
          3.77033    2.17693   34.29 
          3.77033   -1.87691   34.29 
          0.00000   -4.05384   24.29
         -3.77033   -2.17693   34.29 
         -3.77033    1.87691   34.29 
          0.00000    7.98068   34.29 
          4.14034    7.17115   34.29 
          7.17115    4.14034   34.29 
          8.28068    0.00000   34.29 
          4.14034   -6.65153   34.29 
          0.00000   -7.98068   34.29 
         -4.14034    -7.1711   34.29 
         -8.28068    0.00000   34.29 
         -7.17111    3.84030   34.29 
         -4.14030    6.65149   34.29 
          0.00000    11.9456   34.29 
          4.18790    11.5072   34.29 
          7.87155    9.38021   34.29 
          10.6047    6.12280   34.29 
          12.0594    2.12578   34.29 
          12.0594   -2.02162   44.29
          10.6047   -5.82280   24.29
          7.87155   -8.92059   34.29 
          4.18790   -10.9433   34.29 
          0.00000   -11.9456   34.29 
         -4.18790   -11.5072   34.29 
         -7.87155   -9.38021   34.29 
         -10.6047   -6.12280   34.29 
         -12.0594   -2.12578   34.29 
         -12.0594    2.02162   34.29 
         -10.6047    5.82280   34.29 
         -7.87155    8.92059   24.29
         -4.18790    10.9433   34.29 
          4.19654    15.6625   34.29 
          8.10780    14.0426   44.29
          11.4661    11.4661   34.29 
          14.1344    8.10706   34.29 
          15.6625    4.19654   34.29 
          16.2156    0.00000   34.29 
          15.6625   -4.04126   34.29 
          14.1344   -7.80854   34.29 
          11.4661   -11.0418   34.29 
          8.10780   -13.5229   34.29 
          4.19654   -15.0830   34.29 
          0.00000   -15.9156   44.29
         -4.19654   -15.6625   34.29 
         -8.10780   -14.0426   34.29 
         -11.4661   -11.4661   34.29 
         -14.1344   -8.10706   34.29 
         -15.6625   -4.19654   34.29 
         -16.2156    0.00000   34.29 
         -15.6625    4.04126   34.29 
         -14.1344    7.80854   24.29
         -11.4661    11.0418   34.29 
         -8.10780    13.5229   34.29 
         -4.19654    15.0830   34.29 
          0.00000    19.8882   34.29 
          4.19724    19.7460   34.29 
          8.21070    18.4319   34.29 
          11.8666    16.3323   34.29 
          15.0019    13.5080   44.29
          17.4830    10.0941   34.29 
          19.2009    6.23823   34.29 
          20.0755    2.10185   34.29 
          19.2009   -6.05283   34.29 
          17.4830   -9.79410   34.29 
          15.0019   -13.1065   34.29 
          11.8666   -15.8469   34.29 
          8.21065   -17.8937   44.29
          4.19724   -19.1591   34.29 
          0.00000   -19.8882   34.29 
         -4.19724   -19.7460   34.29 
         -8.21065   -18.4419   34.29 
         -11.8666   -16.3323   34.29 
         -15.0019   -13.5080   34.29 
         -17.4830   -10.0941   34.29 
         -19.2009   -6.23823   34.29 
         -20.0755    2.03937   34.29 
         -17.4830    9.79410   34.29 
         -15.0019    13.1065   34.29 
         -11.8666    15.8469   24.29
         -8.21065    17.8937   44.29
         -4.19724    19.1591   34.29 
c
c
c
c
c
mode n                                                  $ neutrons! 
c
kcode    10000 1.0 10 110 $ kcode card
c
esplt:n  2 0.1 2 0.001 2 0.0001 2 0.000001 0.75 5e-7    $ split energy
c
c
c
c
c
