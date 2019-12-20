import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardItem extends StatelessWidget {
  final IconData leading;
  final String title;
  final String subtitle;
  final GestureTapCallback onTap;

  CardItem(this.onTap, {this.leading, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        subtitle: Text(this.subtitle),
        leading: Icon(this.leading),
        title: Text(this.title),
      ),
    );
  }

}