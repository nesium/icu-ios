export ICU_PATH="$(pwd)/icu"
export ICU_FLAGS="-I$ICU_PATH/source/common/ -I$ICU_PATH/source/tools/tzcode/ -O3 \
-DU_USING_ICU_NAMESPACE=1 -fno-short-enums -DU_HAVE_NL_LANGINFO_CODESET=0 \
-D__STDC_INT64__ -DU_TIMEZONE=0 -DUCONFIG_NO_LEGACY_CONVERSION=1 \
-DUCONFIG_NO_BREAK_ITERATION=1 -DUCONFIG_NO_COLLATION=1 \
-DUCONFIG_NO_TRANSLITERATION=1 -DUCONFIG_NO_REGULAR_EXPRESSIONS=1"


ICU_ROOT=$(pwd)

./configure_i386.sh
mkdir -p build-i386 && cd build-i386 && gnumake

cd $ICU_ROOT

./configure_x86_64.sh
mkdir -p build-x86_64 && cd build-x86_64 && gnumake

cd $ICU_ROOT

./configure_armv7.sh
mkdir -p build-armv7 && cd build-armv7 && gnumake

cd $ICU_ROOT

./configure_armv7s.sh
mkdir -p build-armv7s && cd build-armv7s && gnumake

cd $ICU_ROOT

./configure_arm64.sh
mkdir -p build-arm64 && cd build-arm64 && gnumake

cd $ICU_ROOT

echo "Combining i386, x86 64, armv7, armv7s, and arm64 libraries."

./make_universal.sh
