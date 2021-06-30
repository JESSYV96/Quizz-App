import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/presentation/screens/questions/add_question_screen.dart';

import 'amplifyconfiguration.dart';
import 'business_logic/game_logic/level/cubit/level_cubit.dart';
import 'models/ModelProvider.dart';
import 'presentation/screens/game/game_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/loading_screen.dart';
import 'presentation/screens/options_screen.dart';
import 'presentation/screens/questions/questions_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Amplify.addPlugin(AmplifyAPI()); // UNCOMMENT this line once backend is deployed
    Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));

    // Once Plugins are added, configure Amplify
    try {
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<LevelCubit>(create: (context) => LevelCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          '/game': (context) => GameScreen(),
          '/options': (context) => OptionsScreen(),
          '/questions': (context) => QuestionsScreen(),
          '/questions/add': (context) => AddQuestionScreen(),
          '/loading': (context) => LoadingScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
