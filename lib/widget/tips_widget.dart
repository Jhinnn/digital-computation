import 'package:flutter/material.dart';

class TipsWidget extends StatelessWidget {
  final String words;
  final Function()? onTap;
  const TipsWidget({Key? key, required this.words, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          // width: 40,
          constraints: BoxConstraints.loose(const Size(160, 40)),
          // height: 40,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(color: Colors.grey, width: 1)),
          child: Center(
              child: Text(
            words,
            style: const TextStyle(color: Colors.white),
          ))),
    );
  }
}
