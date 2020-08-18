class Orgs {
  String name;
  String abbreviation;
  String tagline;
  String website;
  String facebook;
  String twitter;
  String instagram;
  String description;
  String advocacy;
  String core;
  String awards;
  String projectTitleOne;
  String projectDescOne;
  String projectTitleTwo;
  String projectDescTwo;
  String projectTitleThree;
  String projectDescThree;
  String vision;
  String mission;
  String body;
  String logo;
  List<dynamic> cluster;

  Orgs(
      [this.name,
      this.abbreviation,
      this.tagline,
      this.website,
      this.facebook,
      this.twitter,
      this.instagram,
      this.description,
      this.advocacy,
      this.core,
      this.awards,
      this.projectTitleOne,
      this.projectDescOne,
      this.projectTitleTwo,
      this.projectDescTwo,
      this.projectTitleThree,
      this.projectDescThree,
      this.vision,
      this.mission,
      this.body,
      this.logo,
      this.cluster]);

  // Orgs.fromJson(Map<String, dynamic> json) {
  //   cluster = json['Cluster'].cast<String>();
  //   name = json['Name'];
  //   abbreviation = json['Abbreviation'];
  //   tagline = json['Tagline'];
  //   website = json['Website'];
  //   facebook = json['Facebook'];
  //   twitter = json['Twitter'];
  //   instagram = json['Instagram'];
  //   description = json['Description'];
  //   advocacy = json['Advocacy'];
  //   core = json['Core'];
  //   awards = json['Awards'];
  //   projectTitleOne = json['projectTitleOne'];
  //   projectDescOne = json['projectDescOne'];
  //   projectTitleTwo = json['projectTitleTwo'];
  //   projectDescTwo = json['projectDescTwo'];
  //   projectTitleThree = json['projectTitleThree'];
  //   projectDescThree = json['projectDescThree'];
  //   vision = json['Vision'];
  //   mission = json['Mission'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['Cluster'] = this.cluster;
  //   data['Name'] = this.name;
  //   data['Abbreviation'] = this.abbreviation;
  //   data['Tagline'] = this.tagline;
  //   data['Website'] = this.website;
  //   data['Facebook'] = this.facebook;
  //   data['Twitter'] = this.twitter;
  //   data['Instagram'] = this.instagram;
  //   data['Description'] = this.description;
  //   data['Advocacy'] = this.advocacy;
  //   data['Core'] = this.core;
  //   data['Awards'] = this.awards;
  //   data['projectTitleOne'] = this.projectTitleOne;
  //   data['projectDescOne'] = this.projectDescOne;
  //   data['projectTitleTwo'] = this.projectTitleTwo;
  //   data['projectDescTwo'] = this.projectDescTwo;
  //   data['projectTitleThree'] = this.projectTitleThree;
  //   data['projectDescThree'] = this.projectDescThree;
  //   data['Vision'] = this.vision;
  //   data['Mission'] = this.mission;
  //   return data;
  // }
}
