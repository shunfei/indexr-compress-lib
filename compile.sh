SCRIPT_DIR=$(cd $(dirname $0);echo $PWD)
ROOT_DIR=${SCRIPT_DIR}

SRCROOT=${ROOT_DIR}/src
LIBDIR=${ROOT_DIR}/lib
CPP_OUT_DIR=${ROOT_DIR}/cpp-out

mkdir -p ${LIBDIR}
mkdir -p ${CPP_OUT_DIR}

cd ${CPP_OUT_DIR}

if [[ "${OSTYPE}" == "linux"* ]] || [[ "${OSTYPE}" == "cygwin"* ]]; then
    BHLIB=libbhcompress.so
elif [[ "${OSTYPE}" == "darwin"* ]]; then
    BHLIB=libbhcompress.dylib
else
    echo "Platform ${OSTYPE} not supported!"
    exit 1
fi

rm -f ${LIBDIR}/${BHLIB}
rm -f ${CPP_OUT_DIR}/*.o

g++ -O3 -c -fPIC -I${SRCROOT} ${SRCROOT}/compress/*.cpp
g++ -O3 -c -fPIC -I${SRCROOT} ${SRCROOT}/javaitf/*.cpp
g++ -shared -fPIC -O3 -o ${LIBDIR}/${BHLIB} ${CPP_OUT_DIR}/*.o

if [ ! "x$?" = "x0" ]; then
    exit $?
fi

rm -rf ${CPP_OUT_DIR}

echo "Generated ${LIBDIR}/${BHLIB}"
