import 'package:flutter/material.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No videos downloaded'),
            ElevatedButton(onPressed: (){
        
            }, child: const Text('Find videos to download'))
          ],
        ),
      ),
    );
  }
}