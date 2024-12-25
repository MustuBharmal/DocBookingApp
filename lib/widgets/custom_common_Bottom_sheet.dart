import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/styles.dart';
import '../presentations/authentication/controller/authentication_controller.dart';
import 'custom_text_field.dart';

RxList<String> listItem = RxList.empty();
RxList<String> listEmoji = RxList.empty();

class CustomCommonBottomSheetWidget extends StatelessWidget {
  final String header;
  final RxList<String> listOfItems;
  final RxList<String>? listOfEmojis;
  final TextEditingController controller;
  final Function(String value) selectFun;

  const CustomCommonBottomSheetWidget(
      {required this.header,
      required this.listOfItems,
      required this.listOfEmojis,
      required this.controller,
      required this.selectFun,
      super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    searchItem('','');
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.7,
      child: Column(
        children: [
          Text(
            'Select $header',
            style: headerTextStyle.copyWith(
                fontSize: 21, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              label: 'Search',
              errorText:
                  AuthController.instance.signupError[header.toLowerCase()],
              controller: searchController,
              showAsterisk: false,
              hintStyle: txtInterTextFieldHint,
              hintText: header,
              isPassword: RxBool(false),
              onChanged: (value) {
                searchItem(value,value);
              },
            ),
          ),
          Obx(
            () => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 22.0,
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height * 0.7,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      primary: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            controller.text = listItem[index];
                            selectFun(listItem[index]);
                            Get.back();
                          },
                          leading: listEmoji.isNotEmpty ?Text(
                            listEmoji[index],
                            style: TextStyle(fontSize: 18),
                          ) : null,
                          title: Text(
                            listItem[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      },
                      itemCount: listItem.length,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void searchItem(String name, String emoji) {
    if (name != '') {
      listItem.clear();
      listEmoji.clear();
      listItem.addAll(listOfItems
          .where((item) => item.toLowerCase().startsWith(name.toLowerCase()))
          .toList());
      listEmoji.addAll(listEmoji
          .where((emoji) => emoji.toLowerCase().startsWith(emoji.toLowerCase()))
          .toList());
    } else {
      listItem.clear();
      listEmoji.clear();
      listItem.addAll(listOfItems);
      listEmoji.addAll(listOfEmojis ?? []);
    }
  }
}
