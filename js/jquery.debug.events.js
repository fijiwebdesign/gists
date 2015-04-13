(function () {
    var elements = $(window.$0 || prompt('JQuery selector for element to debug events. Eg: .className'));

    if (!elements.length) {
    	console.warn('Selector did not match any elements');
    	return;
    }

    var eventType = prompt('Event Type. Eg: click, hover, mouseout, keyUp, keyDown etc.');

    elements.each(function(i, element) {
    	var events = $._data(element).events[eventType];

	    if (!events) {
	    	console.warn('Element ' + element + 'has no Events of that type: ' + eventType);
	    }

	    events.forEach(function (event) {
	        var handler = event.handler;

	        event.handler = function () {
	            debugger;
	            handler.apply(this, arguments);
	        };
	    });
    });
    
})();