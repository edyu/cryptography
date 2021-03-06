// Copyright 2019-2020 Gohilla Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:cryptography/cryptography.dart';

const Cipher webAesCbc = null;

const Cipher webAesCtr = null;
const Cipher webAesGcm = null;
const KeyExchangeAlgorithm webEcdhP256 = null;

const KeyExchangeAlgorithm webEcdhP384 = null;
const KeyExchangeAlgorithm webEcdhP521 = null;
const SignatureAlgorithm webEcdsaP256Sha256 = null;

const SignatureAlgorithm webEcdsaP384Sha256 = null;
const SignatureAlgorithm webEcdsaP384Sha384 = null;
const SignatureAlgorithm webEcdsaP521Sha256 = null;
const SignatureAlgorithm webEcdsaP521Sha512 = null;
const SignatureAlgorithm webRsaPss = null;

const HashAlgorithm webSha1 = null;
const HashAlgorithm webSha256 = null;
const HashAlgorithm webSha384 = null;
const HashAlgorithm webSha512 = null;

bool get isWebCryptoSupported => false;

class WebRsaPss extends SignatureAlgorithm {
  WebRsaPss(HashAlgorithm hashAlgorithm);

  @override
  String get name => throw UnimplementedError();

  @override
  int get publicKeyLength => null;

  @override
  KeyPair newKeyPairSync() {
    throw UnimplementedError();
  }

  @override
  Signature signSync(List<int> input, KeyPair keyPair) {
    throw UnimplementedError();
  }

  @override
  bool verifySync(List<int> input, Signature signature) {
    throw UnimplementedError();
  }
}

class WebRsaSsaPkcs1v15 extends SignatureAlgorithm {
  WebRsaSsaPkcs1v15(HashAlgorithm hashAlgorithm);

  @override
  String get name => throw UnimplementedError();

  @override
  int get publicKeyLength => null;

  @override
  KeyPair newKeyPairSync() {
    throw UnimplementedError();
  }

  @override
  Signature signSync(List<int> input, KeyPair keyPair) {
    throw UnimplementedError();
  }

  @override
  bool verifySync(List<int> input, Signature signature) {
    throw UnimplementedError();
  }
}
