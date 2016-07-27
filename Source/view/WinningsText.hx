package view;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import model.Machine;
import model.Machine.State;

class WinningsText extends TextField {
    public function new () {
        super();
        x = 280;
        y = 400 + 8;
        width = 80;
        autoSize = TextFieldAutoSize.CENTER;
        selectable = false;
        TileFactory.add_redrawer(updateDisplay);
        updateDisplay();
    }
    private function updateDisplay() {
        if (Machine.state == State.Spinning) {
            text = "--";
        } else if (Machine.state == State.Settling) {
            text = "--";
        } else if (Machine.state == State.Paying) {
            var dt:Float = (Date.now().getTime() - Machine.stateSetTime) / Math.min(50 * Machine.winnings, 1000);
            if (dt > 1) {
                text = Std.string(Machine.winnings);
            } else {
                text = Std.string(Std.int(dt * Machine.winnings));
            }
        } else {
            text = Std.string(Machine.winnings);
        }
    }
}
