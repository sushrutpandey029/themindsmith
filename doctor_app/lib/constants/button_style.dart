import 'package:flutter/material.dart';

ButtonStyle fullButtonStyle = ElevatedButton.styleFrom(
  elevation: 10,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  primary: Colors.black,
  // fixedSize: Size(double.infinity,22)
);
ButtonStyle fullButtonStyleWhite = ElevatedButton.styleFrom(
  fixedSize: const Size.fromHeight(50),
  elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    onPrimary: Colors.black,
    primary: Colors.white
    // fixedSize: Size(double.infinity,22)
    );
ButtonStyle halfButtonStyle = ElevatedButton.styleFrom(
   shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 10,
    fixedSize: const Size.fromHeight(80),
    primary: Colors.white,
    onPrimary: Colors.black);

ButtonStyle halfButtonStyle1 = ElevatedButton.styleFrom(
   shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 10,
    primary: Colors.white,
    onPrimary: Colors.black,
    fixedSize: const Size(200,50));

ButtonStyle smallButtonStyle(bool isSelected) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 10,
      side: isSelected ? const BorderSide(width: 2) : null,
      primary: Colors.white,
      onPrimary: Colors.black,
      fixedSize: const Size.fromWidth(150));
}

ButtonStyle smallBlackButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  elevation: 10,
    primary: Colors.black,
    onPrimary: Colors.white,
    fixedSize: const Size.fromWidth(100));

ButtonStyle smallBlackButtonStyle1 = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  elevation: 10,
    primary: Colors.black,
    onPrimary: Colors.white,
    fixedSize: const Size.fromWidth(200));

ButtonStyle flatWhiteButton = ElevatedButton.styleFrom(
    fixedSize: const Size(double.infinity,50),
    elevation: 10,
    primary: Colors.white,
    onPrimary: Colors.black,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), side: const BorderSide(width: 2)));
