#!/usr/bin/awk -f
BEGIN {
	before = ARGV[1] # time slices before a sample point (including the
	                 # current sample)
	after = ARGV[2]  # time slices after the sample poit (excluding the
	                 # current sample)
	delete ARGV[1]
	delete ARGV[2]
}

NR == 1
NR > 1 {
	n = split($0, fields)
	for (i = 1; i <= n; ++i) {
		values[NR, i] = fields[i]
	}
	for (i = 2; i <= n; ++i) if (fields[i] ~ /[0-9]+\.[0-9]+/) {
		sums[NR, i] = sums[NR - 1, i] + fields[i]
	}
	delete fields
}

NR > after + 1 {
	li = NR - after;
	printf("%s", values[li, 1]);
	for (i = 2; i <= n; ++i) {
		if (values[li, i] ~ /[0-9]+\.[0-9]+/) {
			printf(" %.3f", (sums[NR, i] - sums[li - before, i]) \
			                / ((NR - 1 > before ? before : NR - 1) + after))
		} else {
			printf(" %s", values[li, i]);
		}
	}
	printf("\n")
	for (i = 1; i <= n; ++i) {
		delete values[li, i];
		delete sums[li - before, i]
	}
}

END {
	for (li = NR - after + 1; li <= NR; ++li) {
		printf("%s", values[li, 1]);
		for (i = 2; i <= n; ++i) {
			if (values[li, i] ~ /[0-9]+\.[0-9]+/) {
				printf(" %.3f", (sums[NR, i] - sums[li - before, i]) \
				                / (before + NR - li))
			} else {
				printf(" %s", values[li, i]);
			}
		}
		printf("\n")
		for (i = 1; i <= n; ++i) {
			delete values[li, i];
			delete sums[li - before, i]
		}
	}
}
