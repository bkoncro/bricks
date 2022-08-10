import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('create widget {{name}}!');

  final bool alwaysUseBuilder =
      context.vars['has_multiple_screen'] == true ? false : true;
  final bool useMultipleScreen =
      context.vars['has_multiple_screen'] == true ? true : false;
  context.vars = {
    ...context.vars,
    'alwaysUseBuilder': alwaysUseBuilder,
    'useMultipleScreen': useMultipleScreen
  };
}
