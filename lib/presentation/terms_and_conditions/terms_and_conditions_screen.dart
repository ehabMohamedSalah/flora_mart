import 'dart:convert';
import 'package:flora_mart/config/theme/app_theme.dart';
import 'package:flora_mart/core/resuable_comp/app_bar.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  Future<Map<String, dynamic>> loadAboutUsJson() async {
    final String jsonString = await rootBundle.loadString(
        'assets/articles/Flowery Terms and Conditions JSON with Arabic and English.json');
    return jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    String languageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppBarWidget(
              onpressed: () {
                Navigator.pop(context, true);
              },
              title: AppStrings.termsandConditions,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.white70,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: FutureBuilder<Map<String, dynamic>>(
                  future: loadAboutUsJson(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 30,
                              color: ColorManager.red,
                            ),
                            Text(
                              languageCode == 'ar'
                                  ? 'حدث خطأ أثناء تحميل البيانات'
                                  : 'An error occurred while loading data',
                              style: AppTheme.lightTheme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    } else {
                      final termsAndConditionsSections = snapshot
                          .data?['terms_and_conditions'] as List<dynamic>;

                      return ListView.builder(
                        itemCount: termsAndConditionsSections.length,
                        itemBuilder: (context, index) {
                          final section = termsAndConditionsSections[index];
                          final content = section['content'];
                          final style = section['style'];

                          if (content is String) {
                            return buildTextWidget(
                                content, style, languageCode);
                          } else if (content is Map) {
                            final value = content[languageCode];
                            if (value is String) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child:
                                    buildTextWidget(value, style, languageCode),
                              );
                            } else if (value is List) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(value.length, (i) {
                                    return buildTextWidget(
                                        value[i], style, languageCode);
                                  }),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          } else {
                            return const SizedBox();
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildTextWidget(String text, dynamic style, String languageCode) {
    double fontSize = 16;
    FontWeight fontWeight = FontWeight.normal;
    Color color = Colors.black;
    TextAlign textAlign = TextAlign.left;

    if (style != null) {
      fontSize = (style['fontSize'] ?? 16).toDouble();

      final fontWeightStr = style['fontWeight'] ?? 'normal';
      if (fontWeightStr == 'bold') {
        fontWeight = FontWeight.bold;
      }

      final colorHex = style['color'];
      if (colorHex != null) {
        color = Color(int.parse(colorHex.replaceFirst('#', '0xff')));
      }

      final alignMap = style['textAlign'];
      if (alignMap != null && alignMap is Map) {
        final alignStr = alignMap[languageCode];
        textAlign = getTextAlign(alignStr);
      }
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  TextAlign getTextAlign(String? alignStr) {
    switch (alignStr) {
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      case 'left':
      default:
        return TextAlign.left;
    }
  }
}
