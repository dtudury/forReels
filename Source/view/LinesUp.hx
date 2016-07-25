package view;

import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.events.MouseEvent;
import controller.BetLogic;
import view.SymbolFactory;
import model.Machine;

// button to increment number of lines

class LinesUp extends Sprite {
    public function new () {
        super();
        x = 128 - 32;
        y = 2;
        buttonMode = true;
        var tilemap:Tilemap = new Tilemap(32, 32, SymbolFactory.instance.tileset);
        tilemap.addTile(SymbolFactory.instance.plus());
        addChild(tilemap);
        addEventListener(MouseEvent.CLICK, BetLogic.onLinesUp);
    }
}
