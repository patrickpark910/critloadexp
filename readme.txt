
Essentially, if you run the python program, you can just input which core positions
you want to be "evacuated". Then, python will AUTOMATICALLY:
- create the MCNP input decks with the core geometry
- run MCNP
- read through the output files to find keff
- calculate and plot 1/M values

HOWEVER, before running the python program, you need to change the 'fileplath' variable
in 'cle.py' to wherever you placed this folder.

A more formal how-to should follow.


_____
NOTES

To change rod heights, search for key word "ROD HEIGHTS".
0% and 90% z-coordinates have been calculated (commented out), so


If you want to change fuel elements in a certain core position:
Save a copy of the old file. 
In the new file, find & replace the old FE ID with the new FE ID.
Use an online tool to compare differences between the old and new files. 
Make sure that the ID changes are only in places where you would expect them. 
Fix any numbers that were changed that should not have been.
