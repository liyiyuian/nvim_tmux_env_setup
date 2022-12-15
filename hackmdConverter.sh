#!/bin/bash
################################################################################
# Filename: hackmdConverter.sh
# Author: Ian Lee
# Date created: 12.15.2022
# Date updated: 12.15.2022
# Description: create a local .md file, copy the context from hackmd, and run
#              with this script. An html file will be generaetd.
################################################################################
input=$1
echo "# Working on $input... "
echo "# TOC, warning blocks, tags, highlihgts will be removed."

echo "# Start parsing $input"
sed '/^:/,/^:/d' $input > "tmp_${input}"
sed -i '/\[TOC\]/d' "tmp_${input}"
sed -i '/###### tags/d' "tmp_${input}"
sed -i 's/bash=/bash/g' "tmp_${input}"
sed -i 's/python=/python/g' "tmp_${input}"

cat "tmp_${input}" | while read line
do
	if echo "$line" | grep -q '==.*=='
	then
		newline=`echo "$line" | sed 's/==/**/g'`
		echo "$newline" >> "tmp2_${input}"
	else
		echo "$line" >> "tmp2_${input}"
	fi
done

sed -i 's/\*\*\*\*/\*\*/g' "tmp2_${input}"

echo  "\`\`\` {=html}<style>body { min-width: 80% !important; }</style>\`\`\`" >> "tmp2_${input}"

echo "# Start converting file with pandoc..."
pandoc "tmp2_${input}" -f markdown -t html -s -o ${input%.md}.html
rm "tmp_${input}"
rm "tmp2_${input}"

echo "# Done"
