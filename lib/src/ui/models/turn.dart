
enum Turn {
  turn90,
}

extension TurnValue on Turn {
  double getValue() {
    switch (this) {
      case Turn.turn90:
        return 0.25;
    }
  }
}
