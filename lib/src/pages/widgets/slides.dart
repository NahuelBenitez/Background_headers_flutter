import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/slider_model.dart';
import 'slide.dart';

class Slides extends StatefulWidget {
  const Slides({super.key});

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.addListener(() {
        Provider.of<SliderModel>(context, listen: false).currentPage =
            controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: const [
        Slide('assets/svgs/1.svg'),
        Slide('assets/svgs/2.svg'),
        Slide('assets/svgs/3.svg'),
        Slide('assets/svgs/4.svg'),
      ],
    );
  }
}
