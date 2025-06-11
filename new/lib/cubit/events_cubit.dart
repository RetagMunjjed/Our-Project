import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/api.consumer.dart';
import 'package:untitled10/core/errors/endpoints.dart';
import 'package:untitled10/core/errors/exceptions.dart';
import 'package:untitled10/cubit/events_status.dart';
import 'package:untitled10/models/events_models.dart';

class Events_cubit extends Cubit<Events_status>{
 Events_cubit(this.api): super(initial_events_class());

  static Events_cubit get(context)=>BlocProvider.of(context);

  final ApiConsumer api;

 static List<git_all_events> _allEvents=[];

  List<git_all_events> get allEvents  => _allEvents;
  Future<List<git_all_events>?>  getAllEvents()async{
    try {
      emit(start_events_class());
      final response = await api.get(
        EndPoints.get_all_events,
      );
     List <dynamic> data= await response['events'];

_allEvents=data.map((item)=>git_all_events.fromJson(item)).toList();
print(allEvents[0]);
emit(finish_events_class());
return allEvents;
    }on serverExceptions catch(e){
      emit(error_events_class(e.errModel.errorMessage));
      return null;
    }
  }




}




