import 'package:flutter/material.dart';
import 'package:home/models/anime_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home/screens/detail_screen.dart';

class RecomendedCarousel extends StatelessWidget {
  final List<Anime> animeList;

  const RecomendedCarousel({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final aspectRatio =
        screenWidth > 600
            ? 3.0
            : 1.0; // Adjust aspect ratio based on screen width

    return Container(
      child: CarouselSlider(
        items:
            animeList.map((anime) {
              return GestureDetector(
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
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          anime.image,
                          fit: BoxFit.cover,
                          width: 1000.0,
                          errorBuilder:
                              (context, error, stackTrace) => const Icon(
                                Icons.broken_image,
                                size: 100,
                                color: Colors.grey,
                              ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
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
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        anime.title,
                                        style: const TextStyle(
                                          fontFamily: 'GreatVibes',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 30.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Expanded(child: Text('')),
                                    const SizedBox(width: 5),
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
                                const SizedBox(height: 5),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children:
                                      anime.genre.take(3).map((genre) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          child: Text(
                                            "#$genre",
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
        options: CarouselOptions(
          height: 400,
          viewportFraction: 0.8,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          pageSnapping: true,
          autoPlay: false,
          aspectRatio: aspectRatio,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
