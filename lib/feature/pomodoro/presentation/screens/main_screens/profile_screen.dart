import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 40),
        child: Column(
          children: [
            const CircleAvatar(
              maxRadius: 50,
              backgroundImage: NetworkImage(
                  '''https://images.unsplash.com/photo-1555320818-21ebf0faf145?i
                  xlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx
                  8&auto=format&fit=crop&w=664&q=80'''),
            ),
            const Text(
              'Christina Ainsley',
              style:  TextStyle(fontSize: 22, fontFamily: 'Ubuntu'),
            ),
            const Text(
              'christinaainsley@yourdomain.com',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Ubuntu', color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Card(
                color: Colors.pink.shade200,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(18)),
                              child: const Center(
                                  child: Text('Pro',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white))),
                            ),
                            const Text(
                              'Upgrade to Premium',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            const Icon(
                              Icons.circle_notifications,
                              color: Colors.white,
                            )
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Enjoy full access app without ads and restrictions',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    setting_btn(Icons.person, 'Edit Profile'),
                    setting_btn(Icons.star_border_outlined, 'Pomo Settings'),
                    setting_btn(Icons.notifications, 'Notifications'),
                    setting_btn(Icons.security, 'Security'),
                    setting_btn(Icons.help_outline_rounded, 'Help'),
                    setting_btn(Icons.remove_red_eye, 'Dark Mode'),
                    setting_btn(Icons.exit_to_app, 'LogOut', color: Colors.red)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row setting_btn(IconData iconData, String title,
      {Color color = const Color(0xFF757575)}) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 30,
          color: Colors.grey.shade700,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Ubuntu', fontSize: 18, color: color.withOpacity(.9)),
        )
      ],
    );
  }
}
