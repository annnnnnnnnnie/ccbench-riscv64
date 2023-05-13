BASEDIR=$(dirname "$0")

# Expected to be run under the guest OS booted by lkvm-static

FIRESIM_START_TRIGGER=/host/usr/bin/firesim-start-trigger
FIRESIM_END_TRIGGER=/host/usr/bin/firesim-end-trigger

numThreads=1
numIterations=50

for appSize in 32 64 128 256 512 1024; do
    for appStride in 1 2 4; do
        $FIRESIM_START_TRIGGER && $BASEDIR/strided $numThreads $appSize $appStride $numIterations && $FIRESIM_END_TRIGGER
    done
done
