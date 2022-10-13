import 'package:flutter/material.dart';

InputDecoration inputDecoration1 (String hintText,Icon? icon) {
  return InputDecoration(
    filled: true,
    prefixIcon: icon,
                      hintText: hintText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(width: 1.5)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(width: 1.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(width: 1.5)));
}InputDecoration inputDecoration2 (String hintText,Icon? icon) {
  return InputDecoration(
    filled: true,
    prefixIcon: icon,
                      hintText: hintText,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none);
}