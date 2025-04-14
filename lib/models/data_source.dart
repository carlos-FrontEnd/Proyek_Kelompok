import 'package:home/models/anime_model.dart';

class AnimeDataSource {
  List<Anime> getAnime() {
    return [
      Anime(
        id: 1,
        title: 'Kimetsu No Yaiba',
        rating: 9.2,
        image:
            'https://i2.wp.com/komikstation.co/wp-content/uploads/2018/01/Kimetsu-no-Yaiba.png',
        genre: ['Action', 'Adventure', 'Drama'],
        chapter: 205,
        likes: 980,
        view: 1230,
        status: 'Completed',
        sinopsis:
            "Tanjiro merupakan anak sulung dari keluarga yang kehilangan ayahnya. Suatu hari Tanjiro mengunjungi kota lain untuk menjual arang tapi berakhir menginap di rumah orang lain ketimbang pulang karena rumor tentang iblis yang mengintai di gunung pada malam hari. Ketika ia pulang pada hari berikutnya, tragedi telah menunggunya.",
        author: 'GOTOUGE Koyoharu',
      ),
      Anime(
        id: 2,
        title: 'One Piece',
        rating: 9.7,
        image:
            'https://i1.wp.com/komikstation.co/wp-content/uploads/2017/11/One-Piece-Vol-106.png',
        genre: [
          'Action',
          'Adventure',
          'Comedy',
          'Fantasy',
          'Martial Arts',
          'Mystery',
          'Shounen',
          'Supernatural',
        ],
        chapter: 1211,
        likes: 1500,
        view: 1470,
        status: 'Ongoing',
        sinopsis:
            "Bercerita tentang seorang laki-laki bernama Monkey D. Luffy, yang menentang arti dari gelar bajak laut. Daripada kesannama besar, kejahatan, kekerasan, dia lebih terlihat seperti bajak laut rendahan yang suka bersenang-senang, alasanLuffy menjadi bajak laut adalah tekadnya untuk berpetualang di lautan yang menyenangkan dan bertemu orang-orangbaru dan menarik, sertabersama-sama mencari One Piece.",
        author: 'Oda Eichiro',
      ),
      Anime(
        id: 3,
        title: 'Ruri Dragon',
        rating: 8.5,
        image:
            'https://i2.wp.com/komikstation.co/wp-content/uploads/2021/02/Ruri-Dragon-Vol-2.jpg',
        genre: ['Action', 'Comedy', 'School Life', 'Shounen', 'Supernatural'],
        chapter: 31,
        likes: 650,
        view: 980,
        status: 'Ongoing',
        sinopsis:
            "Pembunuh bayaran Juzo Ogami dikenal sebagai legenda di dunia hitam yang sangat terampil. Namun dirinya memiliki masalah jati diri yang membuatnya ditinggal oleh putri dan istrinya. Pada sebuah misi yang dia lakoni, terdapat kejadian tidak terduga yang membuat dirinya kembali menjadi anak-anak karena sebuah sengatan lebah laboratorium. Setelah dia kebingungan menafkahi putri dan mantan istrinya, dia ditawari pekerjaan untuk mencoba bersekolah di SMP Swasta yang akan dimasuki oleh putri bosnya. Dirinya yang bahkan dulu tidak lulus SD, kini mendapat kesempatan kembali untuk bersekolah. Dapatkah dia mendapatkan jati diri dan membuat hidupnya lebih berwarna?",
        author: 'FUJIMAKI Tadatoshi',
      ),
      Anime(
        id: 4,
        title: 'Kill Blue',
        rating: 8.3,
        image:
            'https://i0.wp.com/komikstation.co/wp-content/uploads/2023/04/Kill-Blue-Vol-8.jpg',
        genre: ['Action', 'Comedy', 'School Life', 'Shounen', 'Supernatural'],
        chapter: 93,
        likes: 720,
        view: 1110,
        status: 'Ongoing',
        sinopsis:
            "Pembunuh bayaran Juzo Ogami dikenal sebagai legenda di dunia hitam yang sangat terampil. Namun dirinya memiliki masalah jati diri yang membuatnya ditinggal oleh putri dan istrinya. Pada sebuah misi yang dia lakoni, terdapat kejadian tidak terduga yang membuat dirinya kembali menjadi anak-anak karena sebuah sengatan lebah laboratorium. Setelah dia kebingungan menafkahi putri dan mantan istrinya, dia ditawari pekerjaan untuk mencoba bersekolah di SMP Swasta yang akan dimasuki oleh putri bosnya. Dirinya yang bahkan dulu tidak lulus SD, kini mendapat kesempatan kembali untuk bersekolah. Dapatkah dia mendapatkan jati diri dan membuat hidupnya lebih berwarna?",
        author: 'FUJIMAKI Tadatoshi',
      ),
      Anime(
        id: 5,
        title: 'Komi-san wa Komyushou Desu',
        rating: 8.8,
        image:
            'https://i0.wp.com/komikstation.co/wp-content/uploads/2018/02/Komi-san-wa-Komyushou-Desu.jpg',
        genre: ['Comedy', 'Romance', 'School Life', 'Shounen', 'Slice Of Life'],
        chapter: 448,
        likes: 1100,
        view: 1420,
        status: 'Ongoing',
        sinopsis:
            "Komi-san adalah gadis cantik dan mengagumkan yang tak seorang pun bisa melepaskan pandangan kepadanya. Hampir seluruh sekolah menganggapnya sebagai kecantikan yang dingin, tapi Tadano Hitohito mengetahui yang sebenarnya bahwa dirinya benar-benar buruk dalam berkomunikasi dengan orang lain. Komi-san, yang ingin memperbaiki kebiasaan buruknya ini, mencoba memperbaikinya dengan bantuan Tadano-kun dengan mencapai tujuannya memiliki 100 teman.",
        author: 'Oda Tomohito',
      ),
      Anime(
        id: 6,
        title: "Gachi Koi Maou-sama",
        rating: 8.4,
        image:
            'https://i0.wp.com/komikstation.co/wp-content/uploads/2023/04/Gachi-Koi-Maou-sama.jpg',
        genre: ["Comedy", "Fantasy", "Romance", "Seinen;"],
        chapter: 23,
        likes: 780,
        view: 1010,
        status: 'Ongoing',
        sinopsis:
            'Seorang pahlawan bertugas untuk mengalahkan Raja Iblis demi perdamaian dunia. Ketika ia tiba di istana Raja Iblis, ia disambut oleh Raja Iblis dengan sertifikat pernikahan di tangannya! Sang pahlawan bingung dengan rayuan Raja Iblis yang kuat untuk menikahinya, tetapi…? Sebuah kisah romantis antara iblis yang jatuh cinta dengan pahlawan yang sedang mencoba menyelamatkan dunia!',
        author: 'Moriya Haru',
      ),
    ];
  }
}
