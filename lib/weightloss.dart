import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WeightLoss extends StatefulWidget {
  const WeightLoss({Key? key}) : super(key: key);

  @override
  State<WeightLoss> createState() => _WeightLossState();
}

class _WeightLossState extends State<WeightLoss> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isAuthenticated => _auth.currentUser != null;
  bool get isAdmin => _auth.currentUser != null && _auth.currentUser!.email == 'yasir@123.com';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weight Loss diet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Diet Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: isAdmin ? ()async {
                    try {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        String id = DateTime.now().millisecondsSinceEpoch.toString();
                        await FirebaseFirestore.instance.collection('weightLoss').doc('$name' + '' + '$contact' + '' + '$id').set({
                          'name': name,
                          'contact': contact,
                          'id': id,
                        }).then((value) {
                          setState(() {
                            nameController.text = '';
                            contactController.text = '';
                            contacts.add(Contact(name: name, contact: contact, id: id));
                          });
                        }).catchError((error) {
                          print('Error adding document: $error');
                        });
                      }
                    } catch (e) {
                      print('Error: $e');
                    }
                  }
                      :null,
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed:isAdmin ? ()async {
                    try {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (selectedIndex != -1 && name.isNotEmpty && contact.isNotEmpty) {
                        String id = contacts[selectedIndex].id;
                        await FirebaseFirestore.instance.collection('weightLoss').doc('$name' + '' + '$contact' + '' + '$id').set({
                          'name': name,
                          'contact': contact,
                          'id': id,
                        }).then((value) {
                          setState(() {
                            nameController.text = '';
                            contactController.text = '';
                            contacts[selectedIndex].name = name;
                            contacts[selectedIndex].contact = contact;
                            selectedIndex = -1;
                          });
                        }).catchError((error) {
                          print('Error updating document: $error');
                        });
                      }
                    } catch (e) {
                      print('Error: $e');
                    }
                  }
                      :null,
                  child: const Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () async{

                    try {
                      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('weightLoss').get();
                      contacts = snapshot.docs.map((doc) => Contact(
                        name: doc['name'],
                        contact: doc['contact'],
                        id: doc.id,
                      )).toList();
                      setState(() {}); // Trigger a rebuild to update the UI
                    } catch (e) {
                      print('Error fetching data: $e');
                    }
                  }, child: const Text('fetch'),)
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
              'No Contact yet..',
              style: TextStyle(fontSize: 22),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => getRow(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                onTap:isAdmin ? () {
                  nameController.text = contacts[index].name;
                  contactController.text = contacts[index].contact;
                  setState(() {
                    selectedIndex = index;
                  });
                }
                    :null,
                child: const Icon(Icons.edit),
              ),
              InkWell(
                onTap:isAdmin ? () async{
                  try {
                    String id = contacts[index].id;
                    await FirebaseFirestore.instance.collection('weightLoss').doc(id).delete().then((value) {
                      setState(() {
                        contacts.removeAt(index);
                      });
                    }).catchError((error) {
                      print('Error deleting document: $error');
                    });
                  } catch (e) {
                    print('Error: $e');
                  }
                }
                    :null,
                child: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact {
  String name;
  String contact;
  String id;

  Contact({required this.name, required this.contact, required this.id});
}
