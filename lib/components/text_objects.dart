import 'package:flutter/material.dart';
import 'package:breakmobile2/common/colors_used.dart' as colors_used;
import 'package:breakmobile2/common/tools.dart' as tool;

// ***********************************************************
class MainHeadingBlock extends StatelessWidget {
  final String titleText;
  final String? bodyText;
  final String themeColor;

  const MainHeadingBlock(
      {super.key,
      required this.titleText,
      this.bodyText,
      required this.themeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _HeaderBox(
            text: titleText,
            headerLevel: 0,
            themeColor: themeColor,
          ),
          _DescriptionText(text: bodyText),
        ],
      ),
    );
  }
}

// ***********************************************************
class SubHeadingBlock extends StatelessWidget {
  final String titleText;
  final String bodyText;
  final List<List<Map<String, dynamic>>>? detailText;
  final String themeColor;
  final String icon;

  const SubHeadingBlock(
      {super.key,
      required this.titleText,
      required this.bodyText,
      this.detailText,
      this.themeColor = 'calling',
      this.icon = 'arrow',
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _HeaderBox(
            text: titleText,
            headerLevel: 1,
            themeColor: themeColor,
          ),
          _DescriptionText(text: bodyText),
          // for (List<Map<String, dynamic>> detailBlock in detailText!)
          //   // For each detailText block, create a _DetailTextBlock widget
          //   // Before passing detailBlock, check if each member includes 'icon_color' and if not add the key with a value equal to tht theme
          //   // If the member includes 'icon_color' then check if the value is null and if so, add the key with a value equal to tht theme
          //   _DetailTextBlock(
          //     textBlockData: [
          //       for (Map<String, dynamic> item in detailBlock)
          //         {
          //           ...item,
          //           'icon_color': item['icon_color'] ?? themeColor,
          //         }
          //     ],
          //   ),
        ],
      ),
    );
  }
}

// ***********************************************************
class _HeaderBox extends StatelessWidget {
  final String text;
  final int headerLevel;
  final String themeColor;

  const _HeaderBox(
      {super.key,
      required this.text,
      this.headerLevel = 0,
      required this.themeColor});

  @override
  Widget build(BuildContext context) {
    // If color not found in enum, use a horrible red
    int startColor = colors_used.startColorLookup[themeColor]?[headerLevel] ??
        Colors.red.value;
    int midColor = colors_used.midColorLookup[themeColor]?[headerLevel] ??
        Colors.red.value;
    int endColor = colors_used.endColorLookup[themeColor]?[headerLevel] ??
        Colors.red.value;
    int textColor = colors_used.textColorLookup[themeColor]?[headerLevel] ??
        Colors.black.value;

    return Material(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              height: 30,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(startColor),
                    Color(midColor),
                    Color(endColor),
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: Color(textColor),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ***********************************************************
class _DescriptionText extends StatelessWidget {
  final String? text;
  final int textColor = Colors.black.value;

  _DescriptionText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return Material(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text!,
                  style: TextStyle(
                    color: Color(textColor),
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    wordSpacing: 1.1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ***********************************************************
class _DetailTextBlock extends StatelessWidget {
  final List<Map<String, dynamic>>? textBlockData;

  const _DetailTextBlock({super.key, required this.textBlockData});

  @override
  Widget build(BuildContext context) {
    if (textBlockData != null) {
      return Material(
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 0, bottom: 5, left: 15, right: 15),
                decoration: const BoxDecoration(
                  color: Color(colors_used.paleGrey),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  shrinkWrap: true,
                  itemCount: textBlockData!.length,
                  itemBuilder: (_, int index) {
                    Map<String, dynamic> currentItem = textBlockData![index];
                    switch (currentItem['type']) {
                      case 'heading':
                        {
                          return _DetailTextSubItem(
                            text: currentItem['text'],
                            iconName: currentItem['icon'],
                            iconColor: currentItem['icon_color'],
                            isHeading: true,
                          );
                        }
                      case 'content':
                        {
                          return _DetailTextSubItem(
                            text: currentItem['text'],
                            iconName: currentItem['icon'],
                            iconColor: currentItem['icon_color'],
                          );
                        }
                      case 'indent':
                        {
                          return _DetailTextSubItem(
                            text: currentItem['text'],
                            iconName: currentItem['icon'],
                            iconColor: currentItem['icon_color'],
                            indented: true,
                          );
                        }
                      default:
                        {
                          return Container(color: Colors.red, height: 10);
                        }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox(height: 0, width: 0);
    }
  }
}

// ***********************************************************
class _DetailTextSubItem extends StatelessWidget {
  final String text;
  final String? iconName;
  final String? iconColor;
  final bool indented;
  final bool isHeading;

  const _DetailTextSubItem(
      {super.key,
      required this.text,
      this.iconName,
      this.iconColor,
      this.indented = false,
      this.isHeading = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          child: Padding(
            padding: EdgeInsets.only(left: indented ? 15 : 5),
            child: Icon(
              tool.iconLookup(iconName ?? 'arrow_right'),
              color: Color(colors_used.dotIconColor[iconColor ?? 'purple'] ??
                  Colors.red.value),
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: 5, left: indented ? 25 : 10, top: 5),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: isHeading ? FontWeight.bold : FontWeight.normal,
                  fontSize: 13,
                  wordSpacing: 1.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
