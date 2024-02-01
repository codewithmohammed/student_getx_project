import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.isLoading,
      required this.containerColor,
      required this.text,
      required this.onTap});
  final bool isLoading;
  final Color containerColor;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: const TextStyle(color: Colors.white,fontSize: 18),
                  )),
      ),
    );
  }
}

