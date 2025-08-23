import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xo/boardBtn.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = "Board";

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
 List<String> boardState = [
  "","","",
  "","","",
  "","","",
  ] ;
int player1score = 0 ;
int player2score = 0 ;
String message = "Player 1's turn" ;
late String selectedPlayer ;
  @override
  Widget build(BuildContext context) {
    BoardScreenArgs args = ModalRoute.of
      (context)?.settings.arguments as BoardScreenArgs ;
    selectedPlayer = args.selectedPlayer ;
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 15,
          ),
       backgroundColor: Colors.transparent,
       body:Padding(
         padding: EdgeInsets.symmetric(horizontal: 16,),
         child: Column(
           children: [
             Container(
               decoration: BoxDecoration(
                 color: Colors.white ,
                 borderRadius: BorderRadius.circular(44)
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                 Column(
                     children: [
                       Text("${args.player1name} ${args.selectedPlayer}"
                         ,style: TextStyle(
                         fontSize: 25 ,
                         fontWeight: FontWeight.w600,
                       ),),
                       Text(player1score.toString(),style: TextStyle(
                         fontSize: 25 ,
                         fontWeight: FontWeight.w600,
                       ),),
                     ],
                   ),
                 Column(
                   children: [
                     Text("${args.player2name} (${args.selectedPlayer=="X"?"o":"x"})"
                       ,style: TextStyle(
                       fontSize: 25 ,
                       fontWeight: FontWeight.w600,
                     ),),
                     Text(player2score.toString(),style: TextStyle(
                     fontSize: 25 ,
                     fontWeight: FontWeight.w600,
                     ),),
                   ],
                 ),
                 ],
               ),
             ),
             SizedBox(height: 32,),
             Text(message ,style: TextStyle(
               fontSize: 36 ,
               fontWeight: FontWeight.w700,
               color: Colors.white
             ),),
             SizedBox(height: 32,),
             Expanded(
               child: Container(
                 padding: EdgeInsets.symmetric(
                   horizontal: 13,
                   vertical: 22,
                 ),
                 margin: EdgeInsets.only(bottom: 25),
                 decoration: BoxDecoration(
                   color: Colors.white ,
                   borderRadius: BorderRadius.circular(44),
                 ),
                 child:  Column(
                   children: [
                     Expanded(
                       child: Row(
                         children: [
                          BoardBtn(symbol: boardState[0],
                            onClick: onBoardBtnClick,index: 0,),
                          const VerticalDivider(
                            color: Colors.black,
                            width: 0,
                          ),
                          BoardBtn(symbol: boardState[1],
                            onClick: onBoardBtnClick,index: 1,),
                          const VerticalDivider(
                             color: Colors.black,
                             width: 0,
                           ),
                          BoardBtn(symbol: boardState[2],
                            onClick: onBoardBtnClick,index: 2,),
                         ],
                       ),
                     ),
                     const Divider(
                       height: 0,
                       color: Colors.black,

                     ),
                     Expanded(
                       child: Row(
                         children: [
                           BoardBtn(symbol: boardState[3],
                             onClick: onBoardBtnClick,index: 3,),
                           const VerticalDivider(
                             color: Colors.black,
                             width: 0,
                           ),
                           BoardBtn(symbol: boardState[4],
                             onClick: onBoardBtnClick,index: 4,),
                           const VerticalDivider(
                             color: Colors.black,
                             width: 0,
                           ),
                           BoardBtn(symbol: boardState[5],
                             onClick: onBoardBtnClick,index: 5,),
                         ],
                       ),
                     ),
                    const Divider(
                       height: 0,
                       color: Colors.black,

                     ),
                     Expanded(
                       child: Row(
                         children: [
                           BoardBtn(symbol: boardState[6],
                             onClick: onBoardBtnClick,index: 6,),
                           const VerticalDivider(
                             color: Colors.black,
                             width: 0,
                           ),
                           BoardBtn(symbol: boardState[7],
                             onClick: onBoardBtnClick,index: 7,),
                           const VerticalDivider(
                             color: Colors.black,
                             width: 0,
                           ),
                           BoardBtn(symbol: boardState[8],
                             onClick: onBoardBtnClick,index: 8,),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             )
           ],
         ),
       ),
        )
    );
  }

 bool checkWinner(String symbol){
    for(int i =0; i<=6; i+=3) {
      if (boardState[i] == symbol && boardState[i+1] == symbol
          && boardState[i+2] == symbol) {
        return true;
      }
    }
    for (int i =0 ; i<=2;i++) {
      if(boardState[i]==symbol && boardState[i+3]==symbol&&
          boardState[i+6]==symbol){
        return true ;
      }
    }
    if(boardState[0]==symbol && boardState[4]==symbol
        && boardState[8]==symbol){
      return true ;
    }

    if(boardState[2]==symbol && boardState[4]==symbol
        && boardState[6]==symbol){
      return true ;
    }
return false ;
 }

 resetGame(){
Timer(Duration(seconds: 2),(){
   boardState = [
    "","","",
    "","","",
    "","","",
  ] ;
  count =1 ;
  message = "Player 1's turn" ;
  setState(() {

  });
});
 }

  int count =1 ;
  onBoardBtnClick(int index,){
 if(boardState[index].isEmpty){
   setState(() {
     if (count.isOdd){
       boardState[index] = selectedPlayer =="X"?"x":"o";
       if(checkWinner(selectedPlayer =="X"?"x":"o")){
         player1score+=10 ;
         message = "player 1 win" ;
        resetGame() ;
         return;
       }
       message ="Player 1's turn" ;
     }else{
       boardState[index] = selectedPlayer =="X"?"o":"x";
       if(checkWinner(selectedPlayer =="X"?"o":"x")){
         player2score+=10 ;
         message = "player 2 win" ;
         resetGame() ;
         return;
       }
       message ="Player 2's turn" ;
     }
     if(count==9){
       message = "Draw" ;
       resetGame() ;
     }
     count++ ;
   });
 }

  }
}

class BoardScreenArgs {
  String player1name ;
  String player2name ;
  String selectedPlayer ;

  BoardScreenArgs({required this.player1name , required this.player2name ,
  required this.selectedPlayer});
}
