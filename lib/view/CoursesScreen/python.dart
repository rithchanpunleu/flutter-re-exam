import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PythonScreen extends StatefulWidget {
  const PythonScreen({super.key});

  @override
  State<PythonScreen> createState() => _PythonScreenState();
}

class _PythonScreenState extends State<PythonScreen> {
  YoutubePlayerController? _controller; // Make the controller nullable

  // List to hold video data fetched from the API
  List<Map<String, String>> videoList = [];
  bool isLoading = true; // Flag to indicate loading state
  String errorMessage = ''; // To display errors if any

  @override
  void initState() {
    super.initState();
    fetchVideoData(); // Fetch video data when screen initializes
  }

  Future<void> fetchVideoData() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:5050/videos/3')); // Use your computer's local IP here
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Parse the videos into the videoList
        setState(() {
          videoList = (data['videos'] as List).map<Map<String, String>>((video) {
            return {
              "title": video['title'], // Extract the title
              "url": video['duration'], // Map the 'duration' field to 'url'
            };
          }).toList();

          // Initialize the YouTube player with the first video
          if (videoList.isNotEmpty) {
            _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoList[0]["url"]!)!,
              flags: const YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            );
          }
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load videos. Error: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'An error occurred: $e';
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose(); // Use nullable controller with null check
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
          ? Center(child: Text(errorMessage))
          : Column(
        children: [
          // Main video player
          if (_controller != null && videoList.isNotEmpty)
            YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    player,
                    const SizedBox(height: 20),
                    const Text(
                      "Enjoy watching the video!",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          const SizedBox(height: 20),
          // Video list
          Expanded(
            child: ListView.builder(
              itemCount: videoList.length,
              itemBuilder: (context, index) {
                final video = videoList[index];
                return ListTile(
                  leading: const Icon(
                    Icons.play_circle_outline,
                    color: Colors.red,
                  ),
                  title: Text(video["title"]!),
                  onTap: () {
                    // Update the player with the selected video
                    _controller?.load(
                        YoutubePlayer.convertUrlToId(video["url"]!)!); // Use nullable controller
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
