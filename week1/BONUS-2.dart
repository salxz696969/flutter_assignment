void main() {
  final String sentence="[text}";
  print(isBalance(sentence));
}

bool isBalance(String sentence) {
  final arrayOfChar = sentence.split('');
  final List<String> signStack = <String>[];
  for (var char in arrayOfChar) {
    switch (char) {
      case "{" || "[" || "(":
        signStack.add(char);
        break;
      case "}":
        if (signStack.last == "{") {
          signStack.removeLast();
        }
        break;
      case "]":
        if (signStack.last == "[") {
          signStack.removeLast();
        }
        break;
      case ")":
        if (signStack.last == "(") {
          signStack.removeLast();
        }
        break;
      default:
        break;
    }
  }
  if (signStack.length == 0) {
    return true;
  }
  return false;
}
