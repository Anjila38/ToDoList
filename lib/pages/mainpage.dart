import 'package:flutter/material.dart';
import 'dart:math'; // For random colors
import 'package:todolist/components/card.dart';
import 'listpage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  // Initial card list with unique colors
  List cards = [
    {"text": "Travel Plans", "color": const Color(0xFFFFC6FF)}, // Rose Pink
    {"text": "ABC", "color": const Color(0xFFFFADAD)}, // Soft Coral
  ];

  // Vibrant pastel colors (no green)
  final List pastelColors = [
    const Color(0xFFFFADAD), // Soft Coral
    const Color(0xFFFFD6A5), // Warm Peach
    const Color(0xFFFDFFB6), // Sunshine Yellow
    const Color(0xFFA0C4FF), // Sky Blue
    const Color(0xFFBDB2FF), // Lavender Purple
    const Color(0xFFFFC6FF), // Rose Pink
  ];

  // Function to pick a random pastel color from those not already used.
  Color getRandomPastelColor() {
    // Filter out colors already in use.
    List availableColors = pastelColors.where((color) {
      return !cards.any((card) => card["color"] == color);
    }).toList();

    // If no colors are available, return the first color (or handle as needed).
    if (availableColors.isEmpty) {
      return pastelColors[0];
    }
    final random = Random();
    return availableColors[random.nextInt(availableColors.length)];
  }

  // Function to show an AlertDialog for new card creation.
  void _showAddCardDialog() {
    TextEditingController cardController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Create New Card"),
          content: TextField(
            controller: cardController,
            decoration: const InputDecoration(hintText: "Enter card title"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog.
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (cardController.text.isNotEmpty) {
                  // Prevent adding another card if all unique colors are used.
                  if (cards.length >= pastelColors.length) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Maximum number of cards reached."),
                      ),
                    );
                    return;
                  }
                  setState(() {
                    cards.add({
                      "text": cardController.text,
                      "color": getRandomPastelColor(), // Unique pastel color.
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 210, 255, 211), // Soft green background.
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 210, 255, 211), // Same soft green.
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Header row with title and create icon.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tasks',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Create your own board ( ^.^ )',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                IconButton(
                  onPressed:
                      _showAddCardDialog, // Opens dialog to add a new card.
                  icon: const Icon(
                    Icons.create_outlined,
                    size: 30,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // List of cards with a stacking (overlap) effect.
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Transform.translate(
                    offset:
                        Offset(0, -10.0 * index), // Creates overlapping effect.
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: MyCard(
                        text: cards[index]["text"],
                        customcolor: cards[index]["color"],
                        // Only the last card gets bottom roundness.
                        isLast: index == cards.length - 1,
                        // Give top shadow for every card except the first.
                        hasTopShadow: index != 0,
                        nextpage: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Listpage(
                                title: cards[index]["text"],
                                initialTasks: [],
                              ),
                            ),
                          );
                        },
                        // Delete callback for each card.
                        onDelete: () {
                          setState(() {
                            cards.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
