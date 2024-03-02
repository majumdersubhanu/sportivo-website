import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportivo_website/constants.dart';
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
    'Latest Events',
    'Xaplotes',
    'Vibgyor',
    'Previous Sponsors',
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
      body: Stack(
        children: [
          ListView.builder(
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
                      imageUrl:
                          'assets/images/sportivo_backdrop${index + 1}.jpg',
                      index: index,
                    ),
                    if (index == 0)
                      DynamicSection(
                          content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/sportivo_logo.png',
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            height: 200,
                            width: 200,
                          ),
                          const Gap(50),
                          Text(
                            texts[index],
                            style: const TextStyle(
                              fontSize: 60.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ))
                    else if (index == 2)
                      DynamicSection(
                          content: Column(
                        children: [
                          Text(
                            texts[index],
                            style: const TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 2,
                          ),
                          const Gap(20),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height / 2 - 100,
                            width: MediaQuery.of(context).size.width / 2 - 100,
                            child: const UpcomingEventsSlider(),
                          ),
                        ],
                      ))
                    else if (index == 5)
                      DynamicSection(
                          content: Column(
                        children: [
                          Text(
                            texts[index],
                            style: const TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 2,
                          ),
                          const Gap(20),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.spaceAround,
                            children: sponsorsSliders,
                          ),
                        ],
                      ))
                    else
                      CallToActionSection(
                        header: texts[index],
                        content: index == 6
                            ? ContactForm()
                            : index == 1
                                ? const Text(
                                    'SPORTIVO, the official sports club of Future Institute of Engineering and Management, is a Team Future Education initiated Sports Club. It was formed in 2016 to converge diversified and divided sports enterprises under a unified umbrella. Our arsenal comprises of passionate sports enthusiasts largely from student community, teachers, and key management members. SPORTIVO is more than just a collection of trophies and sweat-soaked jerseys. We are a vibrant community ignited by passion, fueled by sportsmanship, and united by the unwavering belief that every student deserves a chance to shine.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                : null,
                        label: index == 6
                            ? 'Submit Form'
                            : index == 2
                                ? 'View All'
                                : null,
                      ),
                  ],
                ),
              );
            },
          ),
          NavBar(),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final List<String> navItems = [
    "Home",
    "About Us",
    "Latest Events",
    "Xaplotes",
    "Vibgyor",
    "Sponsors",
    "Contact Us",
  ];

  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 4,
      borderRadius: BorderRadius.zero,
      border: Border.all(style: BorderStyle.none),
      gradient: LinearGradient(
        colors: [
          Color(0xFF0f0c29),
          Color(0xFF302b63),
          Color(0xFF24243e),
        ],
      ),
      color: Colors.black.withOpacity(0.3),
      shape: BoxShape.rectangle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/sportivo_logo.png',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              height: 40,
              width: 40,
            ),
            Gap(8),
            Text(
              "Sportivo".toUpperCase(),
              style: GoogleFonts.k2d(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            // Using map to create Text widgets with hover effect
            ...navItems.map((item) {
              return NavBarItem(
                text: item,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final String text;

  const NavBarItem({super.key, required this.text});

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: _isHovered
                  ? Border(
                      bottom: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    )
                  : null,
            ),
            child: Text(
              widget.text,
              style: GoogleFonts.mada(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
