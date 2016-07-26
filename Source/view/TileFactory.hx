package view;

import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Stage;
import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.events.Event;
import openfl.geom.Rectangle;

// factory for tiles cut out from our main png

class TileFactory {

    //how big the square around our symbols is
    public static var SSIZE(default, never):Int = 128;

    public static var stage(get, never):Stage;
    public static function get_stage():Stage {
        return _stage;
    }

    public static var tilemap(get, never):Tilemap;
    public static function get_tilemap():Tilemap {
        return _tilemap;
    }

    private static var _stage:Stage;
    private static var _tilemap:Tilemap;
    private static var _tileset:Tileset;
    private static var _starIndex:Int;
    private static var _heartIndex:Int;
    private static var _moonIndex:Int;
    private static var _sunIndex:Int;
    private static var _starBlurIndex:Int;
    private static var _heartBlurIndex:Int;
    private static var _moonBlurIndex:Int;
    private static var _sunBlurIndex:Int;
    private static var _plusIndex:Int;
    private static var _minusIndex:Int;
    private static var _controlPanelIndex:Int;
    private static var _whiteSquareIndex:Int;
    private static var _redraws:Array<Void->Void> = [];

    public static function init(stage:Stage):Void {
        _stage = stage;
        var bitmapData:BitmapData = Assets.getBitmapData("assets/symbols.png");
        _tileset = new Tileset (bitmapData);
        _tilemap = new Tilemap(stage.stageWidth, stage.stageHeight, _tileset, false);
        _starIndex      = _tileset.addRect (new Rectangle(SSIZE * 0, 0, SSIZE, SSIZE));
        _heartIndex     = _tileset.addRect (new Rectangle(SSIZE * 1, 0, SSIZE, SSIZE));
        _moonIndex      = _tileset.addRect (new Rectangle(SSIZE * 2, 0, SSIZE, SSIZE));
        _sunIndex       = _tileset.addRect (new Rectangle(SSIZE * 3, 0, SSIZE, SSIZE));
        _starBlurIndex  = _tileset.addRect (new Rectangle(SSIZE * 0, SSIZE, SSIZE, Std.int(SSIZE * 1.5)));
        _heartBlurIndex = _tileset.addRect (new Rectangle(SSIZE * 1, SSIZE, SSIZE, Std.int(SSIZE * 1.5)));
        _moonBlurIndex  = _tileset.addRect (new Rectangle(SSIZE * 2, SSIZE, SSIZE, Std.int(SSIZE * 1.5)));
        _sunBlurIndex   = _tileset.addRect (new Rectangle(SSIZE * 3, SSIZE, SSIZE, Std.int(SSIZE * 1.5)));
        _controlPanelIndex = _tileset.addRect (new Rectangle(0, Std.int(SSIZE * 3), SSIZE * 4, Std.int(SSIZE * 1.5)));
        _whiteSquareIndex = _tileset.addRect (new Rectangle(0, 352, 1, 1));
        _plusIndex = _tileset.addRect (new Rectangle(448, 32, 32, 32));
        _minusIndex = _tileset.addRect (new Rectangle(448, 96, 32, 32));
        _stage.addEventListener(Event.ENTER_FRAME, _clear_and_redraw);
    }

    public static function add_redrawer(redraw:Void->Void):Void {
        _redraws.push(redraw);
    }
    private static function _clear_and_redraw(event:Event):Void {
        tilemap.removeTiles();
        for (redraw in _redraws) redraw();
    }


    //getters for our tiles
    public static function star():Tile {
        return new Tile(_starIndex);
    }
    public static function heart():Tile {
        return new Tile(_heartIndex);
    }
    public static function moon():Tile {
        return new Tile(_moonIndex);
    }
    public static function sun():Tile {
        return new Tile(_sunIndex);
    }
    public static function starBlur():Tile {
        return new Tile(_starBlurIndex);
    }
    public static function heartBlur():Tile {
        return new Tile(_heartBlurIndex);
    }
    public static function moonBlur():Tile {
        return new Tile(_moonBlurIndex);
    }
    public static function sunBlur():Tile {
        return new Tile(_sunBlurIndex);
    }
    public static function controlPanel():Tile {
        return new Tile(_controlPanelIndex);
    }
    public static function whiteSquare():Tile {
        return new Tile(_whiteSquareIndex);
    }
    public static function plus():Tile {
        return new Tile(_plusIndex);
    }
    public static function minus():Tile {
        return new Tile(_minusIndex);
    }
}
