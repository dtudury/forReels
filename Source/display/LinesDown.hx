package display;

import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.events.MouseEvent;
import display.SymbolFactory;
import model.Machine;

class LinesDown extends Sprite {
    public function new () {
        super();
        y = 2;
        buttonMode = true;
        var tilemap:Tilemap = new Tilemap(32, 32, SymbolFactory.instance.tileset);
        tilemap.addTile(SymbolFactory.instance.minus());
        addChild(tilemap);
        addEventListener(MouseEvent.CLICK, onClick);
    }
    private function onClick(event:MouseEvent):Void {
        if (Machine.lines > 1) Machine.lines--;
    }
}
