#!/bin/bash

# Set the name of the binary file to create, global var
BINARY_NAME='rsakey'


# Clean the old binaries.  Might be unnecessary, not sure.
function cleanBinaries() {
    echo -n "Cleaning old $BINARY_NAME binaries..."
    find ./bin/ -executable -xtype f -delete
    echo 'done'
}

# Build new binaries.  Takes 3 arguments.
#
# arg1(arch): the target platforms architecture
# arg2(os): the target platforms operating system
# arg3(osName): human-readable version of the OS name, for printing messages
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

    echo -n "Building $BINARY_NAME for $osName/$shortArch dir(bin/target/$os/$shortArch/$BINARY_NAME$binSuffix)..."
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
