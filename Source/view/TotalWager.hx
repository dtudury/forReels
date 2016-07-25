package view;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import model.Machine;

// displays product of number of lines bet on and bet per line

class TotalWager extends Sprite {
    private var display:TextField;
    public function new () {
        super();
        x = 128;
        var label = new TextField();
        label.width = 128;
        label.autoSize = TextFieldAutoSize.CENTER;
        label.selectable = false;
        label.text = "Total Wager";
        addChild(label);
        display = new TextField();
        display.width = 128;
        display.autoSize = TextFieldAutoSize.CENTER;
        display.selectable = false;
        display.y = 20;
        addChild(display);
        Machine.eventDispatcher.addEventListener(Machine.LINES_SET, updateDisplay);
        Machine.eventDispatcher.addEventListener(Machine.WAGER_SET, updateDisplay);
        updateDisplay(new Event(Event.CHANGE));
    }
    private function updateDisplay(event:Event) {
        display.text = Std.string(Machine.lines * Machine.wager);
    }
}
