#!/usr/bin/awk -f
BEGIN {
	sampling = ARGV[1]
	delete ARGV[1]
}
!((NR - 1) % sampling)
