import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement1 = document.getElementById('map-index');
  const mapElement2 = document.getElementById('map-show');
  const mapElement = mapElement1 ? mapElement1 : mapElement2; 
  const idLabel = mapElement1 ? "map-index" : "map-show";

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: idLabel,
      style: 'mapbox://styles/mapbox/streets-v10'
    });
  }
};

// if (mapElement) {
//   // [ ... ]
//   const markers = JSON.parse(mapElement.dataset.markers);
//   markers.forEach((marker) => {
//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .addTo(map);
//   });
// }

export { initMapbox };