import 'dart:convert';

import 'package:api_practice/dashboard/model_dashboard.dart';
import 'package:api_practice/dashboard/service_dashboard.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  DashboardService dashboardService = DashboardService();

  List<DashboardModel> dataList = [];
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
      http.Response response = await dashboardService.getData(6);

      if(response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body);

        result.forEach((element) {
          dataList.add(DashboardModel.fromJson(element));
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