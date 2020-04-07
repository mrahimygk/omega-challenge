class ApiResponse {
  List<Notification> list;
  Page page;
  String time;

  ApiResponse({this.list, this.page, this.time});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<Notification>();
      json['list'].forEach((v) {
        list.add(new Notification.fromJson(v));
      });
    }
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Notification {
  int articleId;
  String title;
  String content;
  Null description;
  Null url;
  String userDisplayName;
  int shortDescriptionLenght;
  int shortTitleLenght;
  String publishDate;
  String createDate;
  String approvedDate;
  String expireDate;
  String updateDate;
  String lastViewDate;
  String shamsiPublishDate;
  String shamsiCreateDate;
  String shamsiApprovedDate;
  String shamsiExpireDate;
  String shamsiUpdateDate;
  String shamsiLastViewDate;
  String createByUser;
  String approvedByUser;
  List<ExtraFieldValues> extraFieldValues;
  Null relatedUrl;
  Category category;
  String categoryName;
  Null imageUrl;
  int voteTotal;
  int voteNumber;
  int poId;
  String portalId;
  bool hasSeen;

  Notification(
      this.articleId,
      this.title,
      this.content,
      this.description,
      this.url,
      this.userDisplayName,
      this.shortDescriptionLenght,
      this.shortTitleLenght,
      this.publishDate,
      this.createDate,
      this.approvedDate,
      this.expireDate,
      this.updateDate,
      this.lastViewDate,
      this.shamsiPublishDate,
      this.shamsiCreateDate,
      this.shamsiApprovedDate,
      this.shamsiExpireDate,
      this.shamsiUpdateDate,
      this.shamsiLastViewDate,
      this.createByUser,
      this.approvedByUser,
      this.extraFieldValues,
      this.relatedUrl,
      this.category,
      this.categoryName,
      this.imageUrl,
      this.voteTotal,
      this.voteNumber,
      this.poId,
      this.portalId,
      this.hasSeen);

  Notification.fromJson(Map<String, dynamic> json) {
    articleId = json['ArticleId'];
    title = json['Title'];
    content = json['Content'];
    description = json['Description'];
    url = json['Url'];
    userDisplayName = json['UserDisplayName'];
    shortDescriptionLenght = json['ShortDescriptionLenght'];
    shortTitleLenght = json['ShortTitleLenght'];
    publishDate = json['PublishDate'];
    createDate = json['CreateDate'];
    approvedDate = json['ApprovedDate'];
    expireDate = json['ExpireDate'];
    updateDate = json['UpdateDate'];
    lastViewDate = json['LastViewDate'];
    shamsiPublishDate = json['ShamsiPublishDate'];
    shamsiCreateDate = json['ShamsiCreateDate'];
    shamsiApprovedDate = json['ShamsiApprovedDate'];
    shamsiExpireDate = json['ShamsiExpireDate'];
    shamsiUpdateDate = json['ShamsiUpdateDate'];
    shamsiLastViewDate = json['ShamsiLastViewDate'];
    createByUser = json['CreateByUser'];
    approvedByUser = json['ApprovedByUser'];
    if (json['ExtraFieldValues'] != null) {
      extraFieldValues = new List<ExtraFieldValues>();
      json['ExtraFieldValues'].forEach((v) {
        extraFieldValues.add(new ExtraFieldValues.fromJson(v));
      });
    }
    relatedUrl = json['RelatedUrl'];
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
    categoryName = json['CategoryName'];
    imageUrl = json['ImageUrl'];
    voteTotal = json['VoteTotal'];
    voteNumber = json['VoteNumber'];
    poId = json['PoId'];
    portalId = json['PortalId'];
    hasSeen = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ArticleId'] = this.articleId;
    data['Title'] = this.title;
    data['Content'] = this.content;
    data['Description'] = this.description;
    data['Url'] = this.url;
    data['UserDisplayName'] = this.userDisplayName;
    data['ShortDescriptionLenght'] = this.shortDescriptionLenght;
    data['ShortTitleLenght'] = this.shortTitleLenght;
    data['PublishDate'] = this.publishDate;
    data['CreateDate'] = this.createDate;
    data['ApprovedDate'] = this.approvedDate;
    data['ExpireDate'] = this.expireDate;
    data['UpdateDate'] = this.updateDate;
    data['LastViewDate'] = this.lastViewDate;
    data['ShamsiPublishDate'] = this.shamsiPublishDate;
    data['ShamsiCreateDate'] = this.shamsiCreateDate;
    data['ShamsiApprovedDate'] = this.shamsiApprovedDate;
    data['ShamsiExpireDate'] = this.shamsiExpireDate;
    data['ShamsiUpdateDate'] = this.shamsiUpdateDate;
    data['ShamsiLastViewDate'] = this.shamsiLastViewDate;
    data['CreateByUser'] = this.createByUser;
    data['ApprovedByUser'] = this.approvedByUser;
    if (this.extraFieldValues != null) {
      data['ExtraFieldValues'] =
          this.extraFieldValues.map((v) => v.toJson()).toList();
    }
    data['RelatedUrl'] = this.relatedUrl;
    if (this.category != null) {
      data['Category'] = this.category.toJson();
    }
    data['CategoryName'] = this.categoryName;
    data['ImageUrl'] = this.imageUrl;
    data['VoteTotal'] = this.voteTotal;
    data['VoteNumber'] = this.voteNumber;
    data['PoId'] = this.poId;
    data['PortalId'] = this.portalId;
    data['hasSeen'] = this.hasSeen;
    return data;
  }
}

class ExtraFieldValues {
  int extraFieldId;
  String fieldValue;

  ExtraFieldValues({this.extraFieldId, this.fieldValue});

  ExtraFieldValues.fromJson(Map<String, dynamic> json) {
    extraFieldId = json['ExtraFieldId'];
    fieldValue = json['FieldValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ExtraFieldId'] = this.extraFieldId;
    data['FieldValue'] = this.fieldValue;
    return data;
  }
}

class Category {
  String categoryName;
  int categoryId;

  Category({this.categoryName, this.categoryId});

  Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['CategoryName'];
    categoryId = json['CategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryName'] = this.categoryName;
    data['CategoryId'] = this.categoryId;
    return data;
  }
}

class Page {
  int currentPageNumber;
  int totalItemNumber;
  int itemPerPage;
  int endPageNumber;
  int prePageNumber;
  int nextPageNumber;

  Page(
      {this.currentPageNumber,
      this.totalItemNumber,
      this.itemPerPage,
      this.endPageNumber,
      this.prePageNumber,
      this.nextPageNumber});

  Page.fromJson(Map<String, dynamic> json) {
    currentPageNumber = json['CurrentPageNumber'];
    totalItemNumber = json['TotalItemNumber'];
    itemPerPage = json['ItemPerPage'];
    endPageNumber = json['EndPageNumber'];
    prePageNumber = json['PrePageNumber'];
    nextPageNumber = json['NextPageNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CurrentPageNumber'] = this.currentPageNumber;
    data['TotalItemNumber'] = this.totalItemNumber;
    data['ItemPerPage'] = this.itemPerPage;
    data['EndPageNumber'] = this.endPageNumber;
    data['PrePageNumber'] = this.prePageNumber;
    data['NextPageNumber'] = this.nextPageNumber;
    return data;
  }
}
