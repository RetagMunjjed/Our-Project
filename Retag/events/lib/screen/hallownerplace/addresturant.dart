import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addresturant extends StatefulWidget {
  const Addresturant({super.key});

  @override
  State<Addresturant> createState() => _AddresturantState();
}

class _AddresturantState extends State<Addresturant> {
  File? _mainImage;
  List<File?> _sideImages = List.generate(6, (_) => null);
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickMainImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _mainImage = File(image.path);
      });
    }
  }

  Future<void> _pickSideImage(int index) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _sideImages[index] = File(image.path);
      });
    }
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Add Resturant",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Add Resturant Name",
                  style: TextStyle(color: Colors.purple)),
              SizedBox(height: 8),
              TextField(decoration: _inputDecoration()),
              SizedBox(height: 20),
              Text("Add The Main image of the Resturant",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Center(
                child: InkWell(
                  onTap: _pickMainImage,
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Card(
                      color: Colors.grey[100],
                      child: _mainImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(_mainImage!,
                                  fit: BoxFit.cover, width: double.infinity),
                            )
                          : Center(
                              child: Icon(Icons.add,
                                  size: 50, color: Colors.grey[700]),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Add Side Photos of the Resturant",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return GestureDetector(
                      onTap: () => _pickSideImage(index),
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 80,
                        height: 80,
                        child: Card(
                          color: Colors.grey[100],
                          child: _sideImages[index] != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(_sideImages[index]!,
                                      fit: BoxFit.cover),
                                )
                              : Icon(Icons.add,
                                  size: 40, color: Colors.grey[700]),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              Text("Add Resturant Location",
                  style: TextStyle(color: Colors.purple)),
              SizedBox(height: 8),
              TextField(decoration: _inputDecoration()),
              SizedBox(height: 20),
              Text("Add How Many People Widen the Resturant",
                  style: TextStyle(color: Colors.purple)),
              SizedBox(height: 8),
              TextField(decoration: _inputDecoration()),
              SizedBox(height: 20),
              Text("Add Price of the Resturant",
                  style: TextStyle(color: Colors.purple)),
              SizedBox(height: 8),
              TextField(decoration: _inputDecoration()),
              SizedBox(height: 20),
              Text("Add the Services You Provide",
                  style: TextStyle(color: Colors.purple)),
              SizedBox(height: 8),
              TextField(decoration: _inputDecoration()),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.purple,
                    onPressed: () {},
                    child: Text("Ok", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
