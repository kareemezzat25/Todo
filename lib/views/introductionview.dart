import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionView extends StatelessWidget {
  static const String routeName = "Introduction";
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logoAppBar.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              "assets/images/introduction.png",
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            SizedBox(
              height: 28,
            ),
            Text("Personalize Your Experience",
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 16,
            ),
            Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Language", style: Theme.of(context).textTheme.titleLarge),
                Text("a-E")
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Theme", style: Theme.of(context).textTheme.titleLarge),
                Text("Black-light")
              ],
            ),
            SizedBox(
              height: 28,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text("Let's Start",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5669FF),
                    minimumSize: Size(360, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)))),
            SizedBox(
              height: 8,
            )
          ]),
        ),
      ),
    );
  }
}
