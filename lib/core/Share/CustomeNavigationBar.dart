import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        height: Units.getHeight(context: context, value: 70),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavigationItem(icon: Icons.home_outlined, itemIndex: 0),
            _buildNavigationItem(icon: Icons.chat_bubble_outline, itemIndex: 1),
            SizedBox(width: Units.getWidth(context: context, value: 40)),
            _buildNavigationItem(icon: Icons.calendar_month_outlined, itemIndex: 2),
            _buildNavigationItem(icon: Icons.person_outline, itemIndex: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem({required IconData icon, required int itemIndex}) {
    final bool isCurrentTabSelected = selectedIndex == itemIndex;

    return GestureDetector(
      onTap: () => onItemSelected(itemIndex),
      child: SizedBox(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isCurrentTabSelected ? const Color(0xFF4D8AFF) : Colors.grey,
              size: 28,
            ),
            if (isCurrentTabSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 3,
                width: 16,
                decoration: BoxDecoration(
                  color: const Color(0xFF4D8AFF),
                  borderRadius: BorderRadius.circular(1.5),
                ),
              ),
          ],
        ),
      ),
    );
  }
}