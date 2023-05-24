import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  ImageHelper(this._imagePicker, this._imageCropper);

  Future<XFile?> pickImage({
    ImageSource imageSource = ImageSource.camera,
    int imageQuality = 100,
  }) async {
    return await _imagePicker.pickImage(
      source: imageSource,
      imageQuality: imageQuality,
    );
  }

  Future<CroppedFile?> cropImage({
    required XFile file,
    CropStyle cropStyle = CropStyle.circle,
  }) async =>
      await _imageCropper.cropImage(
        sourcePath: file.path,
        cropStyle: cropStyle,
      );
}
