using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;

class Layout {
	hidden var width, height; 
	hidden var stats = new StatsDisplay(); 

	function initialize() {
    }
    
    function displayInfo(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
    	var inverter = App.getApp().getProperty("id_invert");
    	dc.setColor(Color.getPrimaryColor() , Gfx.COLOR_TRANSPARENT);
    	stats.drawDate(dc, width/2, 0, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
    	stats.drawSteps(dc, width/2, 130, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_CENTER);
    	stats.drawBattery(dc, width/2 + 68, 130, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_CENTER);
    	var symbol = new Symbol(); 
    	symbol.drawBluetooth(dc, width/2 - 80, 130, inverter);
    	symbol.drawNotification(dc, width/2 - 68, 128, inverter);
    }
}