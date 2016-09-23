#!/usr/bin/awk -f
NR == 1
NR == 1 {
	n = split($0, names)
}
NR > 1 {
	split($0, fields)
	printf("%s", fields[1])
	for (i = 2; i <= n; ++i) {
		if (names[i] !~ /^max\(.*\)$/) {
			printf(" %s", fields[i])
			continue
		}
		name = names[i]
		sub(/^max\(/, "", name)
		sub(/s\)$/, "", name)
		name = "^.*\." name "$"
		max=-9999999999

		for (p = 2; p < n; ++p) {
			if (names[p] ~ name) {
				max = max > fields[p] ? max : fields[p]
			}
		}
		printf(" %s", max)
	}
	printf("\n")
}
