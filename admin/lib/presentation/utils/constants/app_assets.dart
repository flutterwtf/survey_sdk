// TODO(dev): Use export for constants

abstract class AppAssets {
  static const _assetsFolder = 'assets/';
  static const _imagesFolder = '${_assetsFolder}images/';
  static const _iconsFolder = '${_assetsFolder}icons/';

  ///icons
  static const String closeIcon = '${_iconsFolder}close_icon.svg';
  static const String addCircleIcon = '${_iconsFolder}add_circle_icon.svg';
  static const String arcIcon = '${_iconsFolder}arc_icon.svg';
  static const String arrowIcon = '${_iconsFolder}arrow_icon.svg';

  ///images
  static const String checkBoxImage = '${_imagesFolder}check_box_image.svg';
  static const String imageIntroImage = '${_imagesFolder}image_intro_image.svg';
  static const String introImage = '${_imagesFolder}intro_image.svg';
  static const String multiLineInputImage =
      '${_imagesFolder}multi_line_input_image.svg';
  static const String radioButtonImage =
      '${_imagesFolder}radio_button_image.svg';
  static const String singleLineInputImage =
      '${_imagesFolder}single_line_input_image.svg';
  static const String sliderImage = '${_imagesFolder}slider_image.svg';
  static const String iphoneImage = '${_imagesFolder}iphone_image.svg';
}