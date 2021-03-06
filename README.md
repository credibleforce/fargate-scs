# AWS Fargate SCS

Example deployment of Splunk Connect for Syslog to Fargate Cluster

## Initial Setup

There are a number of placeholders in this example that need to be replaced:

- YOUR_HEC_TOKEN_HERE: Splunk HEC Token
- YOUR_HEC_URL_HERE: Splunk HEC URL
- YOUR_EXTERNAL_SYSLOG_SERVER_HERE: Example fireye external syslog destination with certs
- YOUR_CERT_HERE: The name of the certificate to use to Syslog over TLS

## Challenges with Fargate

Challenges with using fargate as a syslog server:

- There is a 5 port limit on services, if you are using a syslog scheme where unique services map to unique ports it means multiple services
- All port mapping needs to be done at each layer, container, load balancer, service. Misalignment can lead to pain :)

## Testing

This repo also contains some potentially useful scripts for other engagements. When migrating to Fargate it's handy to be able to replay some traffic from your prod server. The contains the syslog_replay.py script which takes a pcap file with syslog data and replays that back. Times and dates remain unchanged although I suppose you could hack this script to modify those.
