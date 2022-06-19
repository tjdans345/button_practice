import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("버튼"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: () {}, child: Text(
              "ButtonStyle"
            ), style: ButtonStyle(
              // all : 모든 상태에서 똑같은 값을 적용하겠다.
              //
              backgroundColor: MaterialStateProperty.all(Colors.black12),
              foregroundColor: MaterialStateProperty.resolveWith( // resolveWith 는 all 과 반대로 상태별로 다른 값을 리턴 해줄 수 있다.
                // Material State 란 ? (버튼에만 해당하는 상태는 아니다)
                // hovered - 호버링 상태 (마우스 커서를 올려놓은 상태)
                // focused - 포커싱 되었을 때 (텡스트 필드가 대표적으로 해당함)
                // pressed - 눌렀을 때 (o)
                // dragged - 드래그 됐을 떄
                // selected - 선택 되었을 때 (체크박스, 라디오 버튼 등)
                // scrollUnder - 다른 컴포넌트 밑으로 스크롤링 되었을 때
                // disabled - 비활성화 되었을 때 (o)
                // error - 에러 상태
                  (Set<MaterialState> states) {
                    if(states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    }
                  return Colors.cyan;
              }),
              padding: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if(states.contains(MaterialState.pressed)) {
                      return EdgeInsets.all(100.0);
                    }
                    return EdgeInsets.all(20.0);
                  }
              )
            ),),

            ElevatedButton(onPressed: () {
            },
                style: ElevatedButton.styleFrom(
                  // primary 라는 뜻은 메인 컬러
                  primary: Colors.green,
                  // 글자 애니메이션 색깔
                  onPrimary: Colors.amber,
                  // 그림자 색깔
                  shadowColor: Colors.blueAccent,
                  // 입체감 (z 방향)
                  elevation: 10.0,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0
                  ),
                  padding: EdgeInsets.all(20.0),
                  side: BorderSide(
                    color: Colors.greenAccent,
                    width: 4.0
                  )
                ) ,
                child: Text("ElevatedButton")
            ),
            OutlinedButton(onPressed: () {},
                child: Text("OutlinedButton"),
              style: OutlinedButton.styleFrom( // 버튼종류와 같은 버튼.styleFrom 을 사용하는 것이 좋다.
                primary: Colors.amber,
                backgroundColor: Colors.purpleAccent
              ),
            ),
            TextButton(onPressed: () {}, child: Text("TextButton"),
              style: TextButton.styleFrom(
                primary: Colors.pinkAccent,
                backgroundColor: Colors.cyan,
                textStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
