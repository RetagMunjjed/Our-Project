import 'dart:io';
import 'package:events/core/api/const/color.dart';
import 'package:events/screen/camera.dart';
import 'package:events/screen/music.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Resturantodetails extends StatefulWidget {
  const Resturantodetails({super.key});

  @override
  State<Resturantodetails> createState() => _ResturantodetailsState();
}

class _ResturantodetailsState extends State<Resturantodetails> {
  File? _mainImage;
  List<File?> _subImages = List.generate(5, (_) => null);
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickMainImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) setState(() => _mainImage = File(image.path));
  }

  Future<void> _pickSubImage(int index) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) setState(() => _subImages[index] = File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                color: AppColor.pink,
                icon: Icon(Icons.edit),
                onPressed: _pickMainImage,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _mainImage != null
                  ? Image.file(_mainImage!)
                  : Image.asset("images/rest.jpg"),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                          image: DecorationImage(
                            image: _subImages[index] != null
                                ? FileImage(_subImages[index]!)
                                : AssetImage("images/rest.jpg")
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.edit,
                                size: 16, color: AppColor.pink),
                            onPressed: () => _pickSubImage(index),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text("Paris resturant",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                Spacer(),
                IconButton(
                    color: AppColor.pink,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            content: SizedBox(
                              width: 250,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Add new name of the resturant",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit))
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.message_outlined),
                SizedBox(width: 10),
                Icon(Icons.phone),
                SizedBox(width: 100),
                Container(
                  width: 90,
                  height: 30,
                  child: Card(child: Text("   Birthday")),
                ),
                Container(
                  width: 90,
                  height: 30,
                  child: Card(child: Text("   happy")),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.place),
                SizedBox(width: 10),
                Text(
                  "Mazzeh",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                IconButton(
                    color: AppColor.pink,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            content: SizedBox(
                              width: 250,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Add new location of the resturant",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit))
              ],
            ),
            SizedBox(height: 10),
            Text("العنوان بالتفصيل"),
            SizedBox(height: 20),
            Divider(),
            Row(
              children: [
                Icon(Icons.people),
                Text(" 1000 - 2000 guest"),
                Spacer(),
                IconButton(
                    color: AppColor.pink,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            content: SizedBox(
                              width: 250,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Add new number guset of the resturant",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit))
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Row(
              children: [
                Text("Price: ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("600\$", style: TextStyle(fontSize: 18)),
                Spacer(),
                IconButton(
                    color: AppColor.pink,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            content: SizedBox(
                              width: 250,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Add new price of the resturant",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit))
              ],
            ),
            Divider(),
            Text(
              "Services",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              children: [
                Container(
                  width: 160,
                  height: 70,
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Food     ", style: TextStyle(fontSize: 18)),
                          Icon(Icons.restaurant),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 160,
                  height: 70,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Music()));
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Music     ", style: TextStyle(fontSize: 18)),
                          Icon(Icons.music_note),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 160,
                  height: 70,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Camera()));
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Filming     ", style: TextStyle(fontSize: 18)),
                          Icon(Icons.camera_alt),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 160,
                  height: 70,
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" Team     ", style: TextStyle(fontSize: 18)),
                          Icon(Icons.people),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 160,
                  height: 70,
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" Design     ", style: TextStyle(fontSize: 18)),
                          Icon(Icons.design_services_sharp),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
