import 'package:flutter/material.dart';
import 'package:social_media_app/views/chat_view.dart';
import 'package:social_media_app/views/widgets/post_card.dart';
import 'package:social_media_app/views/widgets/stories_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  late TabController _tabController;

  final List<Tab> _tabs = const [
    Tab(text: 'Dashboard'),
    Tab(text: 'My Profile'),
    Tab(text: 'Liked Posts'),
    Tab(text: 'Friends'),
    Tab(text: 'Search'),
  ];

  final List<Widget> _tabPages = const [
    DashboardPage(),
    MyProfilePage(),
    LikedPostsPage(),
    FriendsPage(),
    SearchPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedTabIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool _showChat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Center(
            child: Container(
              color: Colors.white,
              child: TabBar(
                tabAlignment: TabAlignment.center,
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Colors.grey,
                tabs: _tabs,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          _tabPages[_selectedTabIndex],
          if (_showChat) ChatView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showChat = !_showChat;
          });
        },
        tooltip: 'Chat with friends',
        child: Icon(_showChat ? Icons.close : Icons.chat),
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const StoriesBar(),
        ...List.generate(5, (index) => PostCard(index: index)),
      ],
    );
  }
}

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('My Profile Page', style: TextStyle(fontSize: 24)));
  }
}

class LikedPostsPage extends StatelessWidget {
  const LikedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Liked Posts Page', style: TextStyle(fontSize: 24)));
  }
}

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Friends Page', style: TextStyle(fontSize: 24)));
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Page', style: TextStyle(fontSize: 24)));
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Dashboard Page', style: TextStyle(fontSize: 24)));
  }
}
