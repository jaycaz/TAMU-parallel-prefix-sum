#!/bin/bash

maxnums="1400000"
startnum="500000"
numinc="100000"
maxthreads="12"
startthread="1"
iters="50"

writefile="testomp.txt"

cat /dev/null > $writefile

# Perform tests up to maxthreads and maxnums
# Increase $nums linearly by $numinc
# Increase $threads linearly by 1
thread=$startthread
while [ $thread -le $maxthreads ]
do
	num=$startnum
	while [ $num -le $maxnums ]
    do
        printf "%d threads, %d nums\n" $thread $num
		time=`./psum_openmp $thread $num $iters`
        printf "%f\t" $time >> $writefile
		wait
		num=$[$num+$numinc]
	done
	thread=$[$thread+1]
	printf "\n" >> $writefile
done
