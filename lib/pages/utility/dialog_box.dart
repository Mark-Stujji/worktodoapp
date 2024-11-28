import 'package:flutter/material.dart';
import 'package:todoapplication/pages/utility/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller; // Proper type annotation
  final VoidCallback onSaved;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orangeAccent,
      content: SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // User input field
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            // Save and Cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: onSaved, // Removed extra parentheses
                ),
                const SizedBox(width: 10), // Adjust width if needed
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel, // Removed extra parentheses
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
