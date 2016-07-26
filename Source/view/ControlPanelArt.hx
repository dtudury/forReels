package view;

import openfl.display.Tile;
import view.TileFactory;

// positioning element to hold the controls

class ControlPanelArt {
    public function new() {
        TileFactory.add_redrawer(redraw);
        redraw();
    }
    private function redraw():Void {
        var tile:Tile = TileFactory.controlPanel();
        tile.x = Std.int((TileFactory.stage.stageWidth - TileFactory.SSIZE * 4) / 2);
        tile.y = TileFactory.SSIZE * 3;
        TileFactory.tilemap.addTile(tile);
    }
}
