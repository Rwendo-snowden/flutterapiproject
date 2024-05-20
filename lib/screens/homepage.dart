import 'package:flutter/material.dart';
import 'package:flutterapiproject/controllers/ProductApiController.dart';
import 'package:flutterapiproject/models/Apidata.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductApiController product = Get.put(ProductApiController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Api testing '),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                product.takeData();
              },
              child: Text('Show data')),
          SizedBox(
            height: 10,
          ),
          // Expanded(
          //     child: GetBuilder<ProductApiController>(
          //         init: ProductApiController(),
          //         builder: (v) {
          //           return ListView.builder(
          //             itemCount: v.alldata.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return ListTile(
          //                 title: Text(v.alldata[index]['title']),
          //               );
          //             },
          //           );
          //         })),
          Expanded(
            child: FutureBuilder(
              future: product.takeData(),
              initialData: product.alldata,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ListView.builder(
                  itemCount: product.alldata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(product.alldata[index]['title']),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
