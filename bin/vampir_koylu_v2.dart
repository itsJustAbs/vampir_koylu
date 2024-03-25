import 'dart:math';
// Roles in the game 
enum Roles {
  vampir,
  koylu,
  doktor,
  soytari,
  avci,
  mafya,
  ciftci,
}

void main() {

Map<String, Roles> userRoles = {};


// Needed roles for 4-6 player range
List<Roles> rolesFor4to6players = [
    Roles.vampir,
    Roles.doktor,
];

// Needed roles for 7-10 player range
List<Roles> rolesFor7to10players = [
Roles.vampir,
Roles.vampir,
Roles.doktor,
Roles.mafya,
];

if(users.length <= 6){

// For every role in the role list gets a random person to have that role and deletes the user
for(var role in rolesFor4to6players){
  String randomUser = getRandomName();
  userRoles[randomUser] = role;
  users.remove(randomUser);
}

// For every user left in users gets a random role and assigns it to them
for (var user in users) {
    userRoles[user] = Roles.koylu;
}

}

if(users.length >= 7){

// For every role in the role list gets a random person to have that role and deletes the user
for(var role in rolesFor7to10players){
  String randomUser = getRandomName();
  userRoles[randomUser] = role;
  users.remove(randomUser);
}

// For every user left in users gets a random role and assigns it to them
for (var user in users) {
    userRoles[user] = Roles.koylu;
}
}
print(userRoles);
}

// Function to get a random role
Roles getRandomRole() {
  Random random = Random();
  List<Roles> values = Roles.values;
  return values[random.nextInt(values.length)];
}

// Function to get a random person
String getRandomName() {
  Random random = Random();
  return users[random.nextInt(users.length)];
}


// Test users over here
List<String> users = ['arda','kemal','mehmet','ahmet','ayse','ali','muhammet'];
// Note: you can try removeing some of the users to see the amount of special roles given change 
