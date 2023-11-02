class AppRoute {
  static String splash = "/splash";
  static String onboarding = "/onboarding";
  static String login = "/login";

  static String registerName = "/register/name";
  static String registerGender = "/register/gender";
  static String registerAvatar = "/register/avatar";
  static String registerForm = "/register/form";

  static String profile = "/profile";

  static String home = "/home";
  static String post(String id) => "/post/$id";

  static String speakup = "/speak-up";
  static String report = "/speak-up/report";

  static String newPost = "/new-post";
  static String chat = "/chat";
  static String chatRoom(String id) => "/chat/$id";
}
