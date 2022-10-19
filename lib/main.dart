import 'package:flutter/material.dart';
import 'package:practice_1/app/providers/routes/app.routes.dart';
import 'package:provider/provider.dart';

import 'app/providers/app.provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: Lava(), providers: AppProviders.providers);
  }
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Approutes.LoginRoute,
      routes: Approutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
