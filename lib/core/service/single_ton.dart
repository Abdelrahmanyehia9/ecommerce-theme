import 'package:dio/dio.dart';
import 'package:ecommercetemplate/core/service/api_service.dart';
import 'package:ecommercetemplate/feature/home/data/home_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance ;



void setupSingleTon(){
  getIt.registerSingleton<ApiService>(ApiService(Dio())) ;
  getIt.registerSingleton<HomeRepo>(HomeRepo(getIt.get<ApiService>())) ;

}