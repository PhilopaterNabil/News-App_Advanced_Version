abstract class APIConsumer {

  Future get (
    String path , 
    {
      Object? data ,
    Map<String , dynamic>?  queryParameters , 
    }
  );

  Future post (
    String path , 
    
    {
    Object? data ,
    Map<String , dynamic>?  queryParameters ,
    bool isFromData = true , 
    }
  );

  Future patch (
    String path , 
    {
    Object? data ,
    Map<String , dynamic>?  queryParameters ,
    bool isFromData = true , 
    }
  );


  Future delete (
    String path , 
    {
    Object? data ,
    Map<String , dynamic>?  queryParameters ,
    bool isFromData = true , 
    }
  );  

}