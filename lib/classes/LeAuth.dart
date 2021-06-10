import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LeAuth {
  LeAuth(this.email, this.pass, this.nome);

  String email;
  String pass;
  String nome;

  Future<dynamic> createNewUser(email, pass, nome) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      incluiUsuario(email, nome);
      return 'autorizado';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'senhaErrada';
      } else if (e.code == 'email-already-in-use') {
        return 'jaCadastrado';
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getAccessAuth(email, pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return 'autorizado';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  Future<dynamic> incluiUsuario(email, nome) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('usuarios');
    return users
        .doc(email)
        .set({
          'name': nome, // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
