package view;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import controller.BetLogic;
import model.Machine;
import model.Machine.State;

class BalanceText extends TextField {
    public function new () {
        super();
        x = 280;
        y = 456 + 8;
        width = 80;
        autoSize = TextFieldAutoSize.CENTER;
        selectable = false;
        TileFactory.add_redrawer(updateDisplay);
        updateDisplay();
    }
    private function updateDisplay() {
        if (Machine.state == State.Settling) {
            text = Std.string(Machine.balance - Machine.winnings);
        } else if (Machine.state == State.Paying) {
            var dt:Float = (Date.now().getTime() - Machine.stateSetTime) / Math.min(50 * Machine.winnings, 1000);
            if (dt > 1) {
                text = Std.string(Machine.balance);
                BetLogic.showWins();
            } else {
                text = Std.string(Machine.balance - Std.int((1 - dt) * Machine.winnings));
            }
        } else {
            text = Std.string(Machine.balance);
        }
    }
}
