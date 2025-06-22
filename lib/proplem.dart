import 'dart:developer';

void main() {
  int k = 3;
  String s = "abcdefghij";
  String fill = "x";

  int numOfString = s.length;
  double moduluesResult = (numOfString % k).toDouble();
  double countFill = k - moduluesResult;
  double numOfGroup = numOfString / k;
  List<String> strings = [];
  // "abcdefghij",
  for (var i = 0; i < numOfString; i++) {
    for (var j = 0; j < numOfGroup; j++) {
      if (j < numOfGroup) {
        strings.add("${s[i]}");
      }
    }
  }
  print(strings.toString());
  // List<String> divideString(String s, int k, String fill) {

  // }
}
