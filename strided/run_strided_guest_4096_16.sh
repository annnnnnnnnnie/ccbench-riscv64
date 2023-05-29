BASEDIR=$(dirname "$0")

# Expected to be run under the guest OS booted by lkvm-static

FIRESIM_START_TRIGGER=/host/usr/bin/firesim-start-trigger
FIRESIM_END_TRIGGER=/host/usr/bin/firesim-end-trigger

numThreads=1
numIterations=50

appSize=4096
appStride=16

$FIRESIM_START_TRIGGER && $BASEDIR/strided $numThreads $appSize $appStride $numIterations && $FIRESIM_END_TRIGGER
