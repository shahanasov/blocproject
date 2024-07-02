import 'package:blocproject/Business_Logic/bottomnav/bottompage_bloc.dart';
import 'package:blocproject/Business_Logic/watchhistory/watchhistory_bloc.dart';
import 'package:blocproject/Routs/generatorrount.dart';
import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:blocproject/model/bloc/movie_bloc.dart';
import 'package:blocproject/screens/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final Api api=Api();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottompageBloc(),
        ),
        BlocProvider(
          create: (context) =>  MovieBloc(api),
        ),
        BlocProvider(
          create: (context) =>  WatchHistoryBloc(api: api),
        ),
      ],
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
