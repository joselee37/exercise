import 'dart:io';

import '04_unit_convertor.dart';

String? name, age, color, animal;
List<Map<String, dynamic>> data = [];

Future<void> main(List<String> arguments) async {
  print('[✨ 간단한 데이터 관리 프로그램 ✨]');
  print('안녕하세요! 당신만의 데이터 관리 프로그램에 오신 것을 환영합니다. 📋');
  print('저는 데이터 요정 데이티(Daty)예요. 오늘 어떤 데이터를 관리해 드릴까요?');

  while (true) {
    menu();
    final command = getUserInput(['1', '2', '3', '4', '5']);
    switch (command) {
      case '1':
        dataAdd();
        break;
      case '2':
        dataSearch();
        break;
      case '3':
        datadelete();
        break;
      case '4':
        dataFullSearch();
        break;
      default:
    }
    if (command == '5') {
      print('[🚪 프로그램 종료 🚪]');
      print('프로그램을 종료합니다. 오늘도 데이터 요정 데이티와 함께해 주셔서 감사합니다! 🌟');
      print('다음에 또 뵈어요. 👋');

      break;
    }
  }
}

void menu() {
  print('1. 데이터 추가');
  print('2. 데이터 검색');
  print('3. 데이터 삭제');
  print('4. 전체 데이터 보기');
  print('5. 프로그램 종료');
}

void dataAdd() {
  print('[📌 데이터 추가 📌]');
  print('추가하고 싶은 데이터를 입력하세요');
  print('| 이름 |');
  String? name = stdin.readLineSync();
  print('| 나이|');
  String? age = stdin.readLineSync();
  print('| 좋아하는 색깔 |');
  String? color = stdin.readLineSync();
  print('| 좋아하는 동물 |');
  String? animal = stdin.readLineSync();

  Map<String, String> userInfo = {
    '이름': name!,
    '나이': age!,
    '좋아하는 색': color!,
    '좋아하는 동물': animal!,
  };
  data.add(userInfo);

  print('잠시만요... 데이터를 추가 중입니다...✨\n');
  print('[✅ 데이터 추가 완료 ✅]\n');
  print('현재 데이터 목록: ${data}');
  askRestart();
}

void dataSearch() {
  print('[🔍 데이터 검색 🔍]');
  print('찾고 싶은 데이터를 입력하세요 (예시: 이름): 김똑똑');
  String? search = stdin.readLineSync();

  for (var i = 0; i < data.length; i++) {
    if (data[i]['이름'] == search) {
      print('데이터를 검색 중입니다... 🧐\n');
      print('[🎯 검색 결과 🎯] :\n');
      print(data[i]);
      print('\n데이터가 맞나요? 🎉\n');
    } else if (data[i]['이름'] != search) {
      print('\n❌ 데이터가 없습니다 ❌\n');
    }
    ;
  }
}

void datadelete() {
  print('[🗑️ 데이터 삭제 🗑️]');
  print('삭제하고 싶은 데이터를 입력하세요 (예시: 이름): 이슬기');
  String? delete = stdin.readLineSync();

  for (var i = 0; i < data.length; i++) {
    if (data[i]['이름'] == delete) {
      print('데이터를 삭제 중입니다... 💥\n');
      print('현재 데이터 목록');
      data.removeWhere((i) => i['이름'] == delete);
      print(data);
    }
  }
  print('\n[✅ 데이터 삭제 완료 ✅]');
  print('삭제가 완료되었습니다! 👏');
}

void dataFullSearch() {
  print('[📂 전체 데이터 보기 📂]');
  print('현재 저장된 데이터 목록입니다:');
  print(data);
  print('데이터가 정리되어 있어요! ✨');
}

askRestart() {
  print('더 추가하시겠어요? (Y/N)');
  String? input = stdin.readLineSync();
  if (input == 'Y') {
    return dataAdd();
  } else if (input == 'N') {
    return;
  } else if (input != 'Y' || input != 'N') {
    print('다시 입력해주세요\n');
    return askRestart();
  }
}
