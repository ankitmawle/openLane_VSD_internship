# ASIC Design and Tools
## What is ASIC Design
- Process of creating Application-Specific Integrated Circuit(ASIC), while meeting required performance, power, and area requirements. 
### Steps Involved
1. Goal Specification:-
    -   Define Functionality
    -   Define Chip Size Requirements
    -   Define Chip Speed or Clock specifications
    -   Define other Constraints. \
    `Output:- Configuration file`
    - Output file:- [Config File](/Design/picorv32a_ankit/config.tcl)
2. RTL Design:- 
    - Create Hardware Description using Verilog or VHDL Language, defining the circuit to meet the functionality of the ASIC \
    `Output:- Verilog file `
    - Output file:- [Verilog File](/Design/picorv32a_ankit/src/picorv32a.v)
3. Synthesis:- 
    - Converting RTL Design to gate-level netlist
    - RTL design is updated with Standard Cells and Macros
    `Output:- Netlist file `
    - Output file:- [Synthesis File](/Design/picorv32a_ankit/runs/final/results/synthesis/picorv32a_ankit.synthesis.v)
4. Initial Static Timing Analysis:- 
    - Verify Design Timings for slacks in hold and setup timings, and update cells to meet timing requirements
    - Update Verilog files with alternate cells of same type to mitigate slack
    `Output:- Netlist file`
    - Output file- Overwrite Synthesis results
5. Floor Planning:- 
    - Define the area, core utilization, pin placement, etc. for the ASIC
    `Outptut:- def file`
    - Output folder- [Floorplannning Results Folder](/Design/picorv32a_ankit/runs/final/results/floorplan)
6. Placement:- 
    - Placing the macros, and standard cells on the area of the chip, while maintaining required Core Density utilization\
        `Outptut:- def file`
    - Output folder- [Floorplannning Results Folder](/Design/picorv32a_ankit/runs/final/results/floorplan)
7. Routing:- 
    - Placing Metal connections between cells while following DRC rules
    `Outptut:- def file`
    - Output folder- [Floorplannning Results Folder](/Design/picorv32a_ankit/runs/final/results/routing/)
8. SPEF Generation:- 
    - Generating SPEF output from routed part\
        `Outptut:- spef file`
    - Output folder- [Floorplannning Results Folder](/Design/picorv32a_ankit/runs/final/results/routing/)
9. Post Routing STA:-
    - Verify Design Timings for slacks in hold and setup timings, and update cells to meet timing requirements again after SPEF generation. 
10. ASIC Verificationn
    - Test performance and validate hardware components and systems of the ASIC
11. Tape Out
    - Generate physical IC of the generated design

## What Steps are cconsidered as Physical Design:- 
- Step 3 to 9 comes under the scope of the intership this repo is created on, so we would be disccussing mostly about them in thios repo

## Tools Required for Physical Designing
- EDA tools:- 
    - OpenLane
    - OpenRoad
    - OpenSTA
    - QFlow
    - MAGIC
    - Ngspice
- PDK Data
- RTL Designs\
![ASIC Design Tools](/images/ASIC_design_tools.PNG)
### EDA Tools
- Electronic Design Automation (EDA) tools are software solutions that help design electronic systems, such as microprocessors, integrated circuits, and printed circuit boards. 
- EDA tools are used for simulation, design, and verification

Lets go thorough some EDA tools, and how to use them
## **OpenLane**
Link :- https://github.com/efabless/openlane

- OpenLane is Opensource RTL to GDSII flow EDA tool with inbuilt OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, KLayout 
- Below you can see the openLAnne Flow of RTL to GDSII generation
![OpenLane Flow](/images/openLane%20flow.png)

### Steps and Commands to be used in OpenLane
**Initialize OpenLane**:-\
openlane is installed as a separate runtime hosted in a docker container\
- To initialize docker container
```
cd __openlane_workplace_folder__/openlane/
docker
```
- To initailize openlane flow inside docker container in a interactive mode
```
./flow -interactive
```
- Load required packages
```
package require openlane 0.9
```
![images](/images/initialize.PNG)

**Base OpenLane Flow Commands**
- Print loaded environment Value
```
echo $::env(__KEY__)
```
- Set Environment Variable
```
set ::env(__KEY__)
```
- Run Synthesis
```
run_synthesis
```
- Initialize Floorplanning
```
init_floorplan
```
- Place IO ports
```
place_io
```
- place Tap cells and Decoupling Capacitors
```
tap_decap_or
```
- Run complete Floorplanning flow (can be ran in place of running abovce three ccommands separately)
```
run_floorplan
```
- Run Placemennt
```
run_placement
```
- Run CTS
```
run_cts
```
- Add Power distribution Lanes
```
gen_pdn
```
- Run Routing
```
run_routing
```


## **MAGIC**
Link:- https://github.com/RTimothyEdwards/magic

- VLSI Layout Tool
- Used to visualize and modify def files, as well as implement manual placementt and routing
![Magic Tool](/images/magic.gif)
![Tkon Screen](/images/tkcon_screen.gif)

### Usage Guidlines and shortcut keys
- Start magic
```
magic  
```
Optional Elements
```
-T __path_to_tech_file__
lef read __path_to_lef_file__
def read __path_to_def_file__
```
- Mark a Section or Area
```
Left Click at one corner of the bounding rectange then
Right Click at the diagonally opposite corner
```
- Select a specific element
```
hover over the element with mouse
Press s button
```
- Fit complete designn area
```
v
```
- Zoom in
```
z
```
- Zoom out
```
Shift + z
```
- Zoom to selected component
```
Ctrl + z
```
- Fill selected area with with a material
```
hover over the material and press scroll wheel button
```
- Select multiple components
```
shift +s
```
- copy selected elements
```
hover over the position at wqhich first selcted component's bottom left cornor should be placed and press
c
```

**TKON Commands**
- Find details about selected ccomponents
```
what
```
- Find drc errors
```
drc why
```
- Show grid 
```
grid x_spacing y_spacing x_origin y_origin
```


**All other Commands can be found at** :- http://opencircuitdesign.com/magic/userguide.html


## OpenSTA
Link:- https://github.com/The-OpenROAD-Project/OpenSTA

OpenSTA is a gate level static timing analyzer and verifier.
- To initailize STA first create a pre_sta.conf file, which will be provided as input to starting command
- OCntents of the pre_sta files are commends which could be used in sta
- Content of the pre_sta file, **please note all inputs are opptional**

Set Units
```
set_cmd_units -time ns -ccapacitance pF -current mA -voltage V -resistance kOhm -distance um
```
Read Library Files
```
read_liberty __path_to_typical_lib_file__
```
```
read_liberty -min __path_to_slowest_lib_file__
```
```
read_liberty -max __path_to_fastest_lib_file__
```
Read design files
```
read_verilog __path_to_verilog_file(netlist)__
```
```
read_sdc __path_to_sdc_file__
```
```
read_spef __path_to_spef_file__
```
Generate Reports
```
report_checks -path_delay min_max -fields {slew trans net cap input_pin}
```
```
report_tns
```
```
report_wns
```
Link Design
```
link_design __design_name__
```

- **To start STA run following command**
```
sta
```
- **start STA with connfig file**
```
sta __path_to_config_file__
```
- **To replace one cell with other**
```
replace __cell_instance__ __standard_cell_to_be_replaced_with__
```



