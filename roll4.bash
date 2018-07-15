#!/bin/bash
# roll 4, drop lowest. kb3mpn
#
# ProTip: If you want to make this easier on yourself and roll all six 
#         ability scores at once, just fire it up on the command line
#         like this:
#
# for i in {1..6}; do ./roll4.bash | grep Result; done
#
findlowest()
{
	minroll=$1
	eval minsmall=\$$1
	for i in $*
	do
		eval roll=\$$i
		if [[ $roll -lt $minsmall ]]
			then
		minroll=$i
		minsmall=$roll
	fi
done
}
roll1=`shuf -i1-6 -n1`
roll2=`shuf -i1-6 -n1`
roll3=`shuf -i1-6 -n1`
roll4=`shuf -i1-6 -n1`
echo "Roll 1: $roll1"
echo "Roll 2: $roll2"
echo "Roll 3: $roll3"
echo "Roll 4: $roll4"
findlowest roll1 roll2 roll3 roll4
echo Lowest roll: $minsmall
result="$(($roll1+$roll2+$roll3+$roll4-$minsmall))"
echo Final Result: $result
