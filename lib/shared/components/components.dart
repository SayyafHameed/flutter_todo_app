import 'package:flutter/material.dart';

class DefaultTextFormFld extends StatelessWidget {
   final TextInputType keyBoardType;
   final String textLabel;
   final String textHint;
   final TextEditingController? controller;
   final String? Function(String?)? validate;
   final void Function()? onTap;

  const DefaultTextFormFld({super.key, required this.keyBoardType, required this.textLabel, required this.textHint, this.controller, this.validate, this.onTap});



  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        controller: controller,
        validator: validate,
        keyboardType: keyBoardType,
        onTap: onTap,
        decoration: InputDecoration(
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(textLabel),
          hintText: textHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}


Widget BuildTasksItems(Map model) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        backgroundColor: Colors.grey[300],
        child:  Text('${model['price']}', style: const TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),),
      ),
      const SizedBox(
        width: 20.0,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Text('${model['title']}', style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
          Text('${model['date']}', style: const TextStyle(color: Colors.grey),),
        ],
      ),
      const SizedBox(
        width: 20.0,
      ),
      Row(
        children: [

          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.grey[200],
            child:  Text('${model['count']}', style: const TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    ],
  ),
);
