typedef CompanyInfo = ({
  String role,
  String city,
  String company,
  String startAndEnd,
  List<String> details,
  bool current
});

mixin StringConst {
  static const String title = "Flutter Developer &\nML Enthusiast";
  static const String inShortAbout = """Hi I'm Mahesh Mesta
  - Flutter developer with 5+ years of experience
  - Building high-performance mobile and web applications
  - Currently working at Helixbeat""";

  static const String about =
      """Experienced mobile developer specializing in Flutter and Dart, with a track record of building cross-platform applications for mobile, web, and desktop. I solve platform bottlenecks with native Android (Kotlin) and iOS (Swift) integrations, automated profiling, and scalable state management using BLoC, Provider, and GetX.

  Technical skills include Flutter, Dart, Kotlin, Swift, Python, C, Android development, Firebase, Git, CI/CD, and UI/UX. I earned a Bachelor of Engineering in Electronics and Communications from Vishveshwarya University (2016–2020).

  Outside of work, I built and published the Flutter/Flame game Arise, created an AI-assisted Dart code-generation CLI, wrote articles on face detection and recognition and AI-assisted code generation, developed a Gita app with Kotlin and Jetpack Compose, and earned 5 stars on HackerRank. I value communication, collaboration, and practical problem-solving.""";

  static const CompanyInfo codeMatrix = (
    role: "Mobile Developer (Mobile Technical Lead, Jul 2025 – Jun 2026)",
    company: "Code Matrix",
    city: "Bengaluru",
    startAndEnd: "May 2022 - Jun 2026",
    current: false,
    details: [
      "• Developed a cross-platform company product for mobile and Windows from a single codebase",
      "• Created Android native POCs in Kotlin and implemented iOS features",
      "• Developed custom plugins to meet project requirements"
    ],
  );

  static const CompanyInfo helixbeat = (
    role: "Flutter Developer",
    company: "Helixbeat",
    city: "Coimbatore, Remote",
    startAndEnd: "Jul 2026 - Present",
    current: true,
    details: [
      "• Profiled FCP and frame rendering time, removing bottlenecks and frame drops to sustain 60 FPS",
      "• Removed duplicate API calls",
      "• Integrated Claude with Model Context Protocol (MCP) to automate root-cause analysis and resolve Sentry errors"
    ],
  );

  static const CompanyInfo geekSynergy = (
    role: "Flutter Developer",
    company: "Geeksynergy",
    city: "Bengaluru",
    current: false,
    startAndEnd: "Jul 2021 - May 2022",
    details: [
      "• Developed and deployed an application for web and mobile from a single codebase",
      "• Mentored Flutter interns and helped them resolve issues",
      "• Implemented app localization to support multiple languages"
    ]
  );

  static const CompanyInfo appBee = (
    role: "Flutter Developer Intern",
    company: "AppBee Software Solutions",
    city: "Sirsi, Uttara Kannada",
    current: false,
    startAndEnd: "Jan 2021 - Jul 2021",
    details: [
      "• Developed interactive UI screen, enhancing user experience",
      "• Implemented RESTful APIs for data integration",
      "• Troubleshot and debugged issues ensuring smooth functionality"
    ]
  );
}

mixin Family {
  static const String orbit = "Orbitron";
}
