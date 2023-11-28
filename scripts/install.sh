#!/bin/bash
systemctl stop apache2.service
systemctl restart nginx.service
