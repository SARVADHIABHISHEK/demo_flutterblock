import 'package:blocpractise/blocs/apiEvent.dart';
import 'package:blocpractise/blocs/apiState.dart';
import 'package:blocpractise/provider/corona_data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Bloc<ApiEvent,ApiState>
{
   ApiBloc() : super(CoronaDataLoading()){

     on<CoronaDataLoadEvent>((event, emit) async {
       try {

          final list = await ApiProvider.fetchData();

         emit(CoronaDataSuccess(list));

         if(list.countries!.isEmpty)
           {
             emit(const CoronaDataError('Data Not Found'));
           }
       } catch(e){
         emit( const CoronaDataError('Something Went Wrong'));
       }
     });
   }
}