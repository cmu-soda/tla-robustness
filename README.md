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

Unfortunately the tool is rather brittle, and it appears that it needs to be run in the same directory as the TLA+ files that you feed to it.
