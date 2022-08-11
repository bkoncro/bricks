import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('create widget {{name}}!');

  final bool alwaysUseBuilder =
      context.vars['has_multiple_screen'] == true ? false : true;
  final bool useMultipleScreen =
      context.vars['has_multiple_screen'] == true ? true : false;
  final bool useTagName = context.vars['use_binding'] == true ? false : true;
  context.vars = {
    ...context.vars,
    'alwaysUseBuilder': alwaysUseBuilder,
    'useMultipleScreen': useMultipleScreen,
    'useTagName': useTagName
  };
}
