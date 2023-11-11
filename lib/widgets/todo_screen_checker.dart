import 'package:flutter/material.dart';

// Define a callback for when the checkbox value changes
typedef OnChangeCallback = void Function(bool checked);

class CircularCheckBox extends StatefulWidget {
  // Add a new property for the checked color
  Color color = Colors.white;
  // Add a new property for the unchecked color
  Color uncheckedColor = Colors.blue;
  // Specify that key is nullable
  final Key? key;
  // The initial checked state
  final bool checked;
  // Callback function when the checkbox changes
  final OnChangeCallback onChange;
  // Size of the checkbox
  double size = 30;
  // A label to display next to the checkbox
  final String str;

  // Constructor with named parameters
  CircularCheckBox({
    this.key,
    required this.checked,
    required this.onChange,
    required this.str,
  });

  @override
  _CircularCheckBoxState createState() => _CircularCheckBoxState();
}

class _CircularCheckBoxState extends State<CircularCheckBox> {
  // Add a boolean property to track whether the checkbox is hovered or not
  bool isHovered = false;

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
            // Add a MouseRegion to handle hover events
            onHover: (value) {
              setState(() {
                isHovered = value;
              });
            },
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.0,
                  color: isHovered ? Colors.black : widget.uncheckedColor,
                ),
                color: widget.checked
                    ? widget.color
                    : isHovered
                        ? Colors.grey[200] // Change the background color on hover
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
              color: widget.checked ? Colors.black : Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
