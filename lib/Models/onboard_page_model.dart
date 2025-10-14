class OnboardPageModel {
  String image;
  String title;
  String description;

  OnboardPageModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnboardPageModel> onboardPages = [
    OnboardPageModel(
      image: 'assets/images/onboard1.png',
      title: 'Personalize Your Experience',
      description:
          'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
    ),
    OnboardPageModel(
      image: 'assets/images/onboard2.png',
      title: 'Effortless Event Planning',
      description:
          'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
    ),
    OnboardPageModel(
      image: 'assets/images/onboard3.png',
      title: 'Connect with Friends & Share Moments',
      description:
          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
    ),
  ];
}
