import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class CustomCard extends StatefulWidget {
  final String lottie;
  final String title;
  final VoidCallback onpress;

  const CustomCard({
    super.key,
    required this.lottie,
    required this.title,
    required this.onpress,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpress, // Use the onpress callback here
      child: Card(
        color: Colors.blue.withOpacity(0.7),
        elevation: 8, // Adds shadow for a nicer look
        margin: EdgeInsets.all(10), // Adds spacing around the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Lottie.asset(
              'assets/animations/${widget.lottie}.json',
              width: 150,
            ),
            const SizedBox(width: 10), // Adds spacing between the Lottie and Text
            Expanded(
              child: Text(
                widget.title, // Use the title provided by the user
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis, // Prevents overflow if the text is too long
              ),
            ),
          ],
        ),
      ).animate().scale(duration: Duration(milliseconds: 1000)),
    );
  }
}
