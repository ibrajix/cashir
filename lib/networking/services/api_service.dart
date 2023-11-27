import 'dart:convert';

import 'package:cashir/constants/end_points.dart';
import 'package:cashir/presentation/home/data/response/home_response.dart';
import 'package:http/http.dart';

class ApiService {
  Future<HomeResponse> getData() async {
    Response response = await get(Uri.parse(EndPoints.users));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      return HomeResponse.fromJson(result);
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}