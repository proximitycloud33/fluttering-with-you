import 'package:flutter/material.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';

BottomNavigationBar myBottomNavigationBar(
    {required Function(int index) onItemTapped, required int selectedIndex}) {
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: onItemTapped,
    elevation: 30.0,
    backgroundColor: AppColor.secondaryColor,
    unselectedItemColor: Colors.white70,
    selectedItemColor: AppColor.accentColor,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: 'Daftar Materi',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.code),
        label: 'Tambah Materi',
      ),
    ],
  );
}
