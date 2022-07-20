import 'package:blocpractise/model/corona_data_model.dart';

abstract class ApiState{
  const ApiState();
}

class CoronaDataLoading extends ApiState{}

class CoronaDataSuccess extends ApiState{
  final CoronaDataModel coronaDataModel;
  const CoronaDataSuccess(this.coronaDataModel);
}

class CoronaDataError extends ApiState{
  final String message;
  const CoronaDataError(this.message);
}