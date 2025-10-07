import 'package:flutter/material.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: 8,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueAccent,
                child: Text('U$index',
                    style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 4),
              Text('User$index', style: const TextStyle(fontSize: 12)),
            ],
          );
        },
      ),
    );
  }
}
