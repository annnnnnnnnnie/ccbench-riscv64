BASEDIR=$(dirname "$0")

# Expected to be run under the guest OS booted by lkvm-static

numThreads=1
numIterations=300000

appStride=16
for appSize in 1024 4096 8192 131072 262144
do
  $BASEDIR/strided $numThreads $appSize $appStride $numIterations
  sleep 10
done

appStride=1024
for appSize in 131072 262144
do
  $BASEDIR/strided $numThreads $appSize $appStride $numIterations
  sleep 10
done
