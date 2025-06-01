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
  static const _kotlin = Tech(name: "Kotlin", image: ImageConst.kotlin);
  static const _swift = Tech(name: "Swift", image: ImageConst.swift);
  static const _firebase = Tech(name: "Firebase", image: ImageConst.firebase);
  static const _inno = Tech(name: "Inno");
  // static const  = Platform(name: "Windows", image: ImageConst.windows);

  static const arise = Project(
    name: "Arise: The monster invasion",
    shortDescription: "2D Platform game developed using flutter",
    description: [
      "Built task scheduler with timed notifications & reminders",
      "Implemented window overlay screens for Android, enhancing user interaction even outside the app",
      "Developed native alarm in kotlin and used as a flutter plugin",
      "Used ObjectBox for on-device vector DB storage"
    ],
    duration: "SEPT 2024 - FEB 2025",
    company: "Code Matrix",
    isPersonal: true,
    platforms: [_android],
    techUsed: [_flutter, _firebase],
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
    techUsed: [_flutter, _kotlin, _swift],
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
    techUsed: [_flutter, _inno],
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
    platforms: [_android],
    duration: "Jan 2023 - Dec 2023",
    company: "Code Matrix",
    techUsed: [_flutter, _firebase],
    imageUrl: ImageConst.rommy,
  );

  static const secondSmart = Project(
    name: "2ndSmart",
    shortDescription: "Managing the process of refurbishing electronics accessories",
    description: [
      "Developed a mobile application to manage the refurbishment process of electronic accessories",
      "Planned and developed the workflow with team",
      "Implemented app tour and multi-language localization"
    ],
    platforms: [_android, _web],
    duration: "Nov 2021 - Nov 2022",
    company: "Geeksynergy",
  );
}

class Link {
  String name;
  String url;
  Link({required this.name, required this.url});
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
