## critloadexp: Python-automated MCNP simulation of the Critical Loading Experiment

Patrick Park | <ppark@reed.edu> | Physics '22 | Reed College

### Scope

This project involves a python wrapper (`cle.py`) that:
1. edits the standard MCNP input deck (`cle.i`) for the Reed College Research Reactor to create new input decks with a changed core geometry
2. runs MCNP through cmd line
3. reads through MCNP output files to get final k_eff values
4. converts k_eff values to 1/M 
5. plots MCNP data against experimental data (`results.png`)

In `results.png`, the MCNP-predicted critical loading (blue) is compared with our experimental data from 01/29/2020 (red) in our F-ring TRIGA Mk.I core with all rods down. 
**MCNP predicts 2 more fuel elements are required to go critical with all rods down**; experimental suggests 11.

### Procedure

*I'm writing these instructions for any undergraduate to be able to follow.
That being said, if you were born in this century and you're messing around with Fortran/MCNP, you probably (should) have a working handle of Python.
If you don't, that's okay too. I am learning a lot of Python and MCNP myself by doing this project.*

You need to have MCNP installed. It's an export-controlled, licensed software regulated by our Big Brother at Oak Ridge National Laboratory.

> **If you don't have MCNP**, you can still run this program. Just move everything from the `standard` folder into the main folder.
> Those files are the MCNP inputs and outputs for our standard experimental procedure, which is removing 8 fuel elements.
> Python should recognize these files and skip the MCNP-required steps. When `cle.py` asks you which fuel elements you want to remove (step 4), type in `sop`.

You also need to have python installed, which you can Google how to do so. If you're not sure if it's installed, open cmd (Windows) or Terminal (Mac) and type in:
  
    python --version

which will get you either your python version (`Python 3.7.1`) or an error.

First, open `cle.py` and change the `filepath` variable to the location of this project folder on your computer. 
For instance, the path of my `cle.py` is `C:\MCNP6\facilities\reed\critloadexp\cle.py`, so for me, `filepath = 'C:\MCNP6\facilities\reed\critloadexp'`. Do **not** include a backslash at the end.

Then, run `cle.py` on your computer. This will be the only file you're really interacting with, unless you need to change the base MCNP input deck (`cle.i`).

1. On Windows, press the Windows key, type in `cmd`, and press `Enter`. On Mac, open Terminal using Spotlight search.
2. Change your directory to where this project is located. This should be what you typed in for `filepath`. Type in `cd` followed by a space and your filepath.
    
        cd C:\MCNP6\facilities\reed\critloadexp
    
3. To run the `cle.py` python file, type in `python cle.py` or `python3 cle.py`.
4. Follow the instructions printed on your cmd line. 
5. Use the `sop` option to remove fuel elements per Reed's standard procedure for this experiment. 
The `standard` folder contains the MCNP inputs and outputs for this option. The `keff.csv`, `inv_M.csv`, and `results.png` files already show the resulting data and plot for our standard experiment.

### Technical Notes

#### To-do Improvement
Currently, my methodology is to simply find and replace the materials of the selected fuel elements with water. 
A pro is that this works. A con is that this method doesn't work if you're removing a graphite element.

In our MCNP deck, core positions are universes that are filled by element cells. 
We've calculated individual burnups for each fuel element, so core positions filled with fuel elements are unique. 
However, we fill graphite positiosn with a generic graphite element. 
Using my current methodology, by changing the material of this graphtie element to water, 
we would be changing **all** graphite elements in the core to water.

So, an improvement to be made is to change how the fuel elements are "removed". Instead of changing the material of individual elements,
we can easily create a "water element" and change the filling of individual core positions with this water element.

Reed's critical loading experiment procedure doesn't remove graphite elements, so there was no need for me to accomodate this in my timeframe.

#### Change Rod Heights

To change rod heights, open `cle.i` and `cmd F` to search for "ROD HEIGHTS". 0% and 90% rod heights should be in the code already. Change the z-positions of the control rod components using those two benchmarks. 
The origin is center of the central thimble (x, y), the bottom surface of the bottom grid plate (z).
