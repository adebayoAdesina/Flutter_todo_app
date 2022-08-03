class Task {
  String? text;
  bool isChecked;

  Task({
    this.text,
    this.isChecked = false
  });

  void toggle() {
    isChecked = !isChecked;
  }
}