//this class  contains information about  chapters for each subject
class ChapterData {
  String? assigmentt;
  final String chapterName;

  final String chapterDescription;
  final String chapterImage;

  ChapterData({
    this.assigmentt,
    required this.chapterName,
    required this.chapterDescription,
    required this.chapterImage,
  });
}

final List<ChapterData> chapters = [
  ChapterData(
      assigmentt: "Assigment 1",
      chapterName: 'Basic Of Science',
      chapterDescription: 'Basic Of Science Ch1',
      chapterImage: 'assets/basicogscience.png'),
  ChapterData(
      assigmentt: "Assigment 2",
      chapterName: 'Chapter 2',
      chapterDescription: 'Intro of  Chapter',
      chapterImage: 'assets/introofch2.png'),
  ChapterData(
      assigmentt: " Assigment 2",
      chapterName: 'Chapter 3',
      chapterDescription: 'Intro of  Chapter 3',
      chapterImage: 'assets/sience.png'),
];
