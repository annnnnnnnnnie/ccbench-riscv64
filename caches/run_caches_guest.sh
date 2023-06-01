BASEDIR=$(dirname "$0")

numIterations=300000
runType=0

for appSizeArg in 32768 65536 131702 262144
do 
  $BASEDIR/caches $appSizeArg $numIterations $runType
  sleep 10
done
