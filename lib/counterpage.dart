import 'package:blocpractise/blocs/counterbloc.dart';
import 'package:blocpractise/blocs/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Counterpage extends StatefulWidget {
  const Counterpage({Key? key}) : super(key: key);

  @override
  State<Counterpage> createState() => _CounterpageState();
}

class _CounterpageState extends State<Counterpage> {

  final CounterBloc _counterBloc = CounterBloc();


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => _counterBloc,
      child: Scaffold(
        body:  Center(
          child: BlocBuilder<CounterBloc,int>(builder: (context,state){
              return  Text(state.toString());
              },),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: ()  {
            //BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
             _counterBloc.add(IncrementEvent());
            },
        ),
      ),
    );
  }
}
