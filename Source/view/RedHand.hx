package view;

import openfl.display.Tile;
import view.TileFactory;
import model.Machine;
import model.Machine.Button;

class RedHand {
    public function new() {
        TileFactory.add_redrawer(redraw);
        redraw();
    }
    private function redraw():Void {
        var tile:Tile = TileFactory.pointer();
        if (Machine.over != Button.None) {
            tile.x = TileFactory.stage.mouseX - 5;
            tile.y = TileFactory.stage.mouseY;
        }
        //if I don't do this I get a "Range Error" in the html...
        TileFactory.tilemap.addTile(tile);
    }
}
