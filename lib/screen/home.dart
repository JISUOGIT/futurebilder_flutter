import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textStyle = TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // FutureBuilder : 값을 불러오면 캐싱이 되어 있어 setState를 해도 값은 그대로 남아있다
        child: FutureBuilder(
          future: getNumber(),
          builder: (context, snapshot) {
            // 1 waiting인경우
            // if(snapshot.connectionState == ConnectionState.waiting) {
            //   return Center(child: CircularProgressIndicator(),);
            // }

            // 2 hasData가 null인 경우
            // if(!snapshot.hasData) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }

            if (snapshot.hasData) {
              // 데이터가 있을때 위젯 렌더링
            }

            if (snapshot.hasError) {
              // 에러가 났을 때 위젯 렌더링
            }

            // 로딩중일 때 위젯 렌더링

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'ConState : ${snapshot.connectionState}',
                  style: textStyle,
                ),
                // Row(
                //   children: [
                //     Text(
                //       'Data : ${snapshot.data}',
                //       style: textStyle,
                //     ),
                //     // connectionState == waiting인 경우에만 circularProgressIndicator 사용
                //     if(snapshot.connectionState == ConnectionState.waiting)
                //       CircularProgressIndicator(),
                //   ],
                // ),
                Text(
                  'Data : ${snapshot.data}',
                  style: textStyle,
                ),
                Text(
                  'Error : ${snapshot.error}',
                  style: textStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('setState'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    //에러 발생 : 에러발생도 cashing
    //throw Exception('에러가 발생했습니다.');

    return random.nextInt(100);
  }
}
