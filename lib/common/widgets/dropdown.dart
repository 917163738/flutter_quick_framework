import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownView extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String>? onChange;
  int defaultPosition = 0;

  DropdownView(
      {Key? key, required this.items, this.onChange, this.defaultPosition = 0})
      : super(key: key);

  @override
  State<DropdownView> createState() => _DropdownViewState();
}

class _DropdownViewState extends State<DropdownView> {
  String selectedValue = '';

  @override
  void initState() {
    super.initState();
    selectedValue = widget.items[widget.defaultPosition];
  }

  @override
  Widget build(BuildContext context) {
    return buildDropdownButtonHideUnderline();
  }

  DropdownButtonHideUnderline buildDropdownButtonHideUnderline() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        style: const TextStyle(
          fontSize: 18,
        ),
        iconEnabledColor: Colors.white,
        items: _addDividersAfterItems(widget.items),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
            widget.onChange?.call(selectedValue);
          });
        },
        selectedItemBuilder: (context) {
          return _addDividersAfterItems(widget.items)
              .map((e) => Center(
                    child: Text(
                      selectedValue.length > 12
                          ? '${selectedValue.substring(0, 6)}...${selectedValue.substring(selectedValue.length - 5)}'
                          : selectedValue,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ))
              .toList();
        },
        buttonHeight: 40,
        itemHeight: 55,
        dropdownFullScreen: true,
        dropdownWidth: ScreenUtil().screenWidth,
        dropdownElevation: 8,
        itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      ),
    );
  }

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: 18,
                color: item == selectedValue ? Colors.blue : Colors.black,
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<int> _getDividersIndexes() {
    List<int> dividersIndexes = [];
    for (var i = 0; i < (widget.items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        dividersIndexes.add(i);
      }
    }
    return dividersIndexes;
  }
}