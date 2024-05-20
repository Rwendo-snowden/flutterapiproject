import 'package:flutter/material.dart';
import 'package:flutterapiproject/controllers/ProductApiController.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    // controllers
    TextEditingController namecontroller = TextEditingController();
    TextEditingController agecontroller = TextEditingController();

    ProductApiController productApiController = ProductApiController();
    return Scaffold(
      appBar: AppBar(
        title: Text('send Data '),
      ),
      body: Column(
        children: [
          // make your request form here
          Center(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.amber,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    controller: namecontroller,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    controller: agecontroller,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        productApiController.postdata(
                            namecontroller.text, agecontroller.text);

                        namecontroller.clear();
                        agecontroller.clear();
                      },
                      child: Text('send'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
