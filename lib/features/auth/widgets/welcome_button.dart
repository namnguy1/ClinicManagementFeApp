  import 'package:flutter/material.dart';

  class WelcomeButton extends StatelessWidget {
    final String text;
    final bool filled;
    final VoidCallback onPressed;

    const WelcomeButton({
      super.key,
      required this.text,
      required this.filled,
      required this.onPressed,
    });

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: filled ? Colors.blue : Colors.white,
            foregroundColor: filled ? Colors.white : Colors.black,
            side: filled ? null : const BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
    }
  }
