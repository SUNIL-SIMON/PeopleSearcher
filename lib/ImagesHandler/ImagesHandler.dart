import 'dart:typed_data';

import '../ExceptionHandler/AppException.dart';
import '../ServerRequests/ServerRequestHandler.dart';
import 'ImageModel.dart';



class ImagesHandler {
  ImagesHandler._privateConstructor();
  final urlRequestHandler = ServerRequestsHandler() ;
  final totalImagesPoolSize = 100;
  Map<String, ImageModel> imagesCache = {};
  List<String> imagesIdList = [];
  static final ImagesHandler _instance = ImagesHandler._privateConstructor();

  factory ImagesHandler() {
    return _instance;
  }

  Uint8List? getImage(String url,Function(String errorMessage)? onError,Function(bool success) onComplete) {
    if(imagesCache.containsKey(url)) {
      if (imagesCache[url]?.imageApiStatus == ImageApiStatus.APICALLEDWAITING) {
        return null;
      }
      if (imagesCache[url]?.imageApiStatus == ImageApiStatus.APIRESPONCECOMPLETED) {
        return imagesCache[url]?.imageData;
      }
    }
    else {
      imagesCache[url] = ImageModel(imageData: null, url: url, imageApiStatus: ImageApiStatus.APICALLEDWAITING);
      urlRequestHandler.makeImageRequest(url,(imageData,error) {
        if(error == null ){
          if(imagesIdList.length > totalImagesPoolSize){
            imagesCache.remove(imagesIdList[0]);
            imagesIdList.removeAt(0);
          }
          else{
            imagesCache[url] = ImageModel(imageData: imageData, url: url, imageApiStatus: ImageApiStatus.APIRESPONCECOMPLETED);
            imagesIdList.add(url);
          }
          onComplete(true);
        }
        else{
          if (onError != null) {
            onError!(AppException.handleException(error,null).alertmessage);
          }
        }
      });
      return null;
    }
  }

}