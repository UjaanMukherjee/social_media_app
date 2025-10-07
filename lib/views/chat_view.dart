import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  String _selectedFriend = '';

  final List<String> _friends = [
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
    'Frank',
    'Grace',
    'Heidi'
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 80,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 350,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: ListView.builder(
                  itemCount: _friends.length,
                  itemBuilder: (context, index) {
                    final friend = _friends[index];
                    return ListTile(
                      selected: _selectedFriend == friend,
                      title: Text(friend),
                      onTap: () {
                        setState(() {
                          _selectedFriend = friend;
                        });
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                        ),
                      ),
                      width: double.infinity,
                      child: Text(
                        _selectedFriend.isEmpty
                            ? 'Select a friend'
                            : 'Chat with $_selectedFriend',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: _selectedFriend.isEmpty
                          ? const Center(child: Text('No friend selected'))
                          : ListView(
                              children: [
                                ListTile(
                                  title: Text(_selectedFriend),
                                  subtitle: const Text('Hey there!'),
                                ),
                                const ListTile(
                                  title: Text('You'),
                                  subtitle: Text('Hello!'),
                                ),
                              ],
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.emoji_emotions_outlined),
                            tooltip: 'Add emoji',
                            onPressed: _selectedFriend.isNotEmpty
                                ? () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          height: 250,
                                          child: GridView.count(
                                            crossAxisCount: 8,
                                            children: [
                                              for (final emoji in [
                                                '😀',
                                                '😂',
                                                '😍',
                                                '😎',
                                                '👍',
                                                '🙏',
                                                '🎉',
                                                '🥳',
                                                '😢',
                                                '😡',
                                                '🤔',
                                                '😇',
                                                '😱',
                                                '🤩',
                                                '😴',
                                                '🤗'
                                              ])
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    // You can add logic to insert emoji into the text field
                                                  },
                                                  child: Center(
                                                      child: Text(emoji,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      24))),
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                : null,
                          ),
                          IconButton(
                            icon: const Icon(Icons.attach_file),
                            tooltip: 'Add attachment',
                            onPressed: _selectedFriend.isNotEmpty
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Add Attachment'),
                                        content: const Text(
                                            'Attachment picker UI goes here.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Close'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                : null,
                          ),
                          Expanded(
                            child: TextField(
                              enabled: _selectedFriend.isNotEmpty,
                              decoration: const InputDecoration(
                                hintText: 'Type a message...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed:
                                _selectedFriend.isNotEmpty ? () {} : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
