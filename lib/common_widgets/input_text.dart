import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';

import '../styles/my_app_size.dart';

inputText(
  BuildContext context, {
  value,
  message,
  text,
  hintText,
  initialText,
  type,
  prefixIcon,
  visibility,
  obsecureText,
  maxLength,
  autoFillHints,
  readOnly,
  maxLines,
}) {
  return Container(
      //decoration

       height:60 ,

      decoration: BoxDecoration(
        border: Border.all(),

       // color: const Color(0xfff6f6f6),
       color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),

        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.black12,
        //     offset: Offset(1, 1),
        //     blurRadius: 10,
        //   ),
        //   BoxShadow(
        //     color: Colors.transparent,
        //     offset: Offset(-1, -1),
        //     blurRadius: 10,
        //   )
        // ]

      ),
      child: Padding(
       padding: EdgeInsets.all(5),
       
       // padding: const EdgeInsets.only(left: 5.0,right: 5),
        child: TextFormField(

          controller: value ?? null,
          validator: (v) {
            if (v!.isEmpty) {
              return message != null ? 'Please Enter $message' : null;
            } else {
              return null;
            }
          },
          obscureText: obsecureText ?? false,
          style: const TextStyle(fontSize: 16),
          keyboardType: type ,
          textAlignVertical: TextAlignVertical.center,
          maxLength: maxLength ,
          maxLines: maxLines ?? 1,
          autofillHints: [autoFillHints],
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
              counter: const Offstage(),
              hintText: hintText,
              border: InputBorder.none,
              filled: true,
              isCollapsed: true,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              fillColor: AppColors.lightColor,
              prefixIcon: prefixIcon != null
                  ? Icon(
               // color: Colors.white70,
                prefixIcon,
                size: 25,
              )
                  : null,
              suffixIcon: visibility,
              hintStyle: const TextStyle(fontSize: 16,fontWeight:FontWeight.w600 )),
        ),
      ),);
}

//
