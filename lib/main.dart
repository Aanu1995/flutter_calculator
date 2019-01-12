import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color color = Colors.grey.withOpacity(0.3);
  Color color2 = Colors.orange;

  String output = "0";
  String _output = "0";
  String cal ="";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  Widget buildButton(String text, Color fillColor){
    return Expanded(
      child: RawMaterialButton(
        fillColor: fillColor,
        constraints: BoxConstraints(
          minHeight: 70
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
          child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white
            ),
          ),
          onPressed: (){
            if(text == "+ / -"){
                if(_output.contains("-")){
                 _output =  _output.replaceFirst("-", "");
                }
                else{
                  _output = "-"+output;
                }
            }
            else if(text == "%"){
              cal = cal + _output + "%";
            }
            else if(text == "+" || text == "-" || text == "/" || text == "x"){
              cal="";
              num1 = double.parse(output);
              _output = "0";
              operand = text;
              cal = cal + num1.toString() + operand;
            }else if(text == "."){
              if(_output.contains(".")){

              }else{
                _output  = _output + text;
              }
            }
            else if(text == "="){
              num2 = double.parse(output);
              if(operand == "+"){
                _output = (num1 + num2).toString();
              }
              else if(operand == "-"){
                _output = (num1 - num2).toString();
              }
              else if(operand == "x"){
                _output = (num1 * num2).toString();
              }
              else if(operand == "/"){
                _output = (num1 / num2).toString();
              }
              cal = "";
              cal = num1.toString() + operand + num2.toString() + "=" + _output.toString();
              num1 = 0.0;
              num2 = 0.0;
              operand = "";
            }
            else{
              _output = _output + text;
            }
            setState(() {
              output = double.parse(_output).toStringAsFixed(2);
            });
          },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.20),
      body: MediaQuery.of(context).size.height>600? vertical():horizontal()
    );
  }

  Widget vertical(){
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child:Text(
                cal,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 30,left: 20,right: 20,top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          output,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildButton("(  )",color),
                                SizedBox(width: 20,),
                                buildButton("+ / -",color),
                                SizedBox(width: 20,),
                                buildButton("%",color),
                                SizedBox(width: 20,),
                                buildButton("/",color2),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildButton("7",color),
                                SizedBox(width: 20,),
                                buildButton("8",color),
                                SizedBox(width: 20,),
                                buildButton("9",color),
                                SizedBox(width: 20,),
                                buildButton("x",color2),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildButton("6",color),
                                SizedBox(width: 20,),
                                buildButton("5",color),
                                SizedBox(width: 20,),
                                buildButton("4",color),
                                SizedBox(width: 20,),
                                buildButton("-",color2),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildButton("3",color),
                                SizedBox(width: 20,),
                                buildButton("2",color),
                                SizedBox(width: 20,),
                                buildButton("1",color),
                                SizedBox(width: 20,),
                                buildButton("+",color2),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildButton("0",color),
                                SizedBox(width: 20,),
                                buildButton(".",color),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: GestureDetector(
                                    child: RawMaterialButton(
                                      fillColor: color,
                                      constraints: BoxConstraints(
                                          minHeight: 70
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Text("Del",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.white
                                        ),
                                      ),
                                      onPressed: (){
                                      },
                                    ),
                                    onLongPress: (){
                                      setState(() {
                                        _output = "0";
                                        output = "0";
                                        num1 = 0.0;
                                        num2 = 0.0;
                                        operand = "";
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 20,),
                                buildButton("=",color),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget horizontal(){
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                padding: EdgeInsets.only(bottom: 30,left: 20,right: 20,top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 120,
                      alignment: Alignment.centerRight,
                      child: Text(
                        output,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildButton("(  )",color),
                              SizedBox(width: 20,),
                              buildButton("+ / -",color),
                              SizedBox(width: 20,),
                              buildButton("%",color),
                              SizedBox(width: 20,),
                              buildButton("/",color2),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildButton("7",color),
                              SizedBox(width: 20,),
                              buildButton("8",color),
                              SizedBox(width: 20,),
                              buildButton("9",color),
                              SizedBox(width: 20,),
                              buildButton("x",color2),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildButton("6",color),
                              SizedBox(width: 20,),
                              buildButton("5",color),
                              SizedBox(width: 20,),
                              buildButton("4",color),
                              SizedBox(width: 20,),
                              buildButton("-",color2),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildButton("3",color),
                              SizedBox(width: 20,),
                              buildButton("2",color),
                              SizedBox(width: 20,),
                              buildButton("1",color),
                              SizedBox(width: 20,),
                              buildButton("+",color2),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildButton("0",color),
                              SizedBox(width: 20,),
                              buildButton(".",color),
                              SizedBox(width: 20,),
                              Expanded(
                                child: GestureDetector(
                                  child: RawMaterialButton(
                                    fillColor: color,
                                    constraints: BoxConstraints(
                                        minHeight: 70
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Text("Del",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.white
                                      ),
                                    ),
                                    onPressed: null,
                                  ),
                                  onLongPress: (){
                                    setState(() {
                                      _output = "0";
                                      output = "0";
                                      num1 = 0.0;
                                      num2 = 0.0;
                                      operand = "";
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 20,),
                              buildButton("=",color),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
