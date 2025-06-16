import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/api.consumer.dart';
import 'package:untitled10/core/errors/endpoints.dart';
import 'package:untitled10/core/errors/exceptions.dart';
import 'package:untitled10/cubit/search_status.dart';
import 'package:untitled10/models/search_events_models.dart';

class Search_cubit extends Cubit<Search_Status>{

Search_cubit(this.api):super(initial_Search_Status());

static Search_cubit get(context)=>BlocProvider.of(context);
final ApiConsumer api;



List <Search_events_model> searchResult=[];


Future<void> serach_function (String text) async {
try {
  emit(start_Search_Status());
  final response = await api.get(
    EndPoints.search_events,
    queryParamerters: {
      'query': text,
    },


  );
  List data = response;
   searchResult = data.map((item)=>Search_events_model.fromJson(item)).toList();

  emit(finish_Search_Status());
}on serverExceptions catch(e){
  emit(error_Search_Status(e.errModel.errorMessage));
}
}

List <Search_events_model> searchHistory=[];
Future<void> serach_history () async {
  try {
  emit(history_Search_Status());
    final response = await api.get(
      EndPoints.search_history,



    );
    List data = response['events'];
    searchHistory = data.map((item)=>Search_events_model.fromJson(item)).toList();


  }on serverExceptions catch(e){
    emit(error_Search_Status(e.errModel.errorMessage));
  }
}

}