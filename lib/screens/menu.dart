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
        body: const SingleChildScrollView(
          child: Column(children: [
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              title: Text('No History'),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text('My List'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.star_border_purple500_rounded),
              title: Text('Rate this app'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(
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
