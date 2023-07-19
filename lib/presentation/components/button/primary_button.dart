import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? didTap;
  const PrimaryButton({super.key, this.title, this.didTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.0,
      child: ElevatedButton(
        onPressed: didTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        child: Text(
          title ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
