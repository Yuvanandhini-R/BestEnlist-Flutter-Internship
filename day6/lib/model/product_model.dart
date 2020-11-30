class ProductModel {
  final String image;
  final String title;
  final String shortDescription;
  final String longDescription;
  final double price;

  const ProductModel(this.image, this.title, this.shortDescription,
      this.longDescription, this.price);
}

const productModelsData = [
  ProductModel(
      "images/rubiks_cube.jpg",
      "Rubik's Cube",
      "Twist Your Brain",
      "Every twist you make on the cube will twist your brain and sharpen your mind.",
      100),
  ProductModel("images/pencils.jpg", "Color Pencils", "As Colorful As Rainbow",
      "Express your hidden artist inside you in a creative manner.", 50),
  ProductModel("images/clock.jpg", "Mini Clock", "Mini and Cute",
      "The Clock is Mini but your time is not!", 75),
];
