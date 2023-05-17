import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/utils/utils.dart';

const _marginHorizontal = 24.0;
const _marginVertical = 21.0;

class PhoneView extends StatelessWidget {
  final Widget child;

  const PhoneView({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.greyBackground,
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.sizeL),
            child: Stack(
              children: [
                SvgPicture.asset(AppAssets.iphoneImage),
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: _marginVertical,
                      horizontal: _marginHorizontal,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppDimensions.circularRadiusXL),
                      ),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
