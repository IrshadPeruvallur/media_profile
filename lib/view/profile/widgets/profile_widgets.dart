import 'package:flutter/material.dart';
import 'package:profile_page/controller/media_controller.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 8, 51, 87),
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          child: CustomText(text: text),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final FontWeight? fontWeight;
  final String text;
  final double? size;
  final Color? color;
  const CustomText({
    super.key,
    this.fontWeight,
    this.color,
    required this.text,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}

class ImageGirdviewWidget extends StatelessWidget {
  const ImageGirdviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaController>(builder: (context, value, child) {
      final images = value.allPost
          .where((element) => element.fileType == "image/jpeg")
          .toList();
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.6 / 2,
        ),
        itemBuilder: (context, index) {
          final data = images[index];
          return Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  data.filePath!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 50,
                right: 50,
                bottom: 50,
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: data.likeCount.toString(),
                          color: Colors.white,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.comment, color: Colors.white),
                        CustomText(
                          text: data.commentCount.toString(),
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
        itemCount: images.length,
      );
    });
  }
}

class VideoGirdviewWidget extends StatelessWidget {
  const VideoGirdviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaController>(builder: (context, value, child) {
      final videos = value.allPost
          .where((element) => element.fileType != "image/jpeg")
          .toList();
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.6 / 2,
        ),
        itemBuilder: (context, index) {
          final data = videos[index];
          return Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  data.filePath!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 50,
                right: 50,
                bottom: 50,
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: data.likeCount.toString(),
                          color: Colors.white,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.comment, color: Colors.white),
                        CustomText(
                          text: data.commentCount.toString(),
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
        itemCount: videos.length,
      );
    });
  }
}
