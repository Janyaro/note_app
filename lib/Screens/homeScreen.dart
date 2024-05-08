import 'dart:math';
import 'package:flutter/material.dart';
import 'package:note_app/Color/bc_color.dart';
import 'package:note_app/Screens/create_note.dart';
import 'package:note_app/dbHelper.dart';
import 'package:note_app/models/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbhelper;
  late Future<List<NoteModel>> notesList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbhelper = DBHelper();
    loadData();
  }

  loadData() async {
    notesList = dbhelper!.getNoteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Note App'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: notesList,
                  builder: (context, AsyncSnapshot<List<NoteModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  dbhelper!.update(NoteModel(
                                      id: snapshot.data![index].id,
                                      titleName: 'Fiest',
                                      body: 'dskajkdsakj'));
                                },
                                child: Card(
                                  color: getRandomColor(),
                                  child: ListTile(
                                    trailing: InkWell(
                                        onTap: () {
                                          dbhelper!.delete(
                                              snapshot.data![index].id!);
                                          setState(() {
                                            notesList = dbhelper!.getNoteList();
                                            snapshot.data!.remove(
                                                snapshot.data![index].id);
                                          });
                                        },
                                        child: const Icon(
                                            Icons.delete_forever_outlined)),
                                    contentPadding: EdgeInsets.all(14),
                                    title: Text(
                                      snapshot.data![index].titleName
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        snapshot.data![index].body.toString()),
                                  ),
                                ));
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreateNote()));
          },
          child: const Icon(Icons.add),
        ));
  }

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }
}
