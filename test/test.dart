import 'dart:convert';
import 'dart:math';

Future<void> main() async {
  // 随机5
  for (int i = 1; i <= 10; i++) {
    // print(makeBigLetou1().join(",") + "  " + makeBigLetou2().join(","));
  }
  // 随机5
  for (int i = 1; i <= 10; i++) {
    print(towBall1().join(",") + "  " + towBall2().join(","));
  }
}

List<int> generate(int ballMax, int num) {
  List<int> resList = List.filled(num, -1);
  for(int i=0;i<num;i++) {
    resList[i] = Random().nextInt(ballMax)+1;
    for (int j = 0; j < i; j++) {
      while (resList[i] == resList[j]) {//如果重复，重新生成随机数
        resList[i] = Random().nextInt(ballMax)+1;
      }
    }
  }
  resList.sort();
  return resList;
}

List<int> makeBigLetou1() {
  return generate(35, 5);
}

List<int> makeBigLetou2() {
  return generate(12, 2);
}

List<int> towBall1() {
  return generate(33, 6);
}

List<int> towBall2() {
  return generate(16, 1);
}
