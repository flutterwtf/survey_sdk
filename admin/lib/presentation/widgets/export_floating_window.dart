import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

void showExportFloatingWindow(
  BuildContext context, {
  required VoidCallback onDownloadPressed,
  required VoidCallback onCopyPressed,
}) {
  final overlayState = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return _ExportFloatingWindow(
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

class _ExportFloatingWindow extends StatelessWidget {
  final VoidCallback onClosePressed;
  final VoidCallback onDownloadPressed;
  final VoidCallback onCopyPressed;

  const _ExportFloatingWindow({
    required this.onClosePressed,
    required this.onDownloadPressed,
    required this.onCopyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.2),
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
                  style: const TextStyle(
                    fontSize: AppFonts.sizeL,
                    fontWeight: AppFonts.weightBold,
                  ),
                ),
              ),
              const Image(
                image: AssetImage('images/task_completed.png'),
                width: 150.0,
                height: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.marginL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                      onPressed: onCopyPressed,
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          AppColors.white,
                        ),
                        side: const MaterialStatePropertyAll(
                          BorderSide(
                            color: AppColors.black,
                          ),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppDimensions.circularRadiusXS,
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.sizeL),
                        child: Text(
                          context.localization.copy,
                          style: const TextStyle(
                            fontSize: AppFonts.sizeM,
                            fontWeight: AppFonts.weightBold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: onDownloadPressed,
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          AppColors.black,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppDimensions.circularRadiusXS,
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.margin5XL),
                        child: Text(
                          context.localization.download,
                          style: const TextStyle(
                            fontSize: AppFonts.sizeM,
                            fontWeight: AppFonts.weightMedium,
                            color: AppColors.white,
                            letterSpacing: 0.1,
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
