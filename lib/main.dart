import 'package:flutter/material.dart';

import 'carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final imageUrls = [
      'assets/images/image-58.png',
      'assets/images/image-59.png',
      'assets/images/image-60.png',
      'assets/images/image-61.png',
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        imgUrls: imageUrls,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<String> imgUrls;
  const MyHomePage({required this.imgUrls, super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List.generate(
      10,
      (index) => ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        child: Image.asset(
          widget.imgUrls[index % 2 + 1], //Images stored in assets folder
          fit: BoxFit.fill,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blue,
      //Wrap with Center to place the carousel center of the screen
      body: Center(
        //Wrap the OverlappedCarousel widget with SizedBox to fix a height. No need to specify width.
        child: SizedBox(
          height: 200,
          child: MyCarousel(
            widgets: widgets, //List of widgets
            currentIndex: 0,
            onClicked: (index) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("You clicked at $index"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
