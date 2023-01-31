import 'package:chat_app/ui/widgets/model/chat_model.dart';
import 'package:flutter/material.dart';

class ActiveChats extends StatefulWidget {
  const ActiveChats({super.key});

  @override
  State<ActiveChats> createState() => _ActiveChatsState();
}

class _ActiveChatsState extends State<ActiveChats> {
  ChatModelData ins = ChatModelData();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 5, bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: ins.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    '${ins.data[index]['profileImg']}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
// ListView.builder(
//             shrinkWrap: true,
//             itemCount: ins.data.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 height: 100,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//                   child: Container(
//                     width: 65,
//                     height: 65,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(35),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             blurRadius: 10,
//                             spreadRadius: 2,
//                             offset: const Offset(0, 3),
//                           ),
//                         ]),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(35),
//                       child: Image.asset('${ins.data[index]["profileImg"]}'),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),