import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget articleItem(articles, context) =>
    InkWell(
      onTap: () {
        navigateTo(
          context: context,
          widget: WebViewScreen(articles["url"]),
        ); 
      },
      child: Padding(

        padding: const EdgeInsets.all(20.0),

        child: Row(

          children: [

            Container(

              width: 120,

              height: 120,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10.0,

                ),

                image: DecorationImage(

                  image: NetworkImage('${articles["urlToImage"]}'),

                  fit: BoxFit.fill,

                ),

              ),

            ),

            const SizedBox(

              width: 20.0,

            ),

            Expanded(

              child: Container(

                height: 120.0,

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Expanded(

                      child: Text(

                        "${articles["title"]}  ",

                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                      ),

                    ),

                    Text(

                      "${articles["publishedAt"]}",

                      style: const TextStyle(

                        color: Colors.grey,

                        fontWeight: FontWeight.w600,

                      ),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),
    );

Widget myDivider() =>
    const Divider(
      height: 2.0,
      thickness: 1.0,
      color: Colors.grey,
    );


Widget articleBuilder(list, context, {isSearch=false}) =>
    ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) =>
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => articleItem(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length,

          ),
      fallback: (context) =>isSearch?Container():
       Center(child: CircularProgressIndicator()),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required IconData prefixIcon,
  required String label,

  void Function()? onTap,
  String? Function(String?)? validator,
  String? validateText,
  void Function(String)? onChanged,
  IconData? suffixIcon,
  void Function()? suffixPressed,

  bool enabled = true,
  bool readonly = false,
  bool isPassword = false,
}) =>
    Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextFormField(
        controller: controller,
        onTap: onTap,

        decoration: InputDecoration(
          enabled: enabled,
          label: Text(label),
          prefixIcon: Icon(prefixIcon),

          suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffixIcon),

          ),

          border: const OutlineInputBorder(),
        ),
        readOnly: readonly,
        validator: validator,
        obscureText: isPassword,
        onChanged: onChanged,
      ),
    );


void navigateTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );