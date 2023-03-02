import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class PhoneView extends StatelessWidget {
  final Widget child;

  const PhoneView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.greyBackground,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.sizeL),
          child: Stack(
            children: [
              SvgPicture.asset(AppAssets.iphoneImage),
              Positioned.fill(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: AppDimensions.marginL,
                    horizontal: AppDimensions.margin5XL,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimensions.circularRadiusXL),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
