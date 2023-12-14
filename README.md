## Snapshare

### Description
A simplified photo-sharing app for connecting with friends

### Application Download Link
- google drive link

### Demonstration Link
- google drive link

### Features of Snapshare
- User authentication
- Light/dark mode theme

### User Interface
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/112534902/289357962-0ffdc3d2-ab1f-4ea2-875d-543de23a61ad.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20231214%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231214T133347Z&X-Amz-Expires=300&X-Amz-Signature=a384c365d23f6314258d2a526791249207d6e6e855e0bebcff61f9b7560510da&X-Amz-SignedHeaders=host&actor_id=98202630&key_id=0&repo_id=715112234" width="200" height="400" />

### Used Packages
- ```get: ^4.6.6 ```: State management
- ```iconsax: ^0.0.8```: Icon
- ```carousel_slider: ^4.2.1```: Creating interactive and dynamic image galleries
- ```shared_preferences: ^2.2.1```: Storing app settings and small amounts of data.
- ```smart_snackbars: ^1.0.0```: Create highly customized snackbars and toasts
- ```flutter_staggered_grid_view: ^0.7.0```: Provides a collection of grids layouts.
- ```image_picker: ^1.0.4```: Picking images from the image library, and taking new pictures with the camera.
- ```cloud_firestore: ^4.13.5```: NoSQL cloud database to store and sync data
- ```cloud_firestore: ^4.13.5```: Upload and share user generated content, such as images and video,
- ```flutter_easyloading: ^3.0.5```: Widget to show loading/toast


### MVP Structure
```bash
Snap-Share/
├── assets/
│   ├── fonts/
│   ├── icons/
│   └── images/
│       
└── lib/
    ├── application/
    │   ├── app.dart
    │   └── state_holder_binder.dart
    │
    ├── model/
    │   └── demo.dart
    │
    ├── presentation/
    │   └──demo.dart
    │ 
    ├── utils/
    │    ├── colors.dart
    │    ├── constant.dart
    │    ├── image_url.dart
    │    └── theme.dart
    │
    ├── view/ 
    │    ├── screens/
    │    │   ├── auth/
    │    │   │   ├── login_screen.dart
    │    │   │   └── signup_screen.dart
    │    │   ├── first_screen.dart
    │    │   ├── follower_screen.dart
    │    │   ├── following_screen.dart
    │    │   ├── home_screen.dart
    │    │   ├── location_screen.dart
    │    │   ├── main_bottom_navigation_screen.dart
    │    │   ├── main_follower_following.dart
    │    │   ├── message_screen.dart
    │    │   ├── music_screen.dart
    │    │   ├── my_profile_screen.dart
    │    │   ├── new_post_first_screen.dart
    │    │   ├── new_post_second_screen.dart
    │    │   ├── notification_screen.dart  
    │    │   ├── searching_photo_scree.dart
    │    │   ├── splash_screen.dart
    │    │   ├── upload_user_photo_screen.dart
    │    │   └── user_profile_screen.dart
    │    │  
    │    └── widgets/
    │         ├── alert_box.dart
    │         ├── circular_icon_button.dart
    │         ├── comment_tile_model_sheet.dart
    │         ├── home_screen_app_bar.dart
    │         ├── image_data.dart
    │         ├── metarial_button.dart
    │         ├── my_profile_story.dart
    │         ├── notification_with_follow_button.dart
    │         ├── notification_without_follow_button.dart
    │         ├── other_profile_story.dart
    │         ├── profile_created_alert_box.dart
    │         ├── profile_card.dart
    │         ├── text_box_widget.dart
    │         ├── user_profile_gridview_photo.dart
    │         ├── user_post_card.dart
    │         └── user_profile_listview_photo.dart
    │ 
    └── main.dart
```

### Authors
- [Sayman Rifat](https://github.com/saymanrifat)
- [Moniruzzaman](https://github.com/moniruzzaman76)
- [Biplob Shil](https://github.com/BIPLOB-SHIL)
- [Md.Shahadat Hossain](https://github.com/shahadat349850)
- [Faisal Fardin](https://github.com/faisal-fardin)
