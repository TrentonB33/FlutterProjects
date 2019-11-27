class Story {
  String storyTitle;
  String choice1;
  String choice2;
  List<int> _choices = List.filled(
    2,
    -2,
    growable: false,
  );

  Story({this.storyTitle, this.choice1, this.choice2});

  //Basically, keep a record of where your story links to.
  void addLeg(int choice, int storyChoice) {
    if (choice >= 0 || choice < 2) {
      _choices[choice] = storyChoice;
    }
  }

  int getNextChoice(int choice) {
    if (choice >= 0 || choice < 2) {
      return _choices[choice];
    }
    return -1;
  }
}
