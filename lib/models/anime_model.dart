class Anime {
  int id;
  String title;
  double rating;
  String status;
  String sinopsis;
  String author;
  String image;
  List<String> genre;
  String release;
  int chapter;
  int likes;
  int view;

  Anime({
    required this.id,
    required this.release,
    required this.title,
    required this.rating,
    required this.status,
    required this.sinopsis,
    required this.author,
    required this.image,
    required this.genre,
    required this.chapter,
    required this.likes,
    required this.view,
  });
}