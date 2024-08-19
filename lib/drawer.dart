import 'package:flutter/material.dart';
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.profileImageUrl,
  }) : super(key: key);

  final String userName;
  final String userEmail;
  final String profileImageUrl;


  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {

    return
     Container(

      color: Colors.black54,
      width: double.infinity,


       height: 250,

      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/sule.jpg'),

              ),
            ),
          ),
          Text(
            widget.userName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            widget.userEmail,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),

        ],
      ),

     );
  }

}
