#/bin/bash

test="strided"

INPUTSIZE="small"
# if you're running riscv, you'll want much shorter input vectors!
#INPUTSIZE="riscv"

architecture="riscv"
proc="rocket_chip"


time_stamp=$(date +%Y-%m-%d_%Hh%Mm%Ss)
report_name=reportfile_${test}_${time_stamp}.txt
plot_name=plot_${test}_${proc}_${time_stamp}
echo " "
echo "*****************************************************************"
echo "Building TEST: " $test "  " $time_stamp  " : " 
echo "*****************************************************************"
echo " "

cd $test; make clean; make
echo " "
