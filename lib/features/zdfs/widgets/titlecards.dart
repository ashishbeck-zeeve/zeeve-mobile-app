import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagesList = [
  'assets/images/cloud-storage.png',
  'assets/images/security.png',
  'assets/images/vault.png',
  'assets/images/documents.png'
];

final List<String> titles = [
  ' ZDFS (Zeeve Distributed File System) is your secure and decentralised storage for your digital assets whether it be NFTs or other digital assets. ',
  ' It has been built by developers for developers and feature the most secure, easy to use and easy to integrate decentralised storage service. ',
  ' High Security ',
  ' Privacy',
];

class TitleCards extends StatefulWidget {
  const TitleCards({Key? key}) : super(key: key);

  @override
  _TitleCardsState createState() => _TitleCardsState();
}

class _TitleCardsState extends State<TitleCards> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: imagesList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    margin: const EdgeInsets.only(
                      top: 5.0,
                      bottom: 5.0,
                    ),
                    elevation: 5.0,
                    shadowColor: ZeeveColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: 150,
                              height: 150,
                              child: Image.asset(
                                item,
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "ZDFS",
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    titles[_currentIndex],
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      // fontWeight: FontWeight.bold,
                                      // color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imagesList.map((urlOfItem) {
            int index = imagesList.indexOf(urlOfItem);
            return Container(
              width: 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? ZeeveColors.primary
                    : ZeeveColors.gray,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
