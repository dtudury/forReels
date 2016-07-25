package view;

import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.events.MouseEvent;
import controller.BetLogic;
import view.SymbolFactory;
import model.Machine;

// button to decrement number of lines

class LinesDown extends Sprite {
    public function new () {
        super();
        y = 2;
        buttonMode = true;
        var tilemap:Tilemap = new Tilemap(32, 32, SymbolFactory.instance.tileset);
        tilemap.addTile(SymbolFactory.instance.minus());
        addChild(tilemap);
        addEventListener(MouseEvent.CLICK, BetLogic.onLinesDown);
    }
}
