#!/bin/sh

BASEDIR=`dirname -- "$0"` || exit $?
BASEDIR=`realpath -- "${BASEDIR}"` || exit $?

. "${BASEDIR}/update.conf"

set -xe
set -o pipefail

cat -- "${BASEDIR}/Makejail.template" |\
    sed -Ee "s/%%TAG1%%/${TAG1}/g" > "${BASEDIR}/../Makejail"

cat -- "${BASEDIR}/README.md.template" |\
    sed -E \
        -e "s/%%TAG1%%/${TAG1}/g" \
        -e "s/%%TAG2%%/${TAG2}/g" \
        -e "s/%%PYVER1%%/${PYVER1}/g" \
        -e "s/%%PYVER2%%/${PYVER2}/g" \
        -e "s/%%PYVER3%%/${PYVER3}/g" \
        -e "s/%%PYVER4%%/${PYVER4}/g" \
        -e "s/%%PYVER5%%/${PYVER5}/g" \
        -e "s/%%PYVER6%%/${PYVER6}/g" \
        -e "s/%%PYVER_MAJOR%%/${PYVER_MAJOR}/g" > "${BASEDIR}/../README.md"
