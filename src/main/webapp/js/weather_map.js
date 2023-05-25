let usedMarker;

function newAddress() {
    $("#cards").empty(); // removes all the child elements of the html element with the id of cards
    $(".mapboxgl-marker").remove(); //removes the element and children of the selector, in this case the element with the class of mapboxgl-marker which is associated with the maps markers
    geocode(userAddress.value, mapBoxKey).then(function (results) {
        $.get(`https://api.openweathermap.org/data/2.5/weather?lat=${results[1]}&lon=${results[0]}&appid=${openWeatherKey}&units=imperial`)
            .done(function (data) {
                console.log('current weather', data);
                let string = `<div class="card mb-3">
<div class="card-header text-center">Todays Weather Forecast</div>
<div class="card-body">
<p class="card-title text-center">L: ${parseInt(data.main.temp_min)}&deg; - H: ${parseInt(data.main.temp_max)}&deg;<br>
<img src="http://openweathermap.org/img/w/${data.weather[0].icon}.png"/></p>
<hr><p class="card-text">Description: ${data.weather[0].description}</p>
<hr><p class="card-text">Humidity: ${data.main.humidity}%</p>
<hr><p class="card-text">Wind: ${data.wind.speed}Mph</p>
<hr><p class="card-text">Pressure: ${data.main.pressure}</p>
</div></div>`
                $(string).appendTo('#cards');
            });
        $.get(`https://api.openweathermap.org/data/2.5/forecast?lat=${results[1]}&lon=${results[0]}&appid=${openWeatherKey}&units=imperial`)
            .done(function (data) {
                let i = 8;
                while (i < 40) {
                    let date = data.list[i].dt_txt.split(" ");
                    let string = `<div class="card mb-3">
<div class="card-header text-center">${date[0]}</div>
<div class="card-body">
<p class="card-title text-center">L: ${parseInt(data.list[i].main.temp_min)}&deg; - H: ${parseInt(data.list[i].main.temp_max)}&deg;<br>
<img src="http://openweathermap.org/img/w/${data.list[i].weather[0].icon}.png"/></p>
<hr><p class="card-text">Description: ${data.list[i].weather[0].description}</p>
<hr><p class="card-text">Humidity: ${data.list[i].main.humidity}%</p>
<hr><p class="card-text">Wind: ${data.list[i].wind.speed}Mph</p>
<hr><p class="card-text">Pressure: ${data.list[i].main.pressure}</p>
</div></div>`
                    $(string).appendTo('#cards');
                    i += 8;
                }
                console.log(data);
            });
        var marker = new mapboxgl.Marker({
            draggable: true
        })
            .setLngLat(results)
            .addTo(map)
        marker.on('dragend', onDragEnd);
        map.flyTo({
            center: results,
            zoom: 10
        })
        usedMarker = marker; //this is needed to bring out the markers data to be used in the onDragEnd function
        //the below is used just to get the full address if only a partial address is given such as Houston, Texas
        const lngLat = marker.getLngLat();
        reverseGeocode({lng: lngLat.lng, lat: lngLat.lat}, mapBoxKey)
            .then(function (results) {
                console.log(results);
                $('#location').text("Current Address: " + results);
                $('#locationV2').text("Current Address: " + results);
            });
    });
}

// loading in the initial map
mapboxgl.accessToken = mapBoxKey;
const map = new mapboxgl.Map({
    container: 'map', // container ID
    style: 'mapbox://styles/mapbox/streets-v12', // style URL
    center: [-95.2297, 30.1024], // starting position [lng, lat]
    zoom: 10, // starting zoom
});

let userAddress = document.getElementById('userLocation');
let addressBtn = document.getElementById('userInputBtn');
addressBtn.addEventListener('click', newAddress); //listens for when the 'find' btn is clicked

//called when a marker is dragged or map is double-clicked
function onDragEnd() {
    const lngLat = usedMarker.getLngLat();
    console.log(lngLat);
    $("#cards").empty();
    $.get(`https://api.openweathermap.org/data/2.5/weather?lat=${lngLat.lat}&lon=${lngLat.lng}&appid=${openWeatherKey}&units=imperial`)
        .done(function (data) {
            console.log('current weather', data);
            let string = `<div class="card mb-3">
<div class="card-header text-center">Todays Weather Forcast</div>
<div class="card-body">
<p class="card-title text-center">L: ${parseInt(data.main.temp_min)}&deg; / H: ${parseInt(data.main.temp_max)}&deg;<br>
<img src="http://openweathermap.org/img/w/${data.weather[0].icon}.png"/></p>
<hr><p class="card-text">Description: ${data.weather[0].description}</p>
<hr><p class="card-text">Humidity: ${data.main.humidity}%</p>
<hr><p class="card-text">Wind: ${data.wind.speed}Mph</p>
<hr><p class="card-text">Pressure: ${data.main.pressure}</p>
</div></div>`
            $(string).appendTo('#cards');
        });
    $.get(`https://api.openweathermap.org/data/2.5/forecast?lat=${lngLat.lat}&lon=${lngLat.lng}&appid=${openWeatherKey}&units=imperial`)
        .done(function (data) {
            let i = 8;
            while (i < 40) {
                let date = data.list[i].dt_txt.split(" ");
                let string = `<div class="card mb-3">
<div class="card-header text-center">${date[0]}</div>
<div class="card-body">
<p class="card-title text-center">L: ${parseInt(data.list[i].main.temp_min)}&deg; / H: ${parseInt(data.list[i].main.temp_max)}&deg;<br>
<img src="http://openweathermap.org/img/w/${data.list[i].weather[0].icon}.png"/></p>
<hr><p class="card-text">Description: ${data.list[i].weather[0].description}</p>
<hr><p class="card-text">Humidity: ${data.list[i].main.humidity}%</p>
<hr><p class="card-text">Wind: ${data.list[i].wind.speed}Mph</p>
<hr><p class="card-text">Pressure: ${data.list[i].main.pressure}</p>
</div></div>`
                $(string).appendTo('#cards');
                i += 8;
            }
            console.log(data);
        });
    reverseGeocode({lng: lngLat.lng, lat: lngLat.lat}, mapBoxKey)
        .then(function (results) {
            console.log(results);
            $('#location').text("Current Address: " + results);
            $('#locationV2').text("Current Address: " + results);
        });
}

//specifies what happens when the map is double-clicked
map.on('click', (e) => {
    console.log(e.lngLat);
    $(".mapboxgl-marker").remove();
    var marker = new mapboxgl.Marker({
        draggable: true
    })
        .setLngLat(e.lngLat)
        .addTo(map)
    usedMarker = marker;
    onDragEnd();
    marker.on('dragend', onDragEnd);

});

//finds all classes with the class tt and adds a new bootstrap.tooltip
const tooltips = document.querySelectorAll('.tt');
tooltips.forEach(x => {
    new bootstrap.Tooltip(x);
});