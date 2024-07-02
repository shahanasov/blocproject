
import 'package:blocproject/Business_Logic/bottomnav/bottompage_bloc.dart';
import 'package:blocproject/screens/download.dart';
import 'package:blocproject/screens/home.dart';
import 'package:blocproject/screens/menu.dart';
import 'package:blocproject/screens/searchresult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  const BottomNavigationBarItem(
      icon: Icon(Icons.download_done_outlined), label: 'Download'),
  const BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
];

List<Widget> pages = <Widget>[
  const HomePage(),
   SearchResultPage(),
  const DownloadPage(),
  const MenuPage(),
];

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottompageBloc, BottompageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: pages.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 248, 249, 249),
            showUnselectedLabels: true,
            unselectedItemColor: const Color.fromARGB(255, 116, 113, 113),
            items: items,
            currentIndex: state.tabIndex,
            onTap: (index) {
              BlocProvider.of<BottompageBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
