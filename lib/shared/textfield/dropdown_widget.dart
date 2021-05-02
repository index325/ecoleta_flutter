import 'package:ecoleta/core/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  late TextEditingController _controller;
  String dropdownValue = 'One';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration.collapsed(hintText: ''),
          value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          isExpanded: true,
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.grey),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
