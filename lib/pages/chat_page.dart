import 'package:chat_app/ui/widgets/chat_page.dart';
import 'package:chat_app/ui/widgets/chatbottomsheet.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String userName;
  final String profilePicture;
  const ChatPage(
      {super.key, required this.userName, required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            leadingWidth: 20,
            centerTitle: true,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: profilePicture.toString().length < 20
                      ? const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images.png'))
                      : CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(profilePicture)),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        userName,
                        style: const TextStyle(
                            color: Color(0xff113953), fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Last seen not available',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.call,
                  color: Color(0xff113953),
                  size: 23,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.video_call,
                  color: Color(0xff113953),
                  size: 23,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.more_vert,
                  color: Color(0xff113953),
                  size: 23,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              // stream: ,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  //if data is loading
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                  // return const Center(child: CircularProgressIndicator());

                  //if data is loaded
                  case ConnectionState.active:
                  case ConnectionState.done:
                }
                final list = ['Hello', 'How are you?'];
                if (list.isNotEmpty) {
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 20, top: 5),
                            child: ClipPath(
                              clipper:
                                  UpperNipMessageClipper(MessageType.receive),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: const Color(0xffe1e1e2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(3, 3),
                                      ),
                                    ]),
                                child: Text(
                                  list[index],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerRight,
                            child: ClipPath(
                              clipper: LowerNipMessageClipper(MessageType.send),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                  color: Color(0xff113953),
                                ),
                                child: Text(
                                  list[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Say Hi! 👋',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomSheet: const ChatBottomSheet(),
    );
  }
}

// body: ListView(
//   padding:
//       const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 80),
//   children: const [
//     ChatSample(),
//     ChatSample(),
//     ChatSample(),
//     ChatSample(),
//     ChatSample(),
//   ],
// ),
