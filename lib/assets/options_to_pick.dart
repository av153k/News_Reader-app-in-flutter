Map countries = {
  "wl": "World",
  "in": "India",
  "us": "United States of America",
};

List countriesList() {
  List<String> countryList = [];
  countries.forEach(
    (key, value) => countryList.add(key),
  );
  return countryList;
}

var categories = ["All", "Technology", "Sports", "Politics", "Entertainment", "Buisness"];
