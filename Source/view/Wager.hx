package view;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import model.Machine;

class Wager extends Sprite {
    private var display:TextField;
    public function new () {
        super();
        x = 256;
        var label = new TextField();
        label.x = 32;
        label.width = 64;
        label.autoSize = TextFieldAutoSize.CENTER;
        label.selectable = false;
        label.text = "Wager";
        addChild(label);
        display = new TextField();
        display.x = 32;
        display.width = 64;
        display.autoSize = TextFieldAutoSize.CENTER;
        display.selectable = false;
        display.y = 20;
        addChild(display);
        Machine.eventDispatcher.addEventListener(Machine.WAGER_SET, updateDisplay);
        updateDisplay(new Event(Event.CHANGE));
        addChild(new WagerUp());
        addChild(new WagerDown());
    }
    private function updateDisplay(event:Event) {
        display.text = Std.string(Machine.wager);
    }
}
