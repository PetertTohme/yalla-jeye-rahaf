
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yallajeye/constants/colors_textStyle.dart';

import '../providers/user.dart';

class CustomCupertinoPicker extends StatefulWidget {
  String label;
  TextInputType inputType;
  List<String> items;

  int selectedValue;
  int id;

  TextEditingController controller = TextEditingController();

  CustomCupertinoPicker(
      { this.label,
        this.inputType,
        this.items,

        this.selectedValue = 0,
        this.controller});

  @override
  State<CustomCupertinoPicker> createState() => _CustomCupertinoPickerState();
}


class _CustomCupertinoPickerState extends State<CustomCupertinoPicker> {
  FocusNode _focusNode = FocusNode();
  buildItems() {
    List<Widget> items = [];
    for (int i = 0; i < widget.items.length; i++) {
      items.add(
        Center(
            child: Text(
              widget.items[i].toString(),
              style: TextStyle(color: redColor),
            )),
      );
    }
    return items;
  }

  @override
  void dispose() {
    // widget.controller.dispose();

    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void showPicker(BuildContext ctx) {
    showCupertinoModalPopup(

        context: ctx,
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xffE6E4EA),
                      width: 0.25,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CupertinoButton(

                      child: Text(
                        "Pick " + widget.label.toLowerCase(),
                        style: TextStyle(
                            color: redColor, fontWeight: FontWeight.w300),
                      ),

                      onPressed: () {






                        if (widget.label == 'Gender') {
                          final authProvider = Provider.of<UserProvider>(context,listen: false);
                          authProvider.gender.text=widget.items[widget.selectedValue].toString();

                          Navigator.of(context).pop();
                        }
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 5.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                child:  CupertinoPicker(

                  backgroundColor: Colors.white,
                  onSelectedItemChanged: (value) {
                    final authProvider = Provider.of<UserProvider>(context,listen: false);
                    setState(() {
                      // widget.id=authProvider.genderIdList[value].id;
                      authProvider.genderId=authProvider.genderIdList[value];
                      widget.selectedValue = value;
                      widget.controller.text =
                      widget.items[widget.selectedValue];
                    });

                  },

                  scrollController: FixedExtentScrollController(
                      initialItem: widget.selectedValue-1),
                  itemExtent: 40.0,
                  children: [...buildItems()],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: MediaQuery.of(context).size.height/11,
      // margin: EdgeInsets.only(bottom: 5),
      // padding: EdgeInsets.all(12),
      // decoration: BoxDecoration(
      //     color: Colors.white, //white
      //     borderRadius: BorderRadius.all(Radius.circular(45))),
      child: TextFormField(



        decoration: InputDecoration(


            suffixIcon:Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
              size: 24,
            ) ,

            alignLabelWithHint: true,
            hintStyle: TextStyle(
                fontFamily: 'BerlinSansFB',
                fontSize: _focusNode.hasFocus ? 20 : 18.0,//I believe the size difference here is 6.0 to account padding
                color:
                _focusNode.hasFocus ? Color(0xFF3F5521) : Colors.grey),
            hintText: widget.label,
            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius:
               BorderRadius.all(Radius.circular(15)),
              borderSide:  BorderSide.none,
              // const BorderSide(
              //   color: Colors.grey,
              // ),
            ),
            focusedBorder: OutlineInputBorder(

                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Color(0xFF3F5521),
                ),
            ),
        ),
        style: TextStyle(color: Colors.black),

        focusNode: _focusNode,
        controller: widget.controller,
        onTap: () {
          _focusNode.unfocus();
          showPicker(context);
        },
        readOnly: true,
        keyboardType: this.widget.inputType,

      ),
    );
  }
}
