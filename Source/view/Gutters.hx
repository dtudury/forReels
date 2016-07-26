package view;

import openfl.display.Tile;
import view.TileFactory;

// fill in any overflow

class Gutters {
    public function new() {
        TileFactory.add_redrawer(redraw);
        redraw();
    }
    private function redraw():Void {
        var leftGutter:Tile = TileFactory.whiteSquare();
        leftGutter.x = 0;
        leftGutter.y = 0;
        leftGutter.scaleX = Std.int((TileFactory.stage.stageWidth - TileFactory.SSIZE * 4) / 2);
        leftGutter.scaleY = TileFactory.stage.stageHeight;
        TileFactory.tilemap.addTile(leftGutter);
        var rightGutter:Tile = TileFactory.whiteSquare();
        rightGutter.x = TileFactory.stage.stageWidth - leftGutter.scaleX;
        rightGutter.y = 0;
        rightGutter.scaleX = leftGutter.scaleX;
        rightGutter.scaleY = TileFactory.stage.stageHeight;
        TileFactory.tilemap.addTile(rightGutter);
        var bottomGutter:Tile = TileFactory.whiteSquare();
        bottomGutter.x = 0;
        bottomGutter.y = TileFactory.SSIZE * 4;
        bottomGutter.scaleX = TileFactory.stage.stageWidth;
        bottomGutter.scaleY = TileFactory.stage.stageHeight - TileFactory.SSIZE * 4;
        TileFactory.tilemap.addTile(bottomGutter);
    }
}
