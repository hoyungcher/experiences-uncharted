const location = document.querySelector("#host-location").dataset.location;
const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${location}.json?access_token=pk.eyJ1IjoiaG95dW5nY2hlciIsImEiOiJjazc1bnEwYXQwZHR5M2duN2xxejZrbzhtIn0.aROPmvtsy2jfSBBODE4pDg`;
// fetchCoordinates(address);
fetch(url)
  .then(response => response.json())
  .then((data) => {
    const longtitude = data.features[0].center[0];
    const latitude = data.features[0].center[1];
    mapboxgl.accessToken = 'pk.eyJ1IjoiaG95dW5nY2hlciIsImEiOiJjazc1bnEwYXQwZHR5M2duN2xxejZrbzhtIn0.aROPmvtsy2jfSBBODE4pDg';
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [longtitude, latitude],
      zoom: 12
    });
    const mapdiv = document.querySelector("#map");
    mapdiv.insertAdjacentHTML("beforeend", map);
    new mapboxgl.Marker()
      .setLngLat([longtitude, latitude])
      .addTo(map);
  });
