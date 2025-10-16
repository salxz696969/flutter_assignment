enum Direction { north, east, south, west }

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;
  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  // Print the final position and direction
  final Map<String, Object> finalMove = move(direction, instructions, x, y);
  print('Final position:  ${finalMove["x"]} ${finalMove["y"]}');
  print('Facing:  ${finalMove["direction"]}');
}

Map<String, Object> move(
  Direction direction,
  String instructions,
  int x,
  int y,
) {
  const Map<Direction, Map<String, Map<String, Object>>> instructionList = {
    Direction.north: {
      "L": {"x": -1, "y": 0, "direction": "west"},
      "A": {"x": 0, "y": 1, "direction": "north"},
      "R": {"x": 1, "y": 0, "direction": "east"},
    },
    Direction.east: {
      "L": {"x": 0, "y": 1, "direction": "north"},
      "A": {"x": 1, "y": 0, "direction": "east"},
      "R": {"x": 0, "y": -1, "direction": "south"},
    },
    Direction.west: {
      "L": {"x": 0, "y": -1, "direction": "south"},
      "A": {"x": -1, "y": 0, "direction": "west"},
      "R": {"x": 0, "y": 1, "direction": "north"},
    },
    Direction.south: {
      "L": {"x": 1, "y": 0, "direction": "east"},
      "A": {"x": 0, "y": -1, "direction": "south"},
      "R": {"x": -1, "y": 0, "direction": "west"},
    },
  };
  List<String> arrayOfInstruction = instructions.split('');
  int dx = x;
  int dy = y;
  Direction dir = direction;
  for (var instruction in arrayOfInstruction) {
    final Map<String, Object> step = instructionList[dir]![instruction]!;
    dx += step["x"] as int;
    dy += step["y"] as int;
    dir = Direction.values.byName(step["direction"] as String);
  }
  return {"x": dx, "y": dy, "direction": dir};
}
