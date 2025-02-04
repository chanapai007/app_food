import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodDetailPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String youtubeUrl;
  final String description;

  const FoodDetailPage({super.key, 
    required this.title,
    required this.imageUrl,
    required this.youtubeUrl,
    required this.description,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FoodDetailP ageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool _isLiked = false;
  bool _isDisliked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(widget.imageUrl,
                height: 250, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                openUrl(widget.youtubeUrl);
              },
              icon: Icon(Icons.video_library),
              label: Text('ชมวิดีโอ'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    color: _isLiked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                      if (_isLiked) {
                        _isDisliked = false;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    _isDisliked
                        ? Icons.thumb_down
                        : Icons.thumb_down_alt_outlined,
                    color: _isDisliked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isDisliked = !_isDisliked;
                      if (_isDisliked) {
                        _isLiked = false;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}
