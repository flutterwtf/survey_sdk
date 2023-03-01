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

  // TODO don't use explicit width
  static const double _windowWidth = 420;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.2),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.whitePrimaryBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppDimensions.circularRadiusS,
              ),
            ),
          ),
          width: _windowWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onClosePressed,
                    icon: const Icon(Icons.close),
                    splashRadius: AppDimensions.sizeS,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.marginS,
                  horizontal: AppDimensions.marginL,
                ),
                child: Text(
                  context.localization.export_floating_window_title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: AppFonts.sizeL,
                    fontWeight: AppFonts.weightMedium,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.marginM,
                ),
                child: Icon(
                  //TODO: replace with the one from figma maybe???
                  Icons.task_rounded,
                  size: AppDimensions.sizeXL,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  AppDimensions.marginL,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
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
                    const SizedBox(
                      width: AppDimensions.marginXL,
                    ),
                    Expanded(
                      flex: 2,
                      child: FilledButton(
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
                        child: Text(
                          context.localization.download,
                          style: const TextStyle(
                            fontSize: AppFonts.sizeM,
                            fontWeight: AppFonts.weightBold,
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
