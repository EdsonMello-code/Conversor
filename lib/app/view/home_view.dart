import 'package:conversoraapp/app/controllers/home_controller.dart';
import 'package:conversoraapp/app/widgets/box_input.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController homeController;

  @override
  initState() {
    homeController =
        HomeController(toText: toText, fromText: fromText, context: context);
    super.initState();
  }

  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 130, bottom: 90),
              child: Image.asset('assets/images/logo.png'),
            ),
            BoxInput(
              selectedItem: homeController.toCurrency,
              items: homeController.currencies ?? [],
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model!;
                });
              },
              controller: toText,
            ),
            SizedBox(
              height: 10,
            ),
            BoxInput(
              items: homeController.currencies ?? [],
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model!;
                });
              },
              controller: fromText,
              selectedItem: homeController.fromCurrency,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  homeController.convert();
                },
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                child: Text(
                  'Converter',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
