# tla-robustness

The purpose of this repo is to make it simple to run the tla-robustness tool.
The code for the robust version of the TLC binary can be found <a href="https://github.com/iandardik/tlaplus">here</a>.
The code for the robust version of the FOL separator tool can be found <a href="https://github.com/iandardik/folseparators-tla">here</a>.
The tool should simply work out of the box using python3:
```
python3 robustness.py --help
```

Here is an example of using the tool to calculate robustness for the Voting example:
```
$ cd test/voting2
$ python3 ../../robustness.py --cleanup --outdir out --spec Voting.tla
TLA+ Module: Voting
Diff rep grouped by action:

Confirm:
Safety boundary representation: out/Voting_Confirm_diff_rep.txt
Safety boundary rep formula (with sort definitions):
Sort4 == {"Kevin","David","None","Ian"}
/\ booth = {"eofficial"}
/\ state = "confirm"
/\ confirmed = {}
/\ \A S \in Sort4 : (eoChoice # "None" /\ (voterChoice # S \/ eoChoice # S))
```

In this example, we use the following options:
- The option --cleanup to delete any files or folders the tool creates. This is not required.
- The option --outdir out to create a folder "out" and store temporary files here. This is required.
- The option --spec Voting.tla to calculate robustness for Voting.tla. This is required, but different modes are available (see usage).
Using the --spec option (without --spec2 or --compare) will calculate the spec's "robustness".
In particular, we display the spec's safety boundary to represent the spec's robustness.
The safety boundary is simply a set of states that can violate the safety property in one step, if the environment makes an appropriate deviation.
We write every state in the safety boundary to out/Voting_Confirm_diff_rep.txt, as indicated in the output above.
Since we use the --cleanup flag, the folder out/ will be deleted; removing the flag will keep out/ and all its contents.
The output also contains an FOL formula that concisely describes the set of states in the safety boundary.
This may be useful to quickly understand the safety boundary, since looking at the individual states (in out/Voting_Confirm_diff_rep.txt) may be tough and time consuming.


## System Requirements
This tool has been tested with the following Python and Java versions:
```
$ python3 --version
Python 3.10.9
$ java --version
java 18.0.2.1 2022-08-18
Java(TM) SE Runtime Environment (build 18.0.2.1+1-1)
Java HotSpot(TM) 64-Bit Server VM (build 18.0.2.1+1-1, mixed mode, sharing)
```


## Tips and Assumptions
- Unfortunately the tool is rather brittle, and it appears that it needs to be run in the same directory as the TLA+ files that you feed to it.
- For formula inference to work, there must be a TypeOK. It must be exactly called "TypeOK".
- The tool will generate the entire state space in the TypeOK, so if the TypeOK describes an infinite or large number of states then the tool may not terminate.
- The tool cannot handle the CONSTANT keyword.
- Formula inference works for state variables with primitive types: Natural, Integer, and String. Formula inference also works for sets of primitives and functions with domain/range of primitives. Unfortunately, sets of sets, functions with sets in the domain/range, etc. are not yet supported.
- Choosing --spec <spec.tla> assumes there is also a file in the same folder named <spec.cfg>. This assumption can be overriden by explicitly specfying a config file using the --config option.
