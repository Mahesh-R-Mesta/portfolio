typedef CompanyInfo = ({String role, String city, String company, String startAndEnd, String details});

mixin StringConst {
  static const String title = "Flutter Developer &\nAI/ML Enthusiast";
  static const String inShortAbout = """Hi I'm Mahesh Mesta
      - A Flutter developer with 4+ year of experience
      - Currently working in Code-matrix
      - A Constant Learner and Reader""";

  static const String about = """ Experienced Flutter developer with 4+ years of expertise in building
 dynamic and feature-rich applications. Eager to continuously upskill, I’ve
 successfully resolved complex implementation challenges by learning and
 applying native programming languages within Flutter""";

  static const CompanyInfo codeMatrix = (
    role: "Mobile App Developer",
    company: "Code Matrix",
    city: "Bangalore",
    startAndEnd: "2022 - Present",
    details: """• Worked on the company product, developed a cross-platform app
 for mobile and Windows using a single codebase
 • Created POCs in Android native using Kotlin and implemented iOS
 feature
 • Developed custom plugins for project needs."""
  );

  static const CompanyInfo geekSynergy = (
    role: "Flutter Developer",
    company: "Geeksynergy",
    city: "Bangalore",
    startAndEnd: "Jul 2021 - May 2022",
    details: """• Developed and deployed an application for web and mobile from a
 single codebase
 • Guided flutter internship students and helped theme to resolve
 issue's
 • Implemented app localization to support multiple languages"""
  );

  static const CompanyInfo appBee = (
    role: "Flutter Developer",
    company: "AppBee Software Solutions",
    city: "Sirsi",
    startAndEnd: "Jan 2021 - Jul 2021",
    details: """• Developed interactive UI screen, enhancing user experience
 • Implemented RESTful APIs for data integration
 • Troubleshot and debugged issues ensuring smooth functionality"""
  );
}

mixin Family {
  static const String orbit = "Orbitron";
}
