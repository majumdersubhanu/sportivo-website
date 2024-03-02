import 'package:flutter/material.dart';
import 'package:sportivo_website/widgets/contact_form.dart';
import 'package:sportivo_website/widgets/parallax_bg.dart';
import 'package:sportivo_website/widgets/sections.dart';
import 'package:sportivo_website/widgets/sliders.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> texts = [
    'Wecome To Sportivo',
    'About Us',
    'Upcoming Events',
    'Xapolates',
    'Zaplots',
    'Sponsors',
    'Contact Us'
  ];

  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: controller,
        itemCount: texts.length,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                ParallaxBackdrop(
                  controller: controller,
                  imageUrl: 'assets/images/sportivo_backdrop${index + 1}.jpg',
                  index: index,
                ),
                HomePageSection(
                  header: texts[index],
                  content: index == 2
                      ? const UpcomingEventsSlider()
                      : index == 6
                          ? ContactForm()
                          : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
