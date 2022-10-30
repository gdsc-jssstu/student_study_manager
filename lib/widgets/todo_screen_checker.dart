import 'package:flutter/material.dart';

typedef OnChangeCallback = void Function(bool checked);

class CircularCheckBox extends StatefulWidget {
  Color color = Colors.white;
  Color uncheckedColor = Colors.blue;
  final bool checked;
  final OnChangeCallback onChange;
  double size = 30;
  final String str;

  CircularCheckBox({
    super.key,
    required this.checked,
    required this.onChange,
    required this.str,
  });
  @override
  _CircularCheckBoxState createState() => _CircularCheckBoxState();
}
class _CircularCheckBoxState extends State<CircularCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              widget.onChange(!widget.checked);
            },
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.0,
                  color: widget.uncheckedColor,
                ),
                color: widget.checked
                    ? widget.color
                    : Colors.white,
              ),
              child: widget.checked
                  ? const Center(
                      child: Icon(
                        Icons.circle,
                        color: Colors.blue,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.str,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: widget.checked ? Colors.black:Colors.black38,
            ),),
        ],
      ),
    );
  }
}
