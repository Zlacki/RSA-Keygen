package main

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/gob"
	"encoding/pem"
	"flag"
	"fmt"
	"os"
	"strconv"
)

func main() {
	var maxBitLen = flag.Int("keylength", -1, "Max length of key/modulus in bits")
	flag.Parse()
	if *maxBitLen == -1 && len(os.Args) > 1 {
		newBitLen, _ := strconv.Atoi(os.Args[1])
		maxBitLen = &newBitLen
	} else if *maxBitLen == -1 {
		newBitLen := 1024
		maxBitLen = &newBitLen
	}

	if *maxBitLen < 1024 || *maxBitLen > 4096 {
		fmt.Println("Error: Bit length must be between 1024 bits and 4096 bits")
		os.Exit(1)
	}

	fmt.Printf("Generating RSA keys of: %d bits, please wait...\n", *maxBitLen)

	keyPair, _ := rsa.GenerateMultiPrimeKey(rand.Reader, 6, *maxBitLen)
	fmt.Printf("Pub: [%d];\nPriv:[%d];\nMod:[%d];\n", keyPair.E, keyPair.D, keyPair.N)
	savePrivatePEMKey("private.pem", keyPair)
	savePublicPEMKey("public.pem", keyPair.PublicKey)
}

func saveGobKey(fileName string, key interface{}) {
	outFile, err := os.Create(fileName)
	if err != nil {
		fmt.Printf("ERROR:saveGobKey(can not create file?  Here's why...):\n%s\n", err.Error())
		/* I guess we'll kill the whole application at this moment. */
		os.Exit(1)
	}
	defer outFile.Close()

	encoder := gob.NewEncoder(outFile)
	err = encoder.Encode(key)
	if err != nil {
		fmt.Printf("ERROR:saveGobKey(Can not encode the key?  Here's why...):\n%s\n", err.Error())
		os.Exit(1)
	}
}

func savePrivatePEMKey(fileName string, key *rsa.PrivateKey) {
	outFile, err := os.Create(fileName)
	if err != nil {
		fmt.Printf("ERROR:savePrivatePEMKey(Can not create the file?  Here's why...):\n%s\n", err.Error())
		os.Exit(1)
	}
	defer outFile.Close()

	var privateKey = &pem.Block{
		Type:  "PRIVATE KEY",
		Bytes: x509.MarshalPKCS1PrivateKey(key),
	}

	err = pem.Encode(outFile, privateKey)
	if err != nil {
		fmt.Printf("ERROR:savePrivatePEMKey(Could not encode private key?  Here's why...):\n%s\n", err.Error())
		os.Exit(1)
	}
}

func savePublicPEMKey(fileName string, pubkey rsa.PublicKey) {
	asn1Bytes, err := x509.MarshalPKIXPublicKey(&pubkey)
	if err != nil {
		fmt.Printf("ERROR:savePublicPEMKey(Can not create the file?  Here's why...):\n%s\n", err.Error())
		os.Exit(1)
	}

	var pemkey = &pem.Block{
		Type:  "PUBLIC KEY",
		Bytes: asn1Bytes,
	}

	pemfile, err := os.Create(fileName)
	if err != nil {
		fmt.Printf("ERROR:savePublicPEMKey(Can not create the file?  Here's why...):\n%s\n", err.Error())
		os.Exit(1)
	}
	defer pemfile.Close()

	err = pem.Encode(pemfile, pemkey)
	if err != nil {
		fmt.Printf("ERROR:savePublicPEMKey(Can not encode the file?  Here's why...):\n%s\n", err.Error())
		os.Exit(1)
	}
}
