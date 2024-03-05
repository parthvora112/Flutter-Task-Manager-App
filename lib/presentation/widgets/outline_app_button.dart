import 'package:task_manager_app/utils/colors.dart';
import 'package:flutter/material.dart';

class OutlineAppButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final double? width;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;

  const OutlineAppButton({super.key, required this.text, required this.onPressed, this.width, this.borderColor, this.textColor, this.textStyle});

  @override
  State<OutlineAppButton> createState() => _OutlineAppButtonState();
}

class _OutlineAppButtonState extends State<OutlineAppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: 48,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: widget.borderColor ?? AppColors.borderColor)),
        ),
        child: Text(widget.text, style: widget.textStyle ?? TextStyle(color: widget.textColor ?? AppColors.greyTextColor, fontSize: 16)),
      ),
    );
  }
}
