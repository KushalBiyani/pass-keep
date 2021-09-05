import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8('demodemodemodemo');
final iv = IV.fromLength(16);
final encrypter = Encrypter(AES(key));

String encryptMasterPin(String pin) {
  return encrypter.encrypt(pin, iv: iv).base64;
}

String dencryptMasterPin(String data) {
  return encrypter.decrypt(Encrypted.from64(data), iv: iv);
}
