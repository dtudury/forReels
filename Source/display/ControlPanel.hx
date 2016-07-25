package display;

import openfl.display.Sprite;

class ControlPanel extends Sprite {
    public function new () {
        super();
        this.y = 128 * 3;
        addChild(new Lines());
        addChild(new TotalWager());
        addChild(new Wager());
    }
}
