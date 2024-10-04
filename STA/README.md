# Static Timiing Analysis Discussion
Post synthesis we want to make the chip compatible with the required timinig characteristics. 
- To carryout this we carry out STA analysis using OpenSTA and findout the hold and setup timings of the system

## Setup time
Setup time refers to the minimum amount of time that a data signal must be stable (unchanging) before the clock edge triggers an event (such as capturing the data in a flip-flop or latch). It ensures that the input data is correctly read into the memory element.
```
Tsetup ≤ Tc - Td
```
![Setup_timing](/images/sta_setup.PNG)

## Hold time
Hold time is a critical timing parameter in digital circuits that specifies the minimum amount of time after a clock edge during which the input data to a flip-flop (or any storage element) must remain stable (unchanged) for the output to be correctly latched

![hold_time](/images/hold-time.PNG)


## Internship Flow
To calculate STA for our design create a pre-STA configuration file as shown here
[pre_sta.conf file](./pre_sta.conf)
### Running STA
and run using command
```
sta pre_sta.conf
```
This will result in hold and setup timing analysis


![setup_time](/images/decreasing_slack_1.PNG)

### Reducing Slack
To make the ic properly work on stated frequency, the STA must met
- To reduce slack find cells, causing high delays, and reasons for high delays like 
    - High Fanout
    - smaller version of standard cell wiith slow responses

- Once found out update .tcl to have approprate changes
- Replace standard cells with larger cells to reduce delay
```
replace_cell __cell_iinstance__ __new_standard_cell__
```

**Slack must me Higher or equal to 0**

Reducing Slack
![reducing_slack_1](/images/reduced_slack_2.PNG)
![reducing_slack_2](/images/reduce_slack_3.PNG)

Once slack is met
we can save the new verilog file using ths command
```
write_verilog __path_to_synthesis_result_file__
```

## Next step is to create floorplan for the cell
yopu can find [floorplan discussion here](/Floorplanning/)