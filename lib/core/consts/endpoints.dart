
class Endpoints{
  Endpoints._();
  static String socketUrl(String username,String token) =>
      "wss://sockets.dev.lask.asparksys.cloud/ws/chat/$username/?token=$token";
   static const  String baseUrl="https://dev.lask.asparksys.cloud/api/";
     //static const  String baseUrl="http://192.168.88.68:8001/api/";

}