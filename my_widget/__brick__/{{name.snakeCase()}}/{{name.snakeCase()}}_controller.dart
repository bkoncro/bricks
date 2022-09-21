import 'package:get/get.dart';
{{#use_repository}}import '{{name.snakeCase()}}_repository.dart';{{/use_repository}}

class {{name.pascalCase()}}Controller extends GetxController {  
  // LIFECYCLE
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }
  // SERVICE

  // REPOSITORY
  {{#use_repository}}
  final {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;
  {{name.pascalCase()}}Controller(this.{{name.camelCase()}}Repository);
  {{/use_repository}}

  // RxVAR
  final _loading = false.obs;
  bool get isLoading => _loading.value;
  set isLoading(bool v) => _loading.value = v;

  // VAR

  // API CALL

  // TAP CALL  
  
}