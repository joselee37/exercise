import 'dart:io';

//TODO: 단위 환산기 만들기
//섭씨 <-> 화씨 변환기
//킬로그램 <-> 파운드 <-> 온스 변환기
//미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일 변환기

Future<void> main(List<String> arguments) async {



  /**
   * 
   * 공식 = 화 > 섭 (?F - 32) x5/9 = 섭
   * 공식 = 섭 > 화 (?C x 9/5) + 32 = 화 
   * 
   * // 킬로그램-> 파운드
  // 파운드(Ib) = 킬로그램(kg) * 2.20462 
  // 파운드-> 킬로그램
  // 킬로그램(kg) = 파운드(Ib)  / 2.20462 

  // 파운드 -> 온스 
  // 온스(oz) = 파운드(Ib) * 16
  // 온스 -> 파운드
  //파운드(Ib) = 온스(oz) / 16

  // 킬로그램 -> 온스 
  // 온스(oz) = 킬로그램(kg) * 35.274
  // 온스 -> 킬로그램 
  // 킬로그램(kg) = 온스(oz) / 35.274 
   * 
   * [단위 변환기]
   * 1. 섭씨 <-> 화씨
   * 2. 킬로그램 <-> 파운드 <-> 온스
   * 3. 미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일
   * 변환하려는 항목을 선택하세요: 1
   * 
   * 섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F): C
   * 변환하려는 값을 입력하세요: 25
   * 결과: 25°C -> 77°F
   * 
   * [단위 변환기]
   * 변환하려는 항목을 선택하세요: 1
   * 
   * 섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F): F
   * 변환하려는 값을 입력하세요: 100
   * 결과: 100°F -> 37.78°C
   * 
   */

    print('[단위 변환기]');
    print('1.섭씨 <-> 화씨');
    print('2.킬로그램 <-> 파운드 <-> 온스');
    print('3.미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일');
    print('변환하려는 항목을 선택하세요: ');
  final command = stdin.readLineSync();
  
    

  if (command =='1'){
    print('섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F): C');
    final a = stdin.readLineSync();
    if(a == 'C'){
      print('변환하려는 값을 입력하세요:');
    }


  }else if(command =='2'){

  }else if(command =='3'){
    
  
    


}
}