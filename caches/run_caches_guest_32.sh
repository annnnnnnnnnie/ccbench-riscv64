BASEDIR=$(dirname "$0")
FIRESIM_START_TRIGGER=/host/usr/bin/firesim-start-trigger
FIRESIM_END_TRIGGER=/host/usr/bin/firesim-end-trigger

appSizeArg=32
numIterations=300100
runType=0

$FIRESIM_START_TRIGGER 
$BASEDIR/caches $appSizeArg $numIterations $runType
$FIRESIM_END_TRIGGER
