import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:java_go/config/common/cache_network_image.dart';

class ImagePickerForm extends FormField<XFile> {
  final BuildContext context;
  final String? image;

  ImagePickerForm({
    Key? key,
    this.image,
    required this.context,
    FormFieldSetter<XFile>? onSaved,
    String? Function(XFile?)? validator,
    bool autovalidate = false,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<XFile?> state) {
            return InkWell(
              onTap: () async {
                final pickedImage = await showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return const ImagePickerOptions();
                  },
                );
                if (pickedImage != null) {
                  state.didChange(pickedImage);
                }
              },
              child: Builder(builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.value != null)
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            File(state.value!.path),
                            width: 418.w,
                            height: 304.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else if (image != null && image.trim().isNotEmpty)
                      SizedBox(
                        width: 418.w,
                        height: 304.h,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: NetworkImageWidget(imageUrl: image)),
                      )
                    else
                      Column(
                        children: [
                          Container(
                            width: 418.w,
                            height: 304.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x60000000),
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/plus-circle.png',
                                height: 80.h,
                                width: 80.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          if (state.hasError)
                            10.verticalSpace,
                            Text(
                              state.errorText??"",
                              style: TextStyle(color: Colors.red.shade900),
                            )
                        ],
                      )
                  ],
                );
              }),
            );
          },
        );
}

class ImagePickerOptions extends StatelessWidget {
  const ImagePickerOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Select source",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      content: Wrap(
        children: [
          ListTile(
            title: Text(
              "Camera",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: Icon(Icons.camera_alt, color: Colors.black),
            onTap: () {
              final picker = ImagePicker();
              picker
                  .pickImage(source: ImageSource.camera, imageQuality: 70)
                  .then((value) {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop(value);
              });
            },
          ),
          const Divider(),
          ListTile(
            title:
                Text("Gallery", style: Theme.of(context).textTheme.titleMedium),
            leading: Icon(Icons.image, color: Colors.black),
            onTap: () {
              final picker = ImagePicker();
              picker
                  .pickImage(source: ImageSource.gallery, imageQuality: 70)
                  .then((value) {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
