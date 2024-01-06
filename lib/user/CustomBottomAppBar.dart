import 'package:flutter/material.dart';
import 'package:flutter_mbk_event/user/profile_paged.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  CustomBottomAppBar({
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildTabItem(
            icon: Icons.home,
            index: 0,
            context: context,
          ),
          _buildTabItem(
            icon: Icons.search,
            index: 1,
            context: context,
          ),
          SizedBox(width: 48), // The dummy child for the notch
          _buildTabItem(
            icon: Icons.notifications,
            index: 2,
            context: context,
          ),
          _buildTabItem(
            icon: Icons.person,
            index: 3,
            context: context,
            onIconPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required int index,
    required BuildContext context,
    void Function()? onIconPressed,
  }) {
    return IconButton(
      icon: Icon(
        icon,
        color: selectedIndex == index ? Colors.blue : Colors.grey,
      ),
      onPressed: onIconPressed ?? () => onItemSelected(index),
    );
  }
}
