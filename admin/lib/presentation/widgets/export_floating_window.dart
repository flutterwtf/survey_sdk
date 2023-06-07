import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_sdk/survey_sdk.dart';

//ignore_for_file: prefer-static-class
void showExportFloatingWindow(
  BuildContext context, {
  required VoidCallback onDownloadPressed,
  required VoidCallback onCopy,
}) {
  showDialog(
    context: context,
    builder: (context) => ExportFloatingWindow(
      onClose: () => Navigator.pop(context),
      onDownload: () {
        onDownloadPressed();
        Navigator.pop(context);
      },
      onCopyPressed: () {
        onCopy();
        Navigator.pop(context);
      },
    ),
  );
}

@visibleForTesting
class ExportFloatingWindow extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onDownload;
  final VoidCallback onCopyPressed;

  const ExportFloatingWindow({
    required this.onClose,
    required this.onDownload,
    required this.onCopyPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const opacity = 0.2;
    final labelLarge = context.theme.textTheme.labelLarge;
    return Material(
      color: SurveyColors.black.withOpacity(opacity),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: SurveyColors.whitePrimaryBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(SurveyDimensions.circularRadiusS),
            ),
          ),
          width: SurveyDimensions.exportWindowWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close),
                  splashRadius: SurveyDimensions.sizeS,
                  iconSize: SurveyDimensions.sizeS,
                  color: SurveyColors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: SurveyDimensions.marginXS,
                  left: SurveyDimensions.margin2XL,
                  right: SurveyDimensions.margin2XL,
                ),
                child: Text(
                  context.localization.exportFloatingWindowTitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headLineMediumBold,
                ),
              ),
              const Image(
                image: AssetImage('assets/images/task_completed.png'),
                width: SurveyDimensions.imageSizeM,
                height: SurveyDimensions.imageSizeM,
              ),
              Padding(
                padding: const EdgeInsets.all(SurveyDimensions.marginL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: onCopyPressed,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          SurveyColors.white,
                        ),
                        side: MaterialStatePropertyAll(
                          BorderSide(),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                SurveyDimensions.circularRadiusXS,
                              ),
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SurveyDimensions.sizeL,
                        ),
                        child: Text(
                          context.localization.copy,
                          style: labelLarge?.copyWith(
                            fontFamily: SurveyFonts.karla,
                          ),
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: onDownload,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          SurveyColors.black,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                SurveyDimensions.circularRadiusXS,
                              ),
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SurveyDimensions.margin5XL,
                        ),
                        child: Text(
                          context.localization.download,
                          style: labelLarge?.copyWith(
                            fontFamily: SurveyFonts.karla,
                            color: SurveyColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
