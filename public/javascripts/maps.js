$(function() {
  OpenLayers.IMAGE_RELOAD_ATTEMPTS = 3;
  OpenLayers.ImgPath = 'http://js.mapbox.com/theme/dark/';

  var SHADOW_Z_INDEX = 10;
  var MARKER_Z_INDEX = 11;
  var DIAMETER = 200;

  var map, layer, center, marker;
  var proj = new OpenLayers.Projection("EPSG:4326");
  var center = new OpenLayers.LonLat(-7000000, 4000000);


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

  map.addLayers([gphy]);


  if(!map.getCenter()) {
    map.setCenter(center, 3);
  }

});
