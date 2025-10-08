
Map<String, dynamic> calculateBMI({
  required String genderName,
  required double heightValue,
  required double weightValue,
  required double ageValue,
}) {
  // تحويل الطول من سم إلى متر
  double heightInMeters = heightValue / 100;

  // معادلة حساب الـ BMI
  double bmi = weightValue / (heightInMeters * heightInMeters);

  // تحديد النتيجة (تصنيف)
  String resultText;
  if (bmi < 18.5) {
    resultText = "Underweight";
  } else if (bmi < 24.9) {
    resultText = "Normal";
  } else if (bmi < 29.9) {
    resultText = "Overweight";
  } else {
    resultText = "Obese";
  }

  return {"result": bmi, "status": resultText};
}