import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';

class PlacesField extends StatefulWidget {
  const PlacesField(
      {super.key,
      this.label,
      this.width = 310,
      this.height,
      this.initialValue,
      this.validator,
      required this.onSaved});
  final String? label;
  final double? width;
  final double? height;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?) onSaved;
  @override
  State<PlacesField> createState() => _PlacesFieldState();
}

class _PlacesFieldState extends State<PlacesField> {
  final placeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text("${widget.label}*",
              style: TextStyle(
                  color: Color(0xff461C10),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600)),
          8.verticalSpace,
        ],
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: GooglePlacesAutoCompleteTextFormField(
            maxHeight: 400,
              onChanged: widget.onSaved,
              validator: widget.validator,
              onTapOutside: (va) {
                FocusScope.of(context).unfocus();
              },
              initialValue: widget.initialValue,
              decoration: InputDecoration(
                hintText: "Enter your address line1",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4C2F27)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4C2F27)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              cursorColor: Color(0xFF6A442E),
              textEditingController: placeController,
              googleAPIKey: "AIzaSyBsfvNpOntelAz6fvlZw7IYsDxvfm4l0dg",
              debounceTime: 400,
              countries: ["uk"],
              fetchCoordinates: true,
              onPlaceDetailsWithCoordinatesReceived: (prediction) {
                print("Coordinates: (${prediction.lat},${prediction.lng})");
              },
              onSuggestionClicked: (prediction) {
                placeController.text = prediction.description!;
                placeController.selection = TextSelection.fromPosition(
                    TextPosition(offset: prediction.description!.length));
              }),
        ),
      ],
    );
  }
}
