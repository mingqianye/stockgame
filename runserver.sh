#!/bin/bash
set -x 
rake db:create 
rake db:migrate
rails s -p 8080
