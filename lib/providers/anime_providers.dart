import 'package:flutter/material.dart';
import '../models/anime_model.dart';
import '../models/data_source.dart';


class AnimeProvider with ChangeNotifier {
  List<Anime> _animeList = [];
  List<Anime> _filteredAnime = [];
  List<Anime> _favorites = [];
  bool _isLoading = false;

  List<Anime> get animeList => _animeList;
  List<Anime> get filteredAnime => _filteredAnime;
  List<Anime> get favorites => _favorites;
  bool get isLoading => _isLoading;

  List<Anime> get ongoingAnime =>
      _animeList.where((anime) => anime.status == 'Ongoing').toList();
  List<Anime> get recommended {
    final sortedList = List<Anime>.from(_animeList)
      ..sort((a, b) => b.rating.compareTo(a.rating));
    return sortedList.take(5).toList();
  }
  List<Anime> get completedAnime =>
      _animeList.where((anime) => anime.status == 'Completed').toList();
  List<Anime> get topRatedAndMostViewedAnime {
    final combinedList = List<Anime>.from(_animeList);
    combinedList.sort((a, b) {
      final ratingComparison = b.rating.compareTo(a.rating);
      if (ratingComparison != 0) {
        return ratingComparison;
      }
      return b.view.compareTo(a.view);
    });
    return combinedList.toList();
  }

  Future<void> loadAnimeData() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // Simulasi loading
    _animeList = AnimeDataSource().getAnime();
    _filteredAnime = _animeList;

    _isLoading = false;
    notifyListeners();
  }

  void performSearch(String query) {
    if (query.isEmpty) {
      _filteredAnime = _animeList;
    } else {
      _filteredAnime =
          _animeList.where((anime) {
            final titleMatch = anime.title.toLowerCase().contains(
              query.toLowerCase(),
            );
            final genreMatch = anime.genre.any(
              (genre) => genre.toLowerCase().contains(query.toLowerCase()),
            );
            return titleMatch || genreMatch;
          }).toList();
    }
    notifyListeners();
  }

  void toggleFavorite(Anime anime) {
    if (_favorites.contains(anime)) {
      _favorites.remove(anime);
    } else {
      _favorites.add(anime);
    }
    notifyListeners();
  }

  bool isFavorite(Anime anime) => _favorites.contains(anime);
}
