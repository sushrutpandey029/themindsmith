import 'package:flutter/material.dart';

ButtonStyle fullButtonStyle = ElevatedButton.styleFrom(
  elevation: 8,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  primary: Colors.black,
  // fixedSize: Size(double.infinity,22)
);
ButtonStyle fullButtonStyleWhite = ElevatedButton.styleFrom(
  elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    onPrimary: Colors.black,
    primary: Colors.white
    // fixedSize: Size(double.infinity,22)
    );
ButtonStyle halfButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 10,
    fixedSize: const Size.fromHeight(80),
    primary: Colors.white,
    onPrimary: Colors.black);

ButtonStyle halfButtonStyle1 = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 8,
    primary: Colors.white,
    onPrimary: Colors.black,
    fixedSize: const Size.fromWidth(200));

ButtonStyle smallButtonStyle(bool isSelected) {
  return ElevatedButton.styleFrom(
    elevation: 8,
      side: isSelected ? const BorderSide(width: 2) : null,
      primary: Colors.white,
      onPrimary: Colors.black,
      fixedSize: const Size.fromWidth(150));
}

ButtonStyle smallBlackButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 8,
    primary: Colors.black,
    onPrimary: Colors.white,
    fixedSize: const Size.fromWidth(100));

ButtonStyle smallBlackButtonStyle1 = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 8,
    primary: Colors.black,
    onPrimary: Colors.white,
    fixedSize: const Size(250,46));
