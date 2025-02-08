import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _postController = TextEditingController();
  static const int _maxCharacters = 280;

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.go('/home'),
        ),
        title: const Text("Create New Post", style: TextStyle(fontSize: 18)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _postController.text.isNotEmpty ? _handlePost : null,
            child: Text(
              "Post",
              style: TextStyle(
                color:
                    _postController.text.isNotEmpty ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 24,
                  backgroundImage: NetworkImage(
                    "https://via.placeholder.com/150",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _postController,
                    maxLength: _maxCharacters,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (text) => setState(() {}),
                    decoration: const InputDecoration(
                      hintText: "What's happening?",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.blue),
                  onPressed: () {},
                ),
                Text(
                  "${_postController.text.length} / $_maxCharacters",
                  style: TextStyle(
                    color: _postController.text.length > _maxCharacters
                        ? Colors.red
                        : Colors.white54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handlePost() {
    context.pop();
  }
}
