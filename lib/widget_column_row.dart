import 'package:flutter/material.dart';
import 'package:flutter_app/widget_raised_button.dart';

widgetRowColumn() {
  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      widgetButton(),
      widgetButton(),
      widgetButton(),
    ],
  );
}
