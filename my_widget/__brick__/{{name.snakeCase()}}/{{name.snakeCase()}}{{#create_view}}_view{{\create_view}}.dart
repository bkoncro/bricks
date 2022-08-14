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

class {{name.pascalCase()}}{{#create_view}}View{{/create_view}} extends GetResponsiveView<{{name.pascalCase()}}Controller> {
  {{name.pascalCase()}}{{#create_view}}View{{/create_view}}({
    Key? key,{{#useTagName}}required this.tagName,{{/useTagName}}    
  }) : super(key: key);  
  {{#useTagName}}final String tagName;
  String? get tag => tagName;{{/useTagName}}
  @override
  // ignore: overridden_fields
  final bool alwaysUseBuilder = {{alwaysUseBuilder}};
  {{#alwaysUseBuilder}}
  @override
  Widget? builder() => Container();{{/alwaysUseBuilder}}
  {{#useMultipleScreen}}
  @override
  Widget? desktop() => null;
  @override
  Widget? phone() => null;
  @override
  Widget? tablet() => null;
  @override
  Widget? watch() => null;
  {{/useMultipleScreen}}
}
