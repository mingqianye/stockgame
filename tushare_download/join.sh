#!/bin/bash
join -t "," <(sort tmp1.csv ) <(sort tmp2.csv)
