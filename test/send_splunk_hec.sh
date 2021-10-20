#!/bin/bash

curl -k -u "x:13A0368D-9E8E-4ADB-AD1E-D4E38759CD62" "https://splunk:8088/services/collector/event" -d '{"sourcetype": "mysourcetype", "event": "Hello, world!"}'