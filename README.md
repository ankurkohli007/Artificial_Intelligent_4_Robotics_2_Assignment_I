[Artificial Intelligence for Robotics II](https://corsi.unige.it/en/off.f/2022/ins/60237?codcla=10635)<br>
[M.Sc Robotics Engineering](https://corsi.unige.it/corsi/10635)<br>
[University of Genoa (UniGe)](https://unige.it/en)<br>
**Supervisor:** [Prof. Mauro Vallati](http://maurovallati.blogspot.com/)

# AI4RO2_Assignment1: AI Planning

The work is based on AI Planning which involves the demonstration of an automated warehouse for a company. An automated warehouse helps in order management in a precise way which automatically boost the storage capacity.

* Requirements for the assignment [click here](https://github.com/ankurkohli007/Artificial_Intelligent_4_Robotics_2_Assignment_I/blob/main/AIPlanningAssignemnt/Assignment.pdf).
* Report of the assignment [click here](https://github.com/ankurkohli007/Artificial_Intelligent_4_Robotics_2_Assignment_I/blob/main/AIPlanningAssignemnt/AI%20Planning%20Assignemnt_Group%20I_Ankur%20Kohli_Awais%20Tahir_Subhransu%20Sourav%20Priyadarshan.pdf).

## Abstract

This assignment is about *AI Planning* in which the task is to model an automated warehouse scenario in an efficient manner. We presented with some techniques for handling planning problem throughout the course such as *PDDL+/ Numeric planning*, *Numeric and Temporal planning*, and so on. For this assignment, we used *Numeric and Temporal planning* using *LPG 1.2 Planner*. A planner is used to design an application domain and problem (defines the initial state and goal state), and also to generates a plan.

## Introduction

In this task, we considered the warehouse where we need to implement the AI Planning to automated the warehouse. We taken the scenario in which we are having two ***mover robots*** whose task to moves the crates from the initial position in the warehouse and drop at the loading bay which is near to the conveyor belt. The crates are to be loaded on the conveyor belt by an additional robot named as ***loader robot***. We also have to keep in mind that the weight of the crates is not the same. Some are light-weight, some are fragile while others are heavy-weight. Light crates, (<50kg) can be moved around by a single mover robot while heavy crates (>50kg) need two robots for obvious reasons. Also, light crates can be moved by two mover robots. The time required to move the crate depends on the weight. Hence the formula is used for the time calculation of light crates using single mover robot distance * weight / 100 (for light crates). For heavy crates the time calculation is as same of light crates. As mentioned above light crates can also be carried by two mover robots for this case the time calculation formula will change and calculated by using distance * weight / 150 (for heavy crates). There are also fragile crates. Fragile crates can be heavy or light it’s depend. These fragile crates need extra care to carry from the warehouse to the loading bay. But fragile crates will be carried by two mover robots whether the weight of a fragile crates is less than 50 Kg or more. Also, the time calculation formula for fragile crates will be same as of heavy and light crates. The only change in the speed of the mover robot will effect such as if the mover robot takes 4 times unit to carry the other type of crates and it will take 6 time units instead of 4 time units to carry fragile ones.

## Installation of the planner

To design a plan we used a **LPG Planner**. LPG (Local search for Planning Graphs) ia a planner which is based on local search and planning graphs. These will grasps PDDL 2.1 domains. This PDDL 2.1 domains associates with numerical quantities and durations. This planner able to solve not only plan generation but also plan adaptation problems. The evaluation function uses some heuristics to estimate the "search cost" and the "execution cost" of achieving a (possibly numeric) precondition.

The planner can be dowloaded from the given [link](https://lpg.unibs.it/lpg/).

## Methodology

The movers always start from the loading bay, and distances for crates are provided as straight line distances. There is no risk of interference on the paths between different crates and the loading bay. 

**Domain file:** It consists of one domain file name as ```warehousetaskplanner.pddl```. 

**Problem file:** There four problem files name as ```warehousetaskplannerproblem1.pddl```, ```warehousetaskplannerproblem2.pddl```, ```warehousetaskplannerproblem3.pddl``` and ```warehousetaskplannerproblem4.pddl```.

* **Problem 1:** In problem 1, there are 3 crates; crate, weight 70kg, 10 distance from loading bay, Fragile crate, weight 20kg, 20 distance from loading bay. Crate in group A for extension 1, and crate, weight 20kg, 20 distance from loading bay. Crate in group A for extension 1.
* **Problem 2:** In problem 2, there are 4 crates; crate, weight 70kg, 10 distance from loading bay. Crate in group A for extension 1, Fragile crate, weight 80kg, 20 distance from loading bay. Crate in group A for extension 1, crate, weight 20kg, 20 distance from loading bay. Crate in group B for extension 1, and crate, weight 30kg, 10 distance from loading bay. Crate in group B for extension 1.
* **Problem 3:** In problem 3, there are 4 crates; crate, weight 70kg, 20 distance from loading bay. Crate in group A for extension 1, Fragile crate, weight 80kg, 20 distance from loading bay. Crate in group A for extension 1, crate, weight 60kg, 30 distance from loading bay. Crate in group A for extension 1, and crate, weight 30kg, 10 distance from loading bay.
* **Problem 4:** In problem 4, there are 6 crates; crate, weight 30kg, 20 distance from loading bay. Crate in group A for extension 1, Fragile crate, weight 20kg, 20 distance from loading bay. Crate in group A for extension 1, Fragile crate, weight 30kg, 10 distance from loading bay. Crate in group B for extension 1, Fragile crate, weight 20kg, 20 distance from loading bay. Crate in group B for extension 1, Fragile crate, weight 30kg, 30 distance from loading bay. Crate in group B for extension 1, and crate, weight 20kg, 10 distance from loading bay.

## Running

To run the project, first clone the repository from [here](https://github.com/ankurkohli007/Artificial_Intelligent_4_Robotics_2_Assignment_I.git). After cloning the repository make sure the palnner file is executable if not execute the below command: 

```sh
chmod +x lpg
```

In order to run the program (lpg) it is necessary to specify the value of three parameters indicating ***a file containing a set of PDDL2.1 operators;*** ***a file containing a problem specification in PDDL2.1 (the facts of the initial and goal states);*** ***the maximum number of desired solutions***. This must be specified using: 

* **o** -> operator file name
* **f** -> problem file name
* **n** -> maximum number of solution

After the executable file execute the following commands for the four different problems:

For problem 1:

```sh
./lpg -o warehousetaskplanner.pddl -f warehousetaskplannerproblem1.pddl -n 1
```

For problem 2:

```sh
./lpg -o warehousetaskplanner.pddl -f warehousetaskplannerproblem2.pddl -n 1
```

For problem 3:

```sh
./lpg -o warehousetaskplanner.pddl -f warehousetaskplannerproblem3.pddl -n 1
```

For problem 4:

```sh
./lpg -o warehousetaskplanner.pddl -f warehousetaskplannerproblem4.pddl -n 1
```

