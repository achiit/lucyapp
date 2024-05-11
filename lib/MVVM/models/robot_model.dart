// models/robot.dart
class Robot {
  final String name;
  final String mode;

  Robot({required this.name, required this.mode});

  Robot copyWith({String? name, String? mode}) {
    return Robot(
      name: name ?? this.name,
      mode: mode ?? this.mode,
    );
  }
}
