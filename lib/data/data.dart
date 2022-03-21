import 'package:flutter/material.dart';
import 'package:projectmovie/models/models.dart';

final Content sintelContent = Content(
  name: 'Sintel',
  imageUrl: 'assets/images/transformer.jpg',
  titleImageUrl: 'assets/images/sintel_title.png',
  videoUrl:
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
  description:
      'A lonely young woman, Sintel, helps and befriends a dragon,\nwhom she calls Scales. But when he is kidnapped by an adult\ndragon, Sintel decides to embark on a dangerous quest to find\nher lost friend Scales.',
);

final List<Content> previews = const [
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: 'assets/images/atla.jpg',
    color: Colors.orange,
    titleImageUrl: 'assets/images/atla_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'The Crown',
    imageUrl: 'assets/images/crown.jpg',
    color: Colors.red,
    titleImageUrl: 'assets/images/crown_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: 'assets/images/umbrella_academy.jpg',
    color: Colors.yellow,
    titleImageUrl: 'assets/images/umbrella_academy_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: 'assets/images/carole_and_tuesday.jpg',
    color: Colors.lightBlueAccent,
    titleImageUrl: 'assets/images/carole_and_tuesday_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: 'assets/images/black_mirror.jpg',
    color: Colors.green,
    titleImageUrl: 'assets/images/black_mirror_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: 'assets/images/atla.jpg',
    color: Colors.orange,
    titleImageUrl: 'assets/images/atla_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'The Crown',
    imageUrl: 'assets/images/black_mirror.jpg',
    color: Colors.red,
    titleImageUrl: 'assets/images/atla_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: 'assets/images/umbrella_academy.jpg',
    color: Colors.yellow,
    titleImageUrl: 'assets/images/umbrella_academy_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: 'assets/images/carole_and_tuesday.jpg',
    color: Colors.lightBlueAccent,
    titleImageUrl: 'assets/images/carole_and_tuesday_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: 'assets/images/black_mirror.jpg',
    color: Colors.green,
    titleImageUrl: 'assets/images/black_mirror_title.png',
    videoUrl: null,
  ),
];

final List<Content> myList = const [
  Content(
    name: 'Elephant Dream',
    imageUrl: 'assets/images/violet_evergarden.jpg',
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  Content(
    name: 'How to Sell Drugs Online (Fast)',
    imageUrl: 'assets/images/htsdof.jpg',
    videoUrl:
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  ),
  Content(
    name: 'Kakegurui',
    imageUrl: 'assets/images/kakegurui.jpg',
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: 'assets/images/carole_and_tuesday.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: 'assets/images/black_mirror.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Violet Evergarden',
    imageUrl: 'assets/images/violet_evergarden.jpg',
    videoUrl: null,
  ),
  Content(
      name: 'How to Sell Drugs Online (Fast)',
      imageUrl: 'assets/images/htsdof.jpg'),
  Content(
    name: 'Kakegurui',
    imageUrl: 'assets/images/kakegurui.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: 'assets/images/carole_and_tuesday.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: 'assets/images/black_mirror.jpg',
    videoUrl: null,
  ),
];

final List<Content> originals = const [
  Content(
    name: 'Stranger Things',
    imageUrl: 'assets/images/stranger_things.jpg',
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  ),
  Content(
    name: 'The Witcher',
    imageUrl: 'assets/images/witcher.jpg',
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: 'assets/images/umbrella_academy.jpg',
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  ),
  Content(
    name: '13 Reasons Why',
    imageUrl: 'assets/images/thirteen_reasons_why.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'The End of the F***ing World',
    imageUrl: 'assets/images/teotfw.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Stranger Things',
    imageUrl: 'assets/images/stranger_things.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'The Witcher',
    imageUrl: 'assets/images/witcher.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: 'assets/images/umbrella_academy.jpg',
    videoUrl: null,
  ),
  Content(
    name: '13 Reasons Why',
    imageUrl: 'assets/images/thirteen_reasons_why.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'The End of the F***ing World',
    imageUrl: 'assets/images/teotfw.jpg',
    videoUrl: null,
  ),
];

final List<Content> trending = const [
  Content(
    name: 'Explained',
    imageUrl: 'assets/images/explained.jpg',
    videoUrl:
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
  ),
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: 'assets/images/atla_title.png',
    videoUrl: null,
  ),
  Content(
    name: 'Tiger King',
    imageUrl: 'assets/images/tiger_king.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'The Crown',
    imageUrl: 'assets/images/crown.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Dogs',
    imageUrl: 'assets/images/dogs.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Explained',
    imageUrl: 'assets/images/explained.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: 'assets/images/atla.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Tiger King',
    imageUrl: 'assets/images/atla.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'The Crown',
    imageUrl: 'assets/images/crown.jpg',
    videoUrl: null,
  ),
  Content(
    name: 'Dogs',
    imageUrl: 'assets/images/dogs.jpg',
    videoUrl: null,
  ),
];
