import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/dio.consumer.dart';
import 'package:untitled10/core/errors/endpoints.dart';
import 'package:untitled10/cubit/search_cubit.dart';
import 'package:untitled10/cubit/search_status.dart';
import 'package:untitled10/models/search_events_models.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>Search_cubit(DioConsumer(Dio()))..serach_history(),
      child: BlocConsumer<Search_cubit,Search_Status>
        (
          listener:(context,Search_Status status) {}
          ,builder:(context, Search_Status status) {
return Scaffold(
  appBar: AppBar(
    backgroundColor: Color(0xfffdb1a1),
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
      iconSize: 30,),
    title: Container(
      width: double.infinity,
      height: 45,
      child: TextFormField(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onChanged: (value){
          Search_cubit.get(context).serach_function(value);
        },
        decoration: InputDecoration(
            label: Text('Search',style: TextStyle(
                color: Colors.black
            ),),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black,width: 2)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid)
            )
        ),
      ),
    ),
  ),
    body: () {
    if (status is start_Search_Status) {
    return const Center(child: CircularProgressIndicator());
    } else if (status is error_Search_Status) {
    return Center(child: Text(' ${(status as error_Search_Status).error}'));
    } else if ( Search_cubit.get(context).searchResult.isEmpty) {

      final searchHisrtoryresult= Search_cubit.get(context).searchHistory;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 200,
              child: Image(
                image: NetworkImage(
                    "${EndPoints.imageUrl}${searchHisrtoryresult[index].image_url}"),
                height: 150,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            const Spacer(),
            Text(
              '${searchHisrtoryresult[index].name_en}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: searchHisrtoryresult.length,
      ),
    );
    } else {
    final result = Search_cubit.get(context).searchResult;
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child:
    ListView.separated(
    itemBuilder: (context, index) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Container(
    height: 150,
    width: 200,
    child: Image(
    image: NetworkImage(
    "${EndPoints.imageUrl}${result[index].image_url}"),
    height: 150,
    width: 100,
    fit: BoxFit.fill,
    ),
    ),
    const Spacer(),
    Text(
    '${result[index].name_en}',
    style: const TextStyle(
    fontSize: 20,
    color: Colors.black,
    ),
    ),
    const SizedBox(width: 20),
    ],
    ),
    separatorBuilder: (context, index) => const SizedBox(height: 10),
    itemCount: result.length,
    ),
    );
    }
    }()
    );}));
}
}