import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laravel_api_provider/Data/Response/status.dart';
import 'package:laravel_api_provider/Utils/Routes/route_names.dart';
import 'package:laravel_api_provider/View-Models/auth_view_model.dart';
import 'package:laravel_api_provider/View-Models/food_view_model.dart';
import 'package:laravel_api_provider/View-Models/user_view_model.dart';
import 'package:laravel_api_provider/View/Product-Details/product_detail_view.dart';
import 'package:laravel_api_provider/View/testing_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String? title;
  const HomeScreen({Key? key, this.title}) : super(key: key);

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

  bool fav = false;

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthViewModel>(context);
    final userAuth = Provider.of<UserViewModel>(context);
    // auth.getNote(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldState,
        // floatingActionButton: FloatingActionButton.extended(
        //   icon: const Icon(Icons.note_add),
        //     onPressed: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (_)=> const TestingScreen()));
        //       // openNoteModal(context, auth);
        //     },
        //     label: const Text("add new note")),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerScrolledView) {
            return [
              SliverAppBar(
                backgroundColor: const Color(0xF5F5F5F5),
                pinned: true,
                bottom: PreferredSize(
                    preferredSize: const Size(100, 100),
                    child: Column(
                      children: [
                       Title(color: Colors.black,
                           child: const Text("Discover Your Best",
                             style: TextStyle(
                             fontSize: 26
                           ),)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: CupertinoSearchTextField(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border(
                                      bottom: BorderSide(color: Theme.of(context).primaryColor),
                                      top: BorderSide(color: Theme.of(context).primaryColor),
                                      right: BorderSide(color: Theme.of(context).primaryColor),
                                      left: BorderSide(color: Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                                      backgroundColor: Theme.of(context).primaryColor,
                                      side: BorderSide(color: Theme.of(context).primaryColor),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.sort,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                expandedHeight: MediaQuery.of(context).size.height*0.2,
                // flexibleSpace: const FlexibleSpaceBar(
                //   centerTitle: true,
                //   stretchModes: [StretchMode.zoomBackground],
                // ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                        onPressed: () {
                          userAuth.removeUser().then((value) {
                            Navigator.popUntil(context, (route) => route.isFirst);
                            Navigator.pushReplacementNamed(
                                context, RoutesNames.loginScreen);
                          });
                        },
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: Theme.of(context).primaryColor,
                        )),
                  )
                ],
                leading: Transform.scale(
                  scale: 0.8,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        userAuth.removeUser().then((value) {
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacementNamed(
                              context, RoutesNames.loginScreen);
                        });
                      },
                      child: Icon(
                        CupertinoIcons.rectangle_grid_2x2,
                        color: Theme.of(context).primaryColor,
                      )),
                ),
                centerTitle: true,
              ),
            ];
          },
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.02,
                right: MediaQuery.of(context).size.width*0.02),
            children: [
                ChangeNotifierProvider<FoodViewModel>(
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
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: snapshot.foodList.data?.products?.length,
                                  itemBuilder: (context, index){
                                  dynamic document = snapshot.foodList.data?.products?[index];
                                  // debugPrint('${snapshot.foodList.data?.products?[index].title}');
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.35,
                                    width: MediaQuery.of(context).size.width*0.7,
                                    decoration: BoxDecoration(
                                      color: const Color(0xF5F5F5F5),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 2.0,
                                          color: Colors.black12,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                                onPressed: (){
                                                 setState(() {
                                                   fav = !fav;
                                                 });
                                                },
                                                icon: fav? const Icon(Icons.favorite)
                                                    : const Icon(Icons.favorite_border),
                                                color: Colors.red),
                                        ),
                                        const SizedBox(height: 10),
                                        Image.network("${document.thumbnail}",
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context).size.height*0.2,
                                          width: MediaQuery.of(context).size.width*0.8,
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${document.title}",
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 17,
                                        ),),
                                        const SizedBox(height: 10),
                                        Text("\$${document.price}",
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        const SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                                                backgroundColor: Theme.of(context).primaryColor,
                                                side: BorderSide(color: Theme.of(context).primaryColor),
                                                shape: const CircleBorder(),
                                              ),
                                              onPressed: () {
                                                Navigator.push(context,
                                                    CupertinoPageRoute(builder: (context)=> ProductDetailView(
                                                      id: document.id,
                                                    )));
                                                debugPrint("${document.id}");
                                              },
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            );
                          default:
                            return const Text("Default Error");
                        }
                  }),
                ),
            ],
          ),
        ),

      ),
    );
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
