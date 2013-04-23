$(function() {
  //"use strict";

  //var OpenLayers = OpenLayers || {};
  //var google = google || {};

  OpenLayers.IMAGE_RELOAD_ATTEMPTS = 3;
  OpenLayers.ImgPath = 'http://js.mapbox.com/theme/dark/';

  var SHADOW_Z_INDEX = 10;
  var MARKER_Z_INDEX = 11;
  var DIAMETER = 200;

  // marker settings
  var size = new OpenLayers.Size(21,25);
  var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
  var icon = new OpenLayers.Icon('/images/marker-gold.png',size,offset);


  var map, layer, markers, places;
  var proj = new OpenLayers.Projection("EPSG:4326");
  var center = new OpenLayers.LonLat(-5800000, 4100000);

  var options = {
    controls: [
      new OpenLayers.Control.Navigation(),
      new OpenLayers.Control.PanZoomBar(),
      new OpenLayers.Control.LayerSwitcher({'ascending':false}),
      new OpenLayers.Control.Permalink(),
      new OpenLayers.Control.MousePosition(),
      new OpenLayers.Control.KeyboardDefaults(),
      new OpenLayers.Control.LayerSwitcher()
    ]
  };

  map = new OpenLayers.Map('map', options);

  var gphy = new OpenLayers.Layer.Google(
    "Google Satellite",
    {type: google.maps.MapTypeId.SATELLITE}
  );

  places = new OpenLayers.Layer.Text( "text", { location: "/fixed_points.txt" } );

  console.log(places);

  markers = new OpenLayers.Layer.Markers("Markers");

  map.addLayers([gphy, places, markers]);


  if(!map.getCenter()) {
    map.setCenter(center, 3);
  }

});
