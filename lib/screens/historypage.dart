import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('History'),
        centerTitle: true,
      actions: const [ Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Edit'),
      )],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
        return 
        ListTile(
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.brown,
            ),
            title:const Text('data'),
            subtitle: const Text('Watched'),
          );
      
      }),
    );
  }
}