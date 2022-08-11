import 'package:flutter/material.dart';
import 'package:get/get.dart';
{{#use_repository}}import '{{name.snakeCase()}}_repository.dart';{{/use_repository}}

class {{name.pascalCase()}}Controller extends GetxController {  
  final _loading = false.obs;
  bool get isLoading => _loading.value;
  set isLoading(bool v) => _loading.value = v;
  {{#use_repository}}
  final {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;
  {{name.pascalCase()}}Controller(this.{{name.camelCase()}}Repository);
  {{/use_repository}}
}