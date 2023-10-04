import 'dart:io';

import 'package:api_practice/dashboard/controller_dashboard.dart';
import 'package:api_practice/dashboard/details_dashboard.dart';
import 'package:api_practice/dashboard/model_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lime.shade900,
        title: titleWidget(),
      ),
      body: GetBuilder<DashboardController>(
        builder: (_) {
          return GridView.builder(
            itemCount: dashboardController.dataList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              childAspectRatio: 2/3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
            ), 
            itemBuilder: (context, index) {
              DashboardModel receive = dashboardController.dataList[index];

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardDetails(receive: receive))),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 2, color: Colors.lime.shade300)
                      ),
                      child: Column(
                        children: [
                          Text(
                            dashboardController.dataList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 8),
                          Image.network(
                            dashboardController.dataList[index].image!,
                            width: double.infinity,
                            height: 120,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }

  Widget titleWidget() => Row(
    children: const [
      Icon(Icons.api_outlined),
      SizedBox(width: 8),
      Text('My Products')
    ],
  );
}