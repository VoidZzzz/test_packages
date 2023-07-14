import 'package:get/get.dart';

import 'models/profile_model.dart';

class CustomAnimationController extends GetxController{
  List<ProfileModel> superStarLists = [
    ProfileModel("https://imgresizer.eurosport.com/unsafe/1200x0/filters:format(jpeg):focal(1206x513:1208x511)/origin-imgresizer.eurosport.com/2023/02/27/3586243-73034028-2560-1440.jpg", "Lionel Messi", 5.0, 900, ""),
    ProfileModel("https://media.cnn.com/api/v1/images/stellar/prod/230602093946-01-cristiano-ronaldo-happy-saudi.jpg?c=3x2", "Ronaldo", 5.0, 900, ""),
    ProfileModel("https://imageio.forbes.com/specials-images/imageserve/64a2282f8915731ce78aa486/Brazil-v-Colombia/960x0.jpg?format=jpg&width=960", "Neymar Jr", 4.5, 700, ""),
    ProfileModel("https://images.indianexpress.com/2017/02/ronaldinho-m.jpeg", "Ronaldinho", 4.9, 600, ""),
    ProfileModel("https://cdn-s-www.ledauphine.com/images/C8D254FB-1138-4CEE-92E4-E9E9D07AD3F8/NW_raw/photo-maxppp-stephane-guiochon-1655920518.jpg", "Zidane", 4.9, 700, ""),
  ];
}