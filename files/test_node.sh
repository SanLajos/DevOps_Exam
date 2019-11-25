#!/bin/bash

server="192.168.56.231:6543"
expected="DevOps Exam"


if curl -s "$server" | grep "$expected"
then
    echo "nodeJS server working as expected."
else
    echo "nodeJS server is not working"
fi