import 'package:calculator/screens/calcBlack.dart';
import 'package:calculator/screens/calcWhite.dart';
import 'package:calculator/screens/color.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart'; // Make sure to include this package in your pubspec.yaml

class Calcblack extends StatefulWidget {
  const Calcblack({super.key});
  
  @override
  State<Calcblack> createState() => _CalcblackState();
}

class _CalcblackState extends State<Calcblack> {
  
  String _s="0";
  @override
  Widget build(BuildContext context) {
    
    
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
  Color Wsurface= Color.fromARGB(255, 22, 22, 22);
  Color Wcolor=Color.fromARGB(255, 22, 22, 22);
  List items=["AC","+/-","%","/","7","8","9","*","4","5","6","-","1","2","3","+","00","0",".","="];
  
    return Scaffold(
      body: Stack(
        children: [
          ClayContainer(
            color: Wsurface,
            height: deviceHeight,
            width: deviceWidth,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
              SizedBox(height: 70,),
            ClayContainer(
              emboss: true,
              height:150,
              width: deviceWidth,
              color: Wcolor,
              borderRadius: 15,
              depth: 20,
              spread: 5,
             
              
              surfaceColor: Wsurface,
              child: Padding(padding: EdgeInsets.all(20),
                child: Align(
                  
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(_s,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 196, 196, 196)),)),
              ),
            ),

            SizedBox(height: 0,width: deviceWidth,),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),itemCount: 20, itemBuilder: (context,index){

                bool isNumeric = double.tryParse(items[index]) != null;
      
    
      Color textColor = isNumeric ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 255, 119, 0);
      double textSize=isNumeric?25:31;
              return GestureDetector(
                onTap: (){
                  calculate(items[index]);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ClayContainer(
                    
                    height: 30,width: 30,color: Wcolor,surfaceColor: Wsurface,borderRadius: 15,
                    child: Center(child: Text("${items[index]}",style: TextStyle(color: textColor,
                    fontSize: textSize,fontWeight: FontWeight.bold),
                    )),
                    
                  ),
                ),
              );
            })),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Calcwhite()));
                },
                  child: Container(
                    
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: Icon(Icons.dark_mode,color: Color.fromARGB(255, 255, 119, 0),size: 40,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30,right: 30),
                  child: Icon(Icons.home_outlined,color: Color.fromARGB(255, 255, 119, 0),size: 45,),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if (_s.isEmpty) {
                        _s="";
                        }
                      _s= _s.substring(0, _s.length - 1);
                    });
                  },
                  child: Container(
                    
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: Icon(Icons.backspace,color: Color.fromARGB(255, 255, 119, 0),size: 35,),
                  ),
                )
              ],
            )
            

            
              
          
            
            
            
            
              ],
            ),
            
          ),

        ]
          
            
          
        
      )
    );
  }
  calculate(String t){
    if(t=="AC"){
      _s="";
    }
    else if(t=="="){
       _s= calculateExpression(_s);
    }
    else if(t=="+/-"){}
    else{
      _s+=t;
    }
    setState(() {
    });
    
  }
  String calculateExpression(String expression) {
  final exp = Expression.parse(expression);
  final evaluator =  ExpressionEvaluator();
  final result = evaluator.eval(exp, {});
  return result.toString();
}
}


