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

part of web_crypto;

const Cipher webAesGcm = _WebAesGcmCipher();

class _WebAesGcmCipher extends _WebAesCipher {
  const _WebAesGcmCipher();

  @override
  Cipher get dartImplementation => dart.dartAesGcm;

  @override
  String get webName => 'AES-GCM';

  @override
  Future<Uint8List> _decrypt(
    List<int> input, {
    @required SecretKey secretKey,
    @required Nonce nonce,
    @required List<int> aad,
  }) async {
    try {
      if (aad == null) {
        final byteBuffer = await js.promiseToFuture<ByteBuffer>(
          web_crypto.subtle.decrypt(
            web_crypto.AesGcmParams(
              name: 'AES-GCM',
              iv: _jsArrayBufferFrom(nonce.bytes),
              tagLength: 128,
            ),
            await _getCryptoKey(secretKey, 'AES-GCM'),
            _jsArrayBufferFrom(input),
          ),
        );
        return Uint8List.view(byteBuffer);
      }
      final byteBuffer = await js.promiseToFuture<ByteBuffer>(
        web_crypto.subtle.decrypt(
          web_crypto.AesGcmParams(
            name: 'AES-GCM',
            iv: _jsArrayBufferFrom(nonce.bytes),
            additionalData: aad == null ? null : _jsArrayBufferFrom(aad),
            tagLength: 128,
          ),
          await _getCryptoKey(secretKey, 'AES-GCM'),
          _jsArrayBufferFrom(input),
        ),
      );
      return Uint8List.view(byteBuffer);
    } on html.DomException catch (e) {
      if (e.name == 'OperationError') {
        throw MacValidationException();
      }
      rethrow;
    }
  }

  @override
  Future<Uint8List> _encrypt(
    List<int> input, {
    @required SecretKey secretKey,
    @required Nonce nonce,
    @required List<int> aad,
  }) async {
    if (aad == null) {
      final byteBuffer = await js.promiseToFuture<ByteBuffer>(
        web_crypto.subtle.encrypt(
          web_crypto.AesGcmParams(
            name: 'AES-GCM',
            iv: _jsArrayBufferFrom(nonce.bytes),
            tagLength: 128,
          ),
          await _getCryptoKey(secretKey, 'AES-GCM'),
          _jsArrayBufferFrom(input),
        ),
      );
      return Uint8List.view(byteBuffer);
    }
    final byteBuffer = await js.promiseToFuture<ByteBuffer>(
      web_crypto.subtle.encrypt(
        web_crypto.AesGcmParams(
          name: 'AES-GCM',
          iv: _jsArrayBufferFrom(nonce.bytes),
          additionalData: aad == null ? null : _jsArrayBufferFrom(aad),
          tagLength: 128,
        ),
        await _getCryptoKey(secretKey, 'AES-GCM'),
        _jsArrayBufferFrom(input),
      ),
    );
    return Uint8List.view(byteBuffer);
  }
}
