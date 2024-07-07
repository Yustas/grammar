import 'package:flutter/material.dart';

import '../models/content.dart';
import '../screens/pravopys.dart';

class ContentList extends StatelessWidget {
  const ContentList({super.key, required this.content});

  final List<Content> content;

  @override
  Widget build(BuildContext context) {
    void openContent(
      BuildContext context,
      Content content,
    ) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Pravopys(content: content),
        ),
      ); // Navigator.push(context, route)
    }

    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(30, 150, 150, 150),
          border: Border(
              top: BorderSide(color: Color.fromARGB(70, 150, 150, 150)))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(15.0) //                 <--- border radius here
                ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: content.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  openContent(
                    context,
                    content[index],
                  );
                },
                child: Text('${content[index].prefix} ${content[index].data}'),
              );
            },
          ),
        ),
      ),
    );
  }
}