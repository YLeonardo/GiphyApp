import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/giphy_service.dart';
import 'providers/giphy_provider.dart';
import 'screens/home_screen.dart';
import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              GiphyProvider(GiphyService(AppConfig.giphyApiKey)),
        ),
      ],
      child: MaterialApp(
        title: 'Giphy Picker App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
