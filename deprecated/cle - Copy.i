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
c ------ fill = empty: 2, graphite: 80, element replacement container (e.g. installed source): ??, fuel element: SN ------
c
c B ring
201 0 10 -11 -20 trcl=(0.00000  4.05384 0)      imp:n=1 fill=5488 $  
202 0 10 -11 -20 trcl=(3.51053  2.02692 0)      imp:n=1 fill=5478 $  
203 0 10 -11 -20 trcl=(3.51053 -2.02692 0)      imp:n=1 fill=5480 $  
204 0 10 -11 -20 trcl=( 0.00000 -4.05384 0)     imp:n=1 fill=5504 $  
205 0 10 -11 -20 trcl=(-3.51053 -2.02692 0)     imp:n=1 fill=5525 $  
206 0 10 -11 -20 trcl=(-3.51053  2.02692 0)     imp:n=1 fill=4968 $  
c
c C ring
301 0 10 -11 -20 trcl=( 0.00000  7.98068 0)     imp:n=1 fill=5487 $  
302 0 10 -11 -20 trcl=( 3.99034  6.91134 0)     imp:n=1 fill=5491 $  
303 0 10 -11 -20 trcl=( 6.91134  3.99034 0)     imp:n=1 fill=5496 $  
304 0 10 -11 -20 trcl=( 7.98068  0.00000 0)     imp:n=1 fill=5507 $  
306 0 10 -11 -20 trcl=( 3.99034 -6.91134 0)     imp:n=1 fill=5533 $  
307 0 10 -11 -20 trcl=( 0.00000 -7.98068 0)     imp:n=1 fill=5473 $  
308 0 10 -11 -20 trcl=(-3.99034 -6.91134 0)     imp:n=1 fill=5476 $  
310 0 10 -11 -20 trcl=(-7.98068  0.00000 0)     imp:n=1 fill=5481 $  
311 0 10 -11 -20 trcl=(-6.91130  3.99030 0)     imp:n=1 fill=5523 $  
312 0 10 -11 -20 trcl=(-3.99030  6.91130 0)     imp:n=1 fill=5484 $  
c
c D ring
401 0 10 -11 -20 trcl=( 0.00000  11.9456 0)     imp:n=1 fill=5495 $  
402 0 10 -11 -20 trcl=( 4.08530  11.2253 0)     imp:n=1 fill=5475 $  
403 0 10 -11 -20 trcl=( 7.67870  9.15040 0)     imp:n=1 fill=5479 $  
404 0 10 -11 -20 trcl=( 10.3449  5.97280 0)     imp:n=1 fill=5482 $  
405 0 10 -11 -20 trcl=( 11.7640  2.07370 0)     imp:n=1 fill=5485 $  
406 0 10 -11 -20 trcl=( 11.7640 -2.07370 0)     imp:n=1 fill=5486 $  
407 0 10 -11 -20 trcl=( 10.3449 -5.97280 0)     imp:n=1 fill=5492 $  
408 0 10 -11 -20 trcl=( 7.67870 -9.15040 0)     imp:n=1 fill=5497 $  
409 0 10 -11 -20 trcl=( 4.08530 -11.2253 0)     imp:n=1 fill=5500 $  
410 0 10 -11 -20 trcl=( 0.00000 -11.9456 0)     imp:n=1 fill=5514 $  
411 0 10 -11 -20 trcl=(-4.08530 -11.2253 0)     imp:n=1 fill=5515 $  
412 0 10 -11 -20 trcl=(-7.67870 -9.15040 0)     imp:n=1 fill=5516 $  
413 0 10 -11 -20 trcl=(-10.3449 -5.97280 0)     imp:n=1 fill=5517 $  
414 0 10 -11 -20 trcl=(-11.7640 -2.07370 0)     imp:n=1 fill=5526 $  
415 0 10 -11 -20 trcl=(-11.7640  2.07370 0)     imp:n=1 fill=4970 $  
416 0 10 -11 -20 trcl=(-10.3449  5.97280 0)     imp:n=1 fill=5529 $  
417 0 10 -11 -20 trcl=(-7.67870  9.15040 0)     imp:n=1 fill=5530 $  
418 0 10 -11 -20 trcl=(-4.08530  11.2253 0)     imp:n=1 fill=5531 $  
c
c E ring
502 0 10 -11 -20 trcl=( 4.1189000  15.372800 0) imp:n=1 fill=5501 $  
503 0 10 -11 -20 trcl=( 7.9578000  13.782800 0) imp:n=1 fill=5472 $  
504 0 10 -11 -20 trcl=( 11.254000  11.254000 0) imp:n=1 fill=5474 $  
505 0 10 -11 -20 trcl=( 13.874200  7.9578000 0) imp:n=1 fill=5477 $  
506 0 10 -11 -20 trcl=( 15.372800  4.1189000 0) imp:n=1 fill=5483 $  
507 0 10 -11 -20 trcl=( 15.915600  0.0000000 0) imp:n=1 fill=5489 $  
508 0 10 -11 -20 trcl=( 15.372800 -4.1189000 0) imp:n=1 fill=5490 $  
509 0 10 -11 -20 trcl=( 13.874200 -7.9578000 0) imp:n=1 fill=1471 $  
510 0 10 -11 -20 trcl=( 11.254000 -11.254000 0) imp:n=1 fill=5528 $  
511 0 10 -11 -20 trcl=( 7.9578000 -13.782800 0) imp:n=1 fill=5498 $  
512 0 10 -11 -20 trcl=( 4.1189000 -15.372800 0) imp:n=1 fill=5503 $  
513 0 10 -11 -20 trcl=( 0.0000000 -15.915600 0) imp:n=1 fill=5506 $  
514 0 10 -11 -20 trcl=(-4.1189000 -15.372800 0) imp:n=1 fill=5509 $  
515 0 10 -11 -20 trcl=(-7.9578000 -13.782800 0) imp:n=1 fill=5510 $  
516 0 10 -11 -20 trcl=(-11.254000 -11.254000 0) imp:n=1 fill=5511 $  
517 0 10 -11 -20 trcl=(-13.874200 -7.9578000 0) imp:n=1 fill=5513 $  
518 0 10 -11 -20 trcl=(-15.372800 -4.1189000 0) imp:n=1 fill=5518 $  
519 0 10 -11 -20 trcl=(-15.915600  0.0000000 0) imp:n=1 fill=5519 $  
520 0 10 -11 -20 trcl=(-15.372800  4.1189000 0) imp:n=1 fill=5520 $  
521 0 10 -11 -20 trcl=(-13.874200  7.9578000 0) imp:n=1 fill=5521 $  
522 0 10 -11 -20 trcl=(-11.254000  11.254000 0) imp:n=1 fill=5522 $  
523 0 10 -11 -20 trcl=(-7.9578000  13.782800 0) imp:n=1 fill=5524 $  
524 0 10 -11 -20 trcl=(-4.1189000  15.372800 0) imp:n=1 fill=5527 $  
c
c F ring
601 0 10 -11 -20 trcl=( 0.0000000  19.888200 0) imp:n=1 fill=80 $  
602 0 10 -11 -20 trcl=( 4.1348660  19.452590 0) imp:n=1 fill=80 $  
603 0 10 -11 -20 trcl=( 8.0886300  18.157860 0) imp:n=1 fill=80 $  
604 0 10 -11 -20 trcl=( 11.690350  16.089630 0) imp:n=1 fill=80 $  
605 0 10 -11 -20 trcl=( 14.778990  13.307314 0) imp:n=1 fill=80 $  
606 0 10 -11 -20 trcl=( 17.223232  9.9441000 0) imp:n=1 fill=80 $  
607 0 10 -11 -20 trcl=( 18.915634  6.1455300 0) imp:n=1 fill=80 $  
608 0 10 -11 -20 trcl=( 19.777202  2.0706080 0) imp:n=1 fill=80 $  
610 0 10 -11 -20 trcl=( 18.915634 -6.1455300 0) imp:n=1 fill=80 $  
611 0 10 -11 -20 trcl=( 17.223232 -9.9441000 0) imp:n=1 fill=80 $  
612 0 10 -11 -20 trcl=( 14.778990 -13.307314 0) imp:n=1 fill=80 $  
613 0 10 -11 -20 trcl=( 11.690350 -16.089630 0) imp:n=1 fill=80 $  
614 0 10 -11 -20 trcl=( 8.0886300 -18.167858 0) imp:n=1 fill=80 $  
615 0 10 -11 -20 trcl=( 4.1348660 -19.452590 0) imp:n=1 fill=80 $  
616 0 10 -11 -20 trcl=( 0.0000000 -19.888200 0) imp:n=1 fill=277 $  
617 0 10 -11 -20 trcl=(-4.1348660 -19.452590 0) imp:n=1 fill=80 $  
618 0 10 -11 -20 trcl=(-8.0886300 -18.167858 0) imp:n=1 fill=80 $  
619 0 10 -11 -20 trcl=(-11.690350 -16.089630 0) imp:n=1 fill=80 $  
620 0 10 -11 -20 trcl=(-14.778990 -13.307314 0) imp:n=1 fill=80 $  
621 0 10 -11 -20 trcl=(-17.223232 -9.9441000 0) imp:n=1 fill=80 $  
622 0 10 -11 -20 trcl=(-18.915634 -6.1455300 0) imp:n=1 fill=80 $  
623 0 10 -11 -20 trcl=(-19.777202 -2.0706080 0) imp:n=1 fill=80 $  
624 0 10 -11 -20 trcl=(-19.777202  2.0706080 0) imp:n=1 fill=80 $  
625 0 10 -11 -20 trcl=(-18.915634  6.1455300 0) imp:n=1 fill=80 $  
626 0 10 -11 -20 trcl=(-17.223232  9.9441000 0) imp:n=1 fill=80 $  
627 0 10 -11 -20 trcl=(-14.778990  13.307314 0) imp:n=1 fill=80 $  
628 0 10 -11 -20 trcl=(-11.690350  16.089630 0) imp:n=1 fill=80 $  
629 0 10 -11 -20 trcl=(-8.0886300  18.167858 0) imp:n=1 fill=80 $  
630 0 10 -11 -20 trcl=(-4.1348660  19.452590 0) imp:n=1 fill=80 $  
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
c
c
c
c
c
c
c --- 277 - Al (TOS210D130) universe ---
c
27701  104  -2.70     312300 -312301 -311302          imp:n=1 u=277  $ Lower grid plate pin
27702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=277  $ Water around grid plate pin 
27703  104  -2.70     312301 -312302 -311305          imp:n=1 u=277  $ Bottom casing 
27704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=277  $ Water around fuel element
27705  106  -1.56     312302 -312303 -311304          imp:n=1 u=277  $ Lower graphite slug 
27706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=277  $ Fuel cladding
27707  108   0.042234 312303 -312304 -311301          imp:n=1 u=277  $ Zirc pin 
27708 2771 -5.66    312303 -302303  311301 -311304  vol=77.096 imp:n=1 u=277  $ Fuel meat section 1
27709 2772 -5.66    302303 -302306  311301 -311304  vol=77.096 imp:n=1 u=277  $ Fuel meat section 2
27710 2773 -5.66    302306 -302309  311301 -311304  vol=77.096 imp:n=1 u=277  $ Fuel meat section 3
27711 2774 -5.66    302309 -302312  311301 -311304  vol=77.096 imp:n=1 u=277  $ Fuel meat section 4
27712 2775 -5.66    302312 -312304  311301 -311304  vol=77.096 imp:n=1 u=277  $ Fuel meat section 5
27713  106  -1.56     312304 -312305 -311304          imp:n=1 u=277  $ Upper graphite spacer
27714  104  -2.70     312305 -312306 -311305          imp:n=1 u=277  $ Al top cap 
27715  104  -2.70     312306 -312307 -311303          imp:n=1 u=277  $ Tri-flute 
27716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=277  $ Water around tri-flute 
27717  104  -2.70     312307 -312308 -311302          imp:n=1 u=277  $ Fuel tip
27718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=277  $ Water around fuel tip
27719  102  -1.00     312308 -312309 -311306          imp:n=1 u=277  $ Water above fuel element
c
c
c
c --- 1471 - Al (TOS210D130) universe ---
c
147101  104  -2.70     312300 -312301 -311302          imp:n=1 u=1471  $ Lower grid plate pin
147102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=1471  $ Water around grid plate pin 
147103  104  -2.70     312301 -312302 -311305          imp:n=1 u=1471  $ Bottom casing 
147104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=1471  $ Water around fuel element
147105  106  -1.56     312302 -312303 -311304          imp:n=1 u=1471  $ Lower graphite slug 
147106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=1471  $ Fuel cladding
147107  108   0.042234 312303 -312304 -311301          imp:n=1 u=1471  $ Zirc pin 
147108 14711 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=1471 $ Fuel meat section 1
147109 14712 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=1471 $ Fuel meat section 2
147110 14713 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=1471 $ Fuel meat section 3
147111 14714 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=1471 $ Fuel meat section 4
147112 14715 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=1471 $ Fuel meat section 5
147113  106  -1.56     312304 -312305 -311304          imp:n=1 u=1471  $ Upper graphite spacer
147114  104  -2.70     312305 -312306 -311305          imp:n=1 u=1471  $ Al top cap 
147115  104  -2.70     312306 -312307 -311303          imp:n=1 u=1471  $ Tri-flute 
147116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=1471  $ Water around tri-flute 
147117  104  -2.70     312307 -312308 -311302          imp:n=1 u=1471  $ Fuel tip
147118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=1471  $ Water around fuel tip
147119  102  -1.00     312308 -312309 -311306          imp:n=1 u=1471  $ Water above fuel element
c
c
c
c --- 4968 - Al (TOS210D130) universe ---
c
496801  104  -2.70     312300 -312301 -311302          imp:n=1 u=4968  $ Lower grid plate pin
496802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4968  $ Water around grid plate pin 
496803  104  -2.70     312301 -312302 -311305          imp:n=1 u=4968  $ Bottom casing 
496804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4968  $ Water around fuel element
496805  106  -1.56     312302 -312303 -311304          imp:n=1 u=4968  $ Lower graphite slug 
496806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4968  $ Fuel cladding
496807  108   0.042234 312303 -312304 -311301          imp:n=1 u=4968  $ Zirc pin 
496808 49681 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4968 $ Fuel meat section 1
496809 49682 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4968 $ Fuel meat section 2
496810 49683 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4968 $ Fuel meat section 3
496811 49684 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4968 $ Fuel meat section 4
496812 49685 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4968 $ Fuel meat section 5
496813  106  -1.56     312304 -312305 -311304          imp:n=1 u=4968  $ Upper graphite spacer
496814  104  -2.70     312305 -312306 -311305          imp:n=1 u=4968  $ Al top cap 
496815  104  -2.70     312306 -312307 -311303          imp:n=1 u=4968  $ Tri-flute 
496816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4968  $ Water around tri-flute 
496817  104  -2.70     312307 -312308 -311302          imp:n=1 u=4968  $ Fuel tip
496818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4968  $ Water around fuel tip
496819  102  -1.00     312308 -312309 -311306          imp:n=1 u=4968  $ Water above fuel element
c
c
c
c --- 4970 - Al (TOS210D130) universe ---
c
497001  104  -2.70     312300 -312301 -311302          imp:n=1 u=4970  $ Lower grid plate pin
497002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=4970  $ Water around grid plate pin 
497003  104  -2.70     312301 -312302 -311305          imp:n=1 u=4970  $ Bottom casing 
497004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=4970  $ Water around fuel element
497005  106  -1.56     312302 -312303 -311304          imp:n=1 u=4970  $ Lower graphite slug 
497006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=4970  $ Fuel cladding
497007  108   0.042234 312303 -312304 -311301          imp:n=1 u=4970  $ Zirc pin 
497008 49701 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=4970 $ Fuel meat section 1
497009 49702 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=4970 $ Fuel meat section 2
497010 49703 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=4970 $ Fuel meat section 3
497011 49704 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=4970 $ Fuel meat section 4
497012 49705 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=4970 $ Fuel meat section 5
497013  106  -1.56     312304 -312305 -311304          imp:n=1 u=4970  $ Upper graphite spacer
497014  104  -2.70     312305 -312306 -311305          imp:n=1 u=4970  $ Al top cap 
497015  104  -2.70     312306 -312307 -311303          imp:n=1 u=4970  $ Tri-flute 
497016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=4970  $ Water around tri-flute 
497017  104  -2.70     312307 -312308 -311302          imp:n=1 u=4970  $ Fuel tip
497018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=4970  $ Water around fuel tip
497019  102  -1.00     312308 -312309 -311306          imp:n=1 u=4970  $ Water above fuel element
c
c
c
c --- 5472 - Al (TOS210D130) universe ---
c
547201  104  -2.70     312300 -312301 -311302          imp:n=1 u=5472  $ Lower grid plate pin
547202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5472  $ Water around grid plate pin 
547203  104  -2.70     312301 -312302 -311305          imp:n=1 u=5472  $ Bottom casing 
547204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5472  $ Water around fuel element
547205  106  -1.56     312302 -312303 -311304          imp:n=1 u=5472  $ Lower graphite slug 
547206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5472  $ Fuel cladding
547207  108   0.042234 312303 -312304 -311301          imp:n=1 u=5472  $ Zirc pin 
547208 54721 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5472 $ Fuel meat section 1
547209 54722 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5472 $ Fuel meat section 2
547210 54723 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5472 $ Fuel meat section 3
547211 54724 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5472 $ Fuel meat section 4
547212 54725 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5472 $ Fuel meat section 5
547213  106  -1.56     312304 -312305 -311304          imp:n=1 u=5472  $ Upper graphite spacer
547214  104  -2.70     312305 -312306 -311305          imp:n=1 u=5472  $ Al top cap 
547215  104  -2.70     312306 -312307 -311303          imp:n=1 u=5472  $ Tri-flute 
547216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5472  $ Water around tri-flute 
547217  104  -2.70     312307 -312308 -311302          imp:n=1 u=5472  $ Fuel tip
547218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5472  $ Water around fuel tip
547219  102  -1.00     312308 -312309 -311306          imp:n=1 u=5472  $ Water above fuel element
c
c
c
c --- 5473 - Al (TOS210D130) universe ---
c
547301  104  -2.70     312300 -312301 -311302          imp:n=1 u=5473  $ Lower grid plate pin
547302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5473  $ Water around grid plate pin 
547303  104  -2.70     312301 -312302 -311305          imp:n=1 u=5473  $ Bottom casing 
547304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5473  $ Water around fuel element
547305  106  -1.56     312302 -312303 -311304          imp:n=1 u=5473  $ Lower graphite slug 
547306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5473  $ Fuel cladding
547307  108   0.042234 312303 -312304 -311301          imp:n=1 u=5473  $ Zirc pin 
547308 54731 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5473 $ Fuel meat section 1
547309 54732 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5473 $ Fuel meat section 2
547310 54733 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5473 $ Fuel meat section 3
547311 54734 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5473 $ Fuel meat section 4
547312 54735 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5473 $ Fuel meat section 5
547313  106  -1.56     312304 -312305 -311304          imp:n=1 u=5473  $ Upper graphite spacer
547314  104  -2.70     312305 -312306 -311305          imp:n=1 u=5473  $ Al top cap 
547315  104  -2.70     312306 -312307 -311303          imp:n=1 u=5473  $ Tri-flute 
547316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5473  $ Water around tri-flute 
547317  104  -2.70     312307 -312308 -311302          imp:n=1 u=5473  $ Fuel tip
547318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5473  $ Water around fuel tip
547319  102  -1.00     312308 -312309 -311306          imp:n=1 u=5473  $ Water above fuel element
c
c
c
c --- 5474 - Al (TOS210D130) universe ---
c
547401  104  -2.70     312300 -312301 -311302          imp:n=1 u=5474  $ Lower grid plate pin
547402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5474  $ Water around grid plate pin 
547403  104  -2.70     312301 -312302 -311305          imp:n=1 u=5474  $ Bottom casing 
547404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5474  $ Water around fuel element
547405  106  -1.56     312302 -312303 -311304          imp:n=1 u=5474  $ Lower graphite slug 
547406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5474  $ Fuel cladding
547407  108   0.042234 312303 -312304 -311301          imp:n=1 u=5474  $ Zirc pin 
547408 54741 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5474 $ Fuel meat section 1
547409 54742 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5474 $ Fuel meat section 2
547410 54743 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5474 $ Fuel meat section 3
547411 54744 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5474 $ Fuel meat section 4
547412 54745 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5474 $ Fuel meat section 5
547413  106  -1.56     312304 -312305 -311304          imp:n=1 u=5474  $ Upper graphite spacer
547414  104  -2.70     312305 -312306 -311305          imp:n=1 u=5474  $ Al top cap 
547415  104  -2.70     312306 -312307 -311303          imp:n=1 u=5474  $ Tri-flute 
547416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5474  $ Water around tri-flute 
547417  104  -2.70     312307 -312308 -311302          imp:n=1 u=5474  $ Fuel tip
547418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5474  $ Water around fuel tip
547419  102  -1.00     312308 -312309 -311306          imp:n=1 u=5474  $ Water above fuel element
c
c
c
c --- 5475 - Al (TOS210D130) universe ---
c
547501  104  -2.70     312300 -312301 -311302          imp:n=1 u=5475  $ Lower grid plate pin
547502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5475  $ Water around grid plate pin 
547503  104  -2.70     312301 -312302 -311305          imp:n=1 u=5475  $ Bottom casing 
547504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5475  $ Water around fuel element
547505  106  -1.56     312302 -312303 -311304          imp:n=1 u=5475  $ Lower graphite slug 
547506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5475  $ Fuel cladding
547507  108   0.042234 312303 -312304 -311301          imp:n=1 u=5475  $ Zirc pin 
547508 54751 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5475 $ Fuel meat section 1
547509 54752 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5475 $ Fuel meat section 2
547510 54753 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5475 $ Fuel meat section 3
547511 54754 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5475 $ Fuel meat section 4
547512 54755 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5475 $ Fuel meat section 5
547513  106  -1.56     312304 -312305 -311304          imp:n=1 u=5475  $ Upper graphite spacer
547514  104  -2.70     312305 -312306 -311305          imp:n=1 u=5475  $ Al top cap 
547515  104  -2.70     312306 -312307 -311303          imp:n=1 u=5475  $ Tri-flute 
547516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5475  $ Water around tri-flute 
547517  104  -2.70     312307 -312308 -311302          imp:n=1 u=5475  $ Fuel tip
547518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5475  $ Water around fuel tip
547519  102  -1.00     312308 -312309 -311306          imp:n=1 u=5475  $ Water above fuel element
c
c
c
c --- 5476 - Al (TOS210D130) universe ---
c
547601  104  -2.70     312300 -312301 -311302          imp:n=1 u=5476  $ Lower grid plate pin
547602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5476  $ Water around grid plate pin 
547603  104  -2.70     312301 -312302 -311305          imp:n=1 u=5476  $ Bottom casing 
547604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5476  $ Water around fuel element
547605  106  -1.56     312302 -312303 -311304          imp:n=1 u=5476  $ Lower graphite slug 
547606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5476  $ Fuel cladding
547607  108   0.042234 312303 -312304 -311301          imp:n=1 u=5476  $ Zirc pin 
547608 54761 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5476 $ Fuel meat section 1
547609 54762 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5476 $ Fuel meat section 2
547610 54763 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5476 $ Fuel meat section 3
547611 54764 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5476 $ Fuel meat section 4
547612 54765 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5476 $ Fuel meat section 5
547613  106  -1.56     312304 -312305 -311304          imp:n=1 u=5476  $ Upper graphite spacer
547614  104  -2.70     312305 -312306 -311305          imp:n=1 u=5476  $ Al top cap 
547615  104  -2.70     312306 -312307 -311303          imp:n=1 u=5476  $ Tri-flute 
547616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5476  $ Water around tri-flute 
547617  104  -2.70     312307 -312308 -311302          imp:n=1 u=5476  $ Fuel tip
547618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5476  $ Water around fuel tip
547619  102  -1.00     312308 -312309 -311306          imp:n=1 u=5476  $ Water above fuel element
c
c
c
c --- 5477 - Al (TOS210D130) universe ---
c
547701  104  -2.70     312300 -312301 -311302          imp:n=1 u=5477  $ Lower grid plate pin
547702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5477  $ Water around grid plate pin 
547703  104  -2.70     312301 -312302 -311305          imp:n=1 u=5477  $ Bottom casing 
547704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5477  $ Water around fuel element
547705  106  -1.56     312302 -312303 -311304          imp:n=1 u=5477  $ Lower graphite slug 
547706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5477  $ Fuel cladding
547707  108   0.042234 312303 -312304 -311301          imp:n=1 u=5477  $ Zirc pin 
547708 54771 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5477 $ Fuel meat section 1
547709 54772 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5477 $ Fuel meat section 2
547710 54773 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5477 $ Fuel meat section 3
547711 54774 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5477 $ Fuel meat section 4
547712 54775 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5477 $ Fuel meat section 5
547713  106  -1.56     312304 -312305 -311304          imp:n=1 u=5477  $ Upper graphite spacer
547714  104  -2.70     312305 -312306 -311305          imp:n=1 u=5477  $ Al top cap 
547715  104  -2.70     312306 -312307 -311303          imp:n=1 u=5477  $ Tri-flute 
547716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5477  $ Water around tri-flute 
547717  104  -2.70     312307 -312308 -311302          imp:n=1 u=5477  $ Fuel tip
547718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5477  $ Water around fuel tip
547719  102  -1.00     312308 -312309 -311306          imp:n=1 u=5477  $ Water above fuel element
c
c
c
c --- 5478 - Al (TOS210D130) universe ---
c
547801  104  -2.70     312300 -312301 -311302          imp:n=1 u=5478  $ Lower grid plate pin
547802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5478  $ Water around grid plate pin 
547803  104  -2.70     312301 -312302 -311305          imp:n=1 u=5478  $ Bottom casing 
547804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5478  $ Water around fuel element
547805  106  -1.56     312302 -312303 -311304          imp:n=1 u=5478  $ Lower graphite slug 
547806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5478  $ Fuel cladding
547807  108   0.042234 312303 -312304 -311301          imp:n=1 u=5478  $ Zirc pin 
547808 54781 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5478 $ Fuel meat section 1
547809 54782 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5478 $ Fuel meat section 2
547810 54783 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5478 $ Fuel meat section 3
547811 54784 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5478 $ Fuel meat section 4
547812 54785 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5478 $ Fuel meat section 5
547813  106  -1.56     312304 -312305 -311304          imp:n=1 u=5478  $ Upper graphite spacer
547814  104  -2.70     312305 -312306 -311305          imp:n=1 u=5478  $ Al top cap 
547815  104  -2.70     312306 -312307 -311303          imp:n=1 u=5478  $ Tri-flute 
547816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5478  $ Water around tri-flute 
547817  104  -2.70     312307 -312308 -311302          imp:n=1 u=5478  $ Fuel tip
547818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5478  $ Water around fuel tip
547819  102  -1.00     312308 -312309 -311306          imp:n=1 u=5478  $ Water above fuel element
c
c
c
c --- 5479 - Al (TOS210D130) universe ---
c
547901  104  -2.70     312300 -312301 -311302          imp:n=1 u=5479  $ Lower grid plate pin
547902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5479  $ Water around grid plate pin 
547903  104  -2.70     312301 -312302 -311305          imp:n=1 u=5479  $ Bottom casing 
547904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5479  $ Water around fuel element
547905  106  -1.56     312302 -312303 -311304          imp:n=1 u=5479  $ Lower graphite slug 
547906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5479  $ Fuel cladding
547907  108   0.042234 312303 -312304 -311301          imp:n=1 u=5479  $ Zirc pin 
547908 54791 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5479 $ Fuel meat section 1
547909 54792 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5479 $ Fuel meat section 2
547910 54793 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5479 $ Fuel meat section 3
547911 54794 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5479 $ Fuel meat section 4
547912 54795 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5479 $ Fuel meat section 5
547913  106  -1.56     312304 -312305 -311304          imp:n=1 u=5479  $ Upper graphite spacer
547914  104  -2.70     312305 -312306 -311305          imp:n=1 u=5479  $ Al top cap 
547915  104  -2.70     312306 -312307 -311303          imp:n=1 u=5479  $ Tri-flute 
547916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5479  $ Water around tri-flute 
547917  104  -2.70     312307 -312308 -311302          imp:n=1 u=5479  $ Fuel tip
547918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5479  $ Water around fuel tip
547919  102  -1.00     312308 -312309 -311306          imp:n=1 u=5479  $ Water above fuel element
c
c
c
c --- 5480 - Al (TOS210D130) universe ---
c
548001  104  -2.70     312300 -312301 -311302          imp:n=1 u=5480  $ Lower grid plate pin
548002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5480  $ Water around grid plate pin 
548003  104  -2.70     312301 -312302 -311305          imp:n=1 u=5480  $ Bottom casing 
548004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5480  $ Water around fuel element
548005  106  -1.56     312302 -312303 -311304          imp:n=1 u=5480  $ Lower graphite slug 
548006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5480  $ Fuel cladding
548007  108   0.042234 312303 -312304 -311301          imp:n=1 u=5480  $ Zirc pin 
548008 54801 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5480 $ Fuel meat section 1
548009 54802 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5480 $ Fuel meat section 2
548010 54803 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5480 $ Fuel meat section 3
548011 54804 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5480 $ Fuel meat section 4
548012 54805 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5480 $ Fuel meat section 5
548013  106  -1.56     312304 -312305 -311304          imp:n=1 u=5480  $ Upper graphite spacer
548014  104  -2.70     312305 -312306 -311305          imp:n=1 u=5480  $ Al top cap 
548015  104  -2.70     312306 -312307 -311303          imp:n=1 u=5480  $ Tri-flute 
548016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5480  $ Water around tri-flute 
548017  104  -2.70     312307 -312308 -311302          imp:n=1 u=5480  $ Fuel tip
548018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5480  $ Water around fuel tip
548019  102  -1.00     312308 -312309 -311306          imp:n=1 u=5480  $ Water above fuel element
c
c
c
c --- 5481 - Al (TOS210D130) universe ---
c
548101  104  -2.70     312300 -312301 -311302          imp:n=1 u=5481  $ Lower grid plate pin
548102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5481  $ Water around grid plate pin 
548103  104  -2.70     312301 -312302 -311305          imp:n=1 u=5481  $ Bottom casing 
548104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5481  $ Water around fuel element
548105  106  -1.56     312302 -312303 -311304          imp:n=1 u=5481  $ Lower graphite slug 
548106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5481  $ Fuel cladding
548107  108   0.042234 312303 -312304 -311301          imp:n=1 u=5481  $ Zirc pin 
548108 54811 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5481 $ Fuel meat section 1
548109 54812 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5481 $ Fuel meat section 2
548110 54813 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5481 $ Fuel meat section 3
548111 54814 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5481 $ Fuel meat section 4
548112 54815 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5481 $ Fuel meat section 5
548113  106  -1.56     312304 -312305 -311304          imp:n=1 u=5481  $ Upper graphite spacer
548114  104  -2.70     312305 -312306 -311305          imp:n=1 u=5481  $ Al top cap 
548115  104  -2.70     312306 -312307 -311303          imp:n=1 u=5481  $ Tri-flute 
548116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5481  $ Water around tri-flute 
548117  104  -2.70     312307 -312308 -311302          imp:n=1 u=5481  $ Fuel tip
548118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5481  $ Water around fuel tip
548119  102  -1.00     312308 -312309 -311306          imp:n=1 u=5481  $ Water above fuel element
c
c
c
c --- 5482 - Al (TOS210D130) universe ---
c
548201  104  -2.70     312300 -312301 -311302          imp:n=1 u=5482  $ Lower grid plate pin
548202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5482  $ Water around grid plate pin 
548203  104  -2.70     312301 -312302 -311305          imp:n=1 u=5482  $ Bottom casing 
548204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5482  $ Water around fuel element
548205  106  -1.56     312302 -312303 -311304          imp:n=1 u=5482  $ Lower graphite slug 
548206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5482  $ Fuel cladding
548207  108   0.042234 312303 -312304 -311301          imp:n=1 u=5482  $ Zirc pin 
548208 54821 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5482 $ Fuel meat section 1
548209 54822 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5482 $ Fuel meat section 2
548210 54823 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5482 $ Fuel meat section 3
548211 54824 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5482 $ Fuel meat section 4
548212 54825 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5482 $ Fuel meat section 5
548213  106  -1.56     312304 -312305 -311304          imp:n=1 u=5482  $ Upper graphite spacer
548214  104  -2.70     312305 -312306 -311305          imp:n=1 u=5482  $ Al top cap 
548215  104  -2.70     312306 -312307 -311303          imp:n=1 u=5482  $ Tri-flute 
548216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5482  $ Water around tri-flute 
548217  104  -2.70     312307 -312308 -311302          imp:n=1 u=5482  $ Fuel tip
548218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5482  $ Water around fuel tip
548219  102  -1.00     312308 -312309 -311306          imp:n=1 u=5482  $ Water above fuel element
c
c
c
c --- 5483 - Al (TOS210D130) universe ---
c
548301  104  -2.70     312300 -312301 -311302          imp:n=1 u=5483  $ Lower grid plate pin
548302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5483  $ Water around grid plate pin 
548303  104  -2.70     312301 -312302 -311305          imp:n=1 u=5483  $ Bottom casing 
548304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5483  $ Water around fuel element
548305  106  -1.56     312302 -312303 -311304          imp:n=1 u=5483  $ Lower graphite slug 
548306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5483  $ Fuel cladding
548307  108   0.042234 312303 -312304 -311301          imp:n=1 u=5483  $ Zirc pin 
548308 54831 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5483 $ Fuel meat section 1
548309 54832 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5483 $ Fuel meat section 2
548310 54833 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5483 $ Fuel meat section 3
548311 54834 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5483 $ Fuel meat section 4
548312 54835 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5483 $ Fuel meat section 5
548313  106  -1.56     312304 -312305 -311304          imp:n=1 u=5483  $ Upper graphite spacer
548314  104  -2.70     312305 -312306 -311305          imp:n=1 u=5483  $ Al top cap 
548315  104  -2.70     312306 -312307 -311303          imp:n=1 u=5483  $ Tri-flute 
548316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5483  $ Water around tri-flute 
548317  104  -2.70     312307 -312308 -311302          imp:n=1 u=5483  $ Fuel tip
548318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5483  $ Water around fuel tip
548319  102  -1.00     312308 -312309 -311306          imp:n=1 u=5483  $ Water above fuel element
c
c
c
c --- 5484 - Al (TOS210D130) universe ---
c
548401  104  -2.70     312300 -312301 -311302          imp:n=1 u=5484  $ Lower grid plate pin
548402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5484  $ Water around grid plate pin 
548403  104  -2.70     312301 -312302 -311305          imp:n=1 u=5484  $ Bottom casing 
548404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5484  $ Water around fuel element
548405  106  -1.56     312302 -312303 -311304          imp:n=1 u=5484  $ Lower graphite slug 
548406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5484  $ Fuel cladding
548407  108   0.042234 312303 -312304 -311301          imp:n=1 u=5484  $ Zirc pin 
548408 54841 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5484 $ Fuel meat section 1
548409 54842 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5484 $ Fuel meat section 2
548410 54843 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5484 $ Fuel meat section 3
548411 54844 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5484 $ Fuel meat section 4
548412 54845 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5484 $ Fuel meat section 5
548413  106  -1.56     312304 -312305 -311304          imp:n=1 u=5484  $ Upper graphite spacer
548414  104  -2.70     312305 -312306 -311305          imp:n=1 u=5484  $ Al top cap 
548415  104  -2.70     312306 -312307 -311303          imp:n=1 u=5484  $ Tri-flute 
548416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5484  $ Water around tri-flute 
548417  104  -2.70     312307 -312308 -311302          imp:n=1 u=5484  $ Fuel tip
548418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5484  $ Water around fuel tip
548419  102  -1.00     312308 -312309 -311306          imp:n=1 u=5484  $ Water above fuel element
c
c
c
c --- 5485 - Al (TOS210D130) universe ---
c
548501  104  -2.70     312300 -312301 -311302          imp:n=1 u=5485  $ Lower grid plate pin
548502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5485  $ Water around grid plate pin 
548503  104  -2.70     312301 -312302 -311305          imp:n=1 u=5485  $ Bottom casing 
548504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5485  $ Water around fuel element
548505  106  -1.56     312302 -312303 -311304          imp:n=1 u=5485  $ Lower graphite slug 
548506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5485  $ Fuel cladding
548507  108   0.042234 312303 -312304 -311301          imp:n=1 u=5485  $ Zirc pin 
548508 54851 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5485 $ Fuel meat section 1
548509 54852 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5485 $ Fuel meat section 2
548510 54853 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5485 $ Fuel meat section 3
548511 54854 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5485 $ Fuel meat section 4
548512 54855 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5485 $ Fuel meat section 5
548513  106  -1.56     312304 -312305 -311304          imp:n=1 u=5485  $ Upper graphite spacer
548514  104  -2.70     312305 -312306 -311305          imp:n=1 u=5485  $ Al top cap 
548515  104  -2.70     312306 -312307 -311303          imp:n=1 u=5485  $ Tri-flute 
548516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5485  $ Water around tri-flute 
548517  104  -2.70     312307 -312308 -311302          imp:n=1 u=5485  $ Fuel tip
548518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5485  $ Water around fuel tip
548519  102  -1.00     312308 -312309 -311306          imp:n=1 u=5485  $ Water above fuel element
c
c
c
c --- 5486 - Al (TOS210D130) universe ---
c
548601  104  -2.70     312300 -312301 -311302          imp:n=1 u=5486  $ Lower grid plate pin
548602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5486  $ Water around grid plate pin 
548603  104  -2.70     312301 -312302 -311305          imp:n=1 u=5486  $ Bottom casing 
548604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5486  $ Water around fuel element
548605  106  -1.56     312302 -312303 -311304          imp:n=1 u=5486  $ Lower graphite slug 
548606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5486  $ Fuel cladding
548607  108   0.042234 312303 -312304 -311301          imp:n=1 u=5486  $ Zirc pin 
548608 54861 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5486 $ Fuel meat section 1
548609 54862 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5486 $ Fuel meat section 2
548610 54863 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5486 $ Fuel meat section 3
548611 54864 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5486 $ Fuel meat section 4
548612 54865 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5486 $ Fuel meat section 5
548613  106  -1.56     312304 -312305 -311304          imp:n=1 u=5486  $ Upper graphite spacer
548614  104  -2.70     312305 -312306 -311305          imp:n=1 u=5486  $ Al top cap 
548615  104  -2.70     312306 -312307 -311303          imp:n=1 u=5486  $ Tri-flute 
548616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5486  $ Water around tri-flute 
548617  104  -2.70     312307 -312308 -311302          imp:n=1 u=5486  $ Fuel tip
548618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5486  $ Water around fuel tip
548619  102  -1.00     312308 -312309 -311306          imp:n=1 u=5486  $ Water above fuel element
c
c
c
c --- 5487 - Al (TOS210D130) universe ---
c
548701  104  -2.70     312300 -312301 -311302          imp:n=1 u=5487  $ Lower grid plate pin
548702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5487  $ Water around grid plate pin 
548703  104  -2.70     312301 -312302 -311305          imp:n=1 u=5487  $ Bottom casing 
548704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5487  $ Water around fuel element
548705  106  -1.56     312302 -312303 -311304          imp:n=1 u=5487  $ Lower graphite slug 
548706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5487  $ Fuel cladding
548707  108   0.042234 312303 -312304 -311301          imp:n=1 u=5487  $ Zirc pin 
548708 54871 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5487 $ Fuel meat section 1
548709 54872 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5487 $ Fuel meat section 2
548710 54873 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5487 $ Fuel meat section 3
548711 54874 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5487 $ Fuel meat section 4
548712 54875 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5487 $ Fuel meat section 5
548713  106  -1.56     312304 -312305 -311304          imp:n=1 u=5487  $ Upper graphite spacer
548714  104  -2.70     312305 -312306 -311305          imp:n=1 u=5487  $ Al top cap 
548715  104  -2.70     312306 -312307 -311303          imp:n=1 u=5487  $ Tri-flute 
548716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5487  $ Water around tri-flute 
548717  104  -2.70     312307 -312308 -311302          imp:n=1 u=5487  $ Fuel tip
548718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5487  $ Water around fuel tip
548719  102  -1.00     312308 -312309 -311306          imp:n=1 u=5487  $ Water above fuel element
c
c
c
c --- 5488 - Al (TOS210D130) universe ---
c
548801  104  -2.70     312300 -312301 -311302          imp:n=1 u=5488  $ Lower grid plate pin
548802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5488  $ Water around grid plate pin 
548803  104  -2.70     312301 -312302 -311305          imp:n=1 u=5488  $ Bottom casing 
548804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5488  $ Water around fuel element
548805  106  -1.56     312302 -312303 -311304          imp:n=1 u=5488  $ Lower graphite slug 
548806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5488  $ Fuel cladding
548807  108   0.042234 312303 -312304 -311301          imp:n=1 u=5488  $ Zirc pin 
548808 54881 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5488 $ Fuel meat section 1
548809 54882 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5488 $ Fuel meat section 2
548810 54883 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5488 $ Fuel meat section 3
548811 54884 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5488 $ Fuel meat section 4
548812 54885 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5488 $ Fuel meat section 5
548813  106  -1.56     312304 -312305 -311304          imp:n=1 u=5488  $ Upper graphite spacer
548814  104  -2.70     312305 -312306 -311305          imp:n=1 u=5488  $ Al top cap 
548815  104  -2.70     312306 -312307 -311303          imp:n=1 u=5488  $ Tri-flute 
548816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5488  $ Water around tri-flute 
548817  104  -2.70     312307 -312308 -311302          imp:n=1 u=5488  $ Fuel tip
548818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5488  $ Water around fuel tip
548819  102  -1.00     312308 -312309 -311306          imp:n=1 u=5488  $ Water above fuel element
c
c
c
c --- 5489 - Al (TOS210D130) universe ---
c
548901  104  -2.70     312300 -312301 -311302          imp:n=1 u=5489  $ Lower grid plate pin
548902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5489  $ Water around grid plate pin 
548903  104  -2.70     312301 -312302 -311305          imp:n=1 u=5489  $ Bottom casing 
548904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5489  $ Water around fuel element
548905  106  -1.56     312302 -312303 -311304          imp:n=1 u=5489  $ Lower graphite slug 
548906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5489  $ Fuel cladding
548907  108   0.042234 312303 -312304 -311301          imp:n=1 u=5489  $ Zirc pin 
548908 54891 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5489 $ Fuel meat section 1
548909 54892 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5489 $ Fuel meat section 2
548910 54893 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5489 $ Fuel meat section 3
548911 54894 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5489 $ Fuel meat section 4
548912 54895 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5489 $ Fuel meat section 5
548913  106  -1.56     312304 -312305 -311304          imp:n=1 u=5489  $ Upper graphite spacer
548914  104  -2.70     312305 -312306 -311305          imp:n=1 u=5489  $ Al top cap 
548915  104  -2.70     312306 -312307 -311303          imp:n=1 u=5489  $ Tri-flute 
548916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5489  $ Water around tri-flute 
548917  104  -2.70     312307 -312308 -311302          imp:n=1 u=5489  $ Fuel tip
548918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5489  $ Water around fuel tip
548919  102  -1.00     312308 -312309 -311306          imp:n=1 u=5489  $ Water above fuel element
c
c
c
c --- 5490 - Al (TOS210D130) universe ---
c
549001  104  -2.70     312300 -312301 -311302          imp:n=1 u=5490  $ Lower grid plate pin
549002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5490  $ Water around grid plate pin 
549003  104  -2.70     312301 -312302 -311305          imp:n=1 u=5490  $ Bottom casing 
549004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5490  $ Water around fuel element
549005  106  -1.56     312302 -312303 -311304          imp:n=1 u=5490  $ Lower graphite slug 
549006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5490  $ Fuel cladding
549007  108   0.042234 312303 -312304 -311301          imp:n=1 u=5490  $ Zirc pin 
549008 54901 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5490 $ Fuel meat section 1
549009 54902 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5490 $ Fuel meat section 2
549010 54903 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5490 $ Fuel meat section 3
549011 54904 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5490 $ Fuel meat section 4
549012 54905 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5490 $ Fuel meat section 5
549013  106  -1.56     312304 -312305 -311304          imp:n=1 u=5490  $ Upper graphite spacer
549014  104  -2.70     312305 -312306 -311305          imp:n=1 u=5490  $ Al top cap 
549015  104  -2.70     312306 -312307 -311303          imp:n=1 u=5490  $ Tri-flute 
549016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5490  $ Water around tri-flute 
549017  104  -2.70     312307 -312308 -311302          imp:n=1 u=5490  $ Fuel tip
549018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5490  $ Water around fuel tip
549019  102  -1.00     312308 -312309 -311306          imp:n=1 u=5490  $ Water above fuel element
c
c
c
c --- 5491 - Al (TOS210D130) universe ---
c
549101  104  -2.70     312300 -312301 -311302          imp:n=1 u=5491  $ Lower grid plate pin
549102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5491  $ Water around grid plate pin 
549103  104  -2.70     312301 -312302 -311305          imp:n=1 u=5491  $ Bottom casing 
549104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5491  $ Water around fuel element
549105  106  -1.56     312302 -312303 -311304          imp:n=1 u=5491  $ Lower graphite slug 
549106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5491  $ Fuel cladding
549107  108   0.042234 312303 -312304 -311301          imp:n=1 u=5491  $ Zirc pin 
549108 54911 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5491 $ Fuel meat section 1
549109 54912 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5491 $ Fuel meat section 2
549110 54913 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5491 $ Fuel meat section 3
549111 54914 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5491 $ Fuel meat section 4
549112 54915 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5491 $ Fuel meat section 5
549113  106  -1.56     312304 -312305 -311304          imp:n=1 u=5491  $ Upper graphite spacer
549114  104  -2.70     312305 -312306 -311305          imp:n=1 u=5491  $ Al top cap 
549115  104  -2.70     312306 -312307 -311303          imp:n=1 u=5491  $ Tri-flute 
549116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5491  $ Water around tri-flute 
549117  104  -2.70     312307 -312308 -311302          imp:n=1 u=5491  $ Fuel tip
549118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5491  $ Water around fuel tip
549119  102  -1.00     312308 -312309 -311306          imp:n=1 u=5491  $ Water above fuel element
c
c
c
c --- 5492 - Al (TOS210D130) universe ---
c
549201  104  -2.70     312300 -312301 -311302          imp:n=1 u=5492  $ Lower grid plate pin
549202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5492  $ Water around grid plate pin 
549203  104  -2.70     312301 -312302 -311305          imp:n=1 u=5492  $ Bottom casing 
549204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5492  $ Water around fuel element
549205  106  -1.56     312302 -312303 -311304          imp:n=1 u=5492  $ Lower graphite slug 
549206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5492  $ Fuel cladding
549207  108   0.042234 312303 -312304 -311301          imp:n=1 u=5492  $ Zirc pin 
549208 54921 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5492 $ Fuel meat section 1
549209 54922 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5492 $ Fuel meat section 2
549210 54923 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5492 $ Fuel meat section 3
549211 54924 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5492 $ Fuel meat section 4
549212 54925 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5492 $ Fuel meat section 5
549213  106  -1.56     312304 -312305 -311304          imp:n=1 u=5492  $ Upper graphite spacer
549214  104  -2.70     312305 -312306 -311305          imp:n=1 u=5492  $ Al top cap 
549215  104  -2.70     312306 -312307 -311303          imp:n=1 u=5492  $ Tri-flute 
549216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5492  $ Water around tri-flute 
549217  104  -2.70     312307 -312308 -311302          imp:n=1 u=5492  $ Fuel tip
549218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5492  $ Water around fuel tip
549219  102  -1.00     312308 -312309 -311306          imp:n=1 u=5492  $ Water above fuel element
c
c
c
c --- 5495 - Al (TOS210D130) universe ---
c
549501  104  -2.70     312300 -312301 -311302          imp:n=1 u=5495  $ Lower grid plate pin
549502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5495  $ Water around grid plate pin 
549503  104  -2.70     312301 -312302 -311305          imp:n=1 u=5495  $ Bottom casing 
549504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5495  $ Water around fuel element
549505  106  -1.56     312302 -312303 -311304          imp:n=1 u=5495  $ Lower graphite slug 
549506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5495  $ Fuel cladding
549507  108   0.042234 312303 -312304 -311301          imp:n=1 u=5495  $ Zirc pin 
549508 54951 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5495 $ Fuel meat section 1
549509 54952 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5495 $ Fuel meat section 2
549510 54953 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5495 $ Fuel meat section 3
549511 54954 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5495 $ Fuel meat section 4
549512 54955 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5495 $ Fuel meat section 5
549513  106  -1.56     312304 -312305 -311304          imp:n=1 u=5495  $ Upper graphite spacer
549514  104  -2.70     312305 -312306 -311305          imp:n=1 u=5495  $ Al top cap 
549515  104  -2.70     312306 -312307 -311303          imp:n=1 u=5495  $ Tri-flute 
549516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5495  $ Water around tri-flute 
549517  104  -2.70     312307 -312308 -311302          imp:n=1 u=5495  $ Fuel tip
549518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5495  $ Water around fuel tip
549519  102  -1.00     312308 -312309 -311306          imp:n=1 u=5495  $ Water above fuel element
c
c
c
c --- 5496 - Al (TOS210D130) universe ---
c
549601  104  -2.70     312300 -312301 -311302          imp:n=1 u=5496  $ Lower grid plate pin
549602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5496  $ Water around grid plate pin 
549603  104  -2.70     312301 -312302 -311305          imp:n=1 u=5496  $ Bottom casing 
549604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5496  $ Water around fuel element
549605  106  -1.56     312302 -312303 -311304          imp:n=1 u=5496  $ Lower graphite slug 
549606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5496  $ Fuel cladding
549607  108   0.042234 312303 -312304 -311301          imp:n=1 u=5496  $ Zirc pin 
549608 54961 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5496 $ Fuel meat section 1
549609 54962 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5496 $ Fuel meat section 2
549610 54963 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5496 $ Fuel meat section 3
549611 54964 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5496 $ Fuel meat section 4
549612 54965 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5496 $ Fuel meat section 5
549613  106  -1.56     312304 -312305 -311304          imp:n=1 u=5496  $ Upper graphite spacer
549614  104  -2.70     312305 -312306 -311305          imp:n=1 u=5496  $ Al top cap 
549615  104  -2.70     312306 -312307 -311303          imp:n=1 u=5496  $ Tri-flute 
549616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5496  $ Water around tri-flute 
549617  104  -2.70     312307 -312308 -311302          imp:n=1 u=5496  $ Fuel tip
549618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5496  $ Water around fuel tip
549619  102  -1.00     312308 -312309 -311306          imp:n=1 u=5496  $ Water above fuel element
c
c
c
c --- 5497 - Al (TOS210D130) universe ---
c
549701  104  -2.70     312300 -312301 -311302          imp:n=1 u=5497  $ Lower grid plate pin
549702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5497  $ Water around grid plate pin 
549703  104  -2.70     312301 -312302 -311305          imp:n=1 u=5497  $ Bottom casing 
549704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5497  $ Water around fuel element
549705  106  -1.56     312302 -312303 -311304          imp:n=1 u=5497  $ Lower graphite slug 
549706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5497  $ Fuel cladding
549707  108   0.042234 312303 -312304 -311301          imp:n=1 u=5497  $ Zirc pin 
549708 54971 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5497 $ Fuel meat section 1
549709 54972 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5497 $ Fuel meat section 2
549710 54973 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5497 $ Fuel meat section 3
549711 54974 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5497 $ Fuel meat section 4
549712 54975 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5497 $ Fuel meat section 5
549713  106  -1.56     312304 -312305 -311304          imp:n=1 u=5497  $ Upper graphite spacer
549714  104  -2.70     312305 -312306 -311305          imp:n=1 u=5497  $ Al top cap 
549715  104  -2.70     312306 -312307 -311303          imp:n=1 u=5497  $ Tri-flute 
549716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5497  $ Water around tri-flute 
549717  104  -2.70     312307 -312308 -311302          imp:n=1 u=5497  $ Fuel tip
549718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5497  $ Water around fuel tip
549719  102  -1.00     312308 -312309 -311306          imp:n=1 u=5497  $ Water above fuel element
c
c
c
c --- 5498 - Al (TOS210D130) universe ---
c
549801  104  -2.70     312300 -312301 -311302          imp:n=1 u=5498  $ Lower grid plate pin
549802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5498  $ Water around grid plate pin 
549803  104  -2.70     312301 -312302 -311305          imp:n=1 u=5498  $ Bottom casing 
549804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5498  $ Water around fuel element
549805  106  -1.56     312302 -312303 -311304          imp:n=1 u=5498  $ Lower graphite slug 
549806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5498  $ Fuel cladding
549807  108   0.042234 312303 -312304 -311301          imp:n=1 u=5498  $ Zirc pin 
549808 54981 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5498 $ Fuel meat section 1
549809 54982 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5498 $ Fuel meat section 2
549810 54983 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5498 $ Fuel meat section 3
549811 54984 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5498 $ Fuel meat section 4
549812 54985 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5498 $ Fuel meat section 5
549813  106  -1.56     312304 -312305 -311304          imp:n=1 u=5498  $ Upper graphite spacer
549814  104  -2.70     312305 -312306 -311305          imp:n=1 u=5498  $ Al top cap 
549815  104  -2.70     312306 -312307 -311303          imp:n=1 u=5498  $ Tri-flute 
549816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5498  $ Water around tri-flute 
549817  104  -2.70     312307 -312308 -311302          imp:n=1 u=5498  $ Fuel tip
549818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5498  $ Water around fuel tip
549819  102  -1.00     312308 -312309 -311306          imp:n=1 u=5498  $ Water above fuel element
c
c
c
c --- 5500 - Al (TOS210D130) universe ---
c
550001  104  -2.70     312300 -312301 -311302          imp:n=1 u=5500  $ Lower grid plate pin
550002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5500  $ Water around grid plate pin 
550003  104  -2.70     312301 -312302 -311305          imp:n=1 u=5500  $ Bottom casing 
550004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5500  $ Water around fuel element
550005  106  -1.56     312302 -312303 -311304          imp:n=1 u=5500  $ Lower graphite slug 
550006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5500  $ Fuel cladding
550007  108   0.042234 312303 -312304 -311301          imp:n=1 u=5500  $ Zirc pin 
550008 55001 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5500 $ Fuel meat section 1
550009 55002 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5500 $ Fuel meat section 2
550010 55003 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5500 $ Fuel meat section 3
550011 55004 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5500 $ Fuel meat section 4
550012 55005 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5500 $ Fuel meat section 5
550013  106  -1.56     312304 -312305 -311304          imp:n=1 u=5500  $ Upper graphite spacer
550014  104  -2.70     312305 -312306 -311305          imp:n=1 u=5500  $ Al top cap 
550015  104  -2.70     312306 -312307 -311303          imp:n=1 u=5500  $ Tri-flute 
550016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5500  $ Water around tri-flute 
550017  104  -2.70     312307 -312308 -311302          imp:n=1 u=5500  $ Fuel tip
550018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5500  $ Water around fuel tip
550019  102  -1.00     312308 -312309 -311306          imp:n=1 u=5500  $ Water above fuel element
c
c
c
c --- 5501 - Al (TOS210D130) universe ---
c
550101  104  -2.70     312300 -312301 -311302          imp:n=1 u=5501  $ Lower grid plate pin
550102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5501  $ Water around grid plate pin 
550103  104  -2.70     312301 -312302 -311305          imp:n=1 u=5501  $ Bottom casing 
550104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5501  $ Water around fuel element
550105  106  -1.56     312302 -312303 -311304          imp:n=1 u=5501  $ Lower graphite slug 
550106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5501  $ Fuel cladding
550107  108   0.042234 312303 -312304 -311301          imp:n=1 u=5501  $ Zirc pin 
550108 55011 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5501 $ Fuel meat section 1
550109 55012 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5501 $ Fuel meat section 2
550110 55013 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5501 $ Fuel meat section 3
550111 55014 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5501 $ Fuel meat section 4
550112 55015 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5501 $ Fuel meat section 5
550113  106  -1.56     312304 -312305 -311304          imp:n=1 u=5501  $ Upper graphite spacer
550114  104  -2.70     312305 -312306 -311305          imp:n=1 u=5501  $ Al top cap 
550115  104  -2.70     312306 -312307 -311303          imp:n=1 u=5501  $ Tri-flute 
550116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5501  $ Water around tri-flute 
550117  104  -2.70     312307 -312308 -311302          imp:n=1 u=5501  $ Fuel tip
550118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5501  $ Water around fuel tip
550119  102  -1.00     312308 -312309 -311306          imp:n=1 u=5501  $ Water above fuel element
c
c
c
c --- 5503 - Al (TOS210D130) universe ---
c
550301  104  -2.70     312300 -312301 -311302          imp:n=1 u=5503  $ Lower grid plate pin
550302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5503  $ Water around grid plate pin 
550303  104  -2.70     312301 -312302 -311305          imp:n=1 u=5503  $ Bottom casing 
550304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5503  $ Water around fuel element
550305  106  -1.56     312302 -312303 -311304          imp:n=1 u=5503  $ Lower graphite slug 
550306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5503  $ Fuel cladding
550307  108   0.042234 312303 -312304 -311301          imp:n=1 u=5503  $ Zirc pin 
550308 55031 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5503 $ Fuel meat section 1
550309 55032 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5503 $ Fuel meat section 2
550310 55033 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5503 $ Fuel meat section 3
550311 55034 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5503 $ Fuel meat section 4
550312 55035 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5503 $ Fuel meat section 5
550313  106  -1.56     312304 -312305 -311304          imp:n=1 u=5503  $ Upper graphite spacer
550314  104  -2.70     312305 -312306 -311305          imp:n=1 u=5503  $ Al top cap 
550315  104  -2.70     312306 -312307 -311303          imp:n=1 u=5503  $ Tri-flute 
550316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5503  $ Water around tri-flute 
550317  104  -2.70     312307 -312308 -311302          imp:n=1 u=5503  $ Fuel tip
550318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5503  $ Water around fuel tip
550319  102  -1.00     312308 -312309 -311306          imp:n=1 u=5503  $ Water above fuel element
c
c
c
c --- 5504 - Al (TOS210D130) universe ---
c
550401  104  -2.70     312300 -312301 -311302          imp:n=1 u=5504  $ Lower grid plate pin
550402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5504  $ Water around grid plate pin 
550403  104  -2.70     312301 -312302 -311305          imp:n=1 u=5504  $ Bottom casing 
550404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5504  $ Water around fuel element
550405  106  -1.56     312302 -312303 -311304          imp:n=1 u=5504  $ Lower graphite slug 
550406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5504  $ Fuel cladding
550407  108   0.042234 312303 -312304 -311301          imp:n=1 u=5504  $ Zirc pin 
550408 55041 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5504 $ Fuel meat section 1
550409 55042 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5504 $ Fuel meat section 2
550410 55043 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5504 $ Fuel meat section 3
550411 55044 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5504 $ Fuel meat section 4
550412 55045 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5504 $ Fuel meat section 5
550413  106  -1.56     312304 -312305 -311304          imp:n=1 u=5504  $ Upper graphite spacer
550414  104  -2.70     312305 -312306 -311305          imp:n=1 u=5504  $ Al top cap 
550415  104  -2.70     312306 -312307 -311303          imp:n=1 u=5504  $ Tri-flute 
550416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5504  $ Water around tri-flute 
550417  104  -2.70     312307 -312308 -311302          imp:n=1 u=5504  $ Fuel tip
550418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5504  $ Water around fuel tip
550419  102  -1.00     312308 -312309 -311306          imp:n=1 u=5504  $ Water above fuel element
c
c
c
c --- 5506 - Al (TOS210D130) universe ---
c
550601  104  -2.70     312300 -312301 -311302          imp:n=1 u=5506  $ Lower grid plate pin
550602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5506  $ Water around grid plate pin 
550603  104  -2.70     312301 -312302 -311305          imp:n=1 u=5506  $ Bottom casing 
550604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5506  $ Water around fuel element
550605  106  -1.56     312302 -312303 -311304          imp:n=1 u=5506  $ Lower graphite slug 
550606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5506  $ Fuel cladding
550607  108   0.042234 312303 -312304 -311301          imp:n=1 u=5506  $ Zirc pin 
550608 55061 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5506 $ Fuel meat section 1
550609 55062 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5506 $ Fuel meat section 2
550610 55063 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5506 $ Fuel meat section 3
550611 55064 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5506 $ Fuel meat section 4
550612 55065 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5506 $ Fuel meat section 5
550613  106  -1.56     312304 -312305 -311304          imp:n=1 u=5506  $ Upper graphite spacer
550614  104  -2.70     312305 -312306 -311305          imp:n=1 u=5506  $ Al top cap 
550615  104  -2.70     312306 -312307 -311303          imp:n=1 u=5506  $ Tri-flute 
550616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5506  $ Water around tri-flute 
550617  104  -2.70     312307 -312308 -311302          imp:n=1 u=5506  $ Fuel tip
550618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5506  $ Water around fuel tip
550619  102  -1.00     312308 -312309 -311306          imp:n=1 u=5506  $ Water above fuel element
c
c
c
c --- 5507 - Al (TOS210D130) universe ---
c
550701  104  -2.70     312300 -312301 -311302          imp:n=1 u=5507  $ Lower grid plate pin
550702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5507  $ Water around grid plate pin 
550703  104  -2.70     312301 -312302 -311305          imp:n=1 u=5507  $ Bottom casing 
550704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5507  $ Water around fuel element
550705  106  -1.56     312302 -312303 -311304          imp:n=1 u=5507  $ Lower graphite slug 
550706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5507  $ Fuel cladding
550707  108   0.042234 312303 -312304 -311301          imp:n=1 u=5507  $ Zirc pin 
550708 55071 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5507 $ Fuel meat section 1
550709 55072 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5507 $ Fuel meat section 2
550710 55073 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5507 $ Fuel meat section 3
550711 55074 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5507 $ Fuel meat section 4
550712 55075 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5507 $ Fuel meat section 5
550713  106  -1.56     312304 -312305 -311304          imp:n=1 u=5507  $ Upper graphite spacer
550714  104  -2.70     312305 -312306 -311305          imp:n=1 u=5507  $ Al top cap 
550715  104  -2.70     312306 -312307 -311303          imp:n=1 u=5507  $ Tri-flute 
550716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5507  $ Water around tri-flute 
550717  104  -2.70     312307 -312308 -311302          imp:n=1 u=5507  $ Fuel tip
550718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5507  $ Water around fuel tip
550719  102  -1.00     312308 -312309 -311306          imp:n=1 u=5507  $ Water above fuel element
c
c
c
c --- 5509 - Al (TOS210D130) universe ---
c
550901  104  -2.70     312300 -312301 -311302          imp:n=1 u=5509  $ Lower grid plate pin
550902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5509  $ Water around grid plate pin 
550903  104  -2.70     312301 -312302 -311305          imp:n=1 u=5509  $ Bottom casing 
550904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5509  $ Water around fuel element
550905  106  -1.56     312302 -312303 -311304          imp:n=1 u=5509  $ Lower graphite slug 
550906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5509  $ Fuel cladding
550907  108   0.042234 312303 -312304 -311301          imp:n=1 u=5509  $ Zirc pin 
550908 55091 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5509 $ Fuel meat section 1
550909 55092 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5509 $ Fuel meat section 2
550910 55093 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5509 $ Fuel meat section 3
550911 55094 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5509 $ Fuel meat section 4
550912 55095 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5509 $ Fuel meat section 5
550913  106  -1.56     312304 -312305 -311304          imp:n=1 u=5509  $ Upper graphite spacer
550914  104  -2.70     312305 -312306 -311305          imp:n=1 u=5509  $ Al top cap 
550915  104  -2.70     312306 -312307 -311303          imp:n=1 u=5509  $ Tri-flute 
550916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5509  $ Water around tri-flute 
550917  104  -2.70     312307 -312308 -311302          imp:n=1 u=5509  $ Fuel tip
550918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5509  $ Water around fuel tip
550919  102  -1.00     312308 -312309 -311306          imp:n=1 u=5509  $ Water above fuel element
c
c
c
c --- 5510 - Al (TOS210D130) universe ---
c
551001  104  -2.70     312300 -312301 -311302          imp:n=1 u=5510  $ Lower grid plate pin
551002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5510  $ Water around grid plate pin 
551003  104  -2.70     312301 -312302 -311305          imp:n=1 u=5510  $ Bottom casing 
551004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5510  $ Water around fuel element
551005  106  -1.56     312302 -312303 -311304          imp:n=1 u=5510  $ Lower graphite slug 
551006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5510  $ Fuel cladding
551007  108   0.042234 312303 -312304 -311301          imp:n=1 u=5510  $ Zirc pin 
551008 55101 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5510 $ Fuel meat section 1
551009 55102 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5510 $ Fuel meat section 2
551010 55103 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5510 $ Fuel meat section 3
551011 55104 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5510 $ Fuel meat section 4
551012 55105 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5510 $ Fuel meat section 5
551013  106  -1.56     312304 -312305 -311304          imp:n=1 u=5510  $ Upper graphite spacer
551014  104  -2.70     312305 -312306 -311305          imp:n=1 u=5510  $ Al top cap 
551015  104  -2.70     312306 -312307 -311303          imp:n=1 u=5510  $ Tri-flute 
551016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5510  $ Water around tri-flute 
551017  104  -2.70     312307 -312308 -311302          imp:n=1 u=5510  $ Fuel tip
551018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5510  $ Water around fuel tip
551019  102  -1.00     312308 -312309 -311306          imp:n=1 u=5510  $ Water above fuel element
c
c
c
c --- 5511 - Al (TOS210D130) universe ---
c
551101  104  -2.70     312300 -312301 -311302          imp:n=1 u=5511  $ Lower grid plate pin
551102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5511  $ Water around grid plate pin 
551103  104  -2.70     312301 -312302 -311305          imp:n=1 u=5511  $ Bottom casing 
551104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5511  $ Water around fuel element
551105  106  -1.56     312302 -312303 -311304          imp:n=1 u=5511  $ Lower graphite slug 
551106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5511  $ Fuel cladding
551107  108   0.042234 312303 -312304 -311301          imp:n=1 u=5511  $ Zirc pin 
551108 55111 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5511 $ Fuel meat section 1
551109 55112 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5511 $ Fuel meat section 2
551110 55113 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5511 $ Fuel meat section 3
551111 55114 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5511 $ Fuel meat section 4
551112 55115 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5511 $ Fuel meat section 5
551113  106  -1.56     312304 -312305 -311304          imp:n=1 u=5511  $ Upper graphite spacer
551114  104  -2.70     312305 -312306 -311305          imp:n=1 u=5511  $ Al top cap 
551115  104  -2.70     312306 -312307 -311303          imp:n=1 u=5511  $ Tri-flute 
551116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5511  $ Water around tri-flute 
551117  104  -2.70     312307 -312308 -311302          imp:n=1 u=5511  $ Fuel tip
551118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5511  $ Water around fuel tip
551119  102  -1.00     312308 -312309 -311306          imp:n=1 u=5511  $ Water above fuel element
c
c
c
c --- 5513 - Al (TOS210D130) universe ---
c
551301  104  -2.70     312300 -312301 -311302          imp:n=1 u=5513  $ Lower grid plate pin
551302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5513  $ Water around grid plate pin 
551303  104  -2.70     312301 -312302 -311305          imp:n=1 u=5513  $ Bottom casing 
551304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5513  $ Water around fuel element
551305  106  -1.56     312302 -312303 -311304          imp:n=1 u=5513  $ Lower graphite slug 
551306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5513  $ Fuel cladding
551307  108   0.042234 312303 -312304 -311301          imp:n=1 u=5513  $ Zirc pin 
551308 55131 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5513 $ Fuel meat section 1
551309 55132 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5513 $ Fuel meat section 2
551310 55133 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5513 $ Fuel meat section 3
551311 55134 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5513 $ Fuel meat section 4
551312 55135 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5513 $ Fuel meat section 5
551313  106  -1.56     312304 -312305 -311304          imp:n=1 u=5513  $ Upper graphite spacer
551314  104  -2.70     312305 -312306 -311305          imp:n=1 u=5513  $ Al top cap 
551315  104  -2.70     312306 -312307 -311303          imp:n=1 u=5513  $ Tri-flute 
551316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5513  $ Water around tri-flute 
551317  104  -2.70     312307 -312308 -311302          imp:n=1 u=5513  $ Fuel tip
551318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5513  $ Water around fuel tip
551319  102  -1.00     312308 -312309 -311306          imp:n=1 u=5513  $ Water above fuel element
c
c
c
c --- 5514 - Al (TOS210D130) universe ---
c
551401  104  -2.70     312300 -312301 -311302          imp:n=1 u=5514  $ Lower grid plate pin
551402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5514  $ Water around grid plate pin 
551403  104  -2.70     312301 -312302 -311305          imp:n=1 u=5514  $ Bottom casing 
551404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5514  $ Water around fuel element
551405  106  -1.56     312302 -312303 -311304          imp:n=1 u=5514  $ Lower graphite slug 
551406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5514  $ Fuel cladding
551407  108   0.042234 312303 -312304 -311301          imp:n=1 u=5514  $ Zirc pin 
551408 55141 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5514 $ Fuel meat section 1
551409 55142 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5514 $ Fuel meat section 2
551410 55143 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5514 $ Fuel meat section 3
551411 55144 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5514 $ Fuel meat section 4
551412 55145 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5514 $ Fuel meat section 5
551413  106  -1.56     312304 -312305 -311304          imp:n=1 u=5514  $ Upper graphite spacer
551414  104  -2.70     312305 -312306 -311305          imp:n=1 u=5514  $ Al top cap 
551415  104  -2.70     312306 -312307 -311303          imp:n=1 u=5514  $ Tri-flute 
551416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5514  $ Water around tri-flute 
551417  104  -2.70     312307 -312308 -311302          imp:n=1 u=5514  $ Fuel tip
551418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5514  $ Water around fuel tip
551419  102  -1.00     312308 -312309 -311306          imp:n=1 u=5514  $ Water above fuel element
c
c
c
c --- 5515 - Al (TOS210D130) universe ---
c
551501  104  -2.70     312300 -312301 -311302          imp:n=1 u=5515  $ Lower grid plate pin
551502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5515  $ Water around grid plate pin 
551503  104  -2.70     312301 -312302 -311305          imp:n=1 u=5515  $ Bottom casing 
551504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5515  $ Water around fuel element
551505  106  -1.56     312302 -312303 -311304          imp:n=1 u=5515  $ Lower graphite slug 
551506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5515  $ Fuel cladding
551507  108   0.042234 312303 -312304 -311301          imp:n=1 u=5515  $ Zirc pin 
551508 55151 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5515 $ Fuel meat section 1
551509 55152 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5515 $ Fuel meat section 2
551510 55153 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5515 $ Fuel meat section 3
551511 55154 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5515 $ Fuel meat section 4
551512 55155 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5515 $ Fuel meat section 5
551513  106  -1.56     312304 -312305 -311304          imp:n=1 u=5515  $ Upper graphite spacer
551514  104  -2.70     312305 -312306 -311305          imp:n=1 u=5515  $ Al top cap 
551515  104  -2.70     312306 -312307 -311303          imp:n=1 u=5515  $ Tri-flute 
551516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5515  $ Water around tri-flute 
551517  104  -2.70     312307 -312308 -311302          imp:n=1 u=5515  $ Fuel tip
551518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5515  $ Water around fuel tip
551519  102  -1.00     312308 -312309 -311306          imp:n=1 u=5515  $ Water above fuel element
c
c
c
c --- 5516 - Al (TOS210D130) universe ---
c
551601  104  -2.70     312300 -312301 -311302          imp:n=1 u=5516  $ Lower grid plate pin
551602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5516  $ Water around grid plate pin 
551603  104  -2.70     312301 -312302 -311305          imp:n=1 u=5516  $ Bottom casing 
551604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5516  $ Water around fuel element
551605  106  -1.56     312302 -312303 -311304          imp:n=1 u=5516  $ Lower graphite slug 
551606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5516  $ Fuel cladding
551607  108   0.042234 312303 -312304 -311301          imp:n=1 u=5516  $ Zirc pin 
551608 55161 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5516 $ Fuel meat section 1
551609 55162 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5516 $ Fuel meat section 2
551610 55163 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5516 $ Fuel meat section 3
551611 55164 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5516 $ Fuel meat section 4
551612 55165 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5516 $ Fuel meat section 5
551613  106  -1.56     312304 -312305 -311304          imp:n=1 u=5516  $ Upper graphite spacer
551614  104  -2.70     312305 -312306 -311305          imp:n=1 u=5516  $ Al top cap 
551615  104  -2.70     312306 -312307 -311303          imp:n=1 u=5516  $ Tri-flute 
551616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5516  $ Water around tri-flute 
551617  104  -2.70     312307 -312308 -311302          imp:n=1 u=5516  $ Fuel tip
551618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5516  $ Water around fuel tip
551619  102  -1.00     312308 -312309 -311306          imp:n=1 u=5516  $ Water above fuel element
c
c
c
c --- 5517 - Al (TOS210D130) universe ---
c
551701  104  -2.70     312300 -312301 -311302          imp:n=1 u=5517  $ Lower grid plate pin
551702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5517  $ Water around grid plate pin 
551703  104  -2.70     312301 -312302 -311305          imp:n=1 u=5517  $ Bottom casing 
551704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5517  $ Water around fuel element
551705  106  -1.56     312302 -312303 -311304          imp:n=1 u=5517  $ Lower graphite slug 
551706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5517  $ Fuel cladding
551707  108   0.042234 312303 -312304 -311301          imp:n=1 u=5517  $ Zirc pin 
551708 55171 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5517 $ Fuel meat section 1
551709 55172 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5517 $ Fuel meat section 2
551710 55173 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5517 $ Fuel meat section 3
551711 55174 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5517 $ Fuel meat section 4
551712 55175 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5517 $ Fuel meat section 5
551713  106  -1.56     312304 -312305 -311304          imp:n=1 u=5517  $ Upper graphite spacer
551714  104  -2.70     312305 -312306 -311305          imp:n=1 u=5517  $ Al top cap 
551715  104  -2.70     312306 -312307 -311303          imp:n=1 u=5517  $ Tri-flute 
551716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5517  $ Water around tri-flute 
551717  104  -2.70     312307 -312308 -311302          imp:n=1 u=5517  $ Fuel tip
551718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5517  $ Water around fuel tip
551719  102  -1.00     312308 -312309 -311306          imp:n=1 u=5517  $ Water above fuel element
c
c
c
c --- 5518 - Al (TOS210D130) universe ---
c
551801  104  -2.70     312300 -312301 -311302          imp:n=1 u=5518  $ Lower grid plate pin
551802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5518  $ Water around grid plate pin 
551803  104  -2.70     312301 -312302 -311305          imp:n=1 u=5518  $ Bottom casing 
551804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5518  $ Water around fuel element
551805  106  -1.56     312302 -312303 -311304          imp:n=1 u=5518  $ Lower graphite slug 
551806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5518  $ Fuel cladding
551807  108   0.042234 312303 -312304 -311301          imp:n=1 u=5518  $ Zirc pin 
551808 55181 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5518 $ Fuel meat section 1
551809 55182 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5518 $ Fuel meat section 2
551810 55183 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5518 $ Fuel meat section 3
551811 55184 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5518 $ Fuel meat section 4
551812 55185 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5518 $ Fuel meat section 5
551813  106  -1.56     312304 -312305 -311304          imp:n=1 u=5518  $ Upper graphite spacer
551814  104  -2.70     312305 -312306 -311305          imp:n=1 u=5518  $ Al top cap 
551815  104  -2.70     312306 -312307 -311303          imp:n=1 u=5518  $ Tri-flute 
551816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5518  $ Water around tri-flute 
551817  104  -2.70     312307 -312308 -311302          imp:n=1 u=5518  $ Fuel tip
551818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5518  $ Water around fuel tip
551819  102  -1.00     312308 -312309 -311306          imp:n=1 u=5518  $ Water above fuel element
c
c
c
c --- 5519 - Al (TOS210D130) universe ---
c
551901  104  -2.70     312300 -312301 -311302          imp:n=1 u=5519  $ Lower grid plate pin
551902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5519  $ Water around grid plate pin 
551903  104  -2.70     312301 -312302 -311305          imp:n=1 u=5519  $ Bottom casing 
551904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5519  $ Water around fuel element
551905  106  -1.56     312302 -312303 -311304          imp:n=1 u=5519  $ Lower graphite slug 
551906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5519  $ Fuel cladding
551907  108   0.042234 312303 -312304 -311301          imp:n=1 u=5519  $ Zirc pin 
551908 55191 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5519 $ Fuel meat section 1
551909 55192 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5519 $ Fuel meat section 2
551910 55193 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5519 $ Fuel meat section 3
551911 55194 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5519 $ Fuel meat section 4
551912 55195 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5519 $ Fuel meat section 5
551913  106  -1.56     312304 -312305 -311304          imp:n=1 u=5519  $ Upper graphite spacer
551914  104  -2.70     312305 -312306 -311305          imp:n=1 u=5519  $ Al top cap 
551915  104  -2.70     312306 -312307 -311303          imp:n=1 u=5519  $ Tri-flute 
551916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5519  $ Water around tri-flute 
551917  104  -2.70     312307 -312308 -311302          imp:n=1 u=5519  $ Fuel tip
551918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5519  $ Water around fuel tip
551919  102  -1.00     312308 -312309 -311306          imp:n=1 u=5519  $ Water above fuel element
c
c
c
c --- 5520 - Al (TOS210D130) universe ---
c
552001  104  -2.70     312300 -312301 -311302          imp:n=1 u=5520  $ Lower grid plate pin
552002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5520  $ Water around grid plate pin 
552003  104  -2.70     312301 -312302 -311305          imp:n=1 u=5520  $ Bottom casing 
552004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5520  $ Water around fuel element
552005  106  -1.56     312302 -312303 -311304          imp:n=1 u=5520  $ Lower graphite slug 
552006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5520  $ Fuel cladding
552007  108   0.042234 312303 -312304 -311301          imp:n=1 u=5520  $ Zirc pin 
552008 55201 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5520 $ Fuel meat section 1
552009 55202 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5520 $ Fuel meat section 2
552010 55203 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5520 $ Fuel meat section 3
552011 55204 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5520 $ Fuel meat section 4
552012 55205 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5520 $ Fuel meat section 5
552013  106  -1.56     312304 -312305 -311304          imp:n=1 u=5520  $ Upper graphite spacer
552014  104  -2.70     312305 -312306 -311305          imp:n=1 u=5520  $ Al top cap 
552015  104  -2.70     312306 -312307 -311303          imp:n=1 u=5520  $ Tri-flute 
552016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5520  $ Water around tri-flute 
552017  104  -2.70     312307 -312308 -311302          imp:n=1 u=5520  $ Fuel tip
552018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5520  $ Water around fuel tip
552019  102  -1.00     312308 -312309 -311306          imp:n=1 u=5520  $ Water above fuel element
c
c
c
c --- 5521 - Al (TOS210D130) universe ---
c
552101  104  -2.70     312300 -312301 -311302          imp:n=1 u=5521  $ Lower grid plate pin
552102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5521  $ Water around grid plate pin 
552103  104  -2.70     312301 -312302 -311305          imp:n=1 u=5521  $ Bottom casing 
552104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5521  $ Water around fuel element
552105  106  -1.56     312302 -312303 -311304          imp:n=1 u=5521  $ Lower graphite slug 
552106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5521  $ Fuel cladding
552107  108   0.042234 312303 -312304 -311301          imp:n=1 u=5521  $ Zirc pin 
552108 55211 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5521 $ Fuel meat section 1
552109 55212 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5521 $ Fuel meat section 2
552110 55213 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5521 $ Fuel meat section 3
552111 55214 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5521 $ Fuel meat section 4
552112 55215 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5521 $ Fuel meat section 5
552113  106  -1.56     312304 -312305 -311304          imp:n=1 u=5521  $ Upper graphite spacer
552114  104  -2.70     312305 -312306 -311305          imp:n=1 u=5521  $ Al top cap 
552115  104  -2.70     312306 -312307 -311303          imp:n=1 u=5521  $ Tri-flute 
552116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5521  $ Water around tri-flute 
552117  104  -2.70     312307 -312308 -311302          imp:n=1 u=5521  $ Fuel tip
552118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5521  $ Water around fuel tip
552119  102  -1.00     312308 -312309 -311306          imp:n=1 u=5521  $ Water above fuel element
c
c
c
c --- 5522 - Al (TOS210D130) universe ---
c
552201  104  -2.70     312300 -312301 -311302          imp:n=1 u=5522  $ Lower grid plate pin
552202  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5522  $ Water around grid plate pin 
552203  104  -2.70     312301 -312302 -311305          imp:n=1 u=5522  $ Bottom casing 
552204  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5522  $ Water around fuel element
552205  106  -1.56     312302 -312303 -311304          imp:n=1 u=5522  $ Lower graphite slug 
552206  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5522  $ Fuel cladding
552207  108   0.042234 312303 -312304 -311301          imp:n=1 u=5522  $ Zirc pin 
552208 55221 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5522 $ Fuel meat section 1
552209 55222 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5522 $ Fuel meat section 2
552210 55223 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5522 $ Fuel meat section 3
552211 55224 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5522 $ Fuel meat section 4
552212 55225 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5522 $ Fuel meat section 5
552213  106  -1.56     312304 -312305 -311304          imp:n=1 u=5522  $ Upper graphite spacer
552214  104  -2.70     312305 -312306 -311305          imp:n=1 u=5522  $ Al top cap 
552215  104  -2.70     312306 -312307 -311303          imp:n=1 u=5522  $ Tri-flute 
552216  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5522  $ Water around tri-flute 
552217  104  -2.70     312307 -312308 -311302          imp:n=1 u=5522  $ Fuel tip
552218  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5522  $ Water around fuel tip
552219  102  -1.00     312308 -312309 -311306          imp:n=1 u=5522  $ Water above fuel element
c
c
c
c --- 5523 - Al (TOS210D130) universe ---
c
552301  104  -2.70     312300 -312301 -311302          imp:n=1 u=5523  $ Lower grid plate pin
552302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5523  $ Water around grid plate pin 
552303  104  -2.70     312301 -312302 -311305          imp:n=1 u=5523  $ Bottom casing 
552304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5523  $ Water around fuel element
552305  106  -1.56     312302 -312303 -311304          imp:n=1 u=5523  $ Lower graphite slug 
552306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5523  $ Fuel cladding
552307  108   0.042234 312303 -312304 -311301          imp:n=1 u=5523  $ Zirc pin 
552308 55231 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5523 $ Fuel meat section 1
552309 55232 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5523 $ Fuel meat section 2
552310 55233 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5523 $ Fuel meat section 3
552311 55234 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5523 $ Fuel meat section 4
552312 55235 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5523 $ Fuel meat section 5
552313  106  -1.56     312304 -312305 -311304          imp:n=1 u=5523  $ Upper graphite spacer
552314  104  -2.70     312305 -312306 -311305          imp:n=1 u=5523  $ Al top cap 
552315  104  -2.70     312306 -312307 -311303          imp:n=1 u=5523  $ Tri-flute 
552316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5523  $ Water around tri-flute 
552317  104  -2.70     312307 -312308 -311302          imp:n=1 u=5523  $ Fuel tip
552318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5523  $ Water around fuel tip
552319  102  -1.00     312308 -312309 -311306          imp:n=1 u=5523  $ Water above fuel element
c
c
c
c --- 5524 - Al (TOS210D130) universe ---
c
552401  104  -2.70     312300 -312301 -311302          imp:n=1 u=5524  $ Lower grid plate pin
552402  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5524  $ Water around grid plate pin 
552403  104  -2.70     312301 -312302 -311305          imp:n=1 u=5524  $ Bottom casing 
552404  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5524  $ Water around fuel element
552405  106  -1.56     312302 -312303 -311304          imp:n=1 u=5524  $ Lower graphite slug 
552406  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5524  $ Fuel cladding
552407  108   0.042234 312303 -312304 -311301          imp:n=1 u=5524  $ Zirc pin 
552408 55241 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5524 $ Fuel meat section 1
552409 55242 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5524 $ Fuel meat section 2
552410 55243 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5524 $ Fuel meat section 3
552411 55244 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5524 $ Fuel meat section 4
552412 55245 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5524 $ Fuel meat section 5
552413  106  -1.56     312304 -312305 -311304          imp:n=1 u=5524  $ Upper graphite spacer
552414  104  -2.70     312305 -312306 -311305          imp:n=1 u=5524  $ Al top cap 
552415  104  -2.70     312306 -312307 -311303          imp:n=1 u=5524  $ Tri-flute 
552416  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5524  $ Water around tri-flute 
552417  104  -2.70     312307 -312308 -311302          imp:n=1 u=5524  $ Fuel tip
552418  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5524  $ Water around fuel tip
552419  102  -1.00     312308 -312309 -311306          imp:n=1 u=5524  $ Water above fuel element
c
c
c
c --- 5525 - Al (TOS210D130) universe ---
c
552501  104  -2.70     312300 -312301 -311302          imp:n=1 u=5525  $ Lower grid plate pin
552502  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5525  $ Water around grid plate pin 
552503  104  -2.70     312301 -312302 -311305          imp:n=1 u=5525  $ Bottom casing 
552504  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5525  $ Water around fuel element
552505  106  -1.56     312302 -312303 -311304          imp:n=1 u=5525  $ Lower graphite slug 
552506  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5525  $ Fuel cladding
552507  108   0.042234 312303 -312304 -311301          imp:n=1 u=5525  $ Zirc pin 
552508 55251 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5525 $ Fuel meat section 1
552509 55252 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5525 $ Fuel meat section 2
552510 55253 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5525 $ Fuel meat section 3
552511 55254 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5525 $ Fuel meat section 4
552512 55255 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5525 $ Fuel meat section 5
552513  106  -1.56     312304 -312305 -311304          imp:n=1 u=5525  $ Upper graphite spacer
552514  104  -2.70     312305 -312306 -311305          imp:n=1 u=5525  $ Al top cap 
552515  104  -2.70     312306 -312307 -311303          imp:n=1 u=5525  $ Tri-flute 
552516  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5525  $ Water around tri-flute 
552517  104  -2.70     312307 -312308 -311302          imp:n=1 u=5525  $ Fuel tip
552518  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5525  $ Water around fuel tip
552519  102  -1.00     312308 -312309 -311306          imp:n=1 u=5525  $ Water above fuel element
c
c
c
c --- 5526 - Al (TOS210D130) universe ---
c
552601  104  -2.70     312300 -312301 -311302          imp:n=1 u=5526  $ Lower grid plate pin
552602  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5526  $ Water around grid plate pin 
552603  104  -2.70     312301 -312302 -311305          imp:n=1 u=5526  $ Bottom casing 
552604  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5526  $ Water around fuel element
552605  106  -1.56     312302 -312303 -311304          imp:n=1 u=5526  $ Lower graphite slug 
552606  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5526  $ Fuel cladding
552607  108   0.042234 312303 -312304 -311301          imp:n=1 u=5526  $ Zirc pin 
552608 55261 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5526 $ Fuel meat section 1
552609 55262 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5526 $ Fuel meat section 2
552610 55263 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5526 $ Fuel meat section 3
552611 55264 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5526 $ Fuel meat section 4
552612 55265 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5526 $ Fuel meat section 5
552613  106  -1.56     312304 -312305 -311304          imp:n=1 u=5526  $ Upper graphite spacer
552614  104  -2.70     312305 -312306 -311305          imp:n=1 u=5526  $ Al top cap 
552615  104  -2.70     312306 -312307 -311303          imp:n=1 u=5526  $ Tri-flute 
552616  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5526  $ Water around tri-flute 
552617  104  -2.70     312307 -312308 -311302          imp:n=1 u=5526  $ Fuel tip
552618  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5526  $ Water around fuel tip
552619  102  -1.00     312308 -312309 -311306          imp:n=1 u=5526  $ Water above fuel element
c
c
c
c --- 5527 - Al (TOS210D130) universe ---
c
552701  104  -2.70     312300 -312301 -311302          imp:n=1 u=5527  $ Lower grid plate pin
552702  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5527  $ Water around grid plate pin 
552703  104  -2.70     312301 -312302 -311305          imp:n=1 u=5527  $ Bottom casing 
552704  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5527  $ Water around fuel element
552705  106  -1.56     312302 -312303 -311304          imp:n=1 u=5527  $ Lower graphite slug 
552706  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5527  $ Fuel cladding
552707  108   0.042234 312303 -312304 -311301          imp:n=1 u=5527  $ Zirc pin 
552708 55271 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5527 $ Fuel meat section 1
552709 55272 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5527 $ Fuel meat section 2
552710 55273 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5527 $ Fuel meat section 3
552711 55274 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5527 $ Fuel meat section 4
552712 55275 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5527 $ Fuel meat section 5
552713  106  -1.56     312304 -312305 -311304          imp:n=1 u=5527  $ Upper graphite spacer
552714  104  -2.70     312305 -312306 -311305          imp:n=1 u=5527  $ Al top cap 
552715  104  -2.70     312306 -312307 -311303          imp:n=1 u=5527  $ Tri-flute 
552716  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5527  $ Water around tri-flute 
552717  104  -2.70     312307 -312308 -311302          imp:n=1 u=5527  $ Fuel tip
552718  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5527  $ Water around fuel tip
552719  102  -1.00     312308 -312309 -311306          imp:n=1 u=5527  $ Water above fuel element
c
c
c
c --- 5528 - Al (TOS210D130) universe ---
c
552801  104  -2.70     312300 -312301 -311302          imp:n=1 u=5528  $ Lower grid plate pin
552802  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5528  $ Water around grid plate pin 
552803  104  -2.70     312301 -312302 -311305          imp:n=1 u=5528  $ Bottom casing 
552804  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5528  $ Water around fuel element
552805  106  -1.56     312302 -312303 -311304          imp:n=1 u=5528  $ Lower graphite slug 
552806  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5528  $ Fuel cladding
552807  108   0.042234 312303 -312304 -311301          imp:n=1 u=5528  $ Zirc pin 
552808 55281 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5528 $ Fuel meat section 1
552809 55282 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5528 $ Fuel meat section 2
552810 55283 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5528 $ Fuel meat section 3
552811 55284 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5528 $ Fuel meat section 4
552812 55285 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5528 $ Fuel meat section 5
552813  106  -1.56     312304 -312305 -311304          imp:n=1 u=5528  $ Upper graphite spacer
552814  104  -2.70     312305 -312306 -311305          imp:n=1 u=5528  $ Al top cap 
552815  104  -2.70     312306 -312307 -311303          imp:n=1 u=5528  $ Tri-flute 
552816  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5528  $ Water around tri-flute 
552817  104  -2.70     312307 -312308 -311302          imp:n=1 u=5528  $ Fuel tip
552818  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5528  $ Water around fuel tip
552819  102  -1.00     312308 -312309 -311306          imp:n=1 u=5528  $ Water above fuel element
c
c
c
c --- 5529 - Al (TOS210D130) universe ---
c
552901  104  -2.70     312300 -312301 -311302          imp:n=1 u=5529  $ Lower grid plate pin
552902  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5529  $ Water around grid plate pin 
552903  104  -2.70     312301 -312302 -311305          imp:n=1 u=5529  $ Bottom casing 
552904  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5529  $ Water around fuel element
552905  106  -1.56     312302 -312303 -311304          imp:n=1 u=5529  $ Lower graphite slug 
552906  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5529  $ Fuel cladding
552907  108   0.042234 312303 -312304 -311301          imp:n=1 u=5529  $ Zirc pin 
552908 55291 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5529 $ Fuel meat section 1
552909 55292 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5529 $ Fuel meat section 2
552910 55293 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5529 $ Fuel meat section 3
552911 55294 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5529 $ Fuel meat section 4
552912 55295 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5529 $ Fuel meat section 5
552913  106  -1.56     312304 -312305 -311304          imp:n=1 u=5529  $ Upper graphite spacer
552914  104  -2.70     312305 -312306 -311305          imp:n=1 u=5529  $ Al top cap 
552915  104  -2.70     312306 -312307 -311303          imp:n=1 u=5529  $ Tri-flute 
552916  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5529  $ Water around tri-flute 
552917  104  -2.70     312307 -312308 -311302          imp:n=1 u=5529  $ Fuel tip
552918  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5529  $ Water around fuel tip
552919  102  -1.00     312308 -312309 -311306          imp:n=1 u=5529  $ Water above fuel element
c
c
c
c --- 5530 - Al (TOS210D130) universe ---
c
553001  104  -2.70     312300 -312301 -311302          imp:n=1 u=5530  $ Lower grid plate pin
553002  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5530  $ Water around grid plate pin 
553003  104  -2.70     312301 -312302 -311305          imp:n=1 u=5530  $ Bottom casing 
553004  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5530  $ Water around fuel element
553005  106  -1.56     312302 -312303 -311304          imp:n=1 u=5530  $ Lower graphite slug 
553006  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5530  $ Fuel cladding
553007  108   0.042234 312303 -312304 -311301          imp:n=1 u=5530  $ Zirc pin 
553008 55301 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5530 $ Fuel meat section 1
553009 55302 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5530 $ Fuel meat section 2
553010 55303 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5530 $ Fuel meat section 3
553011 55304 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5530 $ Fuel meat section 4
553012 55305 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5530 $ Fuel meat section 5
553013  106  -1.56     312304 -312305 -311304          imp:n=1 u=5530  $ Upper graphite spacer
553014  104  -2.70     312305 -312306 -311305          imp:n=1 u=5530  $ Al top cap 
553015  104  -2.70     312306 -312307 -311303          imp:n=1 u=5530  $ Tri-flute 
553016  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5530  $ Water around tri-flute 
553017  104  -2.70     312307 -312308 -311302          imp:n=1 u=5530  $ Fuel tip
553018  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5530  $ Water around fuel tip
553019  102  -1.00     312308 -312309 -311306          imp:n=1 u=5530  $ Water above fuel element
c
c
c
c --- 5531 - Al (TOS210D130) universe ---
c
553101  104  -2.70     312300 -312301 -311302          imp:n=1 u=5531  $ Lower grid plate pin
553102  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5531  $ Water around grid plate pin 
553103  104  -2.70     312301 -312302 -311305          imp:n=1 u=5531  $ Bottom casing 
553104  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5531  $ Water around fuel element
553105  106  -1.56     312302 -312303 -311304          imp:n=1 u=5531  $ Lower graphite slug 
553106  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5531  $ Fuel cladding
553107  108   0.042234 312303 -312304 -311301          imp:n=1 u=5531  $ Zirc pin 
553108 55311 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5531 $ Fuel meat section 1
553109 55312 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5531 $ Fuel meat section 2
553110 55313 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5531 $ Fuel meat section 3
553111 55314 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5531 $ Fuel meat section 4
553112 55315 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5531 $ Fuel meat section 5
553113  106  -1.56     312304 -312305 -311304          imp:n=1 u=5531  $ Upper graphite spacer
553114  104  -2.70     312305 -312306 -311305          imp:n=1 u=5531  $ Al top cap 
553115  104  -2.70     312306 -312307 -311303          imp:n=1 u=5531  $ Tri-flute 
553116  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5531  $ Water around tri-flute 
553117  104  -2.70     312307 -312308 -311302          imp:n=1 u=5531  $ Fuel tip
553118  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5531  $ Water around fuel tip
553119  102  -1.00     312308 -312309 -311306          imp:n=1 u=5531  $ Water above fuel element
c
c
c
c --- 5533 - Al (TOS210D130) universe ---
c
553301  104  -2.70     312300 -312301 -311302          imp:n=1 u=5533  $ Lower grid plate pin
553302  102  -1.00     312300 -312301  311302 -311306  imp:n=1 u=5533  $ Water around grid plate pin 
553303  104  -2.70     312301 -312302 -311305          imp:n=1 u=5533  $ Bottom casing 
553304  102  -1.00     312301 -312306  311305 -311306  imp:n=1 u=5533  $ Water around fuel element
553305  106  -1.56     312302 -312303 -311304          imp:n=1 u=5533  $ Lower graphite slug 
553306  104  -2.70     312302 -312305  311304 -311305  imp:n=1 u=5533  $ Fuel cladding
553307  108   0.042234 312303 -312304 -311301          imp:n=1 u=5533  $ Zirc pin 
553308 55331 -5.66 312303 -302303  311301 -311304 vol=77.096 imp:n=1 u=5533 $ Fuel meat section 1
553309 55332 -5.66 302303 -302306  311301 -311304 vol=77.096 imp:n=1 u=5533 $ Fuel meat section 2
553310 55333 -5.66 302306 -302309  311301 -311304 vol=77.096 imp:n=1 u=5533 $ Fuel meat section 3
553311 55334 -5.66 302309 -302312  311301 -311304 vol=77.096 imp:n=1 u=5533 $ Fuel meat section 4
553312 55335 -5.66 302312 -312304  311301 -311304 vol=77.096 imp:n=1 u=5533 $ Fuel meat section 5
553313  106  -1.56     312304 -312305 -311304          imp:n=1 u=5533  $ Upper graphite spacer
553314  104  -2.70     312305 -312306 -311305          imp:n=1 u=5533  $ Al top cap 
553315  104  -2.70     312306 -312307 -311303          imp:n=1 u=5533  $ Tri-flute 
553316  102  -1.00     312306 -312307  311303 -311306  imp:n=1 u=5533  $ Water around tri-flute 
553317  104  -2.70     312307 -312308 -311302          imp:n=1 u=5533  $ Fuel tip
553318  102  -1.00     312307 -312308  311302 -311306  imp:n=1 u=5533  $ Water around fuel tip
553319  102  -1.00     312308 -312309 -311306          imp:n=1 u=5533  $ Water above fuel element
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
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
c ----- Air components ---- 
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
c ---- Poly components -----  (Comment out to make empty rabbit terminus)
c
c 60940  109  -0.97   502312 -552302 -501308                   imp:n=1   $ bottom of rabbit tube
c 60941  109  -0.97   502312 -552312  501308 -501301           imp:n=1   $ Main section rabbit tube
c 60942  109  -0.97   502312 -552304  501301 -501318 -553301   imp:n=1   $ Rabbit tube lower bevel lower section
c 60943  109  -0.97   552304 -552306  501301 -501318 -553302   imp:n=1   $ Rabbit tube lower bevel upper section
c 60944  109  -0.97  -552312  501301 -553303  552310 -501317   imp:n=1   $ Rabbit tube upper bevel
c 60945  109  -0.97   552312 -552313  501308 -501317           imp:n=1   $ Rabbit tube upper section
c 60946  109  -0.97   552314 -552315 -501318                   imp:n=1   $ Rabbit tube cap upper section
c 60947  109  -0.97   552313 -552314  501308 -501318           imp:n=1   $ Rabbit tube tube
c c
c 60960  109  -0.97   552302 -552303 -501308                   imp:n=1   $ Outer vial bottom
c 60961  109  -0.97   552303 -552309  501313 -501308           imp:n=1   $ Outer vial tube
c 60962  109  -0.97   552309 -552310 -501308                   imp:n=1   $ Outer vial top
c c
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
c the "bottom of control rod" has z-position 0 at 0 % and 53.2694 at 100 %
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
812301   pz    49.0728   $ top of control rod
812302   pz    48.3108   $ top of main section
812303   pz    47.6758   $ top of poison portion
812304   pz     1.6002   $ bottom of poison portion
812305   pz     0.9652   $ bottom of main section
812306   pz     0.5588   $ bottom of outer lower cone
812307   pz     0.00001   $ bottom of control rod
c
c
c k/z surfaces
c
813301   k/z  6.91134   -3.99034   51.97426154   0.1877777777   $ upper beveling
813302   k/z  6.91134   -3.99034   -0.98865   0.66015625   $ lower outer beveling
813303   k/z  6.91134   -3.99034    0.00001   5.0625   $ lower inner beveling
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
822301   pz    49.0728   $ top of control rod
822302   pz    48.3108   $ top of main section
822303   pz    47.6758   $ top of poison portion
822304   pz     1.6002   $ bottom of poison portion
822305   pz     0.9652   $ bottom of main section
822306   pz     0.5588   $ bottom of outer lower cone
822307   pz     0.00001   $ bottom of control rod
c
c
c k/z surfaces
c
823301   k/z  -6.91134   -3.99034   51.97426154    0.1877777777   $ upper beveling
823302   k/z  -6.91134   -3.99034   -0.98865   0.66015625   $ lower outer beveling
823303   k/z  -6.91134   -3.99034    0.00001   5.0625   $ lower inner beveling
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
832301   pz    49.0728   $ top of control rod
832302   pz    48.3108   $ top of main section
832303   pz    47.6758   $ top of poison portion
832304   pz     1.6002   $ bottom of poison portion
832305   pz     0.9652   $ bottom of main section
832306   pz     0.5588   $ bottom of outer lower cone
832307   pz     0.00001   $ bottom of control rod
c
c
c k/z surfaces
c
833301   k/z  -6.91134   -3.99034   51.97426154    0.1877777777   $ upper beveling
833302   k/z  -6.91134   -3.99034   -0.98865   0.66015625   $ lower outer beveling
833303   k/z  -6.91134   -3.99034    0.00001   5.0625   $ lower inner beveling
c
c
c
c
c
c
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
c -------- Fuel surfaces ------- TODO 
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
m2771   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03  
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03  
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt2771  h/zr.10t zr/h.10t
c
c
m2772   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt2772  h/zr.10t zr/h.10t
c
c
m2773   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt2773  h/zr.10t zr/h.10t
c
c
m2774   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt2774  h/zr.10t zr/h.10t
c
c
m2775   92235.80c 1.1964E-04  92238.80c 4.7999E-04  40090.80c 8.4421E-03
        40091.80c 1.8417E-03  40092.80c 2.8151E-03  40094.80c 2.8520E-03
        40096.80c 4.6088E-04   1001.80c 1.6407E-02
c
mt2775  h/zr.10t zr/h.10t
c
c
c
c
c
m14711  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02  
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03  
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt14711 h/zr.10t zr/h.10t
c
c
m14712  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt14712 h/zr.10t zr/h.10t
c
c
m14713  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt14713 h/zr.10t zr/h.10t
c
c
m14714  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt14714 h/zr.10t zr/h.10t
c
c
m14715  92235.80c 1.8610E-04  92238.80c 7.4665E-04  40090.80c 1.4085E-02
        40091.80c 3.0728E-03  40092.80c 4.6970E-03  40094.80c 4.7585E-03
        40096.80c 7.6896E-04   1001.80c 2.7375E-02
c
mt14715 h/zr.10t zr/h.10t
c
c
c
c
c
m49681  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt49681 h/zr.10t zr/h.10t
c
c
m49682  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt49682 h/zr.10t zr/h.10t
c
c
m49683  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt49683 h/zr.10t zr/h.10t
c
c
m49684  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt49684 h/zr.10t zr/h.10t
c
c
m49685  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt49685 h/zr.10t zr/h.10t
c
c
c
c
c
m49701  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt49701 h/zr.10t zr/h.10t
c
c
m49702  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt49702 h/zr.10t zr/h.10t
c
c
m49703  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt49703 h/zr.10t zr/h.10t
c
c
m49704  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt49704 h/zr.10t zr/h.10t
c
c
m49705  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt49705 h/zr.10t zr/h.10t
c
c
c
c
c
m54721  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54721 h/zr.10t zr/h.10t
c
c
m54722  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54722 h/zr.10t zr/h.10t
c
c
m54723  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54723 h/zr.10t zr/h.10t
c
c
m54724  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54724 h/zr.10t zr/h.10t
c
c
m54725  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54725 h/zr.10t zr/h.10t
c
c
c
c
c
m54731  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54731 h/zr.10t zr/h.10t
c
c
m54732  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54732 h/zr.10t zr/h.10t
c
c
m54733  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54733 h/zr.10t zr/h.10t
c
c
m54734  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54734 h/zr.10t zr/h.10t
c
c
m54735  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54735 h/zr.10t zr/h.10t
c
c
c
c
c
m54741  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54741 h/zr.10t zr/h.10t
c
c
m54742  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54742 h/zr.10t zr/h.10t
c
c
m54743  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54743 h/zr.10t zr/h.10t
c
c
m54744  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54744 h/zr.10t zr/h.10t
c
c
m54745  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54745 h/zr.10t zr/h.10t
c
c
c
c
c
m54751  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54751 h/zr.10t zr/h.10t
c
c
m54752  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54752 h/zr.10t zr/h.10t
c
c
m54753  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54753 h/zr.10t zr/h.10t
c
c
m54754  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54754 h/zr.10t zr/h.10t
c
c
m54755  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54755 h/zr.10t zr/h.10t
c
c
c
c
c
m54761  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54761 h/zr.10t zr/h.10t
c
c
m54762  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54762 h/zr.10t zr/h.10t
c
c
m54763  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54763 h/zr.10t zr/h.10t
c
c
m54764  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54764 h/zr.10t zr/h.10t
c
c
m54765  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54765 h/zr.10t zr/h.10t
c
c
c
c
c
m54771  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54771 h/zr.10t zr/h.10t
c
c
m54772  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54772 h/zr.10t zr/h.10t
c
c
m54773  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54773 h/zr.10t zr/h.10t
c
c
m54774  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54774 h/zr.10t zr/h.10t
c
c
m54775  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54775 h/zr.10t zr/h.10t
c
c
c
c
c
m54781  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54781 h/zr.10t zr/h.10t
c
c
m54782  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54782 h/zr.10t zr/h.10t
c
c
m54783  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54783 h/zr.10t zr/h.10t
c
c
m54784  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54784 h/zr.10t zr/h.10t
c
c
m54785  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54785 h/zr.10t zr/h.10t
c
c
c
c
c
m54791  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54791 h/zr.10t zr/h.10t
c
c
m54792  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54792 h/zr.10t zr/h.10t
c
c
m54793  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54793 h/zr.10t zr/h.10t
c
c
m54794  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54794 h/zr.10t zr/h.10t
c
c
m54795  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54795 h/zr.10t zr/h.10t
c
c
c
c
c
m54801  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54801 h/zr.10t zr/h.10t
c
c
m54802  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54802 h/zr.10t zr/h.10t
c
c
m54803  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54803 h/zr.10t zr/h.10t
c
c
m54804  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54804 h/zr.10t zr/h.10t
c
c
m54805  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54805 h/zr.10t zr/h.10t
c
c
c
c
c
m54811  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54811 h/zr.10t zr/h.10t
c
c
m54812  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54812 h/zr.10t zr/h.10t
c
c
m54813  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54813 h/zr.10t zr/h.10t
c
c
m54814  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54814 h/zr.10t zr/h.10t
c
c
m54815  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54815 h/zr.10t zr/h.10t
c
c
c
c
c
m54821  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54821 h/zr.10t zr/h.10t
c
c
m54822  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54822 h/zr.10t zr/h.10t
c
c
m54823  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54823 h/zr.10t zr/h.10t
c
c
m54824  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54824 h/zr.10t zr/h.10t
c
c
m54825  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54825 h/zr.10t zr/h.10t
c
c
c
c
c
m54831  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54831 h/zr.10t zr/h.10t
c
c
m54832  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54832 h/zr.10t zr/h.10t
c
c
m54833  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54833 h/zr.10t zr/h.10t
c
c
m54834  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54834 h/zr.10t zr/h.10t
c
c
m54835  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54835 h/zr.10t zr/h.10t
c
c
c
c
c
m54841  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54841 h/zr.10t zr/h.10t
c
c
m54842  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54842 h/zr.10t zr/h.10t
c
c
m54843  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54843 h/zr.10t zr/h.10t
c
c
m54844  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54844 h/zr.10t zr/h.10t
c
c
m54845  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54845 h/zr.10t zr/h.10t
c
c
c
c
c
m54851  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54851 h/zr.10t zr/h.10t
c
c
m54852  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54852 h/zr.10t zr/h.10t
c
c
m54853  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54853 h/zr.10t zr/h.10t
c
c
m54854  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54854 h/zr.10t zr/h.10t
c
c
m54855  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54855 h/zr.10t zr/h.10t
c
c
c
c
c
m54861  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54861 h/zr.10t zr/h.10t
c
c
m54862  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54862 h/zr.10t zr/h.10t
c
c
m54863  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54863 h/zr.10t zr/h.10t
c
c
m54864  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54864 h/zr.10t zr/h.10t
c
c
m54865  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54865 h/zr.10t zr/h.10t
c
c
c
c
c
m54871  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54871 h/zr.10t zr/h.10t
c
c
m54872  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54872 h/zr.10t zr/h.10t
c
c
m54873  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54873 h/zr.10t zr/h.10t
c
c
m54874  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54874 h/zr.10t zr/h.10t
c
c
m54875  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54875 h/zr.10t zr/h.10t
c
c
c
c
c
m54881  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54881 h/zr.10t zr/h.10t
c
c
m54882  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54882 h/zr.10t zr/h.10t
c
c
m54883  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54883 h/zr.10t zr/h.10t
c
c
m54884  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54884 h/zr.10t zr/h.10t
c
c
m54885  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54885 h/zr.10t zr/h.10t
c
c
c
c
c
m54891  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54891 h/zr.10t zr/h.10t
c
c
m54892  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54892 h/zr.10t zr/h.10t
c
c
m54893  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54893 h/zr.10t zr/h.10t
c
c
m54894  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54894 h/zr.10t zr/h.10t
c
c
m54895  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54895 h/zr.10t zr/h.10t
c
c
c
c
c
m54901  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54901 h/zr.10t zr/h.10t
c
c
m54902  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54902 h/zr.10t zr/h.10t
c
c
m54903  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54903 h/zr.10t zr/h.10t
c
c
m54904  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54904 h/zr.10t zr/h.10t
c
c
m54905  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54905 h/zr.10t zr/h.10t
c
c
c
c
c
m54911  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54911 h/zr.10t zr/h.10t
c
c
m54912  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54912 h/zr.10t zr/h.10t
c
c
m54913  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54913 h/zr.10t zr/h.10t
c
c
m54914  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54914 h/zr.10t zr/h.10t
c
c
m54915  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54915 h/zr.10t zr/h.10t
c
c
c
c
c
m54921  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54921 h/zr.10t zr/h.10t
c
c
m54922  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54922 h/zr.10t zr/h.10t
c
c
m54923  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54923 h/zr.10t zr/h.10t
c
c
m54924  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54924 h/zr.10t zr/h.10t
c
c
m54925  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt54925 h/zr.10t zr/h.10t
c
c
c
c
c
m54951  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54951 h/zr.10t zr/h.10t
c
c
m54952  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54952 h/zr.10t zr/h.10t
c
c
m54953  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54953 h/zr.10t zr/h.10t
c
c
m54954  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54954 h/zr.10t zr/h.10t
c
c
m54955  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54955 h/zr.10t zr/h.10t
c
c
c
c
c
m54961  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54961 h/zr.10t zr/h.10t
c
c
m54962  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54962 h/zr.10t zr/h.10t
c
c
m54963  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54963 h/zr.10t zr/h.10t
c
c
m54964  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54964 h/zr.10t zr/h.10t
c
c
m54965  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt54965 h/zr.10t zr/h.10t
c
c
c
c
c
m54971  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54971 h/zr.10t zr/h.10t
c
c
m54972  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54972 h/zr.10t zr/h.10t
c
c
m54973  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54973 h/zr.10t zr/h.10t
c
c
m54974  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54974 h/zr.10t zr/h.10t
c
c
m54975  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54975 h/zr.10t zr/h.10t
c
c
c
c
c
m54981  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54981 h/zr.10t zr/h.10t
c
c
m54982  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54982 h/zr.10t zr/h.10t
c
c
m54983  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54983 h/zr.10t zr/h.10t
c
c
m54984  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54984 h/zr.10t zr/h.10t
c
c
m54985  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt54985 h/zr.10t zr/h.10t
c
c
c
c
c
m55001  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55001 h/zr.10t zr/h.10t
c
c
m55002  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55002 h/zr.10t zr/h.10t
c
c
m55003  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55003 h/zr.10t zr/h.10t
c
c
m55004  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55004 h/zr.10t zr/h.10t
c
c
m55005  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55005 h/zr.10t zr/h.10t
c
c
c
c
c
m55011  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55011 h/zr.10t zr/h.10t
c
c
m55012  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55012 h/zr.10t zr/h.10t
c
c
m55013  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55013 h/zr.10t zr/h.10t
c
c
m55014  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55014 h/zr.10t zr/h.10t
c
c
m55015  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55015 h/zr.10t zr/h.10t
c
c
c
c
c
m55031  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55031 h/zr.10t zr/h.10t
c
c
m55032  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55032 h/zr.10t zr/h.10t
c
c
m55033  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55033 h/zr.10t zr/h.10t
c
c
m55034  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55034 h/zr.10t zr/h.10t
c
c
m55035  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55035 h/zr.10t zr/h.10t
c
c
c
c
c
m55041  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55041 h/zr.10t zr/h.10t
c
c
m55042  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55042 h/zr.10t zr/h.10t
c
c
m55043  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55043 h/zr.10t zr/h.10t
c
c
m55044  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55044 h/zr.10t zr/h.10t
c
c
m55045  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55045 h/zr.10t zr/h.10t
c
c
c
c
c
m55061  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55061 h/zr.10t zr/h.10t
c
c
m55062  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55062 h/zr.10t zr/h.10t
c
c
m55063  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55063 h/zr.10t zr/h.10t
c
c
m55064  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55064 h/zr.10t zr/h.10t
c
c
m55065  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55065 h/zr.10t zr/h.10t
c
c
c
c
c
m55071  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55071 h/zr.10t zr/h.10t
c
c
m55072  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55072 h/zr.10t zr/h.10t
c
c
m55073  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55073 h/zr.10t zr/h.10t
c
c
m55074  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55074 h/zr.10t zr/h.10t
c
c
m55075  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55075 h/zr.10t zr/h.10t
c
c
c
c
c
m55091  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55091 h/zr.10t zr/h.10t
c
c
m55092  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55092 h/zr.10t zr/h.10t
c
c
m55093  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55093 h/zr.10t zr/h.10t
c
c
m55094  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55094 h/zr.10t zr/h.10t
c
c
m55095  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55095 h/zr.10t zr/h.10t
c
c
c
c
c
m55101  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55101 h/zr.10t zr/h.10t
c
c
m55102  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55102 h/zr.10t zr/h.10t
c
c
m55103  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55103 h/zr.10t zr/h.10t
c
c
m55104  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55104 h/zr.10t zr/h.10t
c
c
m55105  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55105 h/zr.10t zr/h.10t
c
c
c
c
c
m55111  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55111 h/zr.10t zr/h.10t
c
c
m55112  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55112 h/zr.10t zr/h.10t
c
c
m55113  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55113 h/zr.10t zr/h.10t
c
c
m55114  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55114 h/zr.10t zr/h.10t
c
c
m55115  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55115 h/zr.10t zr/h.10t
c
c
c
c
c
m55131  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55131 h/zr.10t zr/h.10t
c
c
m55132  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55132 h/zr.10t zr/h.10t
c
c
m55133  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55133 h/zr.10t zr/h.10t
c
c
m55134  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55134 h/zr.10t zr/h.10t
c
c
m55135  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55135 h/zr.10t zr/h.10t
c
c
c
c
c
m55141  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55141 h/zr.10t zr/h.10t
c
c
m55142  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55142 h/zr.10t zr/h.10t
c
c
m55143  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55143 h/zr.10t zr/h.10t
c
c
m55144  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55144 h/zr.10t zr/h.10t
c
c
m55145  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55145 h/zr.10t zr/h.10t
c
c
c
c
c
m55151  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55151 h/zr.10t zr/h.10t
c
c
m55152  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55152 h/zr.10t zr/h.10t
c
c
m55153  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55153 h/zr.10t zr/h.10t
c
c
m55154  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55154 h/zr.10t zr/h.10t
c
c
m55155  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55155 h/zr.10t zr/h.10t
c
c
c
c
c
m55161  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55161 h/zr.10t zr/h.10t
c
c
m55162  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55162 h/zr.10t zr/h.10t
c
c
m55163  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55163 h/zr.10t zr/h.10t
c
c
m55164  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55164 h/zr.10t zr/h.10t
c
c
m55165  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55165 h/zr.10t zr/h.10t
c
c
c
c
c
m55171  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55171 h/zr.10t zr/h.10t
c
c
m55172  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55172 h/zr.10t zr/h.10t
c
c
m55173  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55173 h/zr.10t zr/h.10t
c
c
m55174  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55174 h/zr.10t zr/h.10t
c
c
m55175  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55175 h/zr.10t zr/h.10t
c
c
c
c
c
m55181  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55181 h/zr.10t zr/h.10t
c
c
m55182  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55182 h/zr.10t zr/h.10t
c
c
m55183  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55183 h/zr.10t zr/h.10t
c
c
m55184  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55184 h/zr.10t zr/h.10t
c
c
m55185  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55185 h/zr.10t zr/h.10t
c
c
c
c
c
m55191  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55191 h/zr.10t zr/h.10t
c
c
m55192  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55192 h/zr.10t zr/h.10t
c
c
m55193  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55193 h/zr.10t zr/h.10t
c
c
m55194  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55194 h/zr.10t zr/h.10t
c
c
m55195  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55195 h/zr.10t zr/h.10t
c
c
c
c
c
m55201  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55201 h/zr.10t zr/h.10t
c
c
m55202  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55202 h/zr.10t zr/h.10t
c
c
m55203  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55203 h/zr.10t zr/h.10t
c
c
m55204  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55204 h/zr.10t zr/h.10t
c
c
m55205  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55205 h/zr.10t zr/h.10t
c
c
c
c
c
m55211  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55211 h/zr.10t zr/h.10t
c
c
m55212  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55212 h/zr.10t zr/h.10t
c
c
m55213  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55213 h/zr.10t zr/h.10t
c
c
m55214  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55214 h/zr.10t zr/h.10t
c
c
m55215  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55215 h/zr.10t zr/h.10t
c
c
c
c
c
m55221  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55221 h/zr.10t zr/h.10t
c
c
m55222  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55222 h/zr.10t zr/h.10t
c
c
m55223  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55223 h/zr.10t zr/h.10t
c
c
m55224  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55224 h/zr.10t zr/h.10t
c
c
m55225  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55225 h/zr.10t zr/h.10t
c
c
c
c
c
m55231  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02  
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03  
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55231 h/zr.10t zr/h.10t
c
c
m55232  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55232 h/zr.10t zr/h.10t
c
c
m55233  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55233 h/zr.10t zr/h.10t
c
c
m55234  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55234 h/zr.10t zr/h.10t
c
c
m55235  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9254E-02
        40091.80c 4.2003E-03  40092.80c 6.4203E-03  40094.80c 6.5045E-03
        40096.80c 1.0511E-03   1001.80c 3.7419E-02
c
mt55235 h/zr.10t zr/h.10t
c
c
c
c
c
m55241  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55241 h/zr.10t zr/h.10t
c
c
m55242  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55242 h/zr.10t zr/h.10t
c
c
m55243  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55243 h/zr.10t zr/h.10t
c
c
m55244  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55244 h/zr.10t zr/h.10t
c
c
m55245  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55245 h/zr.10t zr/h.10t
c
c
c
c
c
m55251  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55251 h/zr.10t zr/h.10t
c
c
m55252  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55252 h/zr.10t zr/h.10t
c
c
m55253  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55253 h/zr.10t zr/h.10t
c
c
m55254  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55254 h/zr.10t zr/h.10t
c
c
m55255  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55255 h/zr.10t zr/h.10t
c
c
c
c
c
m55261  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55261 h/zr.10t zr/h.10t
c
c
m55262  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55262 h/zr.10t zr/h.10t
c
c
m55263  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55263 h/zr.10t zr/h.10t
c
c
m55264  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55264 h/zr.10t zr/h.10t
c
c
m55265  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55265 h/zr.10t zr/h.10t
c
c
c
c
c
m55271  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55271 h/zr.10t zr/h.10t
c
c
m55272  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55272 h/zr.10t zr/h.10t
c
c
m55273  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55273 h/zr.10t zr/h.10t
c
c
m55274  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55274 h/zr.10t zr/h.10t
c
c
m55275  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55275 h/zr.10t zr/h.10t
c
c
c
c
c
m55281  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55281 h/zr.10t zr/h.10t
c
c
m55282  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55282 h/zr.10t zr/h.10t
c
c
m55283  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55283 h/zr.10t zr/h.10t
c
c
m55284  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55284 h/zr.10t zr/h.10t
c
c
m55285  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55285 h/zr.10t zr/h.10t
c
c
c
c
c
m55291  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55291 h/zr.10t zr/h.10t
c
c
m55292  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55292 h/zr.10t zr/h.10t
c
c
m55293  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55293 h/zr.10t zr/h.10t
c
c
m55294  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55294 h/zr.10t zr/h.10t
c
c
m55295  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55295 h/zr.10t zr/h.10t
c
c
c
c
c
m55301  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55301 h/zr.10t zr/h.10t
c
c
m55302  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55302 h/zr.10t zr/h.10t
c
c
m55303  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55303 h/zr.10t zr/h.10t
c
c
m55304  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55304 h/zr.10t zr/h.10t
c
c
m55305  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55305 h/zr.10t zr/h.10t
c
c
c
c
c
m55311  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02  
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03  
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55311 h/zr.10t zr/h.10t
c
c
m55312  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55312 h/zr.10t zr/h.10t
c
c
m55313  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55313 h/zr.10t zr/h.10t
c
c
m55314  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55314 h/zr.10t zr/h.10t
c
c
m55315  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9355E-02
        40091.80c 4.2224E-03  40092.80c 6.4541E-03  40094.80c 6.5387E-03
        40096.80c 1.0566E-03   1001.80c 3.7616E-02
c
mt55315 h/zr.10t zr/h.10t
c
c
c
c
c
m55331  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02  
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03  
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55331 h/zr.10t zr/h.10t
c
c
m55332  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55332 h/zr.10t zr/h.10t
c
c
m55333  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55333 h/zr.10t zr/h.10t
c
c
m55334  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55334 h/zr.10t zr/h.10t
c
c
m55335  92235.80c 2.5257E-04  92238.80c 1.0133E-03  40090.80c 1.9456E-02
        40091.80c 4.2445E-03  40092.80c 6.4879E-03  40094.80c 6.5729E-03
        40096.80c 1.0622E-03   1001.80c 3.7813E-02
c
mt55335 h/zr.10t zr/h.10t
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
c
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
kcode    1000 1.0 10 110 $ kcode card
c
esplt:n  2 0.1 2 0.001 2 0.0001 2 0.000001 0.75 5e-7    $ split energy
c
c
c
c
c