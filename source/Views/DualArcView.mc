using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class DualArcView extends Ui.WatchFace {
	var time;
	var layout; 
	
	function initialize() {
		WatchFace.initialize();
		time  = new TimeDisplay();
		layout = new Layout();
	}

    //! Update the view
    function onUpdate(dc) {
    	resetScreen(dc);
    	time.displayTime(dc);
    	layout.displayInfo(dc);
    }
    
    function resetScreen(dc) {
    	dc.setColor(Color.getBackgroundColor(), Color.getBackgroundColor());
		dc.clear();
		dc.setColor(Color.getPrimaryColor(), Gfx.COLOR_TRANSPARENT);
    }
}
