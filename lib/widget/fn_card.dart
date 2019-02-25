import 'package:flutter/material.dart';

class FnCard extends StatelessWidget {
  final Widget child;
  final bool isFirst;
  final bool isLast;
  FnCard({Key key, this.child, this.isFirst = false, this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        margin: EdgeInsets.only(
            left: 4.0,
            right: 4.0,
            top: 8.0,
            bottom: 8.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
                bottom: Radius.circular( 16.0 ))),
        child: child);
  }
}
