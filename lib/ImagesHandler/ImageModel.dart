
import 'dart:typed_data';

enum ImageApiStatus {
  APICALLEDWAITING,
  APIRESPONCECOMPLETED,
}
class ImageModel {
  final Uint8List? imageData;
  final String url;
  final ImageApiStatus imageApiStatus;

  ImageModel({
    required this.imageData,
    required this.url,
    required this.imageApiStatus,
  });
}