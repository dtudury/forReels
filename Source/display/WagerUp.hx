package display;

import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.events.MouseEvent;
import display.SymbolFactory;
import model.Machine;

class WagerUp extends Sprite {
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
        var wager:Int = Machine.wager;
        var magnitude:Int = 1;
        while (wager >= 10) {
            wager = Std.int(wager / 10);
            magnitude *= 10;
        }
        if (wager >= 5) {
            wager = 1;
            magnitude *= 10;
        } else if (wager >= 2) {
            wager = 5;
        } else {
            wager = 2;
        }
        Machine.wager = wager * magnitude;
    }
}
