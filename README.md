# RSA-Keygen
So, I was having trouble replicating the behavior of the padding-free BigInteger-based RSA implementation that Jagex had utilized for RSClassic years ago(2005-2006ish) in Golang, no doubt because of my lack of experience in it, and with that being said, decided to make a RSA keygen for the purpose of utilizing  it in an RSClassic server and probably something I'd use for any ventures I make toward an OSRS/RS2/EOC server(s) as well.  This code should be fully portable to all major operating systems(Linuxen, Solarisen, OpenIndiana(OpenSolaris sequel once Sun/Oracle killed it), uhh...Windows, MacOS X, hell it could probably be ported to Android and iOS with very little effort.

# Building
Anyways, to use it, compile it by downloading the Go SDK and finding the directory within which rsa.go resides, then running this in a terminal (emulator) of some sort: 

go build rsa.go
or
go build *.go
or
go build

In the directory where the rsa.go file is located.

This should create a binary file, which is the binary file for the RSA key generator.  On UNIX-like systems, you just open a terminal find the directory it's located at, and run it by typing: [code]./rsa-test[/code].  Windows is similar I presume, just that it's cmd.exe and not a terminal (emulator) you'd be browsing for and running this executable binary file with.

# Usage
$ ./rsa-test --help
Usage of ./rsa-test:
  -keylength int
    	Max length of key/modulus in bits (default 1024)

# Prologue
Well, OKAY everybody!!  This work is distributed under the WTFPLv2.  It's basically public domain, but without being public domain.  Copyleft sort of licensing, and I've always been more or less a big fan of it, and for a mildly more restrictive license, ISC or MIT has been my ones of choice over past few years.  For this though, definitely WTFPLv2 as it's not very advanced and truthfully took me like 15 minutes to make it, while being brand new at the language.


            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2018 Zachariah Knight <aeros.storkpk@gmail.com>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
