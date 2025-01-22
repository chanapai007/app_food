import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  get images => null;

  void _launchYouTube() async {
    final Uri url = Uri.parse(
        'https://www.youtube.com/watch?v=DV9855fTM5E&list=RDDV9855fTM5E&start_radio=1');
    if (!await launchUrl(url)) {
      throw 'ไม่สามารุถเปิดได้: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('เปิด Youtube ด้วย flutter'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _launchYouTube,
              child: Image.asset(
                'images/download.png',
                width: 300,
                height: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _launchYouTube,
              child: Text('เปิด Youtube'),
            ),
          ],
        ),
      ),
    );
  }
}
