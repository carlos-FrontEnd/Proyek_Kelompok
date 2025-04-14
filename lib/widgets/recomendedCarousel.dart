import 'package:flutter/material.dart';
import 'package:home/models/anime_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Recomendedcarousel extends StatelessWidget {
  final List<Anime> animeList;
  const Recomendedcarousel({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items:
            animeList
                .map(
                  (item) => Container(
                    margin: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            item.image,
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0.0,
                                    child: Row(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          item.rating.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
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
                )
                .toList(),
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
