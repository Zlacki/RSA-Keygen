#!/bin/bash

# Set the name of the binary file to create
BINARY_NAME='rsakey'


# Clean the old binaries.  Might be unnecessary, not sure.
echo -n "Cleaning old $BINARY_NAME binaries..."
find ./bin -iname "$BINARY_NAME*" -delete
echo 'done'

function buildBinaries() {
    local arch=$1
    local os=$2
    local osName=$3
    local shortArch='64'
    local binSuffix=''

    if [[ $arch = 'amd64' ]]; then
        shortArch='64'
    else
        shortArch='32'
    fi

    if [[ $os = 'windows' ]]; then
        binSuffix='.exe'
    fi

    echo -n "Building $BINARY_NAME for $osName/$shortArch(bin/target/$os/$shortArch/$BINARY_NAME$binSuffix)..."
    GOARCH=$arch GOOS=$os go build -o "bin/target/$os/$shortArch/$BINARY_NAME$binSuffix"
    echo 'done'
}
buildBinaries 386 linux Linux
buildBinaries amd64 linux Linux
buildBinaries 386 openbsd OpenBSD
buildBinaries amd64 openbsd OpenBSD
buildBinaries 386 freebsd FreeBSD
buildBinaries amd64 freebsd FreeBSD
buildBinaries 386 netbsd NetBSD
buildBinaries amd64 netbsd NetBSD
buildBinaries 386 darwin 'MacOS/Darwin'
buildBinaries amd64 darwin 'MacOS/Darwin'
buildBinaries amd64 solaris 'Solaris based systems'
buildBinaries 386 windows Windows
buildBinaries amd64 windows Windows
