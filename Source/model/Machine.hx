package model;

import openfl.events.Event;
import openfl.events.EventDispatcher;

enum Symbol { 
    Heart; 
    Star;
    Moon; 
    Sun;
}

enum Row {
    Top;
    Middle;
    Bottom;
}

// more or less sequential states of the game cycle
enum State {
    Idle;
    Betting;
    Spinning;
    Settling1;
    Settling2;
    Settling3;
    Paying;
    Showing_wins;
}

class Machine {

    public static var STOPS_SET(default, never):String = "STOPS_SET";
    public static var STATE_SET(default, never):String = "STATE_SET";
    public static var WAGER_SET(default, never):String = "WAGER_SET";
    public static var LINES_SET(default, never):String = "LINES_SET";
    public static var BALANCE_SET(default, never):String = "BALANCE_SET";
    public static var WINNINGS_SET(default, never):String = "WINNINGS_SET";

    // this should move to a config file
    // 98.33676268861457% payback
    public static var PAYS(default, never):Map<Symbol,Int> = [Heart => 2, Moon => 15, Star => 120, Sun => 900];
    public static var REELS(default, never):Array<Array<Symbol>> = [
        [Heart,Heart,Heart,Star,Moon,Heart,Moon,Heart,Sun,Star,Moon,Moon,Heart,Heart,Moon,Heart,Heart,Heart],
        [Moon,Star,Moon,Heart,Moon,Moon,Heart,Star,Sun,Heart,Heart,Heart,Moon,Heart,Heart,Heart,Heart,Heart],
        [Moon,Star,Moon,Heart,Heart,Moon,Moon,Heart,Sun,Heart,Heart,Heart,Heart,Star,Heart,Heart,Moon,Heart]
    ];
    // payline patterns
    public static var LINES(default, never):Array<Array<Row>> = [
        [Middle, Middle, Middle],
        [Top, Middle, Bottom],
        [Bottom, Middle, Top],
        [Top, Top, Top],
        [Bottom, Bottom, Bottom],
        [Middle, Top, Middle],
        [Middle, Bottom, Middle],
        [Top, Middle, Top],
        [Bottom, Middle, Bottom],
        [Top, Middle, Middle],
        [Bottom, Middle, Middle],
        [Middle, Top, Top],
        [Middle, Bottom, Bottom],
        [Top, Top, Middle],
        [Bottom, Bottom, Middle]
    ];


    //where the reels stop after placing a wager
    public static var stops(default, set):Array<Int> = [0,0,0];
    static function set_stops(in_stops) {
        stops = in_stops;
        eventDispatcher.dispatchEvent(new Event(STOPS_SET));
        return stops;
    }

    //game cycle phase (should we be "whirring" or "dinging")
    public static var state(default, set):State = Idle;
    static function set_state(in_state:State) {
        state = in_state;
        eventDispatcher.dispatchEvent(new Event(STATE_SET));
        return state;
    }

    //bet per line
    public static var wager(default, set):Int = 1;
    static function set_wager(in_wager:Int) {
        wager = in_wager;
        eventDispatcher.dispatchEvent(new Event(WAGER_SET));
        return wager;
    }

    //number of lines
    public static var lines(default, set):Int = 1;
    static function set_lines(in_lines:Int) {
        lines = in_lines;
        eventDispatcher.dispatchEvent(new Event(LINES_SET));
        return lines;
    }

    //actual balance (displayed balance might be less winnings)
    public static var balance(default, set):Int = 10000;
    static function set_balance(in_balance:Int) {
        balance = in_balance;
        eventDispatcher.dispatchEvent(new Event(BALANCE_SET));
        return balance;
    }

    //how much the player won from the most recent wager
    public static var winnings(default, set):Int = 1;
    static function set_winnings(in_winnings:Int) {
        winnings = in_winnings;
        eventDispatcher.dispatchEvent(new Event(WINNINGS_SET));
        return winnings;
    }

    public static var eventDispatcher = new EventDispatcher();
}
