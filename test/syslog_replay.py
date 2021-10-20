#!/usr/bin/env python3

from scapy.all import *
import time
import socket

scapy_cap = PcapReader('syslog_dump.pcap')

i = 0
max = 1000000
delay = 0.3

# redirct to syslog server
syslog_ip = "127.0.0.1"
ignore_port = False
alternate_port = 514
ignore_protocol = False
alternate_protocol = UDP

# basic test
run_basic_test = False

# replay
replay_pcap = True

# include traffic on specified ports
udp_include = [514,1514,50512,50513,50514,50515,50516,50517,50518,50519]
tcp_include = [514,1514,50512,50513,50514,50515,50516,50517,50518,50519]

if run_basic_test:
    prio = 1
    faci = 1
    priority = (prio << 3) | faci
    
    # msg = "testscapy udp"
    # payload = "<{0}>{1}{2}".format(priority, time.strftime("%b %d %H:%M:%S "), msg)
    # myPack = IP(dst=syslog_ip) / UDP(dport=514)/Raw(load=payload)
    # send(myPack)
    
   
    msg = "testscapytcp"
    payload = "<{0}>{1}{2}".format(priority, time.strftime("%b %d %H:%M:%S "), msg)
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((syslog_ip,514))
    s.send(payload.encode())
    s.close()
    
    
    # dst, dport, sport, seq, ack = syslog_ip, 1514, random.randint(1024,65535), 1000, 0
    # p0 = IP(dst=dst)/TCP(sport=sport, dport=dport, flags="S", seq=seq, ack=ack)
    # p1 = sr1(p0)
    # p2 = IP(dst=dst)/TCP(sport=sport, dport=dport, seq=p1.ack,ack=p1.seq+1, flags="A")
    # p3 = sr1(p2)


if replay_pcap:
    for packet in scapy_cap:
        # resend packet if we have protocol and raw layers
        if packet.haslayer(UDP) and packet.haslayer(Raw):
            if "*" in udp_include or packet[UDP].dport in udp_include:
                i = i + 1
                print("PAYLOAD => UDP:{0}".format(packet[UDP].dport))
                payload = packet[Raw].load
                print(payload)
                
                s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
                s.connect((syslog_ip,packet[UDP].dport))
                s.send(payload)
                s.close()
                time.sleep(delay)

        elif packet.haslayer(TCP) and packet.haslayer(Raw):
            if "*" in tcp_include or packet[TCP].dport in tcp_include:
                i = i + 1
                print("PAYLOAD => TCP:{0}".format(packet[TCP].dport))
                payload = packet[Raw].load
                print(payload)
                
                s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                s.connect((syslog_ip,packet[TCP].dport))
                s.send(payload)
                s.close()
                time.sleep(delay)
        
        if i >= max:
            break

        