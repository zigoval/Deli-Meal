import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  CategoryItem(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        15,
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.4),
            color.withOpacity(1),
          ],
          center: Alignment(0.6, -0.3),
          focal: Alignment(0.3, -0.1),
          focalRadius: 0.1,
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
