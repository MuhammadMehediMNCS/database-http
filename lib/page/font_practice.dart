import 'package:flutter/material.dart';

class FontPractice extends StatelessWidget {
  const FontPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFont(),
    );
  }
}

class MyFont extends StatefulWidget {
  const MyFont({super.key});

  @override
  State<MyFont> createState() => _MyFontState();
}

class _MyFontState extends State<MyFont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font Style'),
      ),
      body: const Center(
        child: Text(
          'My Name is MD. MEHEDI HASAN',
          style: TextStyle(
            fontFamily: 'PoiretOne',
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}