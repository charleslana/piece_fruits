import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.title,
    this.callback,
    this.fontSize,
    this.isInk = true,
  }) : super(key: key);

  final String title;
  final double? fontSize;
  final VoidCallback? callback;
  final bool isInk;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: callback,
      child: isInk ? _ink() : _container(),
    );
  }

  Widget _container() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xfffff158),
            Color(0xffffd531),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _ink() {
    return Ink(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xfffff158),
            Color(0xffffd531),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
