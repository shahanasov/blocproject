import 'package:blocproject/Business_Logic/bloc/bottompage_bloc.dart';
import 'package:blocproject/screens/download.dart';
import 'package:blocproject/screens/home.dart';
import 'package:blocproject/screens/menu.dart';
import 'package:blocproject/screens/search.dart';
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
  const SearchPage(),
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
            selectedItemColor: Colors.brown,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
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
// class BottomBar extends StatefulWidget {
//   const BottomBar({super.key});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int selectedIndex = 0;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: selectedIndex,
//           onTap: (index) {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey,
//           showUnselectedLabels: true,
//           items: const [

//           ]),
//       body: pages.elementAt(selectedIndex),
//     );
//   }
// }
