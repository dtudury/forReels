package controller;

import model.Machine;

class FakeServer {
    public static function spin():Void {
        var newStops:Array<Int> = [];
        for (reel in Machine.REELS) {
            newStops.push(Std.int(Math.random() * reel.length));
        }
        Machine.stops = newStops;
    }
}
