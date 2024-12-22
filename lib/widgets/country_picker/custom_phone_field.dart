import 'package:doc_booking_app/presentations/authentication/models/country_model.dart';
import 'package:doc_booking_app/presentations/authentication/repo/auth_repo.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/material.dart';

import '../../global/app_color.dart';
import '../../global/styles.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<CountryModel>? onChanged;
  final List<CountryModel>? countries;
  final String? errorText;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.countries,
    this.onChanged,
    this.errorText,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  List<CountryModel> countries = [];
  bool loading = true;
  CountryModel? selectedCountry;
  List<CountryModel> allCountries = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountries();
    });
  }

  getCountries() async {
    try {
      if (widget.countries?.isNotEmpty == true) {
        allCountries.clear();
        allCountries.addAll(widget.countries ?? []);
      } else {
        allCountries.clear();
        allCountries.addAll(await AuthRepo.getCountries());
      }
      countries.clear();
      countries.addAll(allCountries);
      if (countries.isNotEmpty) {
        selectedCountry = countries.first;
      }
      setState(() {});
    } catch (e) {
      LogUtil.error(e.toString());
    }
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Phone Number',
              style: txtInterTextField,
              children: const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.borderColor,
              ),
            ),
            child: Row(
              children: [
                loading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (_) => Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.gray,
                                    blurRadius: 20,
                                  )
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.all(16),
                              child: StatefulBuilder(builder: (context, setS) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(25),
                                              ),
                                              isDense: true,
                                              hintText: 'Search',
                                            ),
                                            onChanged: (value) {
                                              if (value.isEmpty) {
                                                countries.clear();
                                                countries.addAll(allCountries);
                                              } else {
                                                countries.clear();
                                                countries.addAll(
                                                  allCountries.where(
                                                    (c) {
                                                      return c.name?.toLowerCase().startsWith(value.toLowerCase()) ??
                                                          c.iso2?.toLowerCase().startsWith(value.toLowerCase()) ??
                                                          false;
                                                    },
                                                  ),
                                                );
                                              }
                                              setS(() {});
                                            },
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.clear))
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (ctx, index) => ListTile(
                                          onTap: () {
                                            if (widget.onChanged != null) {
                                              widget.onChanged!(countries[index]);
                                            }
                                            selectedCountry = countries[index];
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          leading: Text(
                                            countries[index].emoji ?? '',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                          title: Text(
                                            countries[index].name ?? '',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        itemCount: countries.length,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          );
                          /* showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            profileController.updateCountry(country);
                          },
                        );*/
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                selectedCountry?.emoji ?? '',
                                style: const TextStyle(fontSize: 24),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.arrow_drop_down, size: 18),
                            ],
                          ),
                        ),
                      ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey.shade300,
                ),
                Expanded(
                  child: TextFormField(
                    style: txtInterDropDownValue,
                    readOnly: loading,
                    controller: widget.controller,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onChanged: (value) {
                      if (widget.onChanged != null) {
                        // widget.onChanged!(value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          if (widget.errorText != null)
            Text(
              widget.errorText!,
              style: TextStyle(color: AppColors.errorTextColor),
            )
        ],
      ),
    );
  }
}
