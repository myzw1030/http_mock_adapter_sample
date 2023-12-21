import 'dart:io';

// テストデータをファイルから読み込み
String fixture(String name) {
  return File('test/stub/$name').readAsStringSync();
}
