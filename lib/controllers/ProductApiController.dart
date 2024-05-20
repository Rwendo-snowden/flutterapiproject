import 'dart:convert';
import 'dart:io';
import 'package:flutterapiproject/models/Apidata.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductApiController extends GetxController {
  List alldata = [];
  @override
  void onInit() {
    takeData();

    super.onInit();
  }

  Future<List<dynamic>> takeData() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/products');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final model = Apidata.fromMap(data);

      alldata = model.products;
      print(model.title);
      return alldata;
    } else {
      return alldata;
    }
  }

  postdata(String name, String age) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/students');

    final headers = {'content-Type': 'application/json'};

    // final body = jsonEncode({
    //   'name': name,
    //   'age': age,
    // });

    final body = jsonEncode(Apidata(title: name, products: age).toJson());

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('data sent successfully');
    } else {
      print('something went wrong ${response.statusCode}');
    }
  }
}
