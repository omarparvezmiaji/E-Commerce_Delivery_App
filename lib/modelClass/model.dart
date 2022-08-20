class DashBoardModel {
  var name;
  var imagePath;
  int counter;

  DashBoardModel({this.name, this.imagePath, required this.counter});
}

var demoDashBoardModel = [
  DashBoardModel(
    name: "Complete Delivery",
    imagePath: "assets/dashboard/complet.png",
    counter: 0
  ),
  DashBoardModel(
      name: "Pending Delivery",
      imagePath: "assets/dashboard/pending.png",
      counter: 0
  ),
  DashBoardModel(
      name: "Total Collected",
      imagePath: "assets/dashboard/collection.png",
      counter: 0
  ),
  DashBoardModel(
      name: "Earning",
      imagePath: "assets/dashboard/earning.png",
      counter: 0
  ),
];
// var DashBoard = [
//   demoDashBoardModel [0],
//   demoDashBoardModel [1],
//   demoDashBoardModel [2],
//   demoDashBoardModel [3],
// ];
