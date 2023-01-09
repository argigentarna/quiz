import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/view/screens/home_page.dart';
import 'package:quiz_app/view/screens/quiz_page.dart';
import 'package:quiz_app/view/screens/result_page.dart';
import 'package:quiz_app/view/screens/topic_page.dart';
import 'package:quiz_app/view_model/question_view_model.dart';
import 'package:quiz_app/view_model/quiz_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuestionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => QuizViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/topic': ((context) => const TopicPage()),
        '/quiz': ((context) => const QuizPage()),
        '/result': ((context) => const ResultPage()),
      },
    );
  }
}
