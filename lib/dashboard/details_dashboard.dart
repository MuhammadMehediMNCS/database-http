import 'package:api_practice/dashboard/controller_dashboard.dart';
import 'package:api_practice/dashboard/model_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardDetails extends StatefulWidget {
  final DashboardModel receive;
  const DashboardDetails({super.key, required this.receive});

  @override
  State<DashboardDetails> createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.lime.shade900,
        title: Text(widget.receive.id.toString()),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.receive.image!,
                    )
                  )
                ),
              )
            ),
            Positioned(
              top: 220,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Color(0xffE6E6D5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38),
                    topRight: Radius.circular(38)
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 40,
                      child: Divider(thickness: 6, color: Colors.lime.shade900,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Price : ${widget.receive.price} ৳',
                          style: const TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 70)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Title',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.receive.title.toString()
                      ),
                    ),
                    const SizedBox(height: 34),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Categori',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.receive.category.toString()
                      ),
                    ),
                    const SizedBox(height: 34),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Description',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.receive.description.toString(),
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              )
            ),
            Positioned(
              top: 210,
              left: 42,
              child: Container(
                height: 50,
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                  )
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.join_full, color: Colors.white,),
                      Text(
                        widget.receive.rating!.rate.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(Icons.star, color: Colors.amber,)
                    ],
                  ),
                )
              )
            )
          ],
        ),
      ),
    );
  }
}