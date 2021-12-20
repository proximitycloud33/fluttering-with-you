import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetFlashCard extends StatelessWidget {
  final String statement;
  final String answer;

  // ignore: use_key_in_widget_constructors
  const GetFlashCard(this.statement, this.answer);

  @override
  Widget build(BuildContext context) {
    CollectionReference flashCard =
        FirebaseFirestore.instance.collection('flash_Card');

    return FutureBuilder<DocumentSnapshot>(
      future: flashCard.doc().get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
