import 'dart:convert';

import 'package:api_practice/home_service.dart';
import 'package:api_practice/model/postmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeServices homeService = HomeServices();

  List<PostModel> postList = [];
  bool isLoading = false;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {

    try {
      isLoading = true;
      update();
      http.Response response = await homeService.getData();
      
      if(response.statusCode == 200) {
        List<dynamic> results = jsonDecode(response.body);

        results.forEach((value) {
          postList.add(PostModel.fromJson(value));
        });
        isLoading = false;
      }
      update();
    } catch(e) {
      isLoading = false;
      update();
      print(e);
    }
  }
}