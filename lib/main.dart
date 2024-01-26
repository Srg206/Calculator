import 'package:flutter/material.dart';
import 'dart:ui';

double ButtonRadius=30;
String TopDisplay="";
String Display="";
double arg_1=0;
double arg_2=0;
double res=0;
bool Start=true;
enum Sign{
    None, Plus, Minus, Mul, Div,
}
Sign CurSign=Sign.None;

int TopMaxLen=11;
int BottomMaxLen=13;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: PreferredSize(

          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.05), // Задайте высоту AppBar по вашему усмотрению
          child: AppBar(
            title: Text('Calculator'),
          ),
        ),
        body: MainBody(),
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        // Одна большая строка
        Container(
          //padding: EdgeInsets.only(bottom: 30.0),
          //alignment: FractionalOffset.bottomRight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration( color: Color.fromRGBO(50, 48, 48, 1.0)),
          height: MediaQuery.of(context).size.height*0.22*0.95, // Высота вашей большой строки
          child: Column(
            children: [
              Align(
                alignment: FractionalOffset.topRight,
                child: Text(
                  softWrap: false,
                  TopDisplay,
                  style: TextStyle(
                    color: Colors.white, // Цвет текста
                    fontSize: 30,
                  ),
                ),
              ),

              SizedBox(height: 8.0), // Расстояние между текстовыми виджетами
              Align(
                alignment: FractionalOffset.bottomRight,
                child: Text(
                  softWrap: false,
                  Display,
                  style: TextStyle(
                    color: Colors.white, // Цвет текста
                    fontSize: 45,
                  ),
                ),),

            ],
          ),

        ),
        Expanded(
            child: ListView(
                children:[
                  Container(
                      height: MediaQuery.of(context).size.height*0.2*0.75*0.95,
                      child: Row( /////////////////////////////1ROW
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                                child: IconButton(
                                  color: Colors.black87,
                                  icon: Image.asset("assets/images/f(x).png"),
                                  onPressed: () {
                                    print('Кнопка F(X) была нажата');
                                  },
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Color.fromRGBO(255, 21, 21, 1.0)  ),
                                child: IconButton(
                                  color: Colors.black87,
                                  icon: Image.asset("assets/images/C.png"),
                                  onPressed: () {
                                    print('Кнопка C была нажата');
                                    setState(() {
                                      Display="";
                                      TopDisplay="";
                                      Start=true;
                                    });
                                    res=0;
                                  },
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Color.fromRGBO(255, 21, 21, 1.0)  ),
                                child: IconButton(
                                  color: Color.fromRGBO(255, 21, 21, 1.0),
                                  icon: Image.asset("assets/images/delete.png"),
                                  onPressed: () {
                                    print('Кнопка delete была нажата');
                                    print(Display);
                                    setState(() {
                                      Display=Display.substring(0,Display.length-1);
                                    });
                                    print(Display);

                                  },
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Color.fromRGBO(240, 116, 39, 1.0)  ),
                                child: IconButton(
                                  color: Color.fromRGBO(147, 21, 21, 1.0),
                                  icon: Image.asset("assets/images/division.png"),
                                  onPressed: () {
                                    print('Кнопка / была нажата');

                                    setState(() {
                                      arg_1 = double.parse(Display);
                                      TopDisplay = Display + "/";
                                      Display = "";
                                      CurSign=Sign.Div;

                                    });

                                  },
                                )
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.2*0.75*0.95,
                    child: Row( ///////////////////////////////2ROW
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/7.png"),
                                onPressed: () {
                                  print('Кнопка 7 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="7";
                                    }

                                  });
                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/8.png"),
                                onPressed: () {
                                  print('Кнопка 8 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="8";
                                    }

                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/9.png"),
                                onPressed: () {
                                  print('Кнопка 9 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="9";
                                    }

                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Color.fromRGBO(240, 116, 39, 1.0)  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/mul.png"),
                                onPressed: () {
                                  print('Кнопка * была нажата');

                                  setState(() {
                                    arg_1 = double.parse(Display);
                                    TopDisplay = Display + "*";
                                    Display = "";
                                    CurSign=Sign.Mul;

                                  });

                                },
                              )
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height*0.2*0.75*0.95,
                    child: Row(  ///////////////////////////3ROW
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/4.png"),
                                onPressed: () {
                                  print('Кнопка 4 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="4";
                                    }

                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/5.png"),
                                onPressed: () {
                                  print('Кнопка 5 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="5";
                                    }

                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/6.png"),
                                onPressed: () {
                                  print('Кнопка 6 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="6";
                                    }

                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Color.fromRGBO(240, 116, 39, 1.0)  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/minus.png"),
                                onPressed: () {
                                  print('Кнопка - была нажата');

                                  setState(() {
                                    arg_1 = double.parse(Display);
                                    TopDisplay = Display + "-";
                                    Display = "";
                                    CurSign=Sign.Minus;

                                  });

                                },
                              )
                          ),
                        ),
                      ],),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.2*0.75*0.95,
                    child: Row(  ///////////////////////////4ROW
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/1.png"),
                                onPressed: () {
                                  print('Кнопка 1 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="1";
                                    }

                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/2.png"),
                                onPressed: () {
                                  print('Кнопка 2 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="2";
                                    }

                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/3.png"),
                                onPressed: () {
                                  print('Кнопка 3 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="3";
                                    }

                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Color.fromRGBO(240, 116, 39, 1.0)  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/plus.png"),
                                onPressed: () {
                                  print('Кнопка + была нажата');

                                  setState(() {
                                    arg_1 = double.parse(Display);
                                    TopDisplay = Display + "+";
                                    Display = "";
                                    CurSign=Sign.Plus;

                                  });

                                },
                              )
                          ),
                        ),
                      ],),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height*0.2*0.75*0.95,
                    child: Row(  ////////////////////5ROW
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/plus_minus.png"),
                                onPressed: () {
                                  print('Кнопка +/- была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      if(double.parse(Display)>0){
                                        Display="-"+Display;
                                      }
                                      else{
                                        Display=Display.substring(1,Display.length);
                                      }
                                    }
                                  });

                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/0.png"),
                                onPressed: () {
                                  print('Кнопка 0 была нажата');
                                  setState(() {
                                    if(Display.length<=BottomMaxLen){
                                      Display+="0";
                                    }

                                  });
                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Colors.indigoAccent  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/dot.png"),
                                onPressed: () {
                                  print('Кнопка . была нажата');
                                  setState(() {
                                    Display+=".";
                                  });
                                },
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(ButtonRadius), color:Color.fromRGBO(240, 116, 39, 1.0)  ),
                              child: IconButton(
                                color: Colors.black87,
                                icon: Image.asset("assets/images/equal.png"),
                                onPressed: () {
                                  print('Кнопка = была нажата');
                                  setState(() {
                                    arg_2=double.parse(Display);
                                    TopDisplay+=arg_2.toString();
                                    switch (CurSign){
                                      case Sign.Plus:
                                        res=arg_1+arg_2;
                                        break;
                                      case Sign.Minus:
                                        res=arg_1-arg_2;
                                        break;
                                      case Sign.Mul:
                                        res=arg_1*arg_2;
                                        break;
                                      case Sign.Div:
                                        res=arg_1/arg_2;
                                        break;
                                      default:
                                        res=0;
                                    }
                                    Display=res.toString();
                                  });
                                },
                              )
                          ),
                        ),
                      ],),
                  ),

                ]
            )
        )

        // Строки сетки

      ],
    );
  }
}
