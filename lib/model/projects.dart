import 'package:myportfolio/util/constant/image_constant.dart';

class Project {
  final String name;
  final String shortDescription;
  final List<String> description;
  final String duration;
  final String company;
  final List<Tech> techUsed;
  final List<Link> links;
  final bool? isPersonal;
  final List<String> developers;
  final List<Platform> platforms;
  final String? imageUrl;

  const Project({
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.duration,
    required this.company,
    this.isPersonal,
    this.techUsed = const [],
    this.platforms = const [],
    this.links = const [],
    this.developers = const [],
    this.imageUrl,
  });

  static const _android = Platform(name: "Android", image: ImageConst.android);
  static const _iOS = Platform(name: "iOS", image: ImageConst.ios);
  static const _web = Platform(name: "Web", image: ImageConst.web);
  static const _windows = Platform(name: "Windows", image: ImageConst.windows);

  static const _flutter = Tech(name: "Flutter", image: ImageConst.flutter);
  static const _dart = Tech(name: "Dart", image: ImageConst.dart);
  static const _kotlin = Tech(name: "Kotlin", image: ImageConst.kotlin);
  static const _swift = Tech(name: "Swift", image: ImageConst.swift);
  static const _firebase = Tech(name: "Firebase", image: ImageConst.firebase);
  static const _inno = Tech(name: "Inno");
  static const _c = Tech(name: "C++");
  static const _map = Tech(name: "Google map");
  static const _gemini = Tech(name: "Gemini");
  // static const  = Platform(name: "Windows", image: ImageConst.windows);

  static const arise = Project(
    name: "Arise: The monster invasion",
    shortDescription: "2D Platform game developed using flutter",
    description: [
      "Developed 2D pixel platform game in flutter using Flame 🔥",
      "Planned & Designed game environment with Tile map editor software",
      "Integrated Firebase realtime database for player leaderboard",
      "Tested and Successfully published the game on Google Play store"
    ],
    duration: "SEPT 2024 - FEB 2025",
    company: "Code Matrix",
    isPersonal: true,
    links: [
      Link(
        image: ImageConst.playStore,
        name: "Play store",
        url: "https://play.google.com/store/apps/details?id=com.geekcode.arise_game",
      ),
      Link(
        image: ImageConst.github,
        name: "Github",
        url: "https://github.com/Mahesh-R-Mesta/arise-game",
      )
    ],
    platforms: [_android],
    techUsed: [_flutter, _dart, _firebase],
    imageUrl: ImageConst.arise,
  );

  static const smriti = Project(
    name: "Smriti",
    shortDescription: "Task & Reminder management app",
    description: [
      "Built task scheduler with timed notifications & reminders",
      "Implemented window overlay screens for Android, enhancing user interaction even outside the app",
      "Developed native alarm in kotlin and used as a flutter plugin",
      "Used ObjectBox for on-device vector DB storage"
    ],
    platforms: [_android, _iOS],
    techUsed: [_flutter, _dart, _kotlin, _swift],
    duration: "Dec 2024 - PRESENT",
    company: "Code Matrix",
    imageUrl: ImageConst.smriti,
  );
  static const billd = Project(
    name: "BILLD",
    shortDescription: "Billing software solution for hotels and canteens",
    description: [
      "Developed Billing application for windows & android on a single codebase",
      "Implemented socket, ofine support, database encryption, pos receipt printer",
      "Wrote pascal script for logging out from app and C++ code for windows method channel",
      "Developed web admin application and optimized loading time 40%"
    ],
    platforms: [_windows, _android, _web],
    duration: "Aug 2022 - PRESENT",
    techUsed: [_flutter, _dart, _c, _inno],
    company: "Code Matrix",
    imageUrl: ImageConst.billd,
  );

  static const romysDoggyFood = Project(
    name: "Romy's Doggy Food",
    shortDescription: "Online food order app for Dog & cats",
    description: [
      "Developed an admin-focused mobile application to manage pet food delivery operations efficiently",
      "Integrated Google Maps for delivery route planning, and optimized route generation to multiple drop-points",
      "Implemented Location search by using Google API's for managing delivery areas",
      "Graph-QL API's integrations"
    ],
    links: [
      Link(
        image: ImageConst.web,
        name: "Link",
        url: "https://romys.in/",
      )
    ],
    platforms: [_android],
    duration: "Jan 2023 - Dec 2023",
    company: "Code Matrix",
    techUsed: [_flutter, _dart, _firebase, _map],
    imageUrl: ImageConst.rommy,
  );

  static const pro_pilot = Project(
    name: "Pro-Pilot",
    shortDescription: "A Dart CLI tool to generate boilerplate code for Flutter/React project",
    description: ["Generates code and create files and folder inside project", "Integrated Gemini API"],
    links: [
      Link(
        image: ImageConst.medium,
        name: "Medium",
        url: "https://medium.com/@maheshmesta/how-i-built-a-dart-cli-tool-that-generates-flutter-react-boilerplate-with-ai-9d75ad105cf3",
      )
    ],
    platforms: [_windows],
    techUsed: [_dart, _gemini],
    duration: "",
    company: "",
    isPersonal: true,
  );

  static const secondSmart = Project(
    name: "2ndSmart",
    shortDescription: "Managing the process of refurbishing electronics accessories",
    description: [
      "Developed a mobile app to manage the refurbishment process of electronic accessories",
      "Planned and developed the workflow with team",
      "Implemented app tour and multi-language localization"
    ],
    links: [
      Link(
        image: ImageConst.web,
        name: "Link",
        url: "https://romys.in/",
      )
    ],
    platforms: [_android, _web],
    techUsed: [_flutter, _dart, _firebase],
    duration: "Nov 2021 - Nov 2022",
    company: "Geeksynergy",
  );
}

class Link {
  final String? image;
  final String name;
  final String url;
  const Link({this.image, required this.name, required this.url});
}

class Tech {
  final String name;
  final String? image;
  const Tech({required this.name, this.image});
}

class Platform {
  final String name;
  final String? image;
  const Platform({required this.name, this.image});
}
