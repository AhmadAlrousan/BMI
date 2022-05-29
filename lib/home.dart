import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = true;
  double height = 172;
  int weight = 65;
  int age = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    expanded1(context, 'Male'),
                    const SizedBox(
                      width: 10,
                    ),
                    expanded1(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("Height",style: Theme.of(context).textTheme.headline1),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                        Text(height.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.headline2,),
                        Text("cm",style: Theme.of(context).textTheme.bodyText1),

                      ],),
                      Slider(min:50 , max: 300 ,value:height ,onChanged: (newVal){
                        setState(() {
                          height=newVal;
                        });
                      },),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    expanded2(context, 'Weight'),
                    const SizedBox(
                      width: 10,
                    ),
                    expanded2(context, 'Age'),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              child: TextButton(
                onPressed: () {
                 double result = weight / pow(height/100,2) ;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Result(result: result, isMale: isMale, age: age);
                    }),
                  );
                },
                child: Text("Calculate",
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded expanded1(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'Male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                type == 'Male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded expanded2(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'Age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              type == 'Age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'Age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age-- : weight--;
                    });
                  },
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                const SizedBox(
                  width: 40,
                ),
                FloatingActionButton(
                  heroTag: type == 'Age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age++ : weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
