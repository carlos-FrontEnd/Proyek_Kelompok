import 'package:flutter/material.dart';
import 'package:home/models/anime_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home/screens/detail_screen.dart';

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
                  (anime) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(anime: anime),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              anime.image,
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
                                  horizontal: 10.0,
                                  vertical: 5.0,
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 1000.0,
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            anime.title
                                                .split(" ")
                                                .take(3)
                                                .join(" "),
                                            style: TextStyle(
                                              fontFamily: 'GreatVibes',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),

                                          Spacer(),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20.0,
                                          ),
                                          Text(
                                            anime.rating.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
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
                  ),
                )
                .toList(),
        options: CarouselOptions(
          viewportFraction: 0.95,
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
