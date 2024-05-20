import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Apidata {
  final title;
  final products;

  Apidata({required this.title, required this.products});

  factory Apidata.fromMap(Map<String, dynamic> json) {
    return Apidata(
      title: json['status'],
      products: json['products'],
    );
  }

  toJson() {
    return {
      if (title != null) 'name': title,
      if (products != null) 'age': products,
    };
  }
}
