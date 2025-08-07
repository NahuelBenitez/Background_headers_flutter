import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/slider_model.dart';
import 'dot.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPage = Provider.of<SliderModel>(context).currentPage;

    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Dot(index: index, currentPage: currentPage),
        ),
      ),
    );
  }
}
