using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;


class TimeDisplay {
	var width; 
	var height; 

	function initialize() { 
    }
	

	//Puts the time on the screen as text
    function displayTime(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
    	var layout = App.getApp().getProperty("layout");
    	var adjust = 20; 
		if(layout == 0 || layout == 1) { 
	   		adjust = 0; 
	    } else if(layout == 4) {
	   		adjust = 15; 
	    } else if(layout == 8) {
	    	adjust = -15; 
	    	if(Sys.getDeviceSettings().screenShape == 2) { 
	    		adjust = -10;
	    	}
	    }
    	drawHours(dc, adjust);
    	drawMinutes(dc, adjust); 
    }
    
    hidden function hourString() {
    	var hourString = new [9]; 
    	var clockTime = Sys.getClockTime(); 
    	if(!Sys.getDeviceSettings().is24Hour) {
			for(var i = 0; i < 9; i++) {
				if((clockTime.hour - 2 + i) > 12) {
					var time = (clockTime.hour - 4 + i - 12);
					if(time > 12) {
						time -= 12; 
					}
					hourString[i] = Lang.format("$1$", [time]);
				}
				else {
					var time = (clockTime.hour - 4 + i);
					if(time <= 0) {
						time += 12;
					}
					hourString[i] = Lang.format("$1$", [time]);
				}
			}
		}
			
		else {
			for(var i = 0; i < 9; i++){
				var time = clockTime.hour - 4 + i;
				if(time < 0){
					time += 24; 
				}
				else if(clockTime.hour - 4 + i > 23){
					time -= 24; 
				}
				hourString[i] = Lang.format("$1$", [time.format("%02d")]);
			}
		}
		return hourString; 
    }
    
    hidden function minString() {
    	var minString = new [9];
    	var clockTime = Sys.getClockTime(); 
    	for(var i = 0; i < 9; i++) {
			var time = clockTime.min - 4 + i;
			
			if(time > 59){
				time -= 60;
			}
			
			else if(time < 0) {
				time += 60;
			}
			minString[i] = Lang.format("$1$", [time.format("%02d")]);
		}
		return minString;  
    }
    
    hidden function drawHours(dc, adjust) {
    	var hourString = hourString(); 
    	dc.drawText(width/2, 33, Gfx.FONT_NUMBER_HOT, hourString[4], Gfx.TEXT_JUSTIFY_CENTER);
    	dc.setColor(Color.getTertiaryColor(), Gfx.COLOR_TRANSPARENT);
    	dc.drawText(0, -3,  Gfx.FONT_SMALL, hourString[0], Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(15, 20,  Gfx.FONT_SMALL, hourString[1], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(40, 35,  Gfx.FONT_SMALL, hourString[2], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(70, 52,  Gfx.FONT_SMALL, hourString[3], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(135, 52,  Gfx.FONT_SMALL, hourString[5], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(165, 35,  Gfx.FONT_SMALL, hourString[6], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(190, 20, Gfx.FONT_SMALL, hourString[7], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(width/2 * 2, -3,  Gfx.FONT_SMALL, hourString[8], Gfx.TEXT_JUSTIFY_RIGHT);
    }
    
    hidden function drawMinutes(dc, adjust) {
    	var minString = minString(); 
    	dc.drawText(0, 130,  Gfx.FONT_SMALL, minString[0], Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(15, 105,  Gfx.FONT_SMALL, minString[1], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(40, 90,  Gfx.FONT_SMALL, minString[2], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(70, 83, Gfx.FONT_SMALL, minString[3], Gfx.TEXT_JUSTIFY_CENTER);
    	dc.drawText(135, 83,  Gfx.FONT_SMALL, minString[5], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(165, 90,  Gfx.FONT_SMALL, minString[6], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(190, 105, Gfx.FONT_SMALL, minString[7], Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(width/2 * 2, 130, Gfx.FONT_SMALL, minString[8], Gfx.TEXT_JUSTIFY_RIGHT);
		dc.setColor(Color.getSecondaryColor(), Gfx.COLOR_TRANSPARENT);
		dc.drawText(width/2, 85, Gfx.FONT_NUMBER_HOT, minString[4], Gfx.TEXT_JUSTIFY_CENTER);
    }
}