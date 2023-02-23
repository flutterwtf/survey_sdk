import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/utils/constants/image_constants.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';

const _title = 'New screen';
const _tabs = [
  'Intro',
  'Single choice',
  'Multiple choice',
  'Custom input',
];
const _optionsInTabs = {
  'Intro': ['Title', 'Image intro'],
  'Single choice': ['Radio button', 'Slider'],
  'Multiple choice': ['Check box'],
  'Custom input': ['Single-line input', 'Multi-line input'],
};

const Map<String, String> _optionsAssets = {
  'Title': AppAssets.introImage,
  'Image intro': AppAssets.imageIntroImage,
  'Radio button': AppAssets.radioButtonImage,
  'Slider': AppAssets.sliderImage,
  'Check box': AppAssets.checkBoxImage,
  'Single-line input': AppAssets.singleLineInputImage,
  'Multi-line input': AppAssets.multiLineInputImage,
};

class NewQuestionPage extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  const NewQuestionPage({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<NewQuestionPage> createState() => _NewQuestionPageState();
}

class _NewQuestionPageState extends State<NewQuestionPage> {
  String _selectedTab = _tabs[0];
  String? _selectedOption;

  Widget _questionTab(String tabTitle) {
    return _TabButton(
      title: tabTitle,
      onTap: () {
        setState(
              () => _selectedTab = tabTitle,
        );
      },
      isSelected: _selectedTab == tabTitle ? true : false,
    );
  }

  @override
  //TODO: split
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppDimensions.appbarSize),
          child: AppBar(
            toolbarHeight: AppDimensions.appbarSize,
            backgroundColor: AppColors.white,
            shadowColor: AppColors.transparentW,
            automaticallyImplyLeading: false,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _title,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppFonts.sizeM,
                  fontWeight: AppFonts.weightRegular,
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin:
                      const EdgeInsets.only(right: AppDimensions.marginXL),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: VectorImage(assetName: AppAssets.closeIcon),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.margin2XS,
            horizontal: AppDimensions.marginM,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _tabs.map(_questionTab).toList(),
              ),
              Expanded(
                child: _QuestionOptionsListView(
                  options: _optionsInTabs[_selectedTab] ?? [],
                  selectedOption: _selectedOption ?? '',
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          _AddButton(
            onPressed:() {
              widget.onSubmit(_selectedTab);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const _TabButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(top: AppDimensions.sizeM),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: AppFonts.sizeL,
            fontWeight:
                isSelected ? AppFonts.weightBold : AppFonts.weightRegular,
          ),
        ),
      ),
    );
  }
}

class _QuestionOptionsListView extends StatelessWidget {
  final List<String> options;
  final String selectedOption;

  const _QuestionOptionsListView({
    Key? key,
    required this.options,
    required this.selectedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: options.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return _AssetTextOption(
          assetName: _optionsAssets[options[index]] ?? '',
          titleText: options[index],
        );
      },
    );
  }
}

class _AssetTextOption extends StatelessWidget {
  final String assetName;
  final String titleText;

  const _AssetTextOption({
    Key? key,
    required this.assetName,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.margin4XL),
      padding: const EdgeInsets.all(AppDimensions.marginXS),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VectorImage(assetName: assetName),
          const SizedBox(height: AppDimensions.marginXL),
          Text(
            titleText,
            style: const TextStyle(
              fontSize: AppFonts.sizeL,
              fontWeight: AppFonts.weightMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 34,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(AppDimensions.circularRadiusXS),
        ),
        child: const Center(
          child: Text(
            'ADD',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: AppFonts.weightBold,
            ),
          ),
        ),
      ),
    );
  }
}
