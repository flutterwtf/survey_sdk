import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/localization/survey_localizations_ext.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';

class SurveyError extends StatelessWidget {
  final List<String> providedErrors;
  final ValueChanged<SurveyErrorState> onDetailsTap;
  final SurveyErrorState errorState;

  const SurveyError({
    required this.providedErrors,
    required this.onDetailsTap,
    required this.errorState,
    super.key,
  });

  SurveyErrorState get _selectableErrorState => switch (errorState) {
        SurveyErrorState.collapsed => SurveyErrorState.stacktrace,
        SurveyErrorState.stacktrace => SurveyErrorState.collapsed,
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (_) => switch (errorState) {
            SurveyErrorState.collapsed => _SurveyErrorTitle(
                errorTitle: context.localization.surveyLoadError,
              ),
            SurveyErrorState.stacktrace => _StacktraceBody(
                providedErrors: providedErrors,
                onDetailsTap: onDetailsTap,
              ),
          },
        ),
        TextButton(
          onPressed: () => onDetailsTap(_selectableErrorState),
          child: Text(
            errorState == SurveyErrorState.stacktrace
                ? context.localization.hideErrorDetails
                : context.localization.showErrorDetails,
          ),
        ),
      ],
    );
  }
}

class _StacktraceBody extends StatelessWidget {
  final List<String> providedErrors;
  final ValueChanged<SurveyErrorState> onDetailsTap;

  const _StacktraceBody({
    required this.providedErrors,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onDetailsTap(SurveyErrorState.collapsed);
        return false;
      },
      child: Expanded(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: SurveyDimensions.marginS,
          ),
          children: [
            _SurveyErrorTitle(
              errorTitle: providedErrors.first,
            ),
            ExpansionTile(
              title: Text(context.localization.damagedJson),
              children: [
                Text(providedErrors.last),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SurveyErrorTitle extends StatelessWidget {
  final String errorTitle;

  const _SurveyErrorTitle({required this.errorTitle});

  @override
  Widget build(BuildContext context) {
    // TODO(dev): May be we should to have text themes (h1, h2, etc.)
    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SurveyDimensions.margin2XS,
        ),
        child: Text(
          errorTitle,
          style: const TextStyle(
            color: SurveyColors.black,
            fontWeight: SurveyFonts.weightBold,
            fontSize: SurveyFonts.sizeXL,
          ),
        ),
      ),
    );
  }
}
