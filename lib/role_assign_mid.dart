import 'dart:math';

import 'package:vampir_koylu_v2/user_model.dart';

// the roles for the mid setting of the game
enum mid_roles {
  vampir,
  koylu,
  doktor,
  soytari,
  ciftci,
  gozcu,
}

// function to assign roles to players (still in makeing will get changed probly when adding online)
void AssignRolesMid() {
  // empty map for the users that have roles (with a map we can see the user and their role better)
  Map<String, mid_roles> userRoles = {};

  // function to get a random person from the users list so they can get a role
  String getRandomName() {
    Random random = Random();
    return users[random.nextInt(users.length)];
  }

  // getting a random person and giving jester to them
  String getRandomJester = getRandomName();
  userRoles[getRandomJester] = mid_roles.soytari;
  users.remove(getRandomJester);

  // getting a random person and giving spoter to them
  String getRandomSpoter = getRandomName();
  userRoles[getRandomSpoter] = mid_roles.gozcu;
  users.remove(getRandomSpoter);

  // calculateing how many doctors will be in the game ( 1 doctor per 5 users )
  // it rounds so not exactly 5 to 1 sometimes but its better like this cuz its more fair
  int doctor = (users.length / 5).round();

  // running a for loop so we give the doctor role
  for (int i = 0; i < doctor; i++) {
    // getting a random person and giving doctor to them
    String getRandomDoctor = getRandomName();

    userRoles[getRandomDoctor] = mid_roles.doktor;

    users.remove(getRandomDoctor);
  }

  // calculateing how many vampires will be in the game ( 1 vampire per 3 users )
  // it rounds so not exactly 3 to 1 sometimes but its better like this cuz its more fair
  int x = (users.length / 3).round();

  // running a for loop so we give the vampire role
  for (int i = 0; i < x; i++) {
    // getting a random person and giving vampire to them
    String getRandomVampire = getRandomName();

    userRoles[getRandomVampire] = mid_roles.vampir;

    users.remove(getRandomVampire);
  }

  // giving villiger role to everybody else left on the users list
  for (var user in users) {
    userRoles[user] = mid_roles.koylu;
  }

  // printing all of them so I can see it work
  print(userRoles);
}
