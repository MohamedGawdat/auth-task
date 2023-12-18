import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final String text;
  final Future<void> Function() onPressed;
  final Color color;
  final Color textColor;

  const LoadingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: widget.color),
      onPressed: () async {
        setState(() => _isLoading = true);
        await widget.onPressed();
        if (mounted) {
          setState(() => _isLoading = false);
        }
      },
      child: _isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(widget.textColor),
            )
          : Text(widget.text, style: TextStyle(color: widget.textColor)),
    );
  }
}
