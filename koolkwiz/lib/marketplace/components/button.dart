import 'package:flutter/material.dart';
import 'package:koolkwiz/marketplace/marketplace.dart';

class MarketButton extends StatefulWidget {
  const MarketButton({required this.onPressed, super.key, required this.text});

  final Function onPressed;
  final String text;

  @override
  State<MarketButton> createState() => _MarketButtonState();
}

class _MarketButtonState extends State<MarketButton> {
  bool pressed = false;
  final Color pressedColor = Marketplace.theme.colorScheme.primary;

  tapDown(TapDownDetails e) {
    setState(() {
      pressed = true;
    });
  }

  tapUp(TapUpDetails e) {
    setState(() {
      pressed = false;
      widget.onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: tapDown,
      onTapUp: tapUp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: pressed
                  ? pressedColor
                  : Marketplace.theme.colorScheme.onPrimary,
              border: Border.all(
                color: Marketplace.theme.colorScheme.onSecondary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 72),
              child: Text(
                textAlign: TextAlign.center,
                style: Marketplace.label,
                widget.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
