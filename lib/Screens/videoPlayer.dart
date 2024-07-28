
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Screens/Home_View.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  void initializeVideoPlayer() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);

    videoPlayerController.initialize().then((_) {
      setState(() {
        aspectRatio = videoPlayerController.value.aspectRatio;
        chewieController = ChewieController(
          
          videoPlayerController: videoPlayerController,
          aspectRatio: aspectRatio,
          allowFullScreen: false,
          autoPlay: false,
          looping: false,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: videoPlayerController.value.isInitialized
          ? Center(
              child: Container(
                width: MediaQuery.of(context).size.width, // عرض الشاشة الكامل
                child: AspectRatio(
                  aspectRatio: aspectRatio ?? 16 / 9, // استخدم نسبة العرض إلى الارتفاع للفيديو
                  child: Chewie(
                    controller: chewieController!,
                    
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                
              ),
            ),
    );
  }
}

class VideoListPage extends StatefulWidget {
  final Map<String, dynamic> factoryData;

  VideoListPage({required this.factoryData});

  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  late Future<List<Map<String, dynamic>>?> _futureVideos;
  late int viewsCount;

  @override
  void initState() {
    super.initState();
    _futureVideos = fetchData();
    viewsCount = widget.factoryData['views'] ?? 180;
    _incrementViews();
  }

  void _incrementViews() async {
    final collection = FirebaseFirestore.instance.collection('videos');
    final querySnapshot = await collection
        .where('name', isEqualTo: widget.factoryData['name'])
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final docRef = querySnapshot.docs.first.reference;
      await docRef.update({'views': viewsCount + 1});
      setState(() {
        viewsCount += 1;
      });
    }
  }

  Future<List<Map<String, dynamic>>?> fetchData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('videos').get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فيديوهات الدلالة'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>?>(
        future: _futureVideos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Icon(Icons.error);
          }
          if (snapshot.hasData && snapshot.data != null) {
            List<Map<String, dynamic>> dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = dataList[index];
                String videoUrl = data['videoUrl'] ?? '';
                String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => banersinfobode(factoryData: data));
                        },
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.touch_app, color: Colors.black), // أيقونة
                              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
                              Text(
                                buttonText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
                                  decoration: TextDecoration.underline, // لإضافة خط تحت النص
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      AspectRatio(
                        aspectRatio: 16 / 14,
                        child: VideoPlayerPage(videoUrl: videoUrl),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Icon(Icons.error);
          }
        },
      ),
    );
  }
}
