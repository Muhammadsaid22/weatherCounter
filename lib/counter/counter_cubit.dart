import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart' as lkt;
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
part 'counter_state.dart';


class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void upCount(){
    if(darkMode){
      counter++;
    }
    counter++;
    emit(CounterInitial());
  }

  void downCount(){
    if(darkMode){
      counter--;
    }
    counter--;
    emit(CounterDown());
  }

  void getCurrentLocation() async{
    var  location =  await lkt.Location().getLocation();
    List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude!, location.longitude!);
    Uri url = Uri.parse('http://api.weatherstack.com/current?access_key=41eb36e0c5f82e3ddce66ef01af877a1&query=${location.latitude},${location.longitude}');
    final r = await http.get(url);
    print(jsonDecode(r.body));
    int temp = jsonDecode(r.body)['current']['temperature'];
    double tempF = (temp * 9/5) + 32 ;
    locationMessage = " country : ${placemarks[0].country},  ${placemarks[0].street},\n weather : $temp °C ,  $tempF °F " ;
    print(locationMessage);
    emit(LocationTake());
  }

  void darkmode(){
    darkMode =! darkMode;
    emit(Color());
  }
}
