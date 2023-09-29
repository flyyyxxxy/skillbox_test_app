import 'package:flutter/material.dart';
import 'package:skillbox_app/presentation/screen/todo_page.dart';
import 'package:skillbox_app/presentation/screen/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Test App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Users'),
            Tab(text: 'Todos'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat),
        onPressed: () {
          Navigator.of(context).pushNamed('/chat');
        },
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          UserPage(),
          TodoPage(),
        ],
      ),
    );
  }
}
