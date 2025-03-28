import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mova/themes/material.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight(context),
      darkTheme: themeDark(context),//MaterialTheme.dark(context),
      themeMode: ThemeMode.system,
      home: const Pravopys(content: homeContent, prevContent: null),
    );
  }
}
