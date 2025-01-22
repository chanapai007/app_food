import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // สร้างแอปที่ใช้สำหรับทดสอบ

    // สร้าง Widget และเริ่มต้นการทดสอบ
    await tester.pumpWidget(MaterialApp(
      home: FoodRecommendationPage(),
    ));

    // ตรวจสอบว่าเริ่มต้น Counter อยู่ที่ 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // กดปุ่ม '+' และตรวจสอบค่าใหม่
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // ตรวจสอบว่าค่า Counter เพิ่มเป็น 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            // style: Theme.of(context).textTheme,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _incrementCounter,
          ),
        ],
      ),
    );
  }
}
