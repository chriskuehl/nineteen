#!/bin/bash
setfacl -Rm \
d:group:design19:rwx,d:user:www-data:r-x,d:user:$1:rwx,d:group:$1:rwx,\
group:design19:rwx,user:www-data:r-x,user:$1:rwx,group:$1:rwx $2
