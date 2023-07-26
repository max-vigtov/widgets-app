import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(this.title, this.caption, this.imageUrl);  
}

final slides = <SlidesInfo> [
  SlidesInfo('Busca la comida', 'Eiusmod officia eiusmod ea tempor dolore nostrud officia do irure veniam dolore.', 'assets/images/1.png'),
  SlidesInfo('Entrga la comida', 'Enim amet esse sit duis sit.', 'assets/images/3.png'), 
  SlidesInfo('Disfuta la comida', 'Amet amet aliquip proident nisi laboris irure excepteur occaecat. ', 'assets/images/3.png')
  
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool enReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0 ;
      print('${pageViewController.page}');

      if (!enReached && page >= (slides.length - 1.5)) {
        setState(() {
          enReached = true;
        });
      }
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController ,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title, 
              caption: slideData.caption, 
              imageUrl: slideData.imageUrl
              )
            ).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(), 
              ),
          ),

        enReached ?
          Positioned(
            bottom: 40,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
              onPressed: () { context.pop();}, 
              child: const Text('Comenzar ')
              ),
            )
          ) : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl; 

  const _Slide({
    required  this.title, 
    required  this.caption, 
    required  this.imageUrl
   });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl),),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle,)

          ],
        ),
      ),
    );
  }
}
