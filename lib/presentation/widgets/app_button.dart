import 'package:task_manager_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final double? width;
  final Color? color;

  const AppButton({super.key, required this.text, required this.onPressed, this.width,this.color});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: 48,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.color ?? AppColors.primaryColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(widget.text,style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
