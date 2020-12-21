import 'package:flutter/material.dart';
import 'package:flutter_app/Fase%201/widget_raised_button.dart';

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
