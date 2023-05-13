BASEDIR=$(dirname "$0")

# Expected to be run under in the host OS
# You can add this result file to the 

numThreads=1
numIterations=50

results="results.strided.firesim.host"
for appSize in 32 64 128 256 512 1024; do
    for appStride in 1 2 4; do
        $BASEDIR/strided $numThreads $appSize $appStride $numIterations >> $results
    done
done
