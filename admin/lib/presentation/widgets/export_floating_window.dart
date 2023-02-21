import 'package:flutter/material.dart';
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

// TODO use localization
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
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.marginS,
                  horizontal: AppDimensions.marginLargeM,
                ),
                child: Text(
                  'Save generated json-file with all '
                  'settings to use in your app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                  Icons.task_rounded,
                  size: AppDimensions.size2XL,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  AppDimensions.marginLargeM,
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
                        child: const Text(
                          'COPY',
                          style: TextStyle(
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
                        child: const Text(
                          'DOWNLOAD',
                          style: TextStyle(
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
