import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:encrypt/encrypt.dart';

Future<void> launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

Future<http.Response> callApi(String url, Map<String, dynamic> body,
    {bool live = false}) async {
  if (live) {
    return await http.post(
      Uri.https('deck-api.web.app', url),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body),
    );
  } else {
    return await http.post(
      Uri.http('localhost:5002', url),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body),
    );
  }
}

String encrypt(String text, String key) {
  final keyBytes = Key.fromUtf8(key.padRight(32, '0').substring(0, 32));
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(keyBytes));

  final encrypted = encrypter.encrypt(text, iv: iv);
  return '${encrypted.base64}:${iv.base64}';
}

String decrypt(String encryptedText, String key) {
  final keyBytes = Key.fromUtf8(key.padRight(32, '0').substring(0, 32));
  final parts = encryptedText.split(':');
  final iv = IV.fromBase64(parts[1]);
  final encrypter = Encrypter(AES(keyBytes));

  final decrypted = encrypter.decrypt64(parts[0], iv: iv);
  return decrypted;
}
