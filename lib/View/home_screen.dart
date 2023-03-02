import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laravel_api_provider/View-Models/auth_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final String? title;
   HomeScreen({Key? key, this.title}) : super(key: key);

  final scaffoldState = GlobalKey<ScaffoldState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    return SafeArea(
        child: Scaffold(
          key: scaffoldState,
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.note_add),
              onPressed: (){
                openNoteModal(context, auth);
              },
              label: const Text("add new note")),
          appBar: AppBar(
            title: Title(
                color: Colors.black,
                child: Text("$title")),
          ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [

        ],
      ),
    ));
  }

  openNoteModal(context, AuthViewModel authViewModel){
    showModalBottomSheet(context: context,
        builder: (snapshot){
      return SizedBox(
        height: MediaQuery.of(context).size.height*0.35,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: "add title",
                    hintStyle: TextStyle(color: Colors.black45),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    )
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      hintText: "add description",
                      hintStyle: TextStyle(color: Colors.black45),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      )
                  ),
                ),

                const SizedBox(height: 40),
                TextButton(
                  onPressed: (){
                    Map data = {
                      "title": titleController.text,
                      "description": descriptionController.text,
                      "is_completed": false,
                    };
                   authViewModel.addNote(context, jsonEncode(data));
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

}
