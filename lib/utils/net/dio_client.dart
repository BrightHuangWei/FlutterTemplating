import 'package:dio/dio.dart';
import '../../config/api.dart';
import '../../global_store/store.dart';

typedef ProgressCallback = void Function(int count, int total);

///
/// * @Author HuangWei
/// * @Time 2019-11-21 09:25
/// * @Description Dio网络请求插件的简单封装，文档在 https://github.com/flutterchina/dio/blob/master/README-ZH.md
///

class DioClient {
  static var _token =
      GlobalStore.store.getState().accountInfo?.authorization ?? '';
  static var _options = new BaseOptions(
    baseUrl: Api.getHost(),
    connectTimeout: 5000,
    receiveTimeout: 100000,
    headers: {
      "Authorization": _token,
    },

    /// The request Content-Type. The default value is "application/json; charset=utf-8".
    /// If you want to encode request body with "application/x-www-form-urlencoded",
    /// you can set [Headers.formUrlEncodedContentType], and [Dio]
    /// will automatically encode the request body.
//    contentType: Headers.formUrlEncodedContentType,

    /// [responseType] indicates the type of data that the server will respond with
    /// options which defined in [ResponseType] are `JSON`, `STREAM`, `PLAIN`.
    ///
    /// The default value is `JSON`, dio will parse response string to json object automatically
    /// when the content-type of response is "application/json".
    ///
    /// If you want to receive response data with binary bytes, for example,
    /// downloading a image, use `STREAM`.
    ///
    /// If you want to receive the response data with String, use `PLAIN`.
    responseType: ResponseType.json,
  );

  static getOptions() {
    return _options;
  }

  static Dio dio = Dio(_options);

  static Dio getInstance() {
    if (dio == null) dio = new Dio(_options);
    return dio;
  }

  ///Get
  static get(url, {Map<String, dynamic> params}) async {
    Response response;
    try {
      if (params != null && params.isNotEmpty)
        response = await getInstance().get(url, queryParameters: params);
      else
        response = await getInstance().get(url);
//      print('Get请求成功!response.data：${response.data}');

//      print('Get请求成功! url = $url');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('Get请求取消! ' + e.message);
      }
      print('Get请求发生错误：$e');

      print('Get token：$_token');
      print('Get URL：$url');
    }

    return response?.data ?? <String, dynamic>{};
  }

  ///Post
  static post(url,
      {Map<String, dynamic> mapData, ProgressCallback onSendProgress}) async {
    Response response;
    try {
      if (mapData != null && mapData.isNotEmpty)
        response = await getInstance().post(url,
            data: FormData.fromMap(mapData), onSendProgress: onSendProgress);
      else
        response =
            await getInstance().post(url, onSendProgress: onSendProgress);
//      print('Get请求成功!response.data：${response.data}');

//      print('Post请求成功! url = $url');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('Post请求取消! ' + e.message);
      }
      print('Post请求发生错误：$e');
    }

    return response?.data ?? <String, dynamic>{};
  }
}
