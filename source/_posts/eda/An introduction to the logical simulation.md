An introduction

主讲：陈昕老师
电子与信息工程学院


**Introduction**

- Computer aids are not limited to chip design. There has been increasing emphasis on the need for system design rather than purely chip design.

- One of the problems with building hardware is that, once built, it is not easily change. It is estimated that the relative cost of finding faults at design time, chip-test time, printed circuit board construction time, or in the finished machine in the field is 1:10:100:1000 (Sec. 3.1.1). 

- Simulation is the process by which a model of the hardware is set up in software, or better still, in data structures that are ‘run’ by the software.

- The simulation can then be used to test the ‘hardware’ before it is ever built. When errors are found the data can be changed and further runs made until a correct design is achieved.

- If budget and time to market considerations allow, it is possible to try out alternative designs –sometimes called ‘playing “what if” games’.





Cont.

- Three important tutorials:


1) A computer aided design systems is what it says it is –an aid. 
Q: Is a computer aided design system a substitute for the intelligence of the designer?
2) It is not meaningful for a simulation run without error reports. The design time is reduced, but redesign will be necessary. 
Q: How must a simulator be used?
3) Simulation does not generally reduce design time. It frequently increase it, possibly by several hundred percent. 
Q: What is the advantage gained for this very expensive process?  


Four aims of simulation

1. Functional correctness（功能正确性）
A simulator is required to give an accurate prediction of the behavior of a good system.
A simulator is required to give warning of a faulty system.
- In order that functional correctness can be checked, two matters must be considered.

a)The correct operation must be known.This requires a specification of the function which is unambiguous, and which is clearly understood by both customer and designer. 

b)The functionality of the system under unusual conditions of operation may be important. This can include what happens if one or more faults appear or if input data patterns are incorrectly generated.





- Consider the logic shown in Fig. 1.1, where the square boxes are pieces of combinational logic. 




Fig. 1.1 Demonstration circuit


- The waveforms of Fig. 1.2 show the result of a check for functional correctness. 




Fig. 1.2 Notional waveforms for Fig. 1.1


Cont.

2. Speed of the system（对输入信号的响应时间）
Most systems will have some form of limit on the time they take to respond to given conditions. For example, designs using logic with basic gate speeds of 10ns will quite easily build up delays of 500 ns without the designer’s noticing.  
Speed of operation depends on three criteria.
1)The circuit type

2)How heavily the circuits are loaded and their driving capability

3)The time that signals take to pass down the wires, which can be significant




Cont.

- For example, a simple TTL gate has basic delay of 8.5 ns, delay per unit load(one similar gate) of 0.25 ns. Then, it is specified to have a delay of 11ns with load of 10 similar gates.

- Wiring delays may or may not be serious. Within a single PCB of 300 mm x 300 mm, the time from corner to corner diagonally using strictly x-y tracks will be about 3 ns. 

- If the logic is TTL with gate delays as above, this could matter for the longest connections, but not in general.

- For faster ECL logic with delays of around 1 ns per gate  it is very serious.


- The wiring delay is also important on chips with polysilicon connections. The polysilicon is very resistive –say 50Ωper square. 

- A track 2 μm wide and 1 mm long is 500 squares long, and hence has a resistance of 25 kΩ.

- The capacitance is likely to be of the order of  0.15 fFper μm2, giving a capacitance for the 1 mm by 2μm line of 0.3 pF.

- The delay of a wire is of the order of one or two time constants. In this case, the  time constant is 7.5 ns, which is very significant. 





Cont.

- Wire delays are unknown until a late stage  in the design process. In the early stages a guess figure may be used. 

- For later stages it is necessary to have software capable of extracting  wire  characteristics from the layoutand feeding them to  the data used  by the simulator.

- The simulator is then run with these additional delays to check that the speed specification can be met.

- The feedback of layout data to the simulator is one example of what is known as back annotation.





Cont.

3. Hazard detection
Fig. 1.1 shows Z being used as the clock input of a flip-flop. The function（功能）suggests that the pulse shown in Fig. 1.3 should not be there.  However, it is, and will probably cause the flip-flop to trigger incorrectly. This is an example of a raceor hazard. 


Fig. 1.3 Waveforms for Fig. 1.1 –actual timing


Cont.

- Other timing constraints include

- Data to a flip-flop  does not change  just before the clock (set-up time)

- Data to a flip-flop does not change just after the clock (hold time)

- Timing to dynamic memories meets the chip specifications under conditions of tolerance (RAS, CAS, R/W etc.).


- It is important that the timing specifications should not be violated during normal operation of the equipment, and so the simulator should be able to detect and report if any violations occur.




Cont.

4. Expected outputs for test and fault simulation
Once the system can be shown its according to the specification, it will be necessary to develop a test program. It will give an output that is different from the good system for as many faults as possible. This will be run on a machine to test the production hardware.
To discover which faults are being tested a fault simulation is run. 
- In this situation, a fault is introduced into the good network and a simulation run. 

- The outputs are compared with the output of the good system.

- The procedure is repeated for every possible fault.



Another purpose of simulationwill be to determine the outputs of the good circuit for each new test.
Q: Whether the system is presumed to be functionally correct or not when simulations are run for test and fault simulation ?


Components of a simulator

- The process of simulation requires three sets of data and a program

- A description of the system to be simulated

- A description of the inputs to the simulated system

- A set of models  of the components  of the system being simulated

- A mechanism(the simulator) to process these three in a manner which simulates the system being designed.


- To follow simulation properly, there is also a need for

- Assistance to find and follow indications of errors to their sources


- During test generation, the design is regarded as functionally correct. Hence the expected outputs for the test fixture to check against can be derived by simulation. 

- A model of a component is a representation of its behavior in a form which the simulator can use.

- The models of the components used by the simulated system may be built into the simulator in some way.

- However, the simulator is much more flexible if the models are held separately in a library available to the simulator. In this way, new components can be added with relative ease and without having to recompile the simulator itself.

- The number of possible components which a simulator may at some time wish to use will run into the thousands. If only subset of models is actually needed by a particular network, it is better put it in the computer memory at run time. This may be only 10 to 20 models, possible less. 





Levels of simulation

1. System design
- As a rule, a customer will present the design engineer with a specification of the system. The engineer will first divide this  into functional blocks –memory, CPU, control, etc. as shown in Fig. 1.4. Each of these major blocks can then be specified clearly and passed to different people for more detailed work. Eventually, the individual circuits such as 4-bit arithmetic logic units (ALUs) are designed. This is described as atop-down procedure.





Fig. 1.4 A computer architecture


Cont.

- However, it may well be apparent at an early stage that certain circuits or small blocks of logic(e.g. the 4-bit ALU) will be required. It is possible to do detailed work on these before their specific place in the system is fully defined. This is bottom-up design. 

- In order to clarify the interface specification of the major blocks of the system, it is necessary to simulate these blocks without knowing their detailed internal structure . For example, a multiplier might be simulated with a statement such as



a: = x * y;
inPASCAL.HDLs,suchasVHDL,makesuseofthemultiplierofthecomputerratherthansomesimulationdescription.
Caution:
- A particular case occurs if the machine works with signed numbersand the new design with unsigned numbers.

- Theeffectsofspecialoperands.Forexample,(-215)*(-216)isnotrepresentableona32-bitmachinebut(-215)*216isforatruecomplementnumberdesign.





Cont.

- As the design progresses, there are two options here.

I.The system has to be described separately at each level of the deign, and these levels must be proved to be equivalent.

II.The design may not progress through the levels evenly, so there is a requirement to be able to simulate some blocks with high level statements and some at gate level.

- The solution is to design a simulator which can handle all levels of design. Then, it should be able to

I.Check a low level block against a high level one;

II.Run multilevel simulations  to



# enable simulations to run faster, since only a few blocks are simulated in detail;
# enable larger systems to be simulated, since high level blocks generally requires less resources.


Cont.

- Benkoski(1987) gives an example of a 4-bit adder.




component level(Spice)

 Four 1-bit adders

 Single4-bit adder

 
293 (s)

 0.5 (s)

 0.1 (ms)

 


Table 1.1 Simulation time with different description level


Cont.

2. High level
This is the level of description equivalent to the high level language procedure in programming.
The words ‘functional’ and ‘behavioral’ are frequently used in this area. Refer to Fig. 1.4 as an example. We will follow Abramoviciet al. (1990) using the following definition:
Functionaldescribes the logic function only and no timing.
Behavioraldescribe logic andtiming.
3.Gatelevel
Thislevelofdescriptionusesmodelsof‘simple’gates.Thelogicalelementsmayincludemultiplexersandflip-flops,thoughbothmaybedescribedinthedatabooksintermsofANDsand/orORs.
Fig.1.5showsonepossibleformofa1-bitALU.SpecialmodelsnotconstructedofANDsandORsshouldalwaysbeconsideredinthesecases.



Fig. 1.5 One bit of an ALU. 


Cont.

4. Circuit level
- The circuit is described in terms of resistances, capacitances and voltage and current sources which are the models. A set of mathematical equations relating current and voltage is set up and solved by numerical techniques. Compared with gate and higher levels of simulation, circuit level simulation is essentially different from others.

- Circuit simulators typically can handle only a few hundred circuit components and nodes, since they require large in-store data structures and large amounts of computing resource. Usually they are used to characterize relatively small blocks(e.g. gates) which are then re-described for the higher level simulators.

- Circuit simulators give analog results. That is the transient response with real rise and fall times, and oscillations where relevant. Other simulators are for digital circuits only. Circuit simulators can also give frequency domain results –that is the zero frequency working point, and frequency responses.  





Cont.

5. Switch level
- Between circuit and gate level, there are a number of modelling methodswith the trade off between speed and accuracy at different points. The primary technique is to regard the transistors as switches that are either open or closed. These techniques are known as switch level (Bryant 1984).

- At its simplest, no timing is involved. The circuit is divided into sections starting from a gate output and proceeding to the following inputs.





Fig. 1.6 Section of circuit for switch level simulation


Cont.

- Timing may be included in switch level simulation. One form of this is to estimate the capacitance of each wire, the driving gate output and the driven gate input, together with the source resistance of the driving gate(s).

- They can handle only the transient performance of digital circuits. They cannot give frequency responses of true analog circuits such as amplifiers.



6. Mixed mode
- Some effort has been made to link circuit simulation and digital simulation.There are at least three ways that has been attempted. 



1) Write a link between a circuit simulator and a digital simulator. Suitable pseudo-analog to digital converters are used. The digital sections also feed the analog part via appropriate conversions. Since the time scales are not really compatible, the whole thing seems unsatisfactory.


Cont.

2) A circuit analysis system based on events has been developed (Sakallah1985).In this system, an estimate is made of the largest time step that can be made without the signals changing by too large an amount. The analog circuit operates in relatively small partitions to keep the solution simpler(compared with the switch level system). This can be made to work with feedback, and the analog and digital simulations use the same base mechanism.
3) ‘Behavioral analog’ (Visweswariahet al. 1988). In this model of the system, the analog blocks are simulated by a circuit simulator, and a model are developed describing the block in terms understandable by the digital simulator. The block can then be treated as a ‘digital’ component by the digital simulator. Actually, writing the analog blocks’ ‘digital’ model is very difficult.


Cont.

- What is a good simulator?


One performshierarchical and mixed level simulation of digital logic, together with timing error detection, independent of technology, but recognizing the distinct features of known technologies. 


Models

- Simulation is about building and exercising a model of a system(electrical or otherwise) that is being designed.

- Writing accurate models of components is a difficult and skilled activity(Chap. 7). Consider an example of a D-type flip-flop(e.g. 74ALS74) as shown in Fig. 1.7

1)Functionality: It has to respond to 4 inputs, i.e. preset, clear, clock, and data, to give an output Q(Q’ is also available). 

2)Timing check list:

- Dmust not change < tsubefore the active edge of the clock

- Dmust not change < thafter the active edge of the clock

- Clockmust not have an active edge < tpcafter presetor cleargo inactive

- Presetand clearmust have a minimum width

- Clockmust have a minimum period, high phase and low phase





Fig. 1.7 74ALS74 type flip-flop

- An accurate model for such a flip-floprequires


upwards of 300 high level programming language
statements. It is hoped that any path through
as a result of an input change will require only a
fraction of these to be executed. 


Test generation

- Once a simulator is in place, a network described and models are available, the network must be exercised. This is done by means of test generation. The goal of the test generation is to exercise the circuit for two purposes.

I.To show that the design is correct and the system performs according to specification. The test pattern must be agreed between designer and customer. This set of test patterns is used during the design phase, primarily in simulation, to demonstrate that the design is correct. 

II.A second set of test patterns is required to detect faults in the implementation. For example, if a wire has a break in it due to faulty manufacture, then the signal on the ‘driven’ end of this wire will probably be at a fixed logical level. This second set of test generation is needed to give a thorough test of each system built. It is not possible to assess the functionality of the system using these tests, which was the purpose of the first set.





Cont.

- A further set of tests may be needed to check thesystem timing. 

- Some of the tests in the first set may be provided for this purpose but further tests may still be needed.


- Producing a test generation to exercise the specified functions of the design must be done ‘by hand’ since only the designer understands the system behavior. 

- Consider Table 1.1, which represents a test generation of the clock and data sections of the flip-flop of Fig. 1.7, presetand clearbeing assumed inactive. This length of program for such a ‘simple’ device, and not including effects of preset and clear, or checks for possible timing faults, demonstrates the difficultywhen many thousands of gates are involved.

- The really big problem in test generation is, how do we know that the set of test patterns is comprehensive?Consider a 32-bit adder.

- The problem can be made easier if the design is done with testabilityin mind.






Table 1.1 Test data(excerpts) for a flip-flop

(Inactive)

(Active)


Fault simulation

- When a set of test patterns has been generated, it is required to check which faults can be detected. This is done with a fault simulator. 

- Basically, a set of tests is run on a ‘good’ network, and the results recorded. 

- A fault is now introduced into the network, the simulation re-run, and its outputs compared with the good network. 

- If a difference in the primary outputs is found, the fault is detectable.


- The number of possible faults is very large.

- It has been found in practice that, if a set of test patterns will detect all stuck-at faults, it will detect most other faults as well.





Cont.

- The number of possible faults in a large network, and hence the number of simulations to be run, is still very large. 

- If each run were to take several days, the cost would be prohibitive.

- Techniques have been developed to speed things up.

- Fault simulation is a time consuming and expensive business. It is one which is often ignored at the cost of one’s peril.





Timing verification

- The timing verifier examines the structure of the network and determines where the paths of signal groups converge in such a way that a timing error might occur. These include narrow clock pulses(Fig. 1.3) and the usual flip-flop or memory timing problems. 

- However, it may be very pessimistic due to including paths which would be improperly used, and may report many narrow pulses  which are not at critical points in the network or in the timing.

- There are techniques to make timing verifiers less pessimistic, but care has to be taken not to miss significant events as a result. 





Conclusion

- The remainder of the course will expand upon many of the previous sections. 

- Firstly, simulation will be set in the context of electronic computer aided design (ECAD) as a whole.

- The mechanisms involved in the simulator itself are then discussed (These include Chap. 6, 7, and 8).

- The course will continue with an introduction to issues involved in design for testability (DFT). This will be followed by a discussion of fault simulation.





