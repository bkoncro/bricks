import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '{{name.snakeCase()}}_controller.dart';

/// Extend this widget to build responsive view.
/// this widget contains the `screen` property that have all
/// information about the screen size and type.
/// You have two options to build it.
/// 1- with `builder` method you return the widget to build.
/// 2- with methods `desktop`, `tablet`,`phone`, `watch`. the specific
/// method will be built when the screen type matches the method
/// when the screen is [ScreenType.Tablet] the `tablet` method
/// will be exuded and so on.
/// Note if you use this method please set the
/// property `alwaysUseBuilder` to false
/// With `settings` property you can set the width limit for the screen types.

class {{name.pascalCase()}} extends GetResponsiveView<{{name.pascalCase()}}Controller> {
  {{name.pascalCase()}}({
    Key? key,{{#use_binding}}required this.tagName,{{/use_binding}}    
  }) : super(key: key);

  {{#use_binding}}final String tagName;{{/use_binding}}

  String? get tag => tagName;  
  
  final bool alwaysUseBuilder = {{alwaysUseBuilder}};

  {{#alwaysUseBuilder}}Widget? builder() => Container();{{/alwaysUseBuilder}}
  
  
  {{#useMultipleScreen}}
  Widget? desktop() => null;

  Widget? phone() => null;

  Widget? tablet() => null;

  Widget? watch() => null;
  {{/useMultipleScreen}}
}
