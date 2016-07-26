package view;

import openfl.display.Tile;
import view.TileFactory;
import model.Machine;
import model.Machine.Symbol;

// ReelBlurs listens to the Machine state and shows itself while
// spinning and hides itself incrementally as Settling resolves

class ReelBlurs {
    public function new() {
        TileFactory.add_redrawer(redraw);
        redraw();
    }

    // just spinning for now, framerate is being finicky after adding buttons...
    // move buttons to same tilemap?
    private function redraw():Void {
        var xOffset:Int = Std.int((TileFactory.stage.stageWidth - TileFactory.SSIZE * 3) / 2);
        var dt:Int = Std.int(2 * Date.now().getTime());
        for (i in 0...Machine.REELS.length) {
            var reel = Machine.REELS[i];
            for (j in 0...reel.length) {
                var symbol:Symbol = reel[j];
                var d:Int = j * TileFactory.SSIZE + dt + i * TileFactory.SSIZE * 4;
                d %= reel.length * TileFactory.SSIZE;
                d -= TileFactory.SSIZE * 2;
                if (d < TileFactory.SSIZE * 3) {
                    var tile:Tile;
                    switch symbol {
                        case Symbol.Heart: tile = TileFactory.heartBlur();
                        case Symbol.Star: tile = TileFactory.starBlur();
                        case Symbol.Moon: tile = TileFactory.moonBlur();
                        case Symbol.Sun: tile = TileFactory.sunBlur();
                    }
                    tile.x = xOffset + i * TileFactory.SSIZE;
                    tile.y = d;
                    TileFactory.tilemap.addTile(tile);
                }
            }
        }
    }
}
