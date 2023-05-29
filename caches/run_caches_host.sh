BASEDIR=$(dirname "$0")

appSizeArg=5000
numIterations=300100
runType=0

$BASEDIR/caches $appSizeArg $numIterations $runType
