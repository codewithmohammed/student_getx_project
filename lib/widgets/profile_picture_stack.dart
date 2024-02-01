import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfilePictureStack extends StatelessWidget {
  const ProfilePictureStack({
    super.key,
    this.imageBytes, required this.function,
  });
  final Uint8List? imageBytes;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 175,
        height: 175,
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white),
            ),
            Container(
              height: 140,
              width: 140,
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.green),
              child: imageBytes != null
                  ? Image.memory(imageBytes!)
                  : const Icon(
                      Icons.person,
                      size: 125,
                    ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: IconButton(
                  onPressed: function,
                  icon: const Icon(Icons.edit),
                  highlightColor: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
