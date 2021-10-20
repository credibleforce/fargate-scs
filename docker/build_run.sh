#!/bin/bash

sudo docker build . -t sc4s
sudo docker run --name sc4s -p 514:514/tcp -p 50512-50519:50512-50519/tcp -p 1514:1514/tcp -p 514:514/udp -p 50512-50519:50512-50519/udp -p 1514:1514/udp -d sc4s:latest