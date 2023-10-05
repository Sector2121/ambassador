class BackendAnswer {
  final bool statusOk;
  final String? message;

  BackendAnswer(
    this.message, {
    required this.statusOk,
  });
}
