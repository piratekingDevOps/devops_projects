#!/bin/bash

LOG_FILE=$1

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' $LOG_FILE \
	| sort \
	| uniq -c \
	| sort -nr \
	| head -5 \
	| awk '{printf "%s - %d requests\n", $2, $1}'
echo

echo "Top 5 most requested paths"
awk -F\" '{print $2}' $LOG_FILE \
	| sort \
	| uniq -c \
	| sort -nr \
	| head -5 \
	| awk '{printf "%s - %d requests\n", $3,  $1}'
echo

echo "Top 5 most response status codes"
awk '
{
	count[$9]++
}
END {
	for (code in count)
	printf "%s - %d requests\n", code, count[code]
}
' "$LOG_FILE" \
| sort -t'-' -k2 -nr \
| head -5
echo

echo "Top 5 user agents"
awk -F\" '

$6 !="-" && $6!="" { count[$6]++ }

END {
	for ( user in count )
	printf "%s - %d requests\n", user, count[user]
}
' $LOG_FILE \
| sort -t'-' -k2 -nr \
| head -5 \
| awk -F' - | requests ' '{split($1, a, " "); print a[1]," - ",$2," requests"}'
