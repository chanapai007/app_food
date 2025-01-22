import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // สร้าง MaterialApp พร้อม CounterWidget
    await tester.pumpWidget(MaterialApp(
      home: CounterWidget(),
    ));

    // ตรวจสอบว่า Counter เริ่มต้นที่ 0
    expect(
        find.text('0'), findsOneWidget); // บรรทัดนี้น่าจะล้มเหลวในโค้ดก่อนหน้า
    expect(find.text('1'), findsNothing);

    // กดปุ่ม '+' และกระตุ้นเฟรมใหม่
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump(); // กระตุ้นเฟรมใหม่

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
