package view;

import openfl.display.Sprite;
import view.SymbolFactory;

// positioning element to hold the controls

class ControlPanel extends Sprite {
    public function new () {
        super();
        this.y = SymbolFactory.SSIZE * 3;
        addChild(new Lines());
        addChild(new TotalWager());
        addChild(new Wager());
    }
}
