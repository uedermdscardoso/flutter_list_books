
class News {
  String title;
  String link;
  String pubDate;
  String description;

  News({this.title, this.link, this.pubDate, this.description});

  factory News.fromJson(News news){
    return News(
      title: news.title,
      link: news.link,
      pubDate: news.pubDate,
      description: news.description
    );
  }
}