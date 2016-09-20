#!/usr/bin/awk -f
BEGIN {
	before = ARGV[1]
	after = ARGV[2]
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
			printf(" %.3f", (sums[NR, i] - sums[li - before - 1, i]) \
			                / ((li > before + 1 ? before : before - li + 1) + 1 + after))
		} else {
			printf(" %s", values[li, i]);
		}
	}
	delete values[li - 1]
	delete sums[li - before - 1]
	printf("\n")
}

END {
	for (li = NR - after + 1; li <= NR; ++li) {
		printf("%s", values[li, 1]);
		for (i = 2; i <= n; ++i) {
			if (values[li, i] ~ /[0-9]+\.[0-9]+/) {
				printf(" %.3f", (sums[NR, i] - sums[li - before - 1, i]) \
				                / (before + 1 + NR - li))
			} else {
				printf(" %s", values[li, i]);
			}
		}
		delete values[li - 1]
		delete sums[li - before - 1]
		printf("\n")
	}
}
