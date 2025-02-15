import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.text,
    required this.customcolor,
    required this.nextpage,
    this.isLast = false,
    this.onDelete,
    this.hasTopShadow = false,
  });

  final String text;
  final Color customcolor;
  final VoidCallback? nextpage;
  final bool isLast;
  final VoidCallback? onDelete;
  final bool hasTopShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add a top-only shadow if hasTopShadow is true.
      decoration: BoxDecoration(
        boxShadow: hasTopShadow
            ? [
                BoxShadow(
                  color: const Color.fromARGB(78, 0, 0, 0).withOpacity(0.1),
                  offset: const Offset(0, -1), // shadow only above the card
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
              ]
            : [],
      ),
      child: Card(
        elevation: 0, // remove default elevation
        shape: RoundedRectangleBorder(
          borderRadius: isLast
              ? BorderRadius.circular(10) // Last card: all corners rounded
              : const BorderRadius.vertical(
                  top: Radius.circular(10), // Only top corners rounded
                  bottom: Radius.zero, // Bottom corners flat
                ),
        ),
        color: customcolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Row(
            children: [
              // The text button that navigates to the list page.
              Expanded(
                child: TextButton(
                  onPressed: nextpage,
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ),
              // Trash icon for deleting the card.
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.black54),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
