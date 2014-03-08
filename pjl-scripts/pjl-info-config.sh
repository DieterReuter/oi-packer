#!/bin/sh -x

#echo "\033%-12345X\n@PJL INFO CONFIG\n@PJL EOJ\n\033%-12345X" | od -bc
echo "\033%-12345X\n@PJL INFO CONFIG\n@PJL EOJ\n\033%-12345X" | nc -v 194.49.3.130 9100

