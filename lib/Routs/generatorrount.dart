import 'package:blocproject/Business_Logic/bloc/bottompage_bloc.dart';
import 'package:blocproject/screens/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RoutGenerator{
  final BottompageBloc bottomnav =BottompageBloc();
  Route<dynamic> generateRoute(RouteSettings settings){
    // final args =settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>
        BlocProvider<BottompageBloc>.value(
         value: bottomnav,
          child: const BottomBar(),
        )
         );
      default: 
      return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: const Text('error'),),
        body: const Center(child:  Text('error'),),
      );
    });
  }
}