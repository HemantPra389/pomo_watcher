import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSize MyAppBar(String title) {
  return PreferredSize(
      child: SafeArea(
        child: Container(
          child: AppBar(
            elevation: 0,
            primary: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.pink.shade300),
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'Wt',
                      style:
                          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Watcher $title",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.pink.shade300,
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
      preferredSize: const Size.fromHeight(60));
}
