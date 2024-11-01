import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_tic_tac_toe/constants/colors.dart';
import 'package:simple_tic_tac_toe/constants/route_names.dart';
import 'package:simple_tic_tac_toe/screens/game_screen/game_room.dart';
import 'package:simple_tic_tac_toe/services/game_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => GameProvider(),
        )
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: MyColors.mainApp,
          ),
          routes: {
            RouteNames.gameRoom: (context) => const GameRoom(),
          },
          initialRoute: RouteNames.gameRoom,
        ),
      ),
    );
  }
}
