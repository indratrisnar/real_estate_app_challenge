import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app_challenge/common/app_color.dart';
import 'package:real_estate_app_challenge/controllers/onboard_controller.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage>
    with TickerProviderStateMixin {
  final onboardController = OnboardController();

  @override
  void initState() {
    onboardController.init(vsync: this);
    onboardController.execute();
    super.initState();
  }

  @override
  void dispose() {
    onboardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: FadeTransition(
          opacity: onboardController.appIconAnimation,
          child: SlideTransition(
            position: onboardController.appIconOffset,
            child: Icon(
              Icons.home_filled,
              color: AppColor.primary,
              size: 20,
            ),
          ),
        ),
        titleSpacing: -10,
        title: FadeTransition(
          opacity: onboardController.appTitleAnimation,
          child: SlideTransition(
            position: onboardController.appTitleOffset,
            child: Row(
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'bhase',
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: FadeTransition(
                opacity: onboardController.imageAnimation,
                child: SlideTransition(
                  position: onboardController.imageOffset,
                  child: Image.asset(
                    'assets/house_onboarding.png',
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    FadeTransition(
                      opacity: onboardController.titleAnimation,
                      child: SlideTransition(
                        position: onboardController.titleOffset,
                        child: RichText(
                          text: TextSpan(
                            text: 'Looking ',
                            style: TextStyle(
                              fontSize: 36,
                              color: AppColor.primary,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                            children: [
                              TextSpan(
                                text: 'for an\n',
                                style: TextStyle(
                                  color: AppColor.secondary,
                                ),
                              ),
                              const TextSpan(
                                text: 'elegant house this\nis the place',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    FadeTransition(
                      opacity: onboardController.descriptionAnimation,
                      child: SlideTransition(
                        position: onboardController.descriptionOffset,
                        child: const Text(
                          'Welcome friends, are you looking for us?\n'
                          'Congratulations you have found us',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            height: 2,
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    FadeTransition(
                      opacity: onboardController.buttonAnimation,
                      child: SlideTransition(
                        position: onboardController.buttonOffset,
                        child: Material(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Gap(16),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
