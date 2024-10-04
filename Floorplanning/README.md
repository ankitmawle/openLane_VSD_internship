# Floorplanning Discussion
Floorplanning involves determining the optimal arrangement of various circuit components on a silicon die to achieve desired performance, power efficiency, and area utilization.

This involves
- Finalizing Die size
- Finalizing Core utilizatoin ratio
- placing IOs
- Placing Tap and Decap cells
- Adding cell placement blockage

## Core Area utilisation
Ratio of total core area(total area of standard cells) to die size
- it is provided as input to floorplaning
- Reduce core area utilizatoin to increase chip size, and provide more area for placement and routing

## Internship flow
To run floorplaning run following command
```
run_floorlan
```
![floorplan__execution](/images/floorplanning_done.PNG)

if using custom cells and additive lef run following commands instead
```
init_floorplan

place_io

tap_decapp_or
```

### Generated results 
Results will be stored as .def file in results folder, you can see here
[floorplanning_result](/Design/picorv32a_ankit/runs/final/results/floorplan/picorv32a_ankit.floorplan.def)

you can find the die area from the result 
![die_area](/images/floorplanning_def.PNG)

### Visualizing Floorplan
run following command to visualize the floorlan
```
magic -T __path_to_tech_file__ lef read __path_to_lef_file__ def read __path_to_def_file
```
![floorplan_visualization](/images/magic%20floorplanb.PNG)

## Next step is to carryout placemennt
You can find [placement discussion over here](/Placement)
