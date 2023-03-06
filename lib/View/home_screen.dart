import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Data/Response/status.dart';
import 'package:laravel_api_provider/Utils/Routes/route_names.dart';
import 'package:laravel_api_provider/View-Models/auth_view_model.dart';
import 'package:laravel_api_provider/View-Models/food_view_model.dart';
import 'package:laravel_api_provider/View-Models/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String? title;
  HomeScreen({Key? key, this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldState = GlobalKey<ScaffoldState>();

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  FoodViewModel foodViewModel = FoodViewModel();

  @override
  void initState() {
    foodViewModel.getFoodList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthViewModel>(context);
    final userAuth = Provider.of<UserViewModel>(context);
    // auth.getNote(context);
    return SafeArea(
        child: Scaffold(
      key: scaffoldState,
      // floatingActionButton: FloatingActionButton.extended(
      //   icon: const Icon(Icons.note_add),
      //     onPressed: (){
      //       openNoteModal(context, auth);
      //     },
      //     label: const Text("add new note")),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
              onPressed: () {
                userAuth.removeUser().then((value) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacementNamed(
                      context, RoutesNames.loginScreen);
                });
              },
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        title: Title(color: Colors.black, child: Text("${widget.title}")),
      ),
      body: ChangeNotifierProvider<FoodViewModel>(
        create: (BuildContext context) => foodViewModel,
        child: Consumer<FoodViewModel>(
            builder: (context, snapshot, _) {
              switch(snapshot.foodList.status){
                case Status.LOADING:
                   return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  debugPrint(snapshot.foodList.message.toString());
                  return Text(snapshot.foodList.message.toString());
                case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: snapshot.foodList.data?.data?.length,
                      itemBuilder: (context, index){
                      debugPrint('${snapshot.foodList.data?.data?[index].title}');
                    return ListTile(
                      leading: Text("${index+1}"),
                      title: Text('${snapshot.foodList.data?.data?[index].title}'),
                    );
                  });
                default:
                  return const Text("Default Error");
              }
        }),
      ),
    ));
  }

  openNoteModal(context, AuthViewModel authViewModel) {
    showModalBottomSheet(
        context: context,
        builder: (snapshot) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "add title",
                        hintStyle: TextStyle(color: Colors.black45),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "add description",
                        hintStyle: TextStyle(color: Colors.black45),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
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
          );
        });
  }
}
