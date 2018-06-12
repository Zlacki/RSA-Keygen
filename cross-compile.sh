#!/bin/bash

# CLEAN ALL TARGET BINS
echo -n 'Cleaning old binaries...'
find ./bin -iname 'rsa_keygen*' -delete
echo 'done'

# BUILD NEW TARGET BINS, LOTS OF THEM
echo -n 'Building binaries for OpenBSD...'
GOARCH=amd64 GOOS=openbsd go build -o bin/target/openbsd/64/rsa_keygen
GOARCH=386 GOOS=openbsd go build -o bin/target/openbsd/32/rsa_keygen
echo 'done'
echo -n 'Building binaries for Darwin/MacOSX...'
GOARCH=amd64 GOOS=darwin go build -o bin/target/darwin/64/rsa_keygen
GOARCH=386 GOOS=darwin go build -o bin/target/darwin/32/rsa_keygen
echo 'done'
echo -n 'Building binaries for NetBSD...'
GOARCH=amd64 GOOS=netbsd go build -o bin/target/netbsd/64/rsa_keygen
GOARCH=386 GOOS=netbsd go build -o bin/target/netbsd/32/rsa_keygen
echo 'done'
echo -n 'Building binaries for FreeBSD...'
GOARCH=amd64 GOOS=freebsd go build -o bin/target/freebsd/64/rsa_keygen
GOARCH=386 GOOS=freebsd go build -o bin/target/freebsd/32/rsa_keygen
echo 'done'
echo -n 'Building binaries for Windows...'
GOARCH=amd64 GOOS=windows go build -o bin/target/windows/64/rsa_keygen.exe
GOARCH=386 GOOS=windows go build -o bin/target/windows/32/rsa_keygen.exe
echo 'done'
echo -n 'Building binaries for Linux...'
GOARCH=amd64 GOOS=linux go build -o bin/target/linux/64/rsa_keygen
GOARCH=386 GOOS=linux go build -o bin/target/linux/32/rsa_keygen
echo 'done'
echo -n 'Building binaries for (Open)(Solaris|Indiana) (amd64 only)...'
GOARCH=amd64 GOOS=solaris go build -o bin/target/solaris/64/rsa_keygen
echo 'done'
