# RSA-Keygen
My reason for writing this is that I was having trouble replicating the behavior of the padding-free BigInteger-based RSA implementation(the lack of padding is a security issue, a large one at that) that JaGEx(tm) had utilized for RuneScape(tm) Classic years ago(they added it to try to combat AutoRune and other packet injecting/altering hacks in 2004-2006ish) with Golang, no doubt because of my lack of experience in the language.
With that being said, I'd decided to make an RSA key generator for the purpose of utilizing it in my [RSCGo] project, and probably something I'd use for any sort of project where I need to securely exchange login information, or any fixed-length sort of small frames of data.
This code should be fully portable to all major operating systems(Linux, Solaris, Windows, MacOS, the variety of BSD flavors, and I mean hell, Golang is so portable that it could probably be ported to Android and iOS with very little effort, though I'm not sure the identical codebase would be used as it is across the ones I'd just mentioned.

# Building
To compile it, start by downloading the Golang SDK and all the Golang utilities. Next, find the directory within which my project [RSA_Keygen] resides at, then run this command in your terminal emulator of choice:
`go build`
In the directory where the `rsa.go` file is located.

This should create a binary file, which is the binary file for the RSA key generator.
On UNIX-like systems, you just open a terminal, and find the directory it's located at, and run it by typing: `./rsa_keygen`.  Windows is similar I presume, just that it's cmd.exe and not a terminal (emulator) you'd be browsing for and running this executable binary file with.

# Usage
``` sh
$ ./rsa_keygen -h
Usage of ./bin/target/linux/64/rsa_keygen:
  -keylength int
		Max length of key/modulus in bits (default 1024)
```

# Prologue
Well, OKAY everybody!!  This work is distributed under the Unlicense public domain waiver.  It's basically public domain, in license form, to apply where PD doesn't exist.  Copyfree sort of licensing, and I've always been more or less a big fan of it, and for a mildly more restrictive license, ISC or MIT has been my permissive FOSS non-PD-waiver licenses of choice over the past few years.  For this though, definitely PD/Unlicensed as it's not very advanced and truthfully took me like 15 minutes to make it, while being brand new at the language.  So happy that it serves my use case with [RSCGo] so fantastically.
