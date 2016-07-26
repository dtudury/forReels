package controller;

import model.Machine.Button;

class ButtonLogic {
    public static function click(button:Button):Void {
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
    public static function rollover(button:Button):Void {
    }

}

