import 'package:conversoraapp/app/utils/format_property.dart';
import 'package:conversoraapp/app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MultiProvider(
        providers: [
          Provider<FormatProperty>(
            lazy: true,
            builder: (_, child) {
              return HomeView();
            },
            create: (_) => FormatProperty(),
          ),
        ],
      ),
    );
  }
}
