package display;

import openfl.display.Stage;
import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.events.Event;
import display.SymbolFactory;
import model.Machine;
import model.Machine.Symbol;

class ReelBlurs extends Tilemap {
    private var counter:Int = 0;
    public function new(stage:Stage) {
        super(128 * 3, 128 * 3, SymbolFactory.instance.tileset);
        stage.addEventListener (Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):Void {
        var symbolFactory:SymbolFactory = SymbolFactory.instance;
        removeTiles();
        counter++;
        for (i in 0...Machine.REELS.length) {
            var reel = Machine.REELS[i];
            for (j in 0...reel.length) {
                var symbol:Symbol = reel[j];
                var d:Int = j * 128 + counter * 32;
                d %= reel.length * 128;
                d -= 256;
                var tile:Tile;
                switch symbol {
                    case Symbol.Heart: tile = symbolFactory.heartBlur();
                    case Symbol.Star: tile = symbolFactory.starBlur();
                    case Symbol.Moon: tile = symbolFactory.moonBlur();
                    case Symbol.Sun: tile = symbolFactory.sunBlur();
                }
                tile.x = i * 128;
                tile.y = d;
                addTile(tile);
            }
        }
    }
}
