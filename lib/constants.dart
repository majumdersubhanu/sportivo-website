import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

final List<String> imgList = [
  'assets/images/sportivo_backdrop1.jpg',
  'assets/images/sportivo_backdrop2.jpg',
  'assets/images/sportivo_backdrop3.jpg',
  'assets/images/sportivo_backdrop4.jpg',
  'assets/images/sportivo_backdrop5.jpg',
  'assets/images/sportivo_backdrop6.jpg',
  'assets/images/sportivo_backdrop7.jpg',
];

final List<String> events = [
  'Event 1',
  'Event 2',
  'Event 3',
  'Event 4',
  'Event 5',
  'Event 6',
  'Event 7',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 1000),
                  Center(
                    child: GlassContainer(
                      width: 200,
                      height: 100,
                      blur: 4,
                      border: const Border.fromBorderSide(BorderSide.none),
                      shadowStrength: 5,
                      borderRadius: BorderRadius.circular(16),
                      shadowColor: Colors.white.withOpacity(0.24),
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            events[imgList.indexOf(item)],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

final List<Widget> sponsorsSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Image.asset(
            item,
            fit: BoxFit.contain,
            height: 100,
            width: 100,
          ),
        ))
    .toList();
