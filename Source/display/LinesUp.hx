package display;

import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.events.MouseEvent;
import display.SymbolFactory;
import model.Machine;

class LinesUp extends Sprite {
    public function new () {
        super();
        x = 128 - 32;
        y = 2;
        buttonMode = true;
        var tilemap:Tilemap = new Tilemap(32, 32, SymbolFactory.instance.tileset);
        tilemap.addTile(SymbolFactory.instance.plus());
        addChild(tilemap);
        addEventListener(MouseEvent.CLICK, onClick);
    }
    private function onClick(event:MouseEvent):Void {
        if (Machine.lines < 15) Machine.lines++;
    }
}
