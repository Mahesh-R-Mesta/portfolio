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
  static const _getX = Tech(name: "GetX");
  static const _bloc = Tech(name: "BLoC");
  static const _graphql = Tech(name: "GraphQL");
  static const _ai = Tech(name: "AI integration");
  static const _webSocket = Tech(name: "WebSocket");
  static const _objectBox = Tech(name: "ObjectBox");
  static const _androidOverlay = Tech(name: "Android Overlay");
  static const _swiftData = Tech(name: "SwiftData");
  static const _siriIntents = Tech(name: "Siri Intents");
  static const _methodChannel = Tech(name: "Method Channel");
  static const _drift = Tech(name: "Drift DB");
  static const _devtools = Tech(name: "DevTools");
  static const _socketIo = Tech(name: "Socket.IO");
  static const _posPrinter = Tech(name: "POS printer integration");
  static const _cpp = Tech(name: "C++");
  static const _pascal = Tech(name: "Pascal Script");
  static const _googleMaps = Tech(name: "Google Maps API");
  static const _location = Tech(name: "Location Services");
  static const _rest = Tech(name: "REST APIs");
  static const _localization = Tech(name: "App localization");
  static const _notifications = Tech(name: "Local notifications");
  static const _documentManagement = Tech(name: "Document management");
  static const _roleBasedAccess = Tech(name: "Role-based access");
  static const _flame = Tech(name: "Flame");
  static const _gemini = Tech(name: "Gemini");

  static const helixdoc = Project(
    name: "Helixdoc",
    shortDescription:
        "Community management app with an integrated AI assistant",
    description: [
      "Built a community platform for forums, events, digital magazines, and shared resources",
      "Added a community wall, real-time chat, and collaborative features",
      "Integrated an AI assistant to help members write forum posts and generate content"
    ],
    duration: "Jul 2026 - Present",
    company: "Helixbeat",
    platforms: [_iOS],
    techUsed: [_flutter, _dart, _getX, _bloc, _devtools],
  );

  static const aykta = Project(
    name: "Aykta",
    shortDescription:
        "Community management app with AI-powered content assistance",
    description: [
      "Built a community platform for forums, events, digital magazines, and shared resources",
      "Added a community wall, real-time chat, and collaboration features",
      "Integrated an AI assistant to help members create and improve content"
    ],
    duration: "Apr 2025 - Jun 2026",
    company: "Code Matrix",
    platforms: [_android, _iOS],
    techUsed: [_flutter, _bloc, _firebase, _graphql, _ai, _webSocket],
  );

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
    company: "",
    isPersonal: true,
    links: [
      Link(
        image: ImageConst.playStore,
        name: "Play store",
        url:
            "https://play.google.com/store/apps/details?id=com.geekcode.arise_game",
      ),
      Link(
        image: ImageConst.github,
        name: "Github",
        url: "https://github.com/Mahesh-R-Mesta/arise-game",
      )
    ],
    platforms: [_android],
    techUsed: [_flutter, _dart, _firebase, _flame],
    imageUrl: ImageConst.arise,
  );

  static const snippic = Project(
    name: "Snippic",
    shortDescription:
        "A visual tutorial editor for creating polished developer content",
    description: [
      "Built a web and mobile editor for creating visually engaging developer tutorials",
      "Combine code snippets, icons, shapes, and images in one tutorial"
    ],
    duration: "",
    company: "",
    isPersonal: true,
    techUsed: [_flutter, _dart, _firebase, _flame],
    links: [
      Link(
        image: ImageConst.web,
        name: "Open web app",
        url: "https://codesnippet-ten.vercel.app/#/editor",
      )
    ],
    platforms: [_web, _android, _iOS],
    imageUrl: ImageConst.snippic,
  );

  static const smriti = Project(
    name: "Smriti",
    shortDescription: "Task & Reminder management app",
    description: [
      "Developed a task scheduler with timed notifications and reminders",
      "Implemented Android overlay screens for interaction outside the app",
      "Built a native Kotlin alarm module as a Flutter plugin",
      "Integrated ObjectBox for on-device vector database storage"
    ],
    platforms: [_android],
    techUsed: [
      _flutter,
      _dart,
      _kotlin,
      _objectBox,
      _androidOverlay,
      _notifications,
      _firebase,
      _bloc
    ],
    duration: "Nov 2024 - May 2025",
    company: "Code Matrix",
    imageUrl: ImageConst.smriti,
  );

  static const zenvoya = Project(
    name: "Zenvoya",
    shortDescription:
        "AI travel assistant that creates personalized trip itineraries",
    description: [
      "Developed an AI travel assistant to generate personalized trip itineraries",
      "Implemented App Shortcuts and Siri Intents",
      "Integrated SwiftData and REST APIs using Swift"
    ],
    duration: "Feb 2024 - Oct 2024",
    company: "Code Matrix",
    platforms: [_iOS],
    techUsed: [
      _flutter,
      _swift,
      _swiftData,
      _siriIntents,
      _rest,
      _methodChannel
    ],
  );

  static const billd = Project(
    name: "BILLD",
    shortDescription: "Billing software solution for hotels and canteens",
    description: [
      "Built hotel billing and management software for Windows and Android from a single codebase",
      "Implemented Socket.IO connections, offline support, database encryption, and POS receipt generation",
      "Developed a web admin panel and optimized its loading time by 40%",
      "Implemented native Windows integrations using C++ and Pascal Script"
    ],
    platforms: [_windows, _android, _web],
    duration: "Jun 2022 - Jun 2026",
    techUsed: [
      _flutter,
      _dart,
      _drift,
      _socketIo,
      _posPrinter,
      _cpp,
      _pascal,
      _graphql
    ],
    company: "Code Matrix",
    imageUrl: ImageConst.billd,
  );

  static const romysDoggyFood = Project(
    name: "Romy's Doggy Food",
    shortDescription: "Online food order app for Dog & cats",
    description: [
      "Developed an admin-focused mobile app to manage pet food delivery operations",
      "Integrated Google Maps for delivery route planning and optimized multi-drop routes",
      "Implemented location search using Google APIs and integrated GraphQL APIs"
    ],
    links: [
      Link(
        image: ImageConst.web,
        name: "Link",
        url: "https://romys.in/",
      )
    ],
    platforms: [_android],
    duration: "Jan 2023 - Oct 2023",
    company: "Code Matrix",
    techUsed: [_flutter, _dart, _firebase, _googleMaps, _graphql, _location],
    imageUrl: ImageConst.rommy,
  );

  static const arraymeter = Project(
    name: "Arraymeter",
    shortDescription: "Solar installation management and monitoring app",
    description: [
      "Built a mobile app to manage and monitor solar panel installations",
      "Implemented separate admin and field tester flows with role-based access",
      "Added installation status tracking, test result logging, and panel performance monitoring"
    ],
    duration: "Jan 2021 - Jun 2021",
    company: "AppBee Software Solutions",
    platforms: [_android],
    techUsed: [_flutter, _dart, _rest, _roleBasedAccess],
  );

  static const corms = Project(
    name: "CORMS",
    shortDescription: "Company Office Records Management System",
    description: [
      "Digitized paper-based organizational documentation with a structured digital workflow",
      "Built features to create, store, retrieve, and track official records"
    ],
    duration: "May 2021 - Jan 2022",
    company: "Geeksynergy",
    platforms: [_android],
    techUsed: [
      _flutter,
      _dart,
      _rest,
      _firebase,
      _documentManagement,
      _notifications
    ],
  );

  static const pro_pilot = Project(
    name: "Pro-Pilot CLI",
    shortDescription:
        "A Dart CLI tool to generate boilerplate code for Flutter/React project using AI",
    description: [
      "Generates code and create files and folder inside project",
      "Integrated Gemini API"
    ],
    links: [
      Link(
        image: ImageConst.medium,
        name: "Medium",
        url:
            "https://medium.com/@maheshmesta/how-i-built-a-dart-cli-tool-that-generates-flutter-react-boilerplate-with-ai-9d75ad105cf3",
      ),
      Link(
        image: ImageConst.github,
        name: "Github",
        url: "https://github.com/Mahesh-R-Mesta/pro_pilot_cli",
      )
    ],
    platforms: [_windows],
    techUsed: [_dart, _gemini, _ai],
    duration: "",
    company: "",
    isPersonal: true,
  );

  static const secondSmart = Project(
    name: "2ndSmart",
    shortDescription:
        "Managing the process of refurbishing electronics accessories",
    description: [
      "Developed a mobile app to manage the end-to-end refurbishment of electronic products",
      "Built a multi-stage workflow for receiving, quality testing, repairing, pricing, and publishing products",
      "Implemented app tour and multi-language localization"
    ],
    platforms: [_android, _web],
    techUsed: [_flutter, _dart, _rest, _localization],
    duration: "Dec 2021 - May 2022",
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
