package display;

import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.events.MouseEvent;
import display.SymbolFactory;
import model.Machine;

class WagerDown extends Sprite {
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
        var wager:Int = Machine.wager;
        var magnitude:Int = 1;
        while (wager >= 10) {
            wager = Std.int(wager / 10);
            magnitude *= 10;
        }
        if (wager <= 1) {
            wager = 5;
            magnitude = Std.int(magnitude / 10);
        } else if (wager <= 2) {
            wager = 1;
        } else {
            wager = 2;
        }
        if (magnitude < 1) Machine.wager = 1;
        else Machine.wager = wager * magnitude;
    }
}
