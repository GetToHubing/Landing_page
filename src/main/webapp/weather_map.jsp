<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link href='https://api.mapbox.com/mapbox-gl-js/v2.13.0/mapbox-gl.css' rel='stylesheet'/>
  <script src='https://api.mapbox.com/mapbox-gl-js/v2.13.0/mapbox-gl.js'></script>
  <script src="js/mapbox-geocoder-utils.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"
          integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/weather_map.css">
  <link rel="apple-touch-icon" sizes="180x180" href="img/weather_map_favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="img/weather_map_favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="img/weather_map_favicons/favicon-16x16.png">
  <link rel="manifest" href="img/weather_map_favicons/site.webmanifest">
  <title>Weather Map</title>
</head>
<body>
<header class="bg-primary p-1 d-flex text-white">
  <h4 class="my-auto d-flex" id="headerId">Weather App</h4>
  <p class="my-auto ms-auto" id="location">Current Address: No address selected yet</p>
</header>
<!--the below paragraph shows up only on smaller screens (425px max)-->
<p class="my-auto me-2 bg-primary text-white text-center w-100" id="locationV2">Current Address: No address selected yet</p>

<main>
  <section class="">
    <div class="input-group my-3 container-fluid" id="inputBtn">
      <input type="text" onfocus="this.value=''" class="form-control tt" placeholder="Search for Location or Address" aria-label="search address" aria-describedby="button-addon2" id="userLocation" data-bs-placement="bottom" title="Please type in an address or click a location on the map to get started">
      <button class="btn btn-primary" type="button" id="userInputBtn">Find</button>
    </div>
  </section>
  <section class="d-flex flex-wrap justify-content-around mt-3" id="cards">
    <!--this is where the cards are loaded-->
  </section>
  <section id="map" class=" mt-3">
    <!--this is where the map is loaded-->
  </section>
</main>

<script src="js/keys.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="js/weather_map.js"></script>
</body>
</html>