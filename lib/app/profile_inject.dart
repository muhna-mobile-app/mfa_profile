import 'package:common_dependencies/common_dependencies.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'presentation/helpers/image_helper.dart';

class ProfileInjection {
  static void init(GetIt getIt) {
    getIt.registerSingleton<ImagePicker>(ImagePicker());
    getIt.registerSingleton<ImageCropper>(ImageCropper());

    getIt.registerSingleton<ImageHelper>(ImageHelper(
      getIt.get<ImagePicker>(),
      getIt.get<ImageCropper>(),
    ));
  }
}
