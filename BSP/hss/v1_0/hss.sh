#!/bin/sh

git clone https://github.com/polarfire-soc/hart-software-services
cd hart-software-services
git checkout 58b03943834fe34991dc5fa924436b3620e07aa5
git apply ../aldec_hss_v1_0.patch
