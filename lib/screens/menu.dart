import 'package:blocproject/screens/historypage.dart';
import 'package:blocproject/widgets/history.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 100),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Log in')),
                ],
              ),
            )),
        body:  SingleChildScrollView(
          child: Column(children: [
            const Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              title: const Text('History'),
              trailing: IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HistoryPage()));
              }, icon: const Icon(Icons.arrow_forward_ios),iconSize: 15,),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: HistoryWidget(),
            ),
            const Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            const ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text('My List'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            const ListTile(
              leading: Icon(Icons.star_border_purple500_rounded),
              title: Text('Rate this app'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            const Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
          ]),
        ),
      ),
    );
  }
}
