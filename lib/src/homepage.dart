import 'package:blocpractise/blocs/apiBloc.dart';
import 'package:blocpractise/blocs/apiState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/apiEvent.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final ApiBloc apiBloc = ApiBloc();
  @override
  void initState()
  {
    super.initState();
    apiBloc.add(CoronaDataLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => apiBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body:  BlocConsumer<ApiBloc,ApiState>(
          builder: (BuildContext context, state) {
            if(state is CoronaDataLoading)
              {
                return const Center(child:  CircularProgressIndicator());
              }
            else if(state is CoronaDataSuccess)
              {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.coronaDataModel.countries!.length,
                    itemBuilder: (context, index) {
                      final item = state.coronaDataModel.countries![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          elevation: 5,
                          shadowColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: ListTile(
                            title: Text('${item.country}'),
                            subtitle: Text('New Confirmed ${item.newConfirmed}'),
                            trailing: Text('Total ${item.totalConfirmed}'),
                          ),
                        ),
                      );

                    });
              }
            else
              {
                return const Center(child: Text('Something Went Wrong'),);
              }
          },
          listener: (BuildContext context, state) {
            if(state is CoronaDataError)
              {
                ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Something Went Wrong')));
              }
          },),
      ));


  }
}
