import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;

  const ProfileImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 118, // Match width
        height: 118, // Match height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover, // Image fits inside container
          ),
        ),
      ),
    );
  }
}
