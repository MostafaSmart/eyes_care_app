import 'package:eyes_care_app/core_api/dio_service.dart';
import '../models/pos_model.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getAllPosts();

  // نوع الارجاع اما لا شيء والتي تعني نجاح العملية او فشل
  Future<void> updatePost(PostModel post);
  Future<void> deletePost(int id);
  Future<void> addPost(PostModel post);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  DioService dio = DioService();
  @override
  Future<List<PostModel>> getAllPosts() async {
    final jsonString = {
      "posts": [
        {
          "id": 1,
          "name": "الدكتور اكرم الصباري",
          "content":
              "المياه الزرقاء هي حالة طبية تؤثر على العين وتسبب زيادة الضغط داخل العين. قد تؤدي إلى فقدان البصر إذا لم يتم علاجها في الوقت المناسب. من الأعراض الشائعة للمياه الزرقاء الشعور بألم أو إجهاد في العين، الرؤية المشوشة، والصداع. يمكن علاج المياه الزرقاء بالأدوية أو الجراحة، وتهدف هذه الخيارات إلى خفض الضغط داخل العين والمحافظة على البصر.",
          "imageUrl": "assets/images/post.jpg",
          "date": "2024-06-13",
          "user_id": 123,
          "likesCount": 50
        },
        {
          "id": 2,
          "name": "الدكتور رشيد",
          "content":
              "المياه الزرقاء هي حالة طبية تؤثر على العين وتسبب زيادة الضغط داخل العين. قد تؤدي إلى فقدان البصر إذا لم يتم علاجها في الوقت المناسب. من الأعراض الشائعة للمياه الزرقاء الشعور بألم أو إجهاد في العين، الرؤية المشوشة، والصداع. يمكن علاج المياه الزرقاء بالأدوية أو الجراحة، وتهدف هذه الخيارات إلى خفض الضغط داخل العين والمحافظة على البصر.",
          "imageUrl": "assets/images/post.jpg",
          "date": "2024-06-13",
          "user_id": 123,
          "likesCount": 29
        },
        {
          "id": 3,
          "name": "الدكتور عادل العفيري",
          "content":
              "المياه الزرقاء هي حالة طبية تؤثر على العين وتسبب زيادة الضغط داخل العين. قد تؤدي إلى فقدان البصر إذا لم يتم علاجها في الوقت المناسب. من الأعراض الشائعة للمياه الزرقاء الشعور بألم أو إجهاد في العين، الرؤية المشوشة، والصداع. يمكن علاج المياه الزرقاء بالأدوية أو الجراحة، وتهدف هذه الخيارات إلى خفض الضغط داخل العين والمحافظة على البصر.",
          "imageUrl": "assets/images/post.jpg",
          "date": "2024-06-13",
          "user_id": 123,
          "likesCount": 520
        },
        {
          "id": 4,
          "name": "الدكتور عادل العفيري",
          "content":
              "المياه الزرقاء هي حالة طبية تؤثر على العين وتسبب زيادة الضغط داخل العين. قد تؤدي إلى فقدان البصر إذا لم يتم علاجها في الوقت المناسب. من الأعراض الشائعة للمياه الزرقاء الشعور بألم أو إجهاد في العين، الرؤية المشوشة، والصداع. يمكن علاج المياه الزرقاء بالأدوية أو الجراحة، وتهدف هذه الخيارات إلى خفض الضغط داخل العين والمحافظة على البصر.",
          "imageUrl": "assets/images/post.jpg",
          "date": "2024-06-13",
          "user_id": 123,
          "likesCount": 520
        },
        {
          "id": 5,
          "name": "الدكتور عادل العفيري",
          "content":
              "المياه الزرقاء هي حالة طبية تؤثر على العين وتسبب زيادة الضغط داخل العين. قد تؤدي إلى فقدان البصر إذا لم يتم علاجها في الوقت المناسب. من الأعراض الشائعة للمياه الزرقاء الشعور بألم أو إجهاد في العين، الرؤية المشوشة، والصداع. يمكن علاج المياه الزرقاء بالأدوية أو الجراحة، وتهدف هذه الخيارات إلى خفض الضغط داخل العين والمحافظة على البصر.",
          "imageUrl": "assets/images/post.jpg",
          "date": "2024-06-13",
          "user_id": 123,
          "likesCount": 520
        },
      ]
    };

    final List<PostModel> posts = (jsonString['posts'] as List)
        .map((postData) => PostModel.fromJson(postData))
        .toList();
    return posts;
  }

  @override
  Future<void> addPost(PostModel post) {
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(PostModel post) {
    throw UnimplementedError();
  }

  // Future<ApiResponseModel> _handleRequest(
  //     {required String method, required String endpoint, Object? data}) async {
  //   ApiResponseModel response;
  //   if (method == "get") {
  //     response = await dio.get(endpoint);
  //   } else if (method == "post") {
  //     response = await dio.post(endpoint, data);
  //   } else if (method == "delete") {
  //     // response = await dio.delete(endpoint);
  //   } else {
  //     response = ApiResponseModel(
  //         status: false, message: "Not Specific method to send request");
  //   }

  //   if (response.status) {
  //     AppPrint.printInfo(
  //         "::: S End handleRequest func in comment_remote_datasource");
  //     return response;
  //   }
  //   AppPrint.printError(
  //       "::: F End handleRequest func in comment_remote_datasource: ${response.message}");
  //   throw AppException(ServerFailure(message: response.message));
  // }

}
