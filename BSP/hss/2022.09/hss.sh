#!/bin/sh

git clone https://github.com/polarfire-soc/hart-software-services

cd hart-software-services
git checkout v2022.09
git apply ../aldec_hss_2022_09_v1_0.patch
