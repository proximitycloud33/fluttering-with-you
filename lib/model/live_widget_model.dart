import 'package:flutter/material.dart';
import 'package:fluttering_with_you/utils/styles.dart';

AppBar myAppBar() {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(Icons.menu),
      color: Colors.white,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
        color: Colors.white,
      ),
    ],
  );
}

Map<String, Widget> liveWidget = {
  'apa itu flutter': Scaffold(),
  'scaffold': Scaffold(),
  'appbar': Scaffold(
    appBar: myAppBar(),
  ),
  'body': Scaffold(
    appBar: myAppBar(),
    body: Center(child: Text('Hello World')),
  ),
  'floating action button': Scaffold(
    appBar: myAppBar(),
    body: Center(child: Text('Hello World')),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  ),
  'container': Scaffold(
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.blue,
            child: Text(
              'Hi',
              style: ThemeText.headingOne,
            ),
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Width and height',
                style: ThemeText.headingOne,
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Text(
              'Padding',
              style: ThemeText.headingOne,
            ),
            padding: EdgeInsets.all(10),
          ),
          Container(
            color: Colors.blue,
            child: Text(
              'Margin',
              style: ThemeText.headingOne,
            ),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    ),
  ),
  'dekorasi container': Scaffold(
    body: Column(
      children: [
        Container(
          child: Text(
            'Color',
            style: ThemeText.headingOne,
          ),
          decoration: BoxDecoration(color: Colors.red),
        ),
        Container(
          width: 200,
          height: 200,
          child: Center(
            child: Text(
              'Shape',
              style: ThemeText.headingOne,
            ),
          ),
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
        Container(
          child: Text(
            'BoxShadow',
            style: ThemeText.headingOne,
          ),
          decoration: BoxDecoration(color: Colors.red, boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(3, 6),
              blurRadius: 10,
            )
          ]),
        ),
        Container(
          child: Text(
            'Border',
            style: ThemeText.headingOne,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.green, width: 3),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Text('Padding'),
        ),
        Center(
          child: Text('Text berada di tengah'),
        ),
      ],
    ),
  ),
  'row': Scaffold(
    body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.thumb_up),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.thumb_down),
        ),
      ],
    ),
  ),
  'column': Scaffold(
    body: Center(
      child: Column(
        children: const [
          Text(
            'Sebuah Judul',
            // style: ThemeText.headingOne,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            'Lorem Ipsum Doler Sit Amet',
            // style: ThemeText.headingOne,
          ),
        ],
      ),
    ),
  ),
  'elevated button': Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
      ),
    ),
  ),
  'text button': Scaffold(
    body: Center(
      child: TextButton(onPressed: () {}, child: Text('Text Button')),
    ),
  ),
  'outlined button': Scaffold(
    body: Center(
      child: OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
    ),
  ),
  'icon button': Scaffold(
    body: Center(
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.volume_up),
        tooltip: 'Increase value by 10',
      ),
    ),
  ),
};
