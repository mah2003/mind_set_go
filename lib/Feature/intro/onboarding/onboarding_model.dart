class OnboardingModel {
  final String image;
  final String title;
  final String body;
  OnboardingModel(
      {required this.image, required this.title, required this.body});
}

List<OnboardingModel> pages = [
  OnboardingModel(
      image: 'assets/Illustration.png',
      title: 'Create Good Habits',
      body:
          'Change your life by slowly adding new healty habits and sticking to them.'),
  OnboardingModel(
      image: 'assets/Illustration (1).png',
      title: 'Track Your Progress ',
      body: 'Everyday you become one step closer toyour goal. Don’t give up!'),
  OnboardingModel(
      image: 'assets/Illustration (2).png',
      title: ' Stay Together and Strong',
      body:
          ' Find friends to discuss common topics. Complete challenges together.')
];
