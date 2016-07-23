package;

import openfl.display.BitmapData;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Rectangle;
import openfl.Assets;
import model.Machine;
import model.Machine.Symbol;


class Main extends Sprite {

    private var tilemap:Tilemap;
    private var tileset:Tileset;
    private var fps:FPS;
	
	public function new () {
		
		super ();

        stage.frameRate = 120;

        trace(Machine.REELS);
        trace(Machine.PAYS[Star]);
        Machine.stops = [2,3,4];

        var bitmapData:BitmapData = Assets.getBitmapData("assets/tileset.png");
        tileset = new Tileset (bitmapData);
        tileset.addRect (new Rectangle(0, 0, 32, 32));
        tileset.addRect (new Rectangle(0, 32, 32, 32));
        tileset.addRect (new Rectangle(32, 0, 32, 32));
        tileset.addRect (new Rectangle(32, 32, 32, 32));
        trace(bitmapData.rect);

        tilemap = new Tilemap (stage.stageWidth, stage.stageHeight, tileset);
        addChild (tilemap);

        fps = new FPS ();
        addChild (fps);

        stage.addEventListener (Event.ENTER_FRAME, stage_onEnterFrame);

	}

    private function stage_onEnterFrame (event:Event):Void {
        var thing = new Tile(Math.floor(Math.random() * 4));
        thing.x = Math.random() * stage.stageWidth;
        thing.y = Math.random() * stage.stageHeight;
        tilemap.addTile(thing);
    }
	
	
}
