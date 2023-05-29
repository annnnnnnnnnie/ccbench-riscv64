BASEDIR=$(dirname "$0")
FIRESIM_START_TRIGGER=/host/usr/bin/firesim-start-trigger
FIRESIM_END_TRIGGER=/host/usr/bin/firesim-end-trigger

appSizeArg=64
numIterations=300100
runType=0

$BASEDIR/caches $appSizeArg $numIterations $runType
