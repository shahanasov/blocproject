import 'package:blocproject/Business_Logic/bloc/bottompage_bloc.dart';
import 'package:blocproject/Routs/generatorrount.dart';
import 'package:blocproject/screens/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (context) => BottompageBloc(),
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        initialRoute: '/',
        onGenerateRoute: RoutGenerator().generateRoute,
        theme: ThemeData(primarySwatch: Colors.brown),
        title: 'Gotv',
        home: const BottomBar(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
