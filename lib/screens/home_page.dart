import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fluttering With You',
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF0F1228),
      ),
      backgroundColor: const Color(0xFF0F1228),
      body: ListView.separated(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 388.0,
            height: 300.0,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: Color(0xFF282D4F),
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 320.0,
                  height: 100.0,
                  margin: const EdgeInsets.all(20.0),
                  child: const Placeholder(color: Color(0xFF42CFCF)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Container',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                            color: Colors.white, fontSize: 15.0, height: 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20.0);
        },
      ),
    );
  }
}
