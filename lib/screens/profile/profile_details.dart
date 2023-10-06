import 'dart:io';
import 'package:college_cupid/screens/about_you/about_you.dart';
import 'package:college_cupid/shared/colors.dart';
import 'package:college_cupid/widgets/global/cupid_botton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  bool isMale = true;
  File? image;
  List<String> programs = ['B.Tech', 'B.Sc', 'M.Tech', 'PHd', 'M.Sc', 'M.BA'];
  var selectedValue1 = 'B.Tech';

  List<String> year = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
    '5th Year',
    '6th Year'
  ];
  var selectedValue2 = '1st Year';

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CupidColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Profile Details',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Stack(children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pickImage(ImageSource.gallery);
                    });
                  },
                  child: image != null
                      ? ClipOval(
                          child: Image.file(
                          image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ))
                      : ClipOval(
                          child: Container(
                            width: 100,
                            height: 100,
                            color: CupidColors.titleColor,
                          ),
                        )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: CupidColors.titleColor, shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Icon(Icons.camera_alt_outlined,
                              size: 16,
                              color: Colors.white),
                        ),
                      )))
            ]),
            const Padding(padding: EdgeInsets.only(top: 30)),
            TextField(
              focusNode: FocusNode(),
              decoration: const InputDecoration(
                labelText: "Name",
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelStyle: TextStyle(color: CupidColors.pinkColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CupidColors.pinkColor, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CupidColors.pinkColor, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              height: 56,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: CupidColors.pinkColor,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Select Gender ',
                      style: TextStyle(
                        color: CupidColors.pinkColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                            color: isMale ? CupidColors.titleColor : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Male",
                            style: TextStyle(
                                color: isMale ? Colors.white : CupidColors.pinkColor),
                          ),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                            color: !isMale ? CupidColors.pinkColor : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Female",
                            style: TextStyle(
                                color: !isMale ? Colors.white : CupidColors.pinkColor),
                          ),
                        )),
                      ),
                    )
                  ]),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedValue1,
                    items: programs.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue1 = value!;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    decoration: InputDecoration(
                        labelText: "Program",
                        labelStyle: const TextStyle(color: CupidColors.pinkColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: CupidColors.pinkColor),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                const SizedBox(width: 16), // Add some spacing between dropdowns
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedValue2,
                    items: year.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue2 = value!;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    decoration: InputDecoration(
                        labelText: "Year",
                        labelStyle: const TextStyle(color: CupidColors.pinkColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: CupidColors.pinkColor),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            TextField(
              focusNode: FocusNode(),
              decoration: const InputDecoration(
                label: Text(
                  "Password",
                  style: TextStyle(color: CupidColors.pinkColor),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelStyle: TextStyle(color: CupidColors.pinkColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CupidColors.pinkColor, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CupidColors.pinkColor, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            TextField(
              focusNode: FocusNode(),
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelStyle: TextStyle(color: CupidColors.pinkColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CupidColors.pinkColor, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CupidColors.pinkColor, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            CupidButton(text: 'Continue', onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutYouScreen()));
            }),
          ],
        ),
      ),
    );
  }
}