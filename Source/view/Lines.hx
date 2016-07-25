package view;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import model.Machine;

// displays number of lines bet on and buttons for changing them

class Lines extends Sprite {
    private var display:TextField;
    public function new () {
        super();
        var label = new TextField();
        label.width = 128;
        label.autoSize = TextFieldAutoSize.CENTER;
        label.selectable = false;
        label.text = "Lines";
        addChild(label);
        display = new TextField();
        display.width = 128;
        display.autoSize = TextFieldAutoSize.CENTER;
        display.selectable = false;
        display.y = 20;
        addChild(display);
        Machine.eventDispatcher.addEventListener(Machine.LINES_SET, updateDisplay);
        updateDisplay(new Event(Event.CHANGE));
        addChild(new LinesUp());
        addChild(new LinesDown());
    }
    private function updateDisplay(event:Event) {
        display.text = Std.string(Machine.lines);
    }
}
