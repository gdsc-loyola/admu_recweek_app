class LIONS {
  String representative;
  String organization;
  String orgLogoPNG;
  String description;
  String advocacy;
  String vision;
  String mission;
  String applicationProcess;
  String featured;
  String photosForEachEvent;
  String tagline;
  String orgPhoto;
  String benefits;
  String flagships;
  String departments;
  String facebook;
  String socMedHandles;

  LIONS(
      {this.representative,
      this.organization,
      this.orgLogoPNG,
      this.description,
      this.advocacy,
      this.vision,
      this.mission,
      this.applicationProcess,
      this.featured,
      this.photosForEachEvent,
      this.tagline,
      this.orgPhoto,
      this.benefits,
      this.flagships,
      this.departments,
      this.facebook,
      this.socMedHandles});

  LIONS.fromJson(Map<String, dynamic> json) {
    representative = json['Representative'];
    organization = json['Organization'];
    orgLogoPNG = json['Org Logo (PNG)'];
    description = json['Description'];
    advocacy = json['Advocacy'];
    vision = json['Vision'];
    mission = json['Mission'];
    applicationProcess = json['Application Process'];
    featured = json['Featured'];
    photosForEachEvent = json['Photos for each event'];
    tagline = json['Tagline'];
    orgPhoto = json['Org Photo'];
    benefits = json['Benefits'];
    flagships = json['Flagships'];
    departments = json['Departments'];
    facebook = json['Facebook'];
    socMedHandles = json['SocMed Handles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Representative'] = this.representative;
    data['Organization'] = this.organization;
    data['Org Logo (PNG)'] = this.orgLogoPNG;
    data['Description'] = this.description;
    data['Advocacy'] = this.advocacy;
    data['Vision'] = this.vision;
    data['Mission'] = this.mission;
    data['Application Process'] = this.applicationProcess;
    data['Featured'] = this.featured;
    data['Photos for each event'] = this.photosForEachEvent;
    data['Tagline'] = this.tagline;
    data['Org Photo'] = this.orgPhoto;
    data['Benefits'] = this.benefits;
    data['Flagships'] = this.flagships;
    data['Departments'] = this.departments;
    data['Facebook'] = this.facebook;
    data['SocMed Handles'] = this.socMedHandles;
    return data;
  }
}
