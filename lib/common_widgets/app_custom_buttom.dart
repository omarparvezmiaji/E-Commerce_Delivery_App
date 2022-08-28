
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/my_app_size.dart';

 appCustomButton(BuildContext context,
    {text, press, height, width, top, left, right, bottom, color, radius,textColor,elevation }) {
  return Center(
    child: Container(
      width:width?? double.infinity,
      height: height,
      color: Colors.red,
      margin: EdgeInsets.only(
          top: top ?? 0,
          left: left ?? 0,
          right: right ?? 0,
          bottom: bottom ?? 0),
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(

              padding: const EdgeInsets.only(top: 5, bottom: 5),
              elevation:elevation ?? 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 5)),
              primary: color ?? const Color(0xff0ce0ff)),
          onPressed: press,
          child: Text(

            text,


            style: const TextStyle(
                color:  Colors.white, fontWeight: FontWeight.w500, fontSize:16.0),
          )),
    ),
  );
}



//



inputField(BuildContext context, {value, message, text, hintText, initialText, type,
  prefixIcon, visibility, obsecureText, maxLength, autoFillHints,readOnly, maxLines}) {
  return Container(
    //decoration
      padding: const EdgeInsets.all(10),
      // height:60 ,
      decoration: BoxDecoration(
        border:Border.all() ,

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
        //
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //for search
          Row(
            children: [
              TextFormField(
                controller: value ?? null,
                validator: (v){
                  if(v!.isEmpty){
                    return message != null ? 'Please Enter $message' : null;
                  }else{
                    return null;
                  }
                },

                obscureText: obsecureText ?? false,
                style: const TextStyle(fontSize: 12),
                keyboardType: type ?? null,
                textAlignVertical: TextAlignVertical.center,
                maxLength: maxLength ?? null,
                maxLines: maxLines ?? 1,
                autofillHints: [autoFillHints],
                readOnly: readOnly ?? false,
                decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: '$hintText',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColors.primaryColor,
                    prefixIcon: prefixIcon != null ? Icon(
                      prefixIcon,
                      size: 18,
                    ) : null,
                    suffixIcon: visibility ?? null,
                    hintStyle: TextStyle(fontSize: 12)),
              ),


            ],
          ),
        ],
      ));
}