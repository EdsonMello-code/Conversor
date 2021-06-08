import 'package:conversoraapp/app/models/Currency_model.dart';
import 'package:flutter/material.dart';

class BoxInput extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model) onChanged;

  BoxInput(
      {Key? key,
      required this.items,
      required this.controller,
      required this.onChanged,
      required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 64,
                child: DropdownButton<CurrencyModel>(
                  value: selectedItem,
                  iconEnabledColor: Colors.amber,
                  iconDisabledColor: Colors.amber[600],
                  isExpanded: true,
                  underline: Container(
                    height: 1,
                    color: Colors.amber,
                  ),
                  items: items
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: onChanged,
                ),
              ),
            ),
            Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
                flex: 3),
          ],
        ),
      ),
    );
  }
}
