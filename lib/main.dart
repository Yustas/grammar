import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mova/repository/content.dart';
import 'package:mova/screens/pravopys.dart';
import 'package:logging/logging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time} | ${record.message}');
    }
  });

  runApp(const MovaApp());
}

class MovaApp extends StatelessWidget {
  const MovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = ThemeData().textTheme.copyWith(
        // AppTitle
        titleLarge: ThemeData().textTheme.titleLarge!.copyWith(fontSize: 20),
        // # Heading 1
        headlineLarge: ThemeData()
            .textTheme
            .headlineLarge!
            .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        headlineSmall:
            ThemeData().textTheme.headlineSmall!.copyWith(fontSize: 24),
        bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
              fontSize: 15,
            ),
        bodySmall: ThemeData().textTheme.bodySmall!.copyWith(fontSize: 16));

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: textTheme,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: textTheme,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      home: const Pravopys(content: homeContent, prevContent: null),
    );
  }
}
