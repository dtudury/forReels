package controller;

import openfl.events.MouseEvent;
import model.Machine;

class BetLogic {
    public static function onLinesUp(event:MouseEvent):Void {
        if (Machine.lines < 15) Machine.lines++;
    }
    public static function onLinesDown(event:MouseEvent):Void {
        if (Machine.lines > 1) Machine.lines--;
    }
    public static function onWagerUp(event:MouseEvent):Void {
        var wager:Int = Machine.wager;
        var magnitude:Int = 1;
        while (wager >= 10) {
            wager = Std.int(wager / 10);
            magnitude *= 10;
        }
        if (wager >= 5) {
            wager = 1;
            magnitude *= 10;
        } else if (wager >= 2) {
            wager = 5;
        } else {
            wager = 2;
        }
        Machine.wager = wager * magnitude;
    }
    public static function onWagerDown(event:MouseEvent):Void {
        var wager:Int = Machine.wager;
        var magnitude:Int = 1;
        while (wager >= 10) {
            wager = Std.int(wager / 10);
            magnitude *= 10;
        }
        if (wager <= 1) {
            wager = 5;
            magnitude = Std.int(magnitude / 10);
        } else if (wager <= 2) {
            wager = 1;
        } else {
            wager = 2;
        }
        if (magnitude < 1) Machine.wager = 1;
        else Machine.wager = wager * magnitude;
    }
}
