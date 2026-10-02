import 'package:flutter/widgets.dart';

class const HomeBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return screenBuilder(context);
  }
}