name: BMI Calculator App
description: >
  A simple and elegant Body Mass Index (BMI) calculator built using Flutter.
  This app helps users calculate their BMI based on their height, weight, age, and gender,
  and displays results with a beautiful blurred dialog interface.

features:
  - Interactive Ruler Picker for selecting height
  - Smooth and responsive UI built with Flutter & Dart
  - Custom Blur Dialog for displaying BMI results
  - Displays BMI status (Normal, Overweight, Underweight, etc.) with styled labels
  - Clean architecture and reusable widgets (AppBar, Button, Cards)
  - Navigation argument passing between screens

tech_stack:
  framework: Flutter
  language: Dart
  ui_components: Material Design, Custom Widgets
  packages:
    - flutter_ruler_picker
    - fluttertoast

preview:
  - assets/preview/bmi_screen1.png
  - assets/preview/bmi_screen2.png
  - assets/preview/bmi_screen3.png
usage:
  steps:
    - Select gender, height, weight, and age
    - Press the Calculate button
    - View results in the blurred popup dialog

example_output: |
  Your BMI: 22.4
  Status: Normal
  Height: 170 cm
  Weight: 65 kg
  Age: 20
  Gender: Male

inspiration: >
  This project was built to explore Flutter UI design, state management, and
  user-friendly visual feedback while maintaining a clean and modular architecture.
