#!/bin/bash

tshark -r syslog_dump.pcap --disable-protocol syslog -Y "udp.port eq 514" -T fields -e data | xxd -r -p