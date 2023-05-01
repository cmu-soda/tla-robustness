---- MODULE MC ----
EXTENDS OAuth, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
TokenAlice, TokenEve
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
CodeAlice, CodeEve
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
SessionX, SessionY
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
CredAlice, CredEve
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
IDAlice, IDEve
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
Alice, Eve
----

\* MV CONSTANT definitions AccessToken
const_1682968123840512000 == 
{TokenAlice, TokenEve}
----

\* MV CONSTANT definitions AuthCode
const_1682968123840513000 == 
{CodeAlice, CodeEve}
----

\* MV CONSTANT definitions Session
const_1682968123840514000 == 
{SessionX, SessionY}
----

\* MV CONSTANT definitions Cred
const_1682968123840515000 == 
{CredAlice, CredEve}
----

\* MV CONSTANT definitions UID
const_1682968123840516000 == 
{IDAlice, IDEve}
----

\* MV CONSTANT definitions Proc
const_1682968123840517000 == 
{Alice, Eve}
----

\* CONSTANT definitions @modelParameterConstants:6AS_creds
const_1682968123840518000 == 
(IDAlice :> CredAlice @@ IDEve :> CredEve)
----

\* CONSTANT definitions @modelParameterConstants:7AS_tokens
const_1682968123840519000 == 
(CodeAlice :> TokenAlice @@ CodeEve :> TokenEve)
----

\* CONSTANT definitions @modelParameterConstants:8AS_codes
const_1682968123840520000 == 
(IDAlice :> CodeAlice @@ IDEve :> CodeEve)
----

\* CONSTANT definitions @modelParameterConstants:10Proc_cred
const_1682968123840521000 == 
(Alice :> CredAlice @@ Eve :> CredEve)
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_1682968123840522000 ==
[]\A s \in Session : (client_tokens[s] = TokenAlice) => ~(user_session[Eve] = s)
----
=============================================================================
\* Modification History
\* Created Mon May 01 15:08:43 EDT 2023 by eunsukkang
