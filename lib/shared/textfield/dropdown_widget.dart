import 'package:flutter/material.dart';
import 'package:ecoleta/home/home_controller.dart';

class DropdownButtonWidget extends StatefulWidget {
  final HomeController controller;
  final Function(String? newValue) onChange;
  final String label;
  final List<dynamic> options;
  final String value;

  DropdownButtonWidget({
    Key? key,
    required this.controller,
    required this.onChange,
    required this.label,
    required this.options,
    required this.value,
  }) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  late TextEditingController _controller;

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
          decoration: InputDecoration.collapsed(hintText: widget.label),
          value: widget.value == "" ? null : widget.value,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          isExpanded: true,
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.grey),
          onChanged: widget.onChange,
          items: widget.options.map((option) {
            return DropdownMenuItem<String>(
              value: option.value.toString(),
              child: Text(option.label),
            );
          }).toList(),
        ),
      ),
    );
  }
}
