in_device	::  FromDump("sampletrace2.pcap", STOP true)
myfirewall :: StatefulFirewall(POLICYFILE "sample_policy.1", DEFAULT 0);
in_device -> Strip(14) -> CheckIPHeader2 -> myfirewall;
myfirewall[0] -> Print(notok) -> Discard;
myfirewall[1] -> Print(ok) -> Discard;
