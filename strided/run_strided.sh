BASEDIR=$(dirname "$0")

numThreads=1
numIterations=50

resultFile=strided.result
for appSize in 32 64 128 256 512 1024; do
    for appStride in 1 2 4; do
        $BASEDIR/strided $numThreads $appSize $appStride $numIterations >> $resultFile
    done
done

