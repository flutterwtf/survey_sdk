import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/app_colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

//ignore_for_file: prefer-static-class
void showExportFloatingWindow(
  BuildContext context, {
  required VoidCallback onDownloadPressed,
  required VoidCallback onCopyPressed,
}) {
  final overlayState = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return ExportFloatingWindow(
        onClosePressed: overlayEntry.remove,
        onDownloadPressed: () {
          onDownloadPressed();
          overlayEntry.remove();
        },
        onCopyPressed: () {
          onCopyPressed();
          overlayEntry.remove();
        },
      );
    },
  );

  overlayState.insert(overlayEntry);
}

@visibleForTesting
class ExportFloatingWindow extends StatelessWidget {
  final VoidCallback onClosePressed;
  final VoidCallback onDownloadPressed;
  final VoidCallback onCopyPressed;

  const ExportFloatingWindow({
    required this.onClosePressed,
    required this.onDownloadPressed,
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
                  onPressed: onClosePressed,
                  icon: const Icon(Icons.close),
                  splashRadius: AppDimensions.sizeS,
                  iconSize: AppDimensions.sizeS,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimensions.marginXS,
                  left: AppDimensions.margin2XL,
                  right: AppDimensions.margin2XL,
                ),
                child: Text(
                  context.localization.export_floating_window_title,
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
                      onPressed: onDownloadPressed,
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
