import 'package:flutter/material.dart';

import 'my_profile_page.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.green[700],
          ),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyProfilePage(),
                  ));
                },
                child: const Text('Profile Screen'),
              )),
        ],
      ),
    );
  }
}
