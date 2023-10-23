// ignore_for_file: file_names
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  const SlideInfo(
      title: 'Forage for food',
      caption:
          'Occaecat consectetur in in mollit enim quis aute qui magna nostrud. Amet laborum eiusmod sit Lorem. Ex quis ut in tempor qui ullamco anim ex Lorem culpa eu duis mollit.',
      imageUrl: 'assets/images/1.png'),
  const SlideInfo(
      title: 'Fast delivery',
      caption:
          'Exercitation exercitation consectetur enim duis aliquip. Nisi et proident veniam excepteur non officia voluptate deserunt incididunt tempor elit. Exercitation veniam excepteur laboris id sint aliquip nostrud commodo nisi nostrud Lorem Lorem. Ut ullamco mollit laboris est. Aliquip reprehenderit do elit aliqua velit est labore velit aute deserunt. Sunt pariatur ex consectetur ex irure eiusmod aliquip quis enim. Fugiat esse cupidatat in aliquip ullamco incididunt.',
      imageUrl: 'assets/images/2.png'),
  const SlideInfo(
      title: 'Enjoy the meal',
      caption:
          'Elit do aliquip labore minim occaecat est ex in qui magna proident incididunt cillum dolor. Adipisicing aute incididunt deserunt ex qui magna officia ipsum. Minim dolor mollit non ad.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached=true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ))
                  .toList()),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Skip'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        child: const Text('Start'),
                        onPressed: () => context.pop()),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyle),
              const SizedBox(height: 10),
              Text(
                caption,
                style: captionStyle,
              )
            ]),
      ),
    );
  }
}
