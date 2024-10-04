# Synthesis Discussions
In Synthesis RTL file is converted into a logic circuit using components from the Standard Cell Library and Macros from PDKs.

## Standard Cell
- A Standard Cell is a pre-designed, pre-characterized building block used to implement logic

Key Features:
- Predefined Layout: 
- Reusable Components: 
- Fixed Height, Variable Width:

![Synthesis](/images/synthesis_img.PNG)

## Custom Standard Cell
As part of this internship we developed a Standard Cell, 
which you can find here:- [sky130A_inv custom cell](/Design/picorv32a_ankit/src/sky130_vsdinv.lef)

Complete Process of making the standard cell can be found here [Custom Cell Discussion](/Custom_cell/)

## Synthesis Flow for Internship
First step includes confiigurng environment variables, either by ncluding them in connfig.tcl file in design folder or entering in openlane directly 
- for command check [Command](/ASIC_Design_and_Tools/README.MD#openlane)

Variables
```
set ::env(CLOCK_PERIOD) "15.000"
set ::env(CLOCK_PORT) "clk"

set ::env(SYNTH_STRATEGY) "DELAY 2"  #Synthesis priority AREA/DELAY
set ::env(SYNTH_SIZING) 1            #Sizing strategy
set ::env(SYNTH_MAX_FANOUT) 4        #max number of components connected to output
```
To run synthesis start with opening openLane and preparing the design 

![preparing design](/images/prep_done.PNG)

Then run synthesis command
```
run_synthesis
```
![synthesis_done](/images/final_synthesis_done.PNG)


### Lets analyse the synthesis result

We receive values of multiple standard cells used in the design
![synthesiis values](/images/synthesis_values.PNG)

We can calculate flop raton form this as :- 

```
Total no. of Cells= 14876

Number of D flipflops = 1613

Flop ratio = 14876/1613 = 0.108
```

## Next stage is STA 
check it out in [STA discussion](/STA/)