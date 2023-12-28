import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';

showSnackBar(message,context,snackBarColor,iconStatus){

  SmartSnackBars.showTemplatedSnackbar(
    context: context,
    backgroundColor: snackBarColor,
    duration: const Duration(seconds: 2),
    animateFrom: AnimateFrom.fromBottom,
    elevation: 5,
    borderRadius: BorderRadius.circular(5),
    leading: Container(
      height: 20,
      margin: const EdgeInsets.only(right: 10),
      //  padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.1),
      ),
      child: iconStatus
          ? const Icon(
        Icons.check,
        color: Colors.white,
      )
          : const Icon(
        Icons.close,
        color: Colors.white,
      ),
    ),
    titleWidget: Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: Text(
        "$message",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    ),
  );

}