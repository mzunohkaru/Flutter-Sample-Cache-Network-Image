import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachePage extends StatelessWidget {
  const CachePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: 'https://picsum.photos/250?image=$index',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Text(
              '画像をロードできませんでした。',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
