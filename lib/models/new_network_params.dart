// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class NewNetworkParams {
  String version;
  String consensus;
  List<OrgItemParams> orgs;
  ChannelDetails channelDetails;
  CloudConfig cloudConfig;

  NewNetworkParams({
    required this.version,
    required this.consensus,
    required this.orgs,
    required this.channelDetails,
    required this.cloudConfig,
  });

  NewNetworkParams.empty()
      : version = '',
        consensus = '',
        orgs = [],
        channelDetails = ChannelDetails(),
        cloudConfig = CloudConfig();

  NewNetworkParams copyWith({
    String? version,
    String? consensus,
    List<OrgItemParams>? orgs,
    ChannelDetails? channelDetails,
    CloudConfig? cloudConfig,
  }) {
    return NewNetworkParams(
      version: version ?? this.version,
      consensus: consensus ?? this.consensus,
      orgs: orgs ?? this.orgs,
      channelDetails: channelDetails ?? this.channelDetails,
      cloudConfig: cloudConfig ?? this.cloudConfig,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'consensus': consensus,
      'orgs': orgs.map((x) => x.toMap()).toList(),
      'channelDetails': channelDetails.toMap(),
      'cloudConfig': cloudConfig.toMap(),
    };
  }

  factory NewNetworkParams.fromMap(Map<String, dynamic> map) {
    return NewNetworkParams(
      version: map['version'] as String,
      consensus: map['consensus'] as String,
      orgs: List<OrgItemParams>.from(
        (map['orgs'] as List<int>).map<OrgItemParams>(
          (x) => OrgItemParams.fromMap(x as Map<String, dynamic>),
        ),
      ),
      channelDetails:
          ChannelDetails.fromMap(map['channelDetails'] as Map<String, dynamic>),
      cloudConfig:
          CloudConfig.fromMap(map['cloudConfig'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewNetworkParams.fromJson(String source) =>
      NewNetworkParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewNetworkParams(version: $version, consensus: $consensus, orgs: $orgs, channelDetails: $channelDetails, cloudConfig: $cloudConfig)';
  }

  @override
  bool operator ==(covariant NewNetworkParams other) {
    if (identical(this, other)) return true;

    return other.version == version &&
        other.consensus == consensus &&
        listEquals(other.orgs, orgs) &&
        other.channelDetails == channelDetails &&
        other.cloudConfig == cloudConfig;
  }

  @override
  int get hashCode {
    return version.hashCode ^
        consensus.hashCode ^
        orgs.hashCode ^
        channelDetails.hashCode ^
        cloudConfig.hashCode;
  }
}

class OrgItemParams {
  String name;
  String username;
  String password;
  bool isPersistent;
  int volumeSize;
  List<Orderer> orderers;
  List<Peer> peers;
  CSR? csr;
  OrgItemParams({
    this.name = '',
    this.username = '',
    this.password = '',
    this.isPersistent = false,
    this.volumeSize = 0,
    this.orderers = const [],
    this.peers = const [],
    this.csr,
  });

  OrgItemParams copyWith({
    String? name,
    String? username,
    String? password,
    bool? isPersistent,
    int? volumeSize,
    List<Orderer>? orderers,
    List<Peer>? peers,
    CSR? csr,
  }) {
    return OrgItemParams(
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
      isPersistent: isPersistent ?? this.isPersistent,
      volumeSize: volumeSize ?? this.volumeSize,
      orderers: orderers ?? this.orderers,
      peers: peers ?? this.peers,
      csr: csr ?? this.csr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'password': password,
      'isPersistent': isPersistent,
      'volumeSize': volumeSize,
      'orderers': orderers.map((x) => x.toMap()).toList(),
      'peers': peers.map((x) => x.toMap()).toList(),
      'csr': csr?.toMap(),
    };
  }

  factory OrgItemParams.fromMap(Map<String, dynamic> map) {
    return OrgItemParams(
      name: map['name'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      isPersistent: map['isPersistent'] as bool,
      volumeSize: map['volumeSize'] as int,
      orderers: List<Orderer>.from(
        (map['orderers'] as List<int>).map<Orderer>(
          (x) => Orderer.fromMap(x as Map<String, dynamic>),
        ),
      ),
      peers: List<Peer>.from(
        (map['peers'] as List<int>).map<Peer>(
          (x) => Peer.fromMap(x as Map<String, dynamic>),
        ),
      ),
      csr: map['csr'] != null
          ? CSR.fromMap(map['csr'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrgItemParams.fromJson(String source) =>
      OrgItemParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrgItemParams(name: $name, username: $username, password: $password, isPersistent: $isPersistent, volumeSize: $volumeSize, orderers: $orderers, peers: $peers, csr: $csr)';
  }

  @override
  bool operator ==(covariant OrgItemParams other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.username == username &&
        other.password == password &&
        other.isPersistent == isPersistent &&
        other.volumeSize == volumeSize &&
        listEquals(other.orderers, orderers) &&
        listEquals(other.peers, peers) &&
        other.csr == csr;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        username.hashCode ^
        password.hashCode ^
        isPersistent.hashCode ^
        volumeSize.hashCode ^
        orderers.hashCode ^
        peers.hashCode ^
        csr.hashCode;
  }
}

class Orderer {
  bool isPersistent;
  int volumeSize;
  Orderer({
    this.isPersistent = false,
    this.volumeSize = 0,
  });

  Orderer copyWith({
    bool? isPersistent,
    int? volumeSize,
  }) {
    return Orderer(
      isPersistent: isPersistent ?? this.isPersistent,
      volumeSize: volumeSize ?? this.volumeSize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isPersistent': isPersistent,
      'volumeSize': volumeSize,
    };
  }

  factory Orderer.fromMap(Map<String, dynamic> map) {
    return Orderer(
      isPersistent: map['isPersistent'] as bool,
      volumeSize: map['volumeSize'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Orderer.fromJson(String source) =>
      Orderer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Orderer(isPersistent: $isPersistent, volumeSize: $volumeSize)';

  @override
  bool operator ==(covariant Orderer other) {
    if (identical(this, other)) return true;

    return other.isPersistent == isPersistent && other.volumeSize == volumeSize;
  }

  @override
  int get hashCode => isPersistent.hashCode ^ volumeSize.hashCode;
}

class Peer {
  String db;
  bool isPersistent;
  bool isCouchPersistent;
  int volumeSize;
  int couchVolumeSize;
  Peer({
    this.db = '',
    this.isPersistent = false,
    this.isCouchPersistent = false,
    this.volumeSize = 0,
    this.couchVolumeSize = 0,
  });

  Peer copyWith({
    String? db,
    bool? isPersistent,
    bool? isCouchPersistent,
    int? volumeSize,
    int? couchVolumeSize,
  }) {
    return Peer(
      db: db ?? this.db,
      isPersistent: isPersistent ?? this.isPersistent,
      isCouchPersistent: isCouchPersistent ?? this.isCouchPersistent,
      volumeSize: volumeSize ?? this.volumeSize,
      couchVolumeSize: couchVolumeSize ?? this.couchVolumeSize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'db': db,
      'isPersistent': isPersistent,
      'isCouchPersistent': isCouchPersistent,
      'volumeSize': volumeSize,
      'couchVolumeSize': couchVolumeSize,
    };
  }

  factory Peer.fromMap(Map<String, dynamic> map) {
    return Peer(
      db: map['db'] as String,
      isPersistent: map['isPersistent'] as bool,
      isCouchPersistent: map['isCouchPersistent'] as bool,
      volumeSize: map['volumeSize'] as int,
      couchVolumeSize: map['couchVolumeSize'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Peer.fromJson(String source) =>
      Peer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Peer(db: $db, isPersistent: $isPersistent, isCouchPersistent: $isCouchPersistent, volumeSize: $volumeSize, couchVolumeSize: $couchVolumeSize)';
  }

  @override
  bool operator ==(covariant Peer other) {
    if (identical(this, other)) return true;

    return other.db == db &&
        other.isPersistent == isPersistent &&
        other.isCouchPersistent == isCouchPersistent &&
        other.volumeSize == volumeSize &&
        other.couchVolumeSize == couchVolumeSize;
  }

  @override
  int get hashCode {
    return db.hashCode ^
        isPersistent.hashCode ^
        isCouchPersistent.hashCode ^
        volumeSize.hashCode ^
        couchVolumeSize.hashCode;
  }
}

class CSR {
  String org;
  String orgUnit;
  String country;
  String state;
  String locality;
  int validity;
  CSR({
    this.org = '',
    this.orgUnit = '',
    this.country = '',
    this.state = '',
    this.locality = '',
    this.validity = 0,
  });

  CSR copyWith({
    String? org,
    String? orgUnit,
    String? country,
    String? state,
    String? locality,
    int? validity,
  }) {
    return CSR(
      org: org ?? this.org,
      orgUnit: orgUnit ?? this.orgUnit,
      country: country ?? this.country,
      state: state ?? this.state,
      locality: locality ?? this.locality,
      validity: validity ?? this.validity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'org': org,
      'orgUnit': orgUnit,
      'country': country,
      'state': state,
      'locality': locality,
      'validity': validity,
    };
  }

  factory CSR.fromMap(Map<String, dynamic> map) {
    return CSR(
      org: map['org'] as String,
      orgUnit: map['orgUnit'] as String,
      country: map['country'] as String,
      state: map['state'] as String,
      locality: map['locality'] as String,
      validity: map['validity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CSR.fromJson(String source) =>
      CSR.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CSR(org: $org, orgUnit: $orgUnit, country: $country, state: $state, locality: $locality, validity: $validity)';
  }

  @override
  bool operator ==(covariant CSR other) {
    if (identical(this, other)) return true;

    return other.org == org &&
        other.orgUnit == orgUnit &&
        other.country == country &&
        other.state == state &&
        other.locality == locality &&
        other.validity == validity;
  }

  @override
  int get hashCode {
    return org.hashCode ^
        orgUnit.hashCode ^
        country.hashCode ^
        state.hashCode ^
        locality.hashCode ^
        validity.hashCode;
  }
}

class ChannelDetails {
  int batchTimeout;
  int maxMessageCount;
  int absoluteMaxBytes;
  int preferredMaxBytes;
  bool createAppChannel;
  String channelName;
  ChannelDetails({
    this.batchTimeout = 0,
    this.maxMessageCount = 0,
    this.absoluteMaxBytes = 0,
    this.preferredMaxBytes = 0,
    this.createAppChannel = false,
    this.channelName = '',
  });

  ChannelDetails copyWith({
    int? batchTimeout,
    int? maxMessageCount,
    int? absoluteMaxBytes,
    int? preferredMaxBytes,
    bool? appChannel,
    String? channelName,
  }) {
    return ChannelDetails(
      batchTimeout: batchTimeout ?? this.batchTimeout,
      maxMessageCount: maxMessageCount ?? this.maxMessageCount,
      absoluteMaxBytes: absoluteMaxBytes ?? this.absoluteMaxBytes,
      preferredMaxBytes: preferredMaxBytes ?? this.preferredMaxBytes,
      createAppChannel: appChannel ?? this.createAppChannel,
      channelName: channelName ?? this.channelName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'batchTimeout': batchTimeout,
      'maxMessageCount': maxMessageCount,
      'absoluteMaxBytes': absoluteMaxBytes,
      'preferredMaxBytes': preferredMaxBytes,
      'appChannel': createAppChannel,
      'channelName': channelName,
    };
  }

  factory ChannelDetails.fromMap(Map<String, dynamic> map) {
    return ChannelDetails(
      batchTimeout: map['batchTimeout'] as int,
      maxMessageCount: map['maxMessageCount'] as int,
      absoluteMaxBytes: map['absoluteMaxBytes'] as int,
      preferredMaxBytes: map['preferredMaxBytes'] as int,
      createAppChannel: map['appChannel'] as bool,
      channelName: map['channelName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelDetails.fromJson(String source) =>
      ChannelDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChannelDetails(batchTimeout: $batchTimeout, maxMessageCount: $maxMessageCount, absoluteMaxBytes: $absoluteMaxBytes, preferredMaxBytes: $preferredMaxBytes, appChannel: $createAppChannel, channelName: $channelName)';
  }

  @override
  bool operator ==(covariant ChannelDetails other) {
    if (identical(this, other)) return true;

    return other.batchTimeout == batchTimeout &&
        other.maxMessageCount == maxMessageCount &&
        other.absoluteMaxBytes == absoluteMaxBytes &&
        other.preferredMaxBytes == preferredMaxBytes &&
        other.createAppChannel == createAppChannel &&
        other.channelName == channelName;
  }

  @override
  int get hashCode {
    return batchTimeout.hashCode ^
        maxMessageCount.hashCode ^
        absoluteMaxBytes.hashCode ^
        preferredMaxBytes.hashCode ^
        createAppChannel.hashCode ^
        channelName.hashCode;
  }
}

class CloudConfig {
  String name;
  String workspace;
  String account;
  String region;
  int instances;
  String instanceDetail;
  CloudConfig({
    this.name = '',
    this.workspace = '',
    this.account = '',
    this.region = '',
    this.instances = 0,
    this.instanceDetail = '',
  });

  CloudConfig copyWith({
    String? name,
    String? workspace,
    String? account,
    String? region,
    int? instances,
    String? instanceDetail,
  }) {
    return CloudConfig(
      name: name ?? this.name,
      workspace: workspace ?? this.workspace,
      account: account ?? this.account,
      region: region ?? this.region,
      instances: instances ?? this.instances,
      instanceDetail: instanceDetail ?? this.instanceDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'workspace': workspace,
      'account': account,
      'region': region,
      'instances': instances,
      'instanceDetail': instanceDetail,
    };
  }

  factory CloudConfig.fromMap(Map<String, dynamic> map) {
    return CloudConfig(
      name: map['name'] as String,
      workspace: map['workspace'] as String,
      account: map['account'] as String,
      region: map['region'] as String,
      instances: map['instances'] as int,
      instanceDetail: map['instanceDetail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CloudConfig.fromJson(String source) =>
      CloudConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CloudConfig(name: $name, workspace: $workspace, account: $account, region: $region, instances: $instances, instanceDetail: $instanceDetail)';
  }

  @override
  bool operator ==(covariant CloudConfig other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.workspace == workspace &&
        other.account == account &&
        other.region == region &&
        other.instances == instances &&
        other.instanceDetail == instanceDetail;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        workspace.hashCode ^
        account.hashCode ^
        region.hashCode ^
        instances.hashCode ^
        instanceDetail.hashCode;
  }
}
