# What eyes_care ? App 

 integrated medical application for ophthalmology 👁️.

 ## Screens of App:
<img src="https://github.com/Malek03/EyeCares-App/blob/8e613068513f757fc46d1910dfa885f3417e55b1/PartTwo/Devlop-Mobile/UI__UX/Screenshot%202024-03-23%20032050.png" alt="Image 1">

## Folder Structure

```
project_root/
│
├── lib/
│   ├── core/
│   │   ├── constants/          
│   │   ├── helper/             
│   │   ├── hive_boxes/         
│   │   ├── services/           
│   │   └── util/               
│
│   ├── coreApi/
│   │   ├── error&success_abstracts/ # معالجة الأخطاء
│   │   ├── network_info/    
│   │   └── dio_service.dart       # إعدادات الاتصال ب API
│
│   ├── features/
│   │   ├── authentication/
│   │   │   ├── data/ # هذه الطبقة مسؤولة عن جلب البيانات وتخزينها. ولا ينبغي أن تكون لها أي تبعيات على طبقة العرض
│   │   │   ├── domain/ #تحتوي هذه الطبقة على منطق الأعمال الأساسي للتطبيق  ولا ينبغي أن يكون لها أي اعتمادعلى طبقات العرض أوالبيانات
│   │   │   └── presentation/  # هذه الطبقة مسؤولة عن واجهة المستخدم والتفاعل مع المستخدم
│   │   │
│   │   ├── diseases/
│   │   │
│   │   ├── posts/
│   │   │
│   │   └── home/
│   │       
│   ├── screen_routes/              # إدارة مسارات الشاشات
│   ├── localization/
│   │   ├── app_localizations.dart  # إعدادات الترجمة
│   │   ├── local_controller.dart   # تحكم في اللغة
│   │   └── translation.dart
│   └── widgets/                    #  عامة
│
│   └── main.dart                 
│
├── assets/
│   ├── fonts/
│   ├── icons/
│   ├── svg/                        
│   └── images/                     
│
└── pubspec.yaml 
```
## Dependencies

- `getx`: <a target="_blank" href="https://pub.dev/packages/get">https://pub.dev/packages/get</a>
- `hive`: <a target="_blank" href="https://pub.dev/packages/hive">https://pub.dev/packages/hive</a>
- `dartz`: <a target="_blank" href="https://pub.dev/packages/dartz">https://pub.dev/packages/dartz</a>
- `dio`: <a target="_blank" href="https://pub.dev/packages/dio">https://pub.dev/packages/dio</a>
- `flutter_otp_text_field`: <a target="_blank" href="https://pub.dev/packages/flutter_otp_text_field">https://pub.dev/packages/flutter_otp_text_field</a>
- `google_sign_in`: <a target="_blank" href="https://pub.dev/packages/google_sign_in">https://pub.dev/packages/google_sign_in</a>
- `google_nav_bar`: <a target="_blank" href="https://pub.dev/packages/google_nav_bar">https://pub.dev/packages/google_nav_bar</a>
- `image_picker`: <a target="_blank" href="https://pub.dev/packages/image_picker">https://pub.dev/packages/image_picker</a>
- 'flutter_svg`: <a target="_blank" href="https://pub.dev/packages/flutter_svg">https://pub.dev/packages/flutter_svg</a>

## Before Running the Project
```bash
flutter clean
flutter pub get