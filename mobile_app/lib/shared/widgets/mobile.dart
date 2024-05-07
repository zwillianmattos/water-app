import 'package:flutter/material.dart';

Widget buildPhoneScaffold(appBar, body, floatingActionButton) {
  return Scaffold(
    appBar: appBar,
    body: body,
    floatingActionButton: floatingActionButton,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
}
