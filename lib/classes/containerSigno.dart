import 'package:flutter/material.dart';

class ContainerSigno extends StatelessWidget {
  const ContainerSigno({
    required this.horizonte,
    required this.images1,
  });

  final double horizonte;
  final String images1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: horizonte),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(images1),
    );
  }
}
