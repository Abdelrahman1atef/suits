part of 'on_boarding.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Stack(
            // fit: StackFit.expand,
            children: [
              Container(),
              Positioned(
                top: 30,
                bottom: 0,
                right: -70,
                child: Container(
                  width: 225,
                  height: 225,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFA7A4A4)),
                  ),
                ),
              ),
              Positioned(
                top: -350,
                bottom: 0,
                left: -50,
                child: Container(
                  width: 225,
                  height: 225,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFA7A4A4)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsGeometry.only(left: 16, right: 16, top: 80),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetStartedImage(
                      width: 137,
                      height: 370,
                      image: "onboarding3.jpg",
                      borderRadius: 45,
                    ),
                    Column(
                      spacing: 23,
                      children: [
                        GetStartedImage(
                          width: 137,
                          height: 214,
                          image: "welcome_img1.jpg",
                          borderRadius: 45,
                        ),
                        GetStartedImage(
                          width: 141,
                          height: 141,
                          image: "welcome_img2.jpg",
                          borderRadius: 150,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 33),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: theme.textTheme.headlineLarge,

              children: [
                const TextSpan(text: "The "),
                TextSpan(
                  text: "Suits App",
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                const TextSpan(text: " that\nMakes Your Look Your Best"),
              ],
            ),
          ),
          const SizedBox(height: 24),
          AppText(
            "Everything you need in the world of fashion, old and new",
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF727272),
            ),
          ),
          const SizedBox(height: 61),
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 17),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const LoginView(),
                      ),
                    ),
                    text: "Get Started",
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 21),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetStartedImage extends StatelessWidget {
  const GetStartedImage({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.borderRadius,
  });

  final double width, height, borderRadius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage("assets/images/$image"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
