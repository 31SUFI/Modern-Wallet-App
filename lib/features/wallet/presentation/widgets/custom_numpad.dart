import 'package:flutter/material.dart';

class CustomNumpad extends StatelessWidget {
  final Function(String) onNumberSelected;

  const CustomNumpad({
    Key? key,
    required this.onNumberSelected,
  }) : super(key: key);

  Widget _buildButton(BuildContext context, String text,
      {bool isIcon = false}) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onNumberSelected(text),
        child: Container(
          height: size.height * 0.08,
          alignment: Alignment.center,
          child: isIcon
              ? Icon(
                  text == 'backspace'
                      ? Icons.backspace_outlined
                      : Icons.keyboard_return,
                  color: Colors.black87,
                  size: size.width * 0.06,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(child: _buildButton(context, '1')),
              Expanded(child: _buildButton(context, '2')),
              Expanded(child: _buildButton(context, '3')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildButton(context, '4')),
              Expanded(child: _buildButton(context, '5')),
              Expanded(child: _buildButton(context, '6')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildButton(context, '7')),
              Expanded(child: _buildButton(context, '8')),
              Expanded(child: _buildButton(context, '9')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildButton(context, '.')),
              Expanded(child: _buildButton(context, '0')),
              Expanded(child: _buildButton(context, 'backspace', isIcon: true)),
            ],
          ),
        ],
      ),
    );
  }
}
