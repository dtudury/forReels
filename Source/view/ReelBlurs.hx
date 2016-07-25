package view;

import openfl.display.Stage;
import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.events.Event;
import view.SymbolFactory;
import model.Machine;
import model.Machine.Symbol;

// ReelBlurs listens to the Machine state and shows itself while
// spinning and hides itself incrementally as Settling resolves

class ReelBlurs extends Tilemap {
    public function new(stage:Stage) {
        super(SymbolFactory.SSIZE * 3, SymbolFactory.SSIZE * 3, SymbolFactory.instance.tileset);
        stage.addEventListener (Event.ENTER_FRAME, onEnterFrame);
    }

    // just spinning for now, framerate is being finicky after adding buttons...
    // move buttons to same tilemap?
    private function onEnterFrame(event:Event):Void {
        var symbolFactory:SymbolFactory = SymbolFactory.instance;
        removeTiles();
        var counter:Int = Std.int(2 * Date.now().getTime());
        for (i in 0...Machine.REELS.length) {
            var reel = Machine.REELS[i];
            for (j in 0...reel.length) {
                var symbol:Symbol = reel[j];
                var d:Int = j * SymbolFactory.SSIZE + counter + i * SymbolFactory.SSIZE * 4;
                d %= reel.length * SymbolFactory.SSIZE;
                d -= SymbolFactory.SSIZE * 2;
                if (d < SymbolFactory.SSIZE * 3) {
                    var tile:Tile;
                    switch symbol {
                        case Symbol.Heart: tile = symbolFactory.heartBlur();
                        case Symbol.Star: tile = symbolFactory.starBlur();
                        case Symbol.Moon: tile = symbolFactory.moonBlur();
                        case Symbol.Sun: tile = symbolFactory.sunBlur();
                    }
                    tile.x = i * SymbolFactory.SSIZE;
                    tile.y = d;
                    addTile(tile);
                }
            }
        }
    }
}
