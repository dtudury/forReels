package view;

import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Tile;
import openfl.display.Tileset;
import openfl.geom.Rectangle;

class SymbolFactory {

    public static var SSIZE(default, never):Int = 128;

    //static methods weren't getting Assets so wrapped it up in a singleton
    public static var instance(get, never):SymbolFactory;
    private static var _instance:SymbolFactory = null;
    public static function get_instance():SymbolFactory {
        if (_instance == null) {
            _instance = new SymbolFactory();
        }
        return _instance;
    }

    public var tileset:Tileset;
    private var starIndex:Int;
    private var heartIndex:Int;
    private var moonIndex:Int;
    private var sunIndex:Int;
    private var starBlurIndex:Int;
    private var heartBlurIndex:Int;
    private var moonBlurIndex:Int;
    private var sunBlurIndex:Int;
    private var plusIndex:Int;
    private var minusIndex:Int;
    private function new () {
        var bitmapData:BitmapData = Assets.getBitmapData("assets/symbols.png");
        this.tileset = new Tileset (bitmapData);
        this.starIndex = tileset.addRect (new Rectangle(0, 0, SSIZE, SSIZE));
        this.heartIndex = tileset.addRect (new Rectangle(0, SSIZE, SSIZE, SSIZE));
        this.moonIndex = tileset.addRect (new Rectangle(0, SSIZE * 2, SSIZE, SSIZE));
        this.sunIndex = tileset.addRect (new Rectangle(0, SSIZE * 3, SSIZE, SSIZE));
        this.starBlurIndex = tileset.addRect (new Rectangle(SSIZE, 0, SSIZE, SSIZE * 2));
        this.heartBlurIndex = tileset.addRect (new Rectangle(SSIZE * 2, 0, SSIZE, SSIZE * 2));
        this.moonBlurIndex = tileset.addRect (new Rectangle(SSIZE, SSIZE * 2, SSIZE, SSIZE * 2));
        this.sunBlurIndex = tileset.addRect (new Rectangle(SSIZE * 2, SSIZE * 2, SSIZE, SSIZE * 2));
        this.plusIndex = tileset.addRect (new Rectangle(448, 32, 32, 32));
        this.minusIndex = tileset.addRect (new Rectangle(448, 96, 32, 32));
    }
    public function star():Tile {
        return new Tile(starIndex);
    }
    public function heart():Tile {
        return new Tile(heartIndex);
    }
    public function moon():Tile {
        return new Tile(moonIndex);
    }
    public function sun():Tile {
        return new Tile(sunIndex);
    }
    public function starBlur():Tile {
        return new Tile(starBlurIndex);
    }
    public function heartBlur():Tile {
        return new Tile(heartBlurIndex);
    }
    public function moonBlur():Tile {
        return new Tile(moonBlurIndex);
    }
    public function sunBlur():Tile {
        return new Tile(sunBlurIndex);
    }
    public function plus():Tile {
        return new Tile(plusIndex);
    }
    public function minus():Tile {
        return new Tile(minusIndex);
    }
}
