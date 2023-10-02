import 'package:api_practice/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APIs Practice'),
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: homeController.postList.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blue.shade200,
                child: ExpansionTile(
                  collapsedTextColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  maintainState: true,
                  leading: Text(homeController.postList[index].id.toString()),
                  title: Text(
                    homeController.postList[index].title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  //trailing: const SizedBox.shrink(),
                  children: [
                    Container(
                      margin: EdgeInsets.zero,
                      child: Text(
                        'User ID : ${homeController.postList[index].userId.toString()}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white)
                      ),
                      child: Text(homeController.postList[index].body.toString())
                    )
                  ],
                ),
              );
            }
          );
        },
      )
    );
  }
}