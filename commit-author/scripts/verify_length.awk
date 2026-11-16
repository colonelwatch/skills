#!/usr/bin/env -S LC_ALL=C.UTF-8 gawk -f

BEGIN {
	if (subject == "") subject = 50
	if (body == "") body = 72
	OFS = "\t"
	found = 0
}

(NR == 1 && length > subject) || (NR == 2 && length) || (NR > 2 && length > body) {
	print NR, length, $0
	found = 1
}

END { if (found) exit 1 }
