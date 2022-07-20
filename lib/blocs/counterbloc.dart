import 'package:blocpractise/blocs/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterBloc extends Bloc<IncrementEvent , int>{

  CounterBloc() : super(0){
    on<IncrementEvent>((event, emit) => emit(state + 1));
   }
}




