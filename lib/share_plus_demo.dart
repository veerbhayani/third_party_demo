import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SharePlusDemo extends StatefulWidget {
  const SharePlusDemo({super.key});

  @override
  State<SharePlusDemo> createState() => _SharePlusDemoState();
}

class _SharePlusDemoState extends State<SharePlusDemo> {
  final TextEditingController _textEditingController = TextEditingController();
  final imageurl =
      'https://images-eu.ssl-images-amazon.com/images/G/31/Gateway/Events/2018/JupiterFallBack/Jupiter_bau_PC_top_card_fashion_1x._SY304_CB484150077_.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Enter Messege',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                const weburl = 'https://pub.dev/packages/share_plus';
                if (_textEditingController.value.text.isNotEmpty) {
                  await Share.share('${_textEditingController.text}$weburl');
                }
                setState(() {});
              },
              child: const Text(
                'Share Text Messege',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
