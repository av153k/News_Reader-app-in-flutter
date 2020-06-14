Map countries = {
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

var categories = [
  "All",
  "Health",
  "Science",
  "Technology",
  "Sports",
  "Politics",
  "Entertainment",
  "Business"
];
