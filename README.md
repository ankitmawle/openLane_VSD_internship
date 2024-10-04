# RTL to GDSII Physical Design using OpenLane and Opensource Softwares 
Created by :- Ankit Mawle\
Internship provided by :- VLSI System Design \
Internship Date:- 17 Sept 2024 to 2 Oct 2024 \
Internship details website:- [digital-vlsi-soc-design-and-planning/](https://vsdsquadron.vlsisystemdesign.com/digital-vlsi-soc-design-and-planning/)

## Platforms Utilized
All OpenSource Platforms are utilized
- OpenLane
- OpenRoad
- OpenSTA
- Ngspice
- Magic

## PDKs used
Google's Opensource PDKs are used:- 
- SkyWater 130nm 

## Introduction
This Internship was provided by VLSI System design a covers all theoratical concepts of physical design and makes us complete a final RTL2GDS conversion project for a RISCV based design using **OpenSource Tools and PDKS** involving following:- 
- Indepth Understanding of required tools, 
    - Discussed here [Tools Section](/ASIC_Design_and_Tools/)
- Indepth understanding of Synthesis, why it is done, steps involved, and all theortical concepts 
    - Discussed here [Synthesis Section](/Synthesis/)
- Indepth understandinng of Static Timing Analysis and theortical concepts
    - Discussed here [STA Section](/STA/)
- Indepth understanding of floorplannig, all criterions and constraints innvolved in floorplanning, placement of io, and involving requirement of tap and decap cells
    - Discussed here [ Floorplanning Section](/Floorplanning/)
- Indepth understanding of placement of cells, and constraints involved in placement. 
    - Discussed here [Placement Section](/Placement)   
- Indepth understanding of Routing procedures, including global as well as detailed routing, and algorithms involved
    - Discussed here [Routing Section](/Routing/)

### Additional contents:-
Apart from RTL2GDS flow the Internship projects, and curriculam dived in deapth to make us understand various additional concepts  as follows:- 
- Development of Custom Standard cell ad including it in our own design
    - Discussed here [Custom cell development Section](/Custom_cell/)

Custom cell sky130_vsd_inv
![Custom cell sky130_vsd_inv](/images/expanded%20custom%20cell.PNG)

- Writing, updating and modifying DRC rules
## Design and Results:- 
Modified version of picorv32a, named as picorv32a_ankit modified as a art of this inteernship.
- All Design files can be found in folder:- [picorv32a_ankit](/Design/picorv32a_ankit/)

- Final resultant SPEF file which is the final output intended form this internship can be found here:-
[picorv32a_ankit.spef](/Design/picorv32a_ankit/runs/final/results/routing/picorv32a_ankit.spef)

Image of final routed spef
![Png of final routed spef](/images/final_post_routing_chip.PNG)

Placement Result image
![Placement Result image](/images/picorv32a_ankit.placement.def.png)

Post Routing STA results:- 
Setup Timing:-
![post_routing_sta_setup_timing](/images/final_post_routing_sta.PNG)
Hold Timing:- 
![post_routing_sta_hold_timing](/images/final_post_routing_sta_hold.PNG)
- All intermediatory results  can be found at:- [picorv32a_ankit results](/Design/picorv32a_ankit/runs/final/results)



**All commands and details of tools is provided at [/ASIC_Design_and_Tools](/ASIC_Design_and_Tools)

## Theoratical concepts

