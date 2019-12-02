#!/bin/bash
# W# = GPU ID # TOTAL WATT
# SMILINE = nvidia-smi output line
# LOOPS = TOTAL TIMES nvidia-smi was run
W1=0
W2=0
SMILINE=0
LOOPS=1
while true; do
        while read i; do
                if (($SMILINE == 14)); then
                        length=${#i}
                        if ((length == 79)); then
                                W1=$(($W1 + ${i:20:3}))
                        else
                                W1=$(($W1 + ${i:20:4}))
                        fi
                fi
                if (($SMILINE == 17)); then
                        length=${#i}
                        if ((length == 79)); then
                                W2=$(($W2 + ${i:20:3}))
                        else
                                W2=$(($W2 + ${i:20:3}))
                        fi
                fi
                ((SMILINE+=1))
        done < <(nvidia-smi)
        echo "GPU1 AVERAGE WATT" > ./gpu.log
        echo "scale=2; $W1/$LOOPS" | bc >> ./gpu.log
	echo "GPU2 AVERAGE WATT" >> ./gpu.log
        echo "scale=2; $W2/$LOOPS" | bc >> ./gpu.log
	echo "Number of Loops: " $LOOPS >> ./gpu.log
        ((LOOPS+=1))
        ((SMILINE=0))
done
