import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
