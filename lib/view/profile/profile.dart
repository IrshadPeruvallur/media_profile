import 'package:flutter/material.dart';
import 'package:profile_page/controller/media_controller.dart';
import 'package:profile_page/model/user_model.dart';
import 'package:profile_page/view/profile/widgets/profile_widgets.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getPrd = Provider.of<MediaController>(context, listen: false);
    getPrd.getMedia();
    final MediaModel userInfo = getPrd.allPost[0];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: ClipOval(
                    child: Image.network(
                      userInfo.profilePic!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(getPrd.allPost.length.toString()),
                    const Text('Post'),
                  ],
                ),
                const Column(
                  children: [
                    Text('564'),
                    Text('followers'),
                  ],
                ),
                const Column(
                  children: [
                    Text('56'),
                    Text('Following'),
                  ],
                ),
              ],
            ),
            CustomText(
              text: userInfo.firstName!,
              fontWeight: FontWeight.bold,
              size: 18,
            ),
            const CustomText(
              text: 'Photographer',
              fontWeight: FontWeight.w400,
              size: 13,
            ),
            const CustomText(
              text: 'You are beautiful, and i am here to capture it',
              fontWeight: FontWeight.w300,
              size: 15,
            ),
            Row(
              children: [
                const Flexible(
                  child: ButtonWidget(
                    text: 'Edit Profile',
                  ),
                ),
                const Flexible(
                  child: ButtonWidget(
                    text: 'Wallet',
                  ),
                ),
                ElevatedButton(
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
                  child: const Icon(Icons.call),
                ),
              ],
            ),
            const Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      indicatorColor: Colors.blue,
                      tabs: [
                        Tab(text: 'Photos'),
                        Tab(text: 'Videos'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ImageGirdviewWidget(),
                          VideoGirdviewWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
