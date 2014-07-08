// This class is responsible to process events for the features loaded from GeoJSON
function EventProcessor() {

}

EventProcessor.prototype = {

  mouseover: function(event) {
    $currentStateProcessor.mouseover(event);
  },

  mouseout: function(event) {
    $currentStateProcessor.mouseout(event);
  },

  mousemove: function(event) {
    $currentStateProcessor.mousemove(event);
  },

  click: function(event) {
    $currentStateProcessor.click(event);
  }

};

// This class is to process the feature events in normal state
function NormalStateEventProcessor() {

}

NormalStateEventProcessor.prototype = {

  mouseover: function(event) {
    if($currentAreaType === 'country' || $currentAreaType === 'province') {
      $currentData.revertStyle();
      $('#info-box').text(event.feature.getProperty('name'));
      $currentData.overrideStyle(event.feature, { fillColor: 'red' });
    }
  },

  mouseout: function(event) {
    if($currentAreaType === 'country' || $currentAreaType === 'province') {
      $currentData.revertStyle();
    }
  },

  mousemove: function(event) {
    
  },

  click: function(event) {
    if($currentAreaType === 'country') {
      $currentData.revertStyle();
      var provinceId = event.feature.getProperty('id');
      console.log("click province id " + provinceId);
      $.getScript("/provinces/" + provinceId + ".js");
    }else if($currentAreaType === 'province') {
      var provinceId = event.feature.getProperty('province_id');
      var cityId = event.feature.getProperty('id');
      console.log("click province id " + provinceId + " city id " + cityId);
      $.getScript("/provinces/" + provinceId + "/cities/" + cityId + ".js");
    }
  }

};


// This class is to process feature events when add a school
function AddSchoolStateEventProcessor() {

}

AddSchoolStateEventProcessor.prototype = {

  mouseover: function(event) {
    $addSchoolMarker.setVisible(true);
  },

  mouseout: function(event) {
    $addSchoolMarker.setVisible(false);
  },

  mousemove: function(event) {
    var cursorPosition = event.latLng;
    $addSchoolMarker.setPosition(cursorPosition);
  },

  click: function(event) {
    $('#myModal').modal({});
  }

}