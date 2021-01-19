#!/bin/bash

sudo rclone copy /home/production/screening_test EFCO_test_script:screening_test -P
sudo rclone copy /home/production/tools EFCO_test_script:tools -P

