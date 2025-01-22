import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แอปแนะนำอาหารและของว่าง',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FoodRecommendationPage(),
    );
  }
}

class FoodRecommendationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('อาหารที่ชอบ'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                foodItem(
                  'กระเพราหมูกรอบ',
                  'images/580e9811-0329-45fc-b5af-ed502d6c772c.jpg',
                  'https://www.youtube.com/watch?v=cFciXuCdG_o',
                  'ส่วนผสม: หมูกรอบ, ใบกระเพรา, พริก, กระเทียม\n\nวิธีทำ: ผัดกระเทียมและพริกจนหอม ใส่หมูกรอบและปรุงรส ใส่ใบกระเพราก่อนปิดไฟ',
                  context,
                ),
                foodItem(
                  'คะน้าหมูกรอบ',
                  'images/6a4b88a6-1be5-40bb-9f95-a4206786fc8e.jpg',
                  'https://www.youtube.com/watch?v=FGhxkvYapWM',
                  'ส่วนผสม: คะน้า, หมูกรอบ, น้ำมันหอย\n\nวิธีทำ: ผัดหมูกรอบกับคะน้าจนสุก ปรุงรสด้วยน้ำมันหอย',
                  context,
                ),
                foodItem(
                  'หมี่เกี้ยว',
                  'images/noodle.jpg',
                  'https://www.youtube.com/watch?v=so5spR2pltk',
                  'ส่วนผสม: เส้นหมี่, เกี้ยว, ผัก\n\nวิธีทำ: ต้มเส้นหมี่และเกี้ยว ใส่ในชามและเติมน้ำซุป',
                  context,
                ),
                foodItem(
                  'ข้าวผัดปู',
                  'images/185eabb6-8d3c-45ba-af92-a33e779b37c8.jpg',
                  'https://www.youtube.com/watch?v=ukrDhCBRiYY',
                  'ส่วนผสม: ข้าว, เนื้อปู, ไข่\n\nวิธีทำ: ผัดข้าวกับไข่และเนื้อปูจนเข้ากัน',
                  context,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ของว่างที่ชอบ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    snackItem(
                      'เลย์',
                      'images/3fe80c5a-f59a-4afe-a4cd-9a027b98ac1a.jpg',
                      'https://www.youtube.com/watch?v=snack1',
                      'เลย์เป็นขนมขบเคี้ยวที่ทำจากมันฝรั่ง มีรสชาติต่าง ๆ เช่น รสเกลือ รสชีส',
                      context,
                    ),
                    snackItem(
                      'ชาเย็น',
                      'images/6af7f64e-d675-435c-a9d2-eaa2417d6184.jpg',
                      'https://www.youtube.com/watch?v=snack2',
                      'ชาเย็นเป็นเครื่องดื่มยอดนิยมในประเทศไทย รสหวานหอม กลมกล่อม',
                      context,
                    ),
                    snackItem(
                      'ไก่ป็อป',
                      'images/AirFryerChickenNuggets.jpg',
                      'https://www.youtube.com/watch?v=snack3',
                      'ไก่ป็อปเป็นของว่างกรอบนอกนุ่มใน สามารถทำเองได้ที่บ้าน',
                      context,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget foodItem(String title, String imageUrl, String youtubeUrl,
      String description, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailPage(
                title: title,
                imageUrl: imageUrl,
                youtubeUrl: youtubeUrl,
                description: description),
          ),
        );
      },
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Image.asset(imageUrl, height: 100, width: 100, fit: BoxFit.cover),
            SizedBox(height: 5),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget snackItem(String title, String imageUrl, String youtubeUrl,
      String description, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SnackDetailPage(
                title: title,
                imageUrl: imageUrl,
                youtubeUrl: youtubeUrl,
                description: description),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Image.asset(imageUrl, height: 80, width: 80, fit: BoxFit.cover),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class FoodDetailPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String youtubeUrl;
  final String description;

  FoodDetailPage({
    required this.title,
    required this.imageUrl,
    required this.youtubeUrl,
    required this.description,
  });

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
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

class SnackDetailPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String youtubeUrl;
  final String description;

  SnackDetailPage({
    required this.title,
    required this.imageUrl,
    required this.youtubeUrl,
    required this.description,
  });

  @override
  _SnackDetailPageState createState() => _SnackDetailPageState();
}

class _SnackDetailPageState extends State<SnackDetailPage> {
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
