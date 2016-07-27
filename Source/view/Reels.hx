package view;


import openfl.display.Tile;
import view.TileFactory;
import controller.BetLogic;
import model.Machine;
import model.Machine.Symbol;
import model.Machine.State;

class Reels {
    public function new() {
        TileFactory.add_redrawer(redraw);
        redraw();
    }

    private function calculateDy(dt:Float):Int {
        var t:Float = dt % 1;
        if (t > 0.5) return 0;
        t *= 2;
        var u:Float = 1 - t;
        var y:Float = u*u*u * 20 + 3*u*u*t*(-20);
        return Std.int(y);
    }
    private function redraw():Void {
        var xOffset:Int = Std.int((TileFactory.stage.stageWidth - TileFactory.SSIZE * 3) / 2);
        var dt:Float = (Date.now().getTime() - Machine.stateSetTime) / 1000;
        if (Machine.state == State.Settling && dt > 2.5) {
            BetLogic.payout();
        }
        for (i in 0...Machine.REELS.length) {
            var visible:Bool = true;
            var dy:Int = 0;
            if (Machine.state == State.Spinning) {
                visible = false;
            } else if (Machine.state == State.Settling) {
                visible = i < dt;
            }
            if (Machine.state == State.Settling && Std.int(dt) == i) {
                dy = calculateDy(dt);
            }
            var whiteOut:Tile = TileFactory.whiteSquare();
            whiteOut.x = xOffset + i * TileFactory.SSIZE;
            whiteOut.y = 0;
            whiteOut.scaleX = TileFactory.SSIZE;
            whiteOut.scaleY = TileFactory.SSIZE * 3;
            //visible fails in html
            if (!visible) whiteOut.x = -TileFactory.SSIZE;
            TileFactory.tilemap.addTile(whiteOut);
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
                tile.y = j * TileFactory.SSIZE + dy;
                if (!visible) tile.x = -TileFactory.SSIZE;
                TileFactory.tilemap.addTile(tile);
            }
        }
    }
}
