class SolarSystemDetails {
  String? id;
  String? name;
  String? englishName;
  bool? isPlanet;
  List<Moons>? moons;
  dynamic semimajorAxis;
  dynamic perihelion;
  dynamic aphelion;
  dynamic eccentricity;
  dynamic inclination;
  Mass? mass;
  Vol? vol;
  dynamic density;
  dynamic gravity;
  dynamic escape;
  dynamic meanRadius;
  dynamic equaRadius;
  dynamic polarRadius;
  dynamic flattening;
  String? dimension;
  dynamic sideralOrbit;
  dynamic sideralRotation;
  dynamic aroundPlanet;
  String? discoveredBy;
  String? discoveryDate;
  String? alternativeName;
  dynamic axialTilt;
  dynamic avgTemp;
  dynamic mainAnomaly;
  dynamic argPeriapsis;
  dynamic longAscNode;
  String? bodyType;

  SolarSystemDetails(
      {this.id,
      this.name,
      this.englishName,
      this.isPlanet,
      this.moons,
      this.semimajorAxis,
      this.perihelion,
      this.aphelion,
      this.eccentricity,
      this.inclination,
      this.mass,
      this.vol,
      this.density,
      this.gravity,
      this.escape,
      this.meanRadius,
      this.equaRadius,
      this.polarRadius,
      this.flattening,
      this.dimension,
      this.sideralOrbit,
      this.sideralRotation,
      this.aroundPlanet,
      this.discoveredBy,
      this.discoveryDate,
      this.alternativeName,
      this.axialTilt,
      this.avgTemp,
      this.mainAnomaly,
      this.argPeriapsis,
      this.longAscNode,
      this.bodyType});

  SolarSystemDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    englishName = json['englishName'];
    isPlanet = json['isPlanet'];
    if (json['moons'] != null) {
      moons = <Moons>[];
      json['moons'].forEach((v) {
        moons!.add(new Moons.fromJson(v));
      });
    }
    semimajorAxis = json['semimajorAxis'];
    perihelion = json['perihelion'];
    aphelion = json['aphelion'];
    eccentricity = json['eccentricity'];
    inclination = json['inclination'];
    mass = json['mass'] != null ? new Mass.fromJson(json['mass']) : null;
    vol = json['vol'] != null ? new Vol.fromJson(json['vol']) : null;
    density = json['density'];
    gravity = json['gravity'];
    escape = json['escape'];
    meanRadius = json['meanRadius'];
    equaRadius = json['equaRadius'];
    polarRadius = json['polarRadius'];
    flattening = json['flattening'];
    dimension = json['dimension'];
    sideralOrbit = json['sideralOrbit'];
    sideralRotation = json['sideralRotation'];
    aroundPlanet = json['aroundPlanet'];
    discoveredBy = json['discoveredBy'];
    discoveryDate = json['discoveryDate'];
    alternativeName = json['alternativeName'];
    axialTilt = json['axialTilt'];
    avgTemp = json['avgTemp'];
    mainAnomaly = json['mainAnomaly'];
    argPeriapsis = json['argPeriapsis'];
    longAscNode = json['longAscNode'];
    bodyType = json['bodyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['isPlanet'] = this.isPlanet;
    if (this.moons != null) {
      data['moons'] = this.moons!.map((v) => v.toJson()).toList();
    }
    data['semimajorAxis'] = this.semimajorAxis;
    data['perihelion'] = this.perihelion;
    data['aphelion'] = this.aphelion;
    data['eccentricity'] = this.eccentricity;
    data['inclination'] = this.inclination;
    if (this.mass != null) {
      data['mass'] = this.mass!.toJson();
    }
    if (this.vol != null) {
      data['vol'] = this.vol!.toJson();
    }
    data['density'] = this.density;
    data['gravity'] = this.gravity;
    data['escape'] = this.escape;
    data['meanRadius'] = this.meanRadius;
    data['equaRadius'] = this.equaRadius;
    data['polarRadius'] = this.polarRadius;
    data['flattening'] = this.flattening;
    data['dimension'] = this.dimension;
    data['sideralOrbit'] = this.sideralOrbit;
    data['sideralRotation'] = this.sideralRotation;
    data['aroundPlanet'] = this.aroundPlanet;
    data['discoveredBy'] = this.discoveredBy;
    data['discoveryDate'] = this.discoveryDate;
    data['alternativeName'] = this.alternativeName;
    data['axialTilt'] = this.axialTilt;
    data['avgTemp'] = this.avgTemp;
    data['mainAnomaly'] = this.mainAnomaly;
    data['argPeriapsis'] = this.argPeriapsis;
    data['longAscNode'] = this.longAscNode;
    data['bodyType'] = this.bodyType;
    return data;
  }
}

class Moons {
  String? moon;
  String? rel;

  Moons({this.moon, this.rel});

  Moons.fromJson(Map<String, dynamic> json) {
    moon = json['moon'];
    rel = json['rel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moon'] = this.moon;
    data['rel'] = this.rel;
    return data;
  }
}

class Mass {
  dynamic massValue;
  dynamic massExponent;

  Mass({this.massValue, this.massExponent});

  Mass.fromJson(Map<String, dynamic> json) {
    massValue = json['massValue'];
    massExponent = json['massExponent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massValue'] = this.massValue;
    data['massExponent'] = this.massExponent;
    return data;
  }
}

class Vol {
  dynamic volValue;
  dynamic volExponent;

  Vol({this.volValue, this.volExponent});

  Vol.fromJson(Map<String, dynamic> json) {
    volValue = json['volValue'];
    volExponent = json['volExponent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['volValue'] = this.volValue;
    data['volExponent'] = this.volExponent;
    return data;
  }
}
