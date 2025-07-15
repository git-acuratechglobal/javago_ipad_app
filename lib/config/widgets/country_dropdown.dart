import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CountrySearchDropdown extends StatefulWidget {
  final ValueChanged<String> onCountrySelected;
  final String? initialSelectedCountry;
  final List<String> countries;
  final FormFieldValidator<String>? validator;
final String? hintText;
  const CountrySearchDropdown({
    super.key,
    required this.onCountrySelected,
    required this.initialSelectedCountry,
    required this.countries,
    this.validator,
    this.hintText
  });

  @override
  State<CountrySearchDropdown> createState() => _CountrySearchDropdownState();
}

class _CountrySearchDropdownState extends State<CountrySearchDropdown> {
  List<String> filteredCountries = [];
  String? selectedCountry;
  List<String> multiCountrySelect = [];
  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool showDropdown = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialSelectedCountry != null &&
        widget.initialSelectedCountry!.isNotEmpty) {
      multiCountrySelect = widget.initialSelectedCountry!
          .split(',')
          .map((e) => e.trim())
          .toList();
    }
    filteredCountries = widget.countries;
    selectedCountry = widget.initialSelectedCountry;
    searchController.text = selectedCountry ?? '';

    focusNode.addListener(() {
      setState(() {
        showDropdown = focusNode.hasFocus;
      });
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      filteredCountries = widget.countries
          .where(
              (country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
      showDropdown = true;
    });
  }

  void _selectCountry(String country, FormFieldState<String> field) {
    setState(() {
      if (multiCountrySelect.contains(country)) {
        multiCountrySelect.remove(country);
      } else {
        multiCountrySelect.add(country);
      }

      selectedCountry = multiCountrySelect.join(", ");
      searchController.text = selectedCountry!;
      showDropdown = false;
      focusNode.unfocus();
    });


    field.didChange(selectedCountry);


    widget.onCountrySelected(selectedCountry!);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      initialValue: selectedCountry,
      builder: (FormFieldState<String> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              cursorColor: Colors.black,
              controller: searchController,
              focusNode: focusNode,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF4C2F27)),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF4C2F27)),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: const Color(0xFFF5F3F0),
                hintText: widget.hintText??'Select Country',
                hintStyle: TextStyle(fontSize: 16.sp),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/drop_down.svg",
                    width: 12,
                  ),
                ),
                errorText: field.errorText, // display error if any
              ),
              onChanged: _onSearchChanged,
            ),
            if (showDropdown && filteredCountries.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.3,
                  ),
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: filteredCountries.length,
                      itemBuilder: (context, index) {
                        final country = filteredCountries[index];
                        return CheckboxListTile(
                          value: multiCountrySelect.contains(country),
                          onChanged: (bool? isChecked) {
                            _selectCountry(country, field);
                          },
                          title: Text(
                            country,
                            style: const TextStyle(color: Colors.black),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                          activeColor: const Color(0xFF4C2F27), // Optional: for styling the checkbox
                        );
                      },
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}



Future<List<String>> loadCountryNames() async {
  final String jsonString =
      await rootBundle.loadString('assets/json/country.json');
  final List<dynamic> jsonData = json.decode(jsonString);

  // Extract the "name" field from each object
  return jsonData.map<String>((e) => e['name'].toString()).toList();
}

final countriesListProvider = FutureProvider<List<String>>((ref) async {
  return await loadCountryNames();
});
