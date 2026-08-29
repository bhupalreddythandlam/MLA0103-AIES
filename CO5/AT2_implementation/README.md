# Healthcare Diagnostic Expert System (Prolog)


## Prerequisites
To run this project, you must have SWI-Prolog installed on your system.
* [Download SWI-Prolog here](https://www.swi-prolog.org/download/stable)

## How to Execute

**Step 1: Launch SWI-Prolog**
Open the SWI-Prolog application on your computer. You will see a terminal window with the `?-` prompt.

**Step 2: Consult (Load) the File**
Load the expert system script into the Prolog environment using the `consult/1` predicate. You must use forward slashes (`/`) in the file path. 

Based on your local setup, run the following command and hit Enter:
```prolog
?- consult(['c:/Users/thand/OneDrive/Documents/AIES/lab/CO5/AT2_implementation/diagnostic_system.pl']).

```

*(If successful, Prolog will output `true.`)*

**Step 3: Start the Expert System**
Initialize the diagnostic system by querying the `start` predicate:

```prolog
?- start.
