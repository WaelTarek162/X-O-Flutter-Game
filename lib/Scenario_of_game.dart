import 'dart:math';

class player{

  static const x='X';
  static const o='O';
  static const empty='';
  static List<int> playerX=[];
  static List<int> playerO=[];


}
class Game{

  void play_game(int index, String active_player) {
    active_player=='X'?player.playerX.add(index):player.playerO.add(index);
  }


  String check_winner(){
    String winner='';
    bool game_over=false;

    //xxxxx
    if(player.playerX.contains(0)&&player.playerX.contains(1)&&player.playerX.contains(2)){winner='X';}
    else if(player.playerX.contains(3)&&player.playerX.contains(4)&&player.playerX.contains(5)){winner='X';}
    else if(player.playerX.contains(6)&&player.playerX.contains(7)&&player.playerX.contains(8)){winner='X';}

    else if(player.playerX.contains(0)&&player.playerX.contains(3)&&player.playerX.contains(6)){winner='X';}
    else if(player.playerX.contains(1)&&player.playerX.contains(4)&&player.playerX.contains(7)){winner='X';}
    else if(player.playerX.contains(2)&&player.playerX.contains(5)&&player.playerX.contains(8)){winner='X';}

    else if(player.playerX.contains(0)&&player.playerX.contains(4)&&player.playerX.contains(8)){winner='X';}
    else if(player.playerX.contains(2)&&player.playerX.contains(4)&&player.playerX.contains(6)){winner='X';}

    //ooooo

    else if(player.playerO.contains(0)&&player.playerO.contains(1)&&player.playerO.contains(2)){winner='O';}
    else if(player.playerO.contains(3)&&player.playerO.contains(4)&&player.playerO.contains(5)){winner='O';}
    else if(player.playerO.contains(6)&&player.playerO.contains(7)&&player.playerO.contains(8)){winner='O';}

    else if(player.playerO.contains(0)&&player.playerO.contains(3)&&player.playerO.contains(6)){winner='O';}
    else if(player.playerO.contains(1)&&player.playerO.contains(4)&&player.playerO.contains(7)){winner='O';}
    else if(player.playerO.contains(2)&&player.playerO.contains(5)&&player.playerO.contains(8)){winner='O';}

    else if(player.playerO.contains(0)&&player.playerO.contains(4)&&player.playerO.contains(8)){winner='O';}
    else if(player.playerO.contains(2)&&player.playerO.contains(4)&&player.playerO.contains(6)){winner='O';}



    return winner;
  }

 Future<void> auto_play( active_player)async{

    int index;

    List <int>empty_places=[];
    for(int i=0;i<9;i++){
      if(!(player.playerX.contains(i)||player.playerO.contains(i))){
        empty_places.add(i);
      }
    }

    ///attack cases
    if((player.playerO.contains(0)&&player.playerO.contains(1)) && empty_places.contains(2)){index =2;}
    else if((player.playerO.contains(3)&&player.playerO.contains(4) )&& empty_places.contains(5)){index =5;}
    else if((player.playerO.contains(6)&&player.playerO.contains(7)) && empty_places.contains(8)){index =8;}
    else if((player.playerO.contains(0)&&player.playerO.contains(3)) && empty_places.contains(6)){index =6;}
    else if((player.playerO.contains(1)&&player.playerO.contains(4) )&& empty_places.contains(7)){index =7;}
    else if((player.playerO.contains(2)&&player.playerO.contains(5)) && empty_places.contains(8)){index =8;}
    else if((player.playerO.contains(0)&&player.playerO.contains(4) )&& empty_places.contains(8)){index =8;}
    else if((player.playerO.contains(2)&&player.playerO.contains(4) )&& empty_places.contains(6)){index =6;}

    // Center is empty
    else if((player.playerO.contains(0)&&player.playerO.contains(2) )&& empty_places.contains(1)){index =1;}
    else if((player.playerO.contains(3)&&player.playerO.contains(5) )&& empty_places.contains(4)){index =4;}
    else if((player.playerO.contains(6)&&player.playerO.contains(8)) && empty_places.contains(7)){index =7;}
    else if((player.playerO.contains(0)&&player.playerO.contains(6)) && empty_places.contains(3)){index =3;}
    else if((player.playerO.contains(1)&&player.playerO.contains(7) )&& empty_places.contains(4)){index =4;}
    else if((player.playerO.contains(2)&&player.playerO.contains(8)) && empty_places.contains(5)){index =5;}
    else if((player.playerO.contains(0)&&player.playerO.contains(8) )&& empty_places.contains(4)){index =4;}
    else if((player.playerO.contains(2)&&player.playerO.contains(6) )&& empty_places.contains(4)){index =4;}
    //start is empty

    else if((player.playerO.contains(2)&&player.playerO.contains(1) )&& empty_places.contains(0)){index =0;}
    else if((player.playerO.contains(5)&&player.playerO.contains(4) )&& empty_places.contains(3)){index =3;}
    else if((player.playerO.contains(8)&&player.playerO.contains(7)) && empty_places.contains(6)){index =6;}
    else if((player.playerO.contains(6)&&player.playerO.contains(3)) && empty_places.contains(0)){index =0;}
    else if((player.playerO.contains(7)&&player.playerO.contains(4) )&& empty_places.contains(1)){index =1;}
    else if((player.playerO.contains(8)&&player.playerO.contains(5)) && empty_places.contains(2)){index =2;}
    else if((player.playerO.contains(8)&&player.playerO.contains(4) )&& empty_places.contains(0)){index =0;}
    else if((player.playerO.contains(6)&&player.playerO.contains(4) )&& empty_places.contains(2)){index =2;}


    
    ////// defence cases
    // end is empty
    else if((player.playerX.contains(0)&&player.playerX.contains(1)) && empty_places.contains(2)){index =2;}
    else if((player.playerX.contains(3)&&player.playerX.contains(4) )&& empty_places.contains(5)){index =5;}
    else if((player.playerX.contains(6)&&player.playerX.contains(7)) && empty_places.contains(8)){index =8;}
    else if((player.playerX.contains(0)&&player.playerX.contains(3)) && empty_places.contains(6)){index =6;}
    else if((player.playerX.contains(1)&&player.playerX.contains(4) )&& empty_places.contains(7)){index =7;}
    else if((player.playerX.contains(2)&&player.playerX.contains(5)) && empty_places.contains(8)){index =8;}
    else if((player.playerX.contains(0)&&player.playerX.contains(4) )&& empty_places.contains(8)){index =8;}
    else if((player.playerX.contains(2)&&player.playerX.contains(4) )&& empty_places.contains(6)){index =6;}

    // Center is empty
    else if((player.playerX.contains(0)&&player.playerX.contains(2) )&& empty_places.contains(1)){index =1;}
    else if((player.playerX.contains(3)&&player.playerX.contains(5) )&& empty_places.contains(4)){index =4;}
    else if((player.playerX.contains(6)&&player.playerX.contains(8)) && empty_places.contains(7)){index =7;}
    else if((player.playerX.contains(0)&&player.playerX.contains(6)) && empty_places.contains(3)){index =3;}
    else if((player.playerX.contains(1)&&player.playerX.contains(7) )&& empty_places.contains(4)){index =4;}
    else if((player.playerX.contains(2)&&player.playerX.contains(8)) && empty_places.contains(5)){index =5;}
    else if((player.playerX.contains(0)&&player.playerX.contains(8) )&& empty_places.contains(4)){index =4;}
    else if((player.playerX.contains(2)&&player.playerX.contains(6) )&& empty_places.contains(4)){index =4;}
    //start is empty

    else if((player.playerX.contains(2)&&player.playerX.contains(1) )&& empty_places.contains(0)){index =0;}
    else if((player.playerX.contains(5)&&player.playerX.contains(4) )&& empty_places.contains(3)){index =3;}
    else if((player.playerX.contains(8)&&player.playerX.contains(7)) && empty_places.contains(6)){index =6;}
    else if((player.playerX.contains(6)&&player.playerX.contains(3)) && empty_places.contains(0)){index =0;}
    else if((player.playerX.contains(7)&&player.playerX.contains(4) )&& empty_places.contains(1)){index =1;}
    else if((player.playerX.contains(8)&&player.playerX.contains(5)) && empty_places.contains(2)){index =2;}
    else if((player.playerX.contains(8)&&player.playerX.contains(4) )&& empty_places.contains(0)){index =0;}
    else if((player.playerX.contains(6)&&player.playerX.contains(4) )&& empty_places.contains(2)){index =2;}

    else{

      Random random=Random();
      int random_index=random.nextInt(empty_places.length);
      index=empty_places[random_index];
    }



    play_game(index, active_player);


  }


}