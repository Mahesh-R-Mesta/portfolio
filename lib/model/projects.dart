class Project {
  final String name;
  final List<String> description;
  final String duration;
  final String company;
  final List<Tech> techUsed;
  final List<Link> links;
  final List<String> developers;
  final String? imageUrl;

  const Project({
    required this.name,
    required this.description,
    required this.duration,
    required this.company,
    this.techUsed = const [],
    this.links = const [],
    this.developers = const [],
    this.imageUrl,
  });

  static const arise = Project(
    name: "Arise: The monster invasion",
    description: [
      "Built task scheduler with timed notifications & reminders",
      "Implemented window overlay screens for Android, enhancing user interaction even outside the app",
      "Developed native alarm in kotlin and used as a flutter plugin",
      "Used ObjectBox for on-device vector DB storage"
    ],
    duration: "SEPT 2024 - FEB 2025",
    company: "Code Matrix",
    techUsed: [Tech(name: "Flutter")],
    imageUrl: "assets/image/arise.png",
  );

  static const smriti = Project(
    name: "Smriti",
    description: [
      "Built task scheduler with timed notifications & reminders",
      "Implemented window overlay screens for Android, enhancing user interaction even outside the app",
      "Developed native alarm in kotlin and used as a flutter plugin",
      "Used ObjectBox for on-device vector DB storage"
    ],
    duration: "Dec 2024 - PRESENT",
    company: "Code Matrix",
  );
  static const billd = Project(
    name: "BILLD",
    description: [
      "Developed Billing application for windows & android on a single codebase",
      "Implemented socket, ofine support, database encryption, pos receipt printer",
      "Wrote pascal script for logging out from app and C++ code for windows method channel",
      "Developed web admin application and optimized loading time 40%"
    ],
    duration: "Aug 2022 - PRESENT",
    company: "Code Matrix",
  );

  static const romysDoggyFood = Project(
    name: "Romy's Doggy Food",
    description: [
      "Developed an admin-focused mobile application to manage pet food delivery operations efficiently",
      "Integrated Google Maps for delivery route planning, and optimized route generation to multiple drop-points",
      "Implemented Location search by using Google API's for managing delivery areas",
      "Graph-QL API's integrations"
    ],
    duration: "Jan 2023 - Dec 2023",
    company: "Code Matrix",
  );

  static const secondSmart = Project(
    name: "2ndSmart",
    description: [
      "Developed a mobile application to manage the refurbishment process of electronic accessories",
      "Planned and developed the workflow with team",
      "Implemented app tour and multi-language localization"
    ],
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
