import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xo/CustomTextField.dart';
import 'package:xo/board_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home" ;


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
TextEditingController player1controller = TextEditingController();
TextEditingController player2controller = TextEditingController();
String selectedPlayer = "x" ;

@override
  void initState() {

    super.initState();
    player1controller.addListener((){
      setState(() {

      });
    });
    player2controller.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff00D2FF),
              Color(0xff3A7BD5)
            ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding:EdgeInsets.only(top: 20),
         child:  Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/xo pic.png",
                      fit: BoxFit.cover,

                      width: double.infinity,
                    ),
                    Text("Tic-Tac-Toe",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 40 ,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextField(hint: "player 1 name",
                    controller: player1controller,
                    ),
                    SizedBox(height: 15,),

                    CustomTextField(hint: "player 2 name",
                    controller:player2controller ,
                    ),
                   SizedBox(height: 17,),
                    Text("Pick who goes first",style:
                    TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.white
                    ),),
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                              onTap: (){
                              setState(() {
                                selectedPlayer = "X" ;
                              });
                              },
                              child: Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32) ,
                                  color: selectedPlayer == "X"?
                                      Colors.white :
                                      Colors.transparent
                                ),
                                child: SvgPicture.asset("assets/images/x .svg",
                                  height: 130,width: 130,),
                              ),
                            )),
                        SizedBox(width: 15,),
                        Expanded(
                            child: InkWell(
                              onTap: (){
                              setState(() {
                                selectedPlayer = "O" ;
                              });
                              },
                              child: Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32) ,
                                    color: selectedPlayer == "O"?
                                    Colors.white :
                                    Colors.transparent
                                ),
                                child: SvgPicture.asset("assets/images/o .svg",
                                  height: 130,width: 130,),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 17,),
                    Visibility(
                      visible: player1controller.text.isNotEmpty && player2controller.text.isNotEmpty,
                      child: ElevatedButton(
                          onPressed: (){
                        Navigator.of(context).pushReplacementNamed(BoardScreen.routeName,
                         arguments: BoardScreenArgs(
                             player1name:player1controller.text,
                             player2name: player2controller.text,
                             selectedPlayer: selectedPlayer)
                        );
                          },
                          child: Text(
                          "Start game"
                          )
                      ),
                    )

                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
