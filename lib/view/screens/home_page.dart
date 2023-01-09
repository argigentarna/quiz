import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/res/color.dart';

import '../../res/components/icon_button.dart';
import '../../res/components/outline_button.dart';
import '../../res/components/round_button.dart';
import '../../res/shared/shared_methods.dart';
import '../../res/textstyle.dart';
import '../../view_model/question_view_model.dart';
import '../../view_model/quiz_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _init = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    QuestionViewModel provider = Provider.of<QuestionViewModel>(
      context,
      listen: false,
    );

    if (!_init) {
      provider.fetchQuestionsFromFirestore();
      setState(() {
        _init = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 36,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 90,
            ),
            buildTitle(),
            const SizedBox(
              height: 70,
            ),
            buildPlayButton(context),
            const SizedBox(
              height: 50,
            ),
            buildShareRate(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              const FlareActor(
                "assets/flare/lamp.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "lightspot",
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 120),
                  child: Text(
                    "Flutter Quiz App",
                    style: AppTextstyle.mainTextStyle.copyWith(
                      fontWeight: AppTextstyle.black,
                      fontSize: 19,
                      color: AppColors.kBlackColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Learn - Take Quiz - Repeat",
            style: AppTextstyle.mainTextStyle.copyWith(
              fontWeight: AppTextstyle.light,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPlayButton(context) {
    return Column(
      children: [
        RoundButton(
          title: "PLAY",
          onPress: () async {
            QuizViewModel provQuiz = Provider.of<QuizViewModel>(
              context,
              listen: false,
            );

            await provQuiz.generateQuizQuestion(
              "",
              context,
            );

            Navigator.pushNamed(
              context,
              '/quiz',
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        OutlineCustomButton(
          title: "TOPICS",
          onPress: () {
            Navigator.pushNamed(
              context,
              '/topic',
            );
          },
        ),
      ],
    );
  }

  Widget buildShareRate() {
    return Row(
      children: [
        const Spacer(),
        IconCustomButton(
          title: 'Share',
          onPress: () {
            SharedMethods.share(
              "We help communicate your brand promise to your audience through customized loyalty programs, personalized media contents and targeted digital campaigns.",
            );
          },
          icon: const Icon(
            Icons.share,
            color: AppColors.kBlueColor,
          ),
        ),
        const Spacer(),
        IconCustomButton(
          title: 'Rate Us',
          onPress: () {},
          icon: const Icon(
            Icons.star,
            color: AppColors.kYellowColor,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
