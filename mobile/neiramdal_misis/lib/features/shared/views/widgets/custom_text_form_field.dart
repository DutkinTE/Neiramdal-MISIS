import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String placeholder;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
    required this.placeholder,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  final OutlineInputBorder customBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color.fromRGBO(0, 174, 239, 0.2), width: 1),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          keyboardType: widget.keyboardType,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: customBorder,
            enabledBorder: customBorder,
            disabledBorder: customBorder,
            focusedBorder: customBorder,
            errorBorder: customBorder,

            labelText: widget.placeholder,
            labelStyle: TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: Color.fromRGBO(30, 46, 112, 1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
