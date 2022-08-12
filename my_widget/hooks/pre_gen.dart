import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('create widget {{name}}!');

  final bool alwaysUseBuilder =
      context.vars['has_multiple_screen'] == true ? false : true;
  final bool useMultipleScreen =
      context.vars['has_multiple_screen'] == true ? true : false;
  final bool useBinding = context.vars['widget_type'] == 'view' ? true : false;
  final bool useTagName = useBinding == true ? false : true;
  final bool createView = context.vars['widget_type'] == 'view';

  context.vars = {
    ...context.vars,
    'alwaysUseBuilder': alwaysUseBuilder,
    'useMultipleScreen': useMultipleScreen,
    'useTagName': useTagName,
    'use_binding': useBinding,
    'create_view': createView,
  };
}
