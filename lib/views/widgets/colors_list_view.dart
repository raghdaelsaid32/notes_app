import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 28,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 28,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

int currentIndex = 0;
List<Color> colors = const [
  Color(0xff87BBA2),
  Color(0xff98C1D9),
  Color(0xffC1A5A9),
  Color(0xffEE6C4D),
  Color(0xffF8F4A2)
];

class _ColorsListViewState extends State<ColorsListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 13, left: 8, top: 20),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
