#!/bin/bash
systemctl stop apache2.service
systemctl restart nginx.service
docker rm -f be_service
