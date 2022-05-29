import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  const Result({Key? key, required this.result, required this.isMale, required this.age}) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase{
    String resultText='';
    if(result >= 30) {
      resultText='obes';
    } else if(result >= 25) {
     resultText='overweight';
   } else if(result > 18) {
      resultText='Normal';
    } else if(result <= 18) {
      resultText='UnderWeight';
    }

    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Result"),centerTitle: true,),
      body: SafeArea(
        child: Container(
          height:double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blueGrey,
          ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
          Text('Gender : ${isMale? 'male' : 'Female'}',
            style:Theme.of(context).textTheme.headline2,),
          Text('result : ${result.toStringAsFixed(1)}',
            style:Theme.of(context).textTheme.headline2,),
          Text('Healthiness :$resultPhrase',
            style:Theme.of(context).textTheme.headline2,),
          Text('age : $age',
            style:Theme.of(context).textTheme.headline2,),
        ],
      ),),),
    );
  }

}
