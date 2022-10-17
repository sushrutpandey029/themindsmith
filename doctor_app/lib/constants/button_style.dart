import 'package:flutter/material.dart';

ButtonStyle fullButtonStyle = ElevatedButton.styleFrom(
  elevation: 10, backgroundColor: Colors.black,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  // fixedSize: Size(double.infinity,22)
);
ButtonStyle fullButtonStyleWhite = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    fixedSize: const Size.fromHeight(50),
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    // fixedSize: Size(double.infinity,22)
    );
ButtonStyle halfButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 10,
    fixedSize: const Size.fromHeight(80));

ButtonStyle halfButtonStyle1 = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 10,
    fixedSize: const Size(200, 50));

ButtonStyle smallButtonStyle(bool isSelected) {
  return ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      side: isSelected ? const BorderSide(width: 2) : null,
      fixedSize: const Size.fromWidth(150));
}

ButtonStyle smallBlackButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 10,
    fixedSize: const Size.fromWidth(100));

ButtonStyle smallBlackButtonStyle1 = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 10,
    fixedSize: const Size.fromWidth(200));

ButtonStyle flatWhiteButton = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    fixedSize: const Size(double.infinity, 50),
    elevation: 10,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(width: 2)));
