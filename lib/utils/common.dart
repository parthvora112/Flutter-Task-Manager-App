import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration commonInputDecoration({String? hintText}){
  return InputDecoration(
    alignLabelWithHint: false,
    contentPadding: const EdgeInsets.all(12),
    hintText: hintText??'',
    fillColor: Colors.white,
    filled: true,
    hintStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 12),
    suffixIconConstraints: const BoxConstraints(minHeight: 0, minWidth: 0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide:  BorderSide(color: AppColors.borderColor)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.red)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide:  BorderSide(color: AppColors.borderColor)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.red)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide:  BorderSide(color: AppColors.borderColor)),
    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.white)),
    errorStyle: const TextStyle(color: Colors.red,fontSize: 12),
    errorMaxLines: 3,
  );
}