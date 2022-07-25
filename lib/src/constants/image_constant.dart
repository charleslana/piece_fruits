const String charlesLogo = 'assets/images/layout/charles-logo.png';
const String enIcon = 'assets/images/icons/en.png';
const String esIcon = 'assets/images/icons/es.png';
const String marineIcon = 'assets/images/icons/marine.png';
const String pieceFruitsLogo = 'assets/images/layout/piece-fruits-logo.png';
const String pirateIcon = 'assets/images/icons/pirate.png';
const String ptIcon = 'assets/images/icons/pt.png';
const String revolutionaryIcon = 'assets/images/icons/revolutionary.png';
const String starterBg = 'assets/images/layout/starter-bg.png';

String getPortraitAvatar(int characterId, String image) {
  return 'assets/images/avatars/portrait/$characterId/$image.png';
}

String getThumbnailAvatar(int characterId, String image) {
  return 'assets/images/avatars/thumbnail/$characterId/$image.png';
}
