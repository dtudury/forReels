package view;


import openfl.display.Tile;
import view.TileFactory;
import model.Machine;
import model.Machine.Symbol;

class Reels {
    public function new() {
        TileFactory.add_redrawer(redraw);
        redraw();
    }

    private function redraw():Void {
        var xOffset:Int = Std.int((TileFactory.stage.stageWidth - TileFactory.SSIZE * 3) / 2);
        for (i in 0...Machine.REELS.length) {
            var reel:Array<Symbol> = Machine.REELS[i];
            var stop:Int = Machine.stops[i];
            for (j in 0...3) {
                var symbol:Symbol = reel[(stop + j) % reel.length];
                var tile:Tile;
                switch symbol {
                    case Symbol.Heart: tile = TileFactory.heart();
                    case Symbol.Star: tile = TileFactory.star();
                    case Symbol.Moon: tile = TileFactory.moon();
                    case Symbol.Sun: tile = TileFactory.sun();
                }
                tile.x = xOffset + i * TileFactory.SSIZE;
                tile.y = j * TileFactory.SSIZE;
                TileFactory.tilemap.addTile(tile);
            }
        }
    }
}
