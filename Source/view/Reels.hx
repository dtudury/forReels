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
    }
}
