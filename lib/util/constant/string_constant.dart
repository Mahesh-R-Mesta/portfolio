typedef CompanyInfo = ({String role, String city, String company, String startAndEnd, List<String> details, bool current});

mixin StringConst {
  static const String title = "Flutter Developer &\nML Enthusiast";
  static const String inShortAbout = """Hi I'm Mahesh Mesta
  - A Flutter developer with 4+ year of experience
  - Currently working in Code-matrix
  - A Constant Learner and Reader""";

  static const String about =
      "Experienced Flutter developer with 4+ years of expertise in building cross-platform apps for mobile, web, and desktop. Successfully published apps and implemented key features across platforms. Strong problem-solving skills with experience resolving complex technical challenges. Integrated native functionalities using Kotlin and Swift via platform channels. Hands-on experience with Android native development using Kotlin and Jetpack Compose. Passionate about continuous learning and adapting to new technologies. Actively exploring AI/ML integration in app development. Eager to work on innovative and impactful projects.";
  // "Experienced Flutter developer with 4+ years of expertise in building dynamic and feature-rich applications. Eager to continuously upskill, I’ve successfully resolved complex implementation challenges by learning and applying native programming languages within Flutter";

  static const CompanyInfo codeMatrix = (
    role: "Mobile App Developer",
    company: "Code Matrix",
    city: "Bangalore",
    startAndEnd: "2022 - Present",
    current: true,
    details: [
      "• Worked on the company product, developed a cross-platform app for mobile and Windows using a single codebase",
      "• Created POCs in Android native using Kotlin and implemented iOS feature",
      "• Developed custom plugins for project needs."
    ],
  );

  static const CompanyInfo geekSynergy = (
    role: "Flutter Developer",
    company: "Geeksynergy",
    city: "Bangalore",
    current: false,
    startAndEnd: "Jul 2021 - May 2022",
    details: [
      "• Developed and deployed an application for web and mobile from a single codebase",
      "• Guided flutter internship students and helped theme to resolve issue's",
      "• Implemented app localization to support multiple languages"
    ]
  );

  static const CompanyInfo appBee = (
    role: "Flutter Developer",
    company: "AppBee Software Solutions",
    city: "Sirsi",
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
