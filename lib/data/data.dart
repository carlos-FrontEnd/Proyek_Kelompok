import 'dart:math';
import 'person.dart';

class DataCard {
  final Random _random = Random();

  int _generateRandomView() {
    return 1 + _random.nextInt(500); // 1 hingga 500
  }

  List<Person> getAnime() {
    return [
      Person(
        id: 1,
        title: 'Attack on Titan',
        rating: 9.8,
        image: 'https://picsum.photos/200/300',
        genre: ['Action', 'Drama', 'Fantasy'],
        chapter: 139,
        likes: 1200,
        view: _generateRandomView(),
      ),
      Person(
        id: 2,
        title: 'Naruto',
        rating: 9.0,
        image: 'https://picsum.photos/200/300',
        genre: ['Action', 'Adventure', 'Fantasy'],
        chapter: 700,
        likes: 1100,
        view: _generateRandomView(),
      ),
      Person(
        id: 3,
        title: 'Demon Slayer',
        rating: 9.7,
        image: 'https://picsum.photos/200/300',
        genre: ['Action', 'Adventure', 'Supernatural'],
        chapter: 205,
        likes: 950,
        view: _generateRandomView(),
      ),
      Person(
        id: 4,
        title: 'My Hero Academia',
        rating: 8.9,
        image: 'https://picsum.photos/200/300',
        genre: ['Action', 'Comedy', 'Superhero'],
        chapter: 390,
        likes: 850,
        view: _generateRandomView(),
      ),
      Person(
        id: 5,
        title: 'Jujutsu Kaisen',
        rating: 9.2,
        image: 'https://picsum.photos/200/300',
        genre: ['Action', 'Supernatural', 'Dark Fantasy'],
        chapter: 236,
        likes: 1000,
        view: _generateRandomView(),
      ),
      Person(
        id: 6,
        title: 'Bleach',
        rating: 8.8,
        image: 'https://picsum.photos/200/300',
        genre: ['Action', 'Adventure', 'Supernatural'],
        chapter: 686,
        likes: 900,
        view: _generateRandomView(),
      ),
      Person(
        id: 7,
        title: 'Tokyo Revengers',
        rating: 8.5,
        image: 'https://picsum.photos/200/300',
        genre: ['Action', 'Drama', 'Time Travel'],
        chapter: 278,
        likes: 800,
        view: _generateRandomView(),
      ),
      Person(
        id: 8,
        title: 'Spy x Family',
        rating: 9.1,
        image: 'https://picsum.photos/200/300',
        genre: ['Action', 'Comedy', 'Slice of Life'],
        chapter: 75,
        likes: 950,
        view: _generateRandomView(),
      ),
      // Add more Person objects if needed
    ];
  }
}
