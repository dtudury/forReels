package controller;

import openfl.utils.Timer;
import openfl.events.TimerEvent;
import model.Machine;
import model.Machine.State;

class FakeServer {
    public static function spin():Void {
        Machine.state = State.Spinning;
        Machine.balance -= Machine.wager * Machine.lines;
        var timer = new Timer(1000, 1);
        timer.addEventListener(TimerEvent.TIMER_COMPLETE, generateOutcome);
        timer.start();
    }
    private static function generateOutcome(timerEvent:TimerEvent):Void {
        var newStops:Array<Int> = [];
        for (reel in Machine.REELS) {
            newStops.push(Std.int(Math.random() * reel.length));
        }
        var winnings:Int = 0;
        var paylines:Array<Array<Int>> = [];
        for (lineIndex in 0...Machine.lines) {
            var line = Machine.LINES[lineIndex];
            var s0:Symbol = Machine.REELS[0][(line[0] + newStops[0]) % Machine.REELS[0].length];
            var s1:Symbol = Machine.REELS[1][(line[1] + newStops[1]) % Machine.REELS[1].length];
            var s2:Symbol = Machine.REELS[2][(line[2] + newStops[2]) % Machine.REELS[2].length];
            if (s0 == s1 && s1 == s2) {
                var lineWin:Int = Machine.wager * Machine.PAYTABLE[s0];
                paylines.push([lineIndex, lineWin]);
                winnings += lineWin;
            }
        }
        trace(paylines);
        Machine.stops = newStops;
        Machine.state = State.Settling;
        Machine.winnings = winnings;
        Machine.balance += winnings;
    }
}
