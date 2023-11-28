#!/bin/sh

if [ $# -lt 1 ];
then
	echo "Need one filee as argument that must exist!"
  exit 1
fi

outFile="${1}.csv"

if [ -f "${outFile}" ]; then

	echo "ERROR: file ${outFile} already exists. Move it away eventually."
  exit 2
fi

if [ -f "$1" ]; then

  echo "converting file $1 ..."
	tempFile=/dev/shm/temp_convert.txt
  dos2unix "${1}" # just in case
	#eliminate empty lines
	grep -v '^$' < "$1" | grep -v Start > $tempFile
	echo "Timestamp,TotalMem,FreeMem,CurT,MaxT,SSNs,SSNx,SSNAvg,REQs,REQx,REQAvg,StartReq,EndReq" >"$outFile"
	while IFS=' ' read -r c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15
	do
		printf "%sT%sZ,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n" "$c1" "$c2" "0x$c4" "0x$c5" "0x$c6" "0x$c7" "0x$c8" "0x$c9" "0x$c10" "0x$c11" "0x$c12" "0x$c13" "0x$c14" "0x$c15" >>"$outFile"
	done < $tempFile
	
	rm $tempFile
  echo "done converting file $1"
else
	echo "First argument needs to be an existing file"
fi
