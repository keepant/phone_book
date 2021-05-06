import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phone_book/data/db/favorite_contact_db.dart';
import 'package:phone_book/providers/auth_provider.dart';
import 'package:phone_book/providers/contact_provider.dart';
import 'package:phone_book/screens/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final favContact = FavoriteContactDB();

  await Hive.initFlutter();
  await favContact.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ContactProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phone Book',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Splashscreen(),
      ),
    );
  }
}
