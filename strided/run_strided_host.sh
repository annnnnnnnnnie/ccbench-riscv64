BASEDIR=$(dirname "$0")

# Expected to be run under in the host OS

numThreads=1
numIterations=50

appSize=32
appStride=1

$BASEDIR/strided $numThreads $appSize $appStride $numIterations

# for appSize in 32 64 128 256 512 1024; do
    # for appStride in 1 2 4; do
    # done
# done

