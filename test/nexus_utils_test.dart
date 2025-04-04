import 'package:flutter_test/flutter_test.dart';

import 'package:nexus_utils/nexus_utils.dart';

void main() {
  test('Encrypt then decrypt a string', () {
    String key =
        "b8cc8e559b5915ad4a61c0414f9017882d91d8c1d5d4179ff1f87ac14f209d20";
    String text = "Hello, World!";
    String encryptedText = encrypt(text, key);
    String decryptedText = decrypt(encryptedText, key);
    expect(decryptedText, text);
  });
}
