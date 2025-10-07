import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final int index;
  const PostCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child:
                  Text('U$index', style: const TextStyle(color: Colors.white)),
            ),
            title: Text('User$index'),
            subtitle: const Text('2 hours ago'),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
          Container(
            height: 180,
            color: Colors.grey[300],
            child: const Center(
                child: Icon(Icons.image, size: 80, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('This is post #$index',
                style: const TextStyle(fontSize: 16)),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
