import 'package:flutter/material.dart';

Widget DefualtTextFormFeild({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,

}){
  return TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: type == TextInputType.visiblePassword ? true : false,
          decoration: InputDecoration(
            hintText: label,
            prefixIcon: Icon(prefix),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)
              ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)
              ),
            fillColor: Colors.grey.shade200,
            filled: true,
          ),
        );
}

Widget DefualtButton({
  required String text,
  required Function() onTapped,
}){
  return GestureDetector(
    onTap: onTapped,
    child: Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[700],
      ),
      child: Center(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),)),
    ),
  );
}

Widget DefualtImage({
    required String path,
    required Function() onTapped,
  }){
  return GestureDetector(
    onTap: onTapped,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
        color: Colors.grey.shade200
      ),
      child: Image.asset(path, fit: BoxFit.cover,height: 40,)),
  );
}