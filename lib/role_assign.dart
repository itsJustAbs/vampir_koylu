import 'dart:math';

import 'package:vampir_koylu_v2/user_model.dart';


// the roles for the basic setting of the game
enum basic_roles {
  vampir,
  koylu,
  doktor,
  gozcu,
}

// function to assign roles to players (still in makeing will get changed probly when adding online)
void AssignPlayer (){
  
  // empty map for the users that have roles (with a map we can see the user and their role better)
  Map<String, basic_roles> userRoles = {}; 

  // function to get a random person from the users list so they can get a role
  String getRandomName() {
  Random random = Random();
  return users[random.nextInt(users.length)];
  }

  // getting a random person and giving doctor to them
  String getRandomDoctor = getRandomName();
  userRoles[getRandomDoctor] = basic_roles.doktor;
  users.remove(getRandomDoctor);

  // getting a random person and giving spoter to them
  String getRandomSpoter = getRandomName();
  userRoles[getRandomSpoter] = basic_roles.gozcu;
  users.remove(getRandomSpoter);

  // calculateing how many vampires will be in the game ( 1 vampire per 4 users )
  int x = (users.length / 4).round();

  // running a for loop so we give the vampire role 
  for(int i = 0; i < x ; i++){

    // getting a random person and giving vampire to them
    String getRandomVampire = getRandomName();

    userRoles[getRandomVampire] = basic_roles.vampir;

    users.remove(getRandomVampire);
    
  }

  // giving villiger role to everybody else left on the users list 
  for (var user in users) {
    userRoles[user] = basic_roles.koylu;
  }

  // printing all of them so I can see it work 
  print(userRoles);
}






