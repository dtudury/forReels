package controller;

import openfl.ui.Mouse;
import model.Machine;
import model.Machine.Button;
import model.Machine.State;

class ButtonLogic {
    public static function click(button:Button):Void {
        if (Machine.state == State.Settling) {
            if (button == Button.Spin) {
                BetLogic.payout();
            }
        } else if ( Machine.state == State.Paying ||
                    Machine.state == State.Showing_wins ||
                    Machine.state == State.Idle ||
                    Machine.state == State.Betting) {
            Machine.state = State.Betting;
            switch button {
                case Button.None: null;

                case Button.WagerUp: BetLogic.onWagerUp();
                case Button.WagerDown: BetLogic.onWagerDown();
                case Button.LineUp: BetLogic.onLinesUp();
                case Button.LineDown: BetLogic.onLinesDown();

                case Button.Spin: FakeServer.spin();
                case Button.Paytable: null;
            }
        }
    }
    public static function rollover(button:Button):Void {
        if (button == Button.None) {
            Mouse.show();
        } else {
            Mouse.hide();
        }
        Machine.over = button;
    }

}

