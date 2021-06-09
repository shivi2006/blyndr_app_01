class SliderModel{
  
  String imagePath;
  String description;

  SliderModel({this.imagePath, this.description});
  void setImagePath(String getImagePath){
    imagePath = getImagePath;
  }
  void setDescription(String des){
    description = des;
  }
  String getImagePath(){
    return imagePath;
  }
  String getDescription(){
    return description;
  }

}

List<SliderModel> getSlides(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setImagePath("assets/On1.png");
  sliderModel.setDescription("Find new friends who relate to your interests");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.setImagePath("assets/On2.png");
  sliderModel.setDescription("Chat and share");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.setImagePath("assets/On3.png");
  sliderModel.setDescription("Get Started now!");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  return slides;



}