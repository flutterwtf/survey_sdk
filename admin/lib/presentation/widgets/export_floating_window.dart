import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';

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
      color: AppColors.black.withOpacity(opacity),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.whitePrimaryBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.circularRadiusS),
            ),
          ),
          width: AppDimensions.exportWindowWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close),
                  splashRadius: AppDimensions.sizeS,
                  iconSize: AppDimensions.sizeS,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimensions.marginXS,
                  left: AppDimensions.margin2XL,
                  right: AppDimensions.margin2XL,
                ),
                child: Text(
                  context.localization.exportFloatingWindowTitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headLineMediumBold,
                ),
              ),
              const Image(
                image: AssetImage('assets/images/task_completed.png'),
                width: AppDimensions.imageSizeM,
                height: AppDimensions.imageSizeM,
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.marginL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: onCopyPressed,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppColors.white,
                        ),
                        side: MaterialStatePropertyAll(
                          BorderSide(),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppDimensions.circularRadiusXS),
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.sizeL,
                        ),
                        child: Text(
                          context.localization.copy,
                          style: labelLarge?.copyWith(
                            fontFamily: AppFonts.karla,
                          ),
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: onDownload,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppColors.black,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppDimensions.circularRadiusXS),
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.margin5XL,
                        ),
                        child: Text(
                          context.localization.download,
                          style: labelLarge?.copyWith(
                            fontFamily: AppFonts.karla,
                            color: AppColors.white,
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
