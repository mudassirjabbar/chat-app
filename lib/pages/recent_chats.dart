import 'package:chat_app/Apis/Apis.dart';
import 'package:chat_app/ui/widgets/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../ui/model/user_data.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({super.key});

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  List<String> docIDs = [];

  Future getDocIds() async {
    FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  void initState() {
    getDocIds();
    super.initState();
  }

  ChatModelData ins = ChatModelData();
  @override
  Widget build(BuildContext context) {
    List<UserData> list = [];
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 2))
          ]),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());

              //if data is loaded
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.docs;
                // list = data?.map((e) => UserData.fromJson(e.data())).toList() ??
                //     [];
                return TextButton(
                  onPressed: () {
                    // APIs.createUser();
                    print(APIs.auth.currentUser!.uid);
                  },
                  child: Text('ok'),
                );
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Text(
                        '${list[index]}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      );
                    }

                    // return Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pushNamed(context, "chatPage");
                    //     },
                    //     child: ListTile(
                    //       leading: CircleAvatar(
                    //         radius: 20,
                    //         backgroundImage: AssetImage(
                    //           '${ins.data[index]["profileImg"]}',
                    //         ),
                    //       ),
                    //       title: Text(
                    //         items[index]['user name'],
                    //         style: const TextStyle(
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.black),
                    //       ),
                    //       subtitle: Text(
                    //         '${ins.data[index]['lastMsg']}',
                    //         style: const TextStyle(
                    //             fontSize: 10, color: Colors.black54),
                    //       ),
                    //       trailing: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             '${ins.data[index]['lastMsgTime']}',
                    //             style: const TextStyle(
                    //                 fontSize: 10, color: Colors.black54),
                    //           ),
                    //           const SizedBox(
                    //             height: 10,
                    //           ),
                    //           Container(
                    //             height: 23,
                    //             width: 23,
                    //             alignment: Alignment.center,
                    //             decoration: BoxDecoration(
                    //               color: const Color(0xff113953),
                    //               borderRadius: BorderRadius.circular(25),
                    //             ),
                    //             child: Text(
                    //               '${ins.data[index]['numOfUnreadMsgs']}',
                    //               style: const TextStyle(
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );

                    );
            }
            return const SizedBox(
                height: 20,
                width: 20,
                child: Center(child: CircularProgressIndicator()));
          }),

      //  ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: ins.data.length,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: InkWell(
      //         onTap: () {
      //           Navigator.pushNamed(context, "chatPage");
      //         },
      //         child: ListTile(
      //           leading: CircleAvatar(
      //             radius: 20,
      //             backgroundImage: AssetImage(
      //               '${ins.data[index]["profileImg"]}',
      //             ),
      //           ),
      //           title: Text(
      //             '${ins.data[index]['name']}',
      //             style: const TextStyle(
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.black),
      //           ),
      //           subtitle: Text(
      //             '${ins.data[index]['lastMsg']}',
      //             style: const TextStyle(fontSize: 10, color: Colors.black54),
      //           ),
      //           trailing: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Text(
      //                 '${ins.data[index]['lastMsgTime']}',
      //                 style:
      //                     const TextStyle(fontSize: 10, color: Colors.black54),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Container(
      //                 height: 23,
      //                 width: 23,
      //                 alignment: Alignment.center,
      //                 decoration: BoxDecoration(
      //                   color: const Color(0xff113953),
      //                   borderRadius: BorderRadius.circular(25),
      //                 ),
      //                 child: Text(
      //                   '${ins.data[index]['numOfUnreadMsgs']}',
      //                   style: const TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.white),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
// Column(
      //   children: [
      //     for (int i = 1; i < 10; i++)
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 15),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, "chatPage");
      //           },
      //           child: SizedBox(
      //             height: 65,
      //             child: Row(
      //               children: [
      //                 ClipRRect(
      //                   borderRadius: BorderRadius.circular(35),
      //                   child: Image.asset(
      //                     'assets/images.png',
      //                     height: 65,
      //                     width: 65,
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 20),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: const [
      //                       Text(
      //                         'Programmer',
      //                         style: TextStyle(
      //                             fontSize: 15,
      //                             fontWeight: FontWeight.bold,
      //                             color: Colors.black),
      //                       ),
      //                       SizedBox(
      //                         height: 10,
      //                       ),
      //                       Text(
      //                         'Hello Developer, How are you?...',
      //                         style: TextStyle(
      //                             fontSize: 10, color: Colors.black54),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 const Spacer(),
      //                 Padding(
      //                   padding: const EdgeInsets.only(right: 10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       const Text(
      //                         '12:30 am',
      //                         style: TextStyle(
      //                             fontSize: 10, color: Colors.black54),
      //                       ),
      //                       const SizedBox(
      //                         height: 10,
      //                       ),
      //                       Container(
      //                         height: 23,
      //                         width: 23,
      //                         alignment: Alignment.center,
      //                         decoration: BoxDecoration(
      //                           color: const Color(0xff113953),
      //                           borderRadius: BorderRadius.circular(25),
      //                         ),
      //                         child: const Text(
      //                           '1',
      //                           style: TextStyle(
      //                               fontSize: 16,
      //                               fontWeight: FontWeight.bold,
      //                               color: Colors.white),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       )
      //   ],
      // ),