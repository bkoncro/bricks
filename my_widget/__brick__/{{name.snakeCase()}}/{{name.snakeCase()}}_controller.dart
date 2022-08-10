import 'package:flutter/material.dart';
import 'package:get/get.dart';

class {{name.pascalCase()}}Controller extends GetxController {  
  final _loading = false.obs;
  bool get isLoading => _loading.value;
  set isLoading(bool v) => _loading.value = v;
  
}