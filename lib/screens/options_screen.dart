import 'package:flutter/material.dart';

import 'layouts/default_layout.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: AppBar(
          title: Text('Options'),
          backgroundColor: Colors.transparent,
        ),
        screen: Container(
          child: Center(
            child: Text('options'),
          ),
        ));
  }
}
