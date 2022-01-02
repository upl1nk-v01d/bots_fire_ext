#include maps\mp\_load;
#include maps\mp\_utility;

init()
{
	if(getDvar("bots_fire_ext") == ""){ setDvar( "bots_fire_ext", "1" ); }
	if(getDvar("bots_play_fire") == "1"){ setDvar( "bots_play_fire", "0" ); }
	
	precacheShader("compass_waypoint_defend");
	precacheShader("compass_waypoint_target");
	precacheShader("compass_waypoint_bomb");

	for(;;)
    {
		level waittill("connected", player);
		player thread _start_fire_ext();
	}
}

_start_fire_ext()
{
	self endon ( "disconnect" );
	self endon( "intermission" );
	self endon( "game_ended" );
	if (!self.isbot){ return; }

	for(;;){
		self waittill("spawned_player");  

    	self thread _bot_fire();
		wait 0.05;
	}
}

_bot_fire(){
	self endon ( "death" );
	self endon ( "disconnect" );
	self endon( "intermission" );
	self endon( "game_ended" );
	if(!self.isbot){ return; }
	
	for(;;){
		if (getDvarInt("bots_fire_ext")>0 && getDvar("bots_play_fire") != "1" && getDvar("bots_play_move") == "1"){
			if(isAlive(self)){
				if (isDefined(self.bot.after_target)) { 
					dist=distance(self.bot.after_target.origin,self.origin);
					delay=randomFloatRange(0.2,0.3)+((dist/4)*0.001);
					self _bot_press_fire(delay);
				}
			}
		}
		wait 0.1;
	}
}

_bot_press_fire(delay)
{
	self endon("death");
	self endon("disconnect");
	self notify("bot_fire");
	self endon("bot_fire");
	
	if(!isDefined(delay)) { delay = 0.3; }
		
	wait delay;

	while (isDefined(self.bot.after_target)){		
		dist=distance(self.bot.after_target.origin,self.origin);
		duration=randomFloatRange(0.05,0.5)+((1/dist)+0.15);
		self botAction("+fire");
		if(duration) { wait duration/2; }
		self botAction("-fire");
		if(duration) { wait duration; }
	}

}

cl(txt){
	if (isDefined(txt)){ print("^2-- "+txt+" -- \n"); }
	else { print("^3!! undefined !! \n"); }
}
