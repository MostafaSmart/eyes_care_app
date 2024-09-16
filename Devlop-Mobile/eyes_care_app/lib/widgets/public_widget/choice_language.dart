import 'package:flutter/material.dart';

class ChoiceLanguage extends StatefulWidget {
  final int initialSelectedIndex;
  final List<String> languageList;
  final Function changeLang;

  const ChoiceLanguage({
    super.key,
    required this.initialSelectedIndex,
    required this.languageList,
    required this.changeLang,
  });
  @override
  State<ChoiceLanguage> createState() => _ChoiceLanguageState();
}
class _ChoiceLanguageState extends State<ChoiceLanguage> {
  late int _selectedChoices;
  @override
  void initState() {
    super.initState();
    _selectedChoices = widget.initialSelectedIndex;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: ListView(
        children: [
          Card(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.languageList.map((choiceLanguage) {
                  int index = widget.languageList.indexOf(choiceLanguage);

                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedChoices = index;
                        widget.changeLang(index);
                      });
                    },
                    key: Key(index.toString()),
                    child: Directionality(
                      textDirection: _selectedChoices == 0
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              textDirection: TextDirection.ltr,
                              _selectedChoices != index
                                  ? Icons.radio_button_off_outlined
                                  : Icons.check_circle_rounded,
                              color: Colors.blue,
                            ),
                            Expanded(
                              child: Text(
                                choiceLanguage,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
