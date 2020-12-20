import 'package:flutter/material.dart';

widgetImage() {
  return SizedBox.expand(
    child: Image.asset(
      "images/Abra.gif",
      fit: BoxFit.contain,
      height: 300,
      width: 300,
    ),
  );
  // return Center(
  //   child: Image.network(
  //       "https://media4.giphy.com/media/p37zQEvmBhwLipmiqV/giphy.gif"),
  // );
}
