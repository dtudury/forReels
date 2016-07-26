package view;

import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import model.Machine;

class TotalWagerText extends TextField {
    public function new () {
        super();
        x = 88;
        y = 456 + 8;
        width = 80;
        autoSize = TextFieldAutoSize.CENTER;
        selectable = false;
        Machine.eventDispatcher.addEventListener(Machine.LINES_SET, updateDisplay);
        Machine.eventDispatcher.addEventListener(Machine.WAGER_SET, updateDisplay);
        updateDisplay();
    }
    private function updateDisplay(event:Event = null) {
        text = Std.string(Machine.lines * Machine.wager);
    }
}
