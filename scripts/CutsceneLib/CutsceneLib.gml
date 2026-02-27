function __InternalCutsceneLibrary() constructor {
    
    // --- Helper for adding tasks to the queue ---
    static custom = function(_cut, _struct) {
        array_push(_cut._queue, _struct);
    };

    #region Management
    
    static create = function() {
        return instance_create_depth(0, 0, 0, cutsceneManager);
    };

    static play = function(_cut) {
        _cut._ready = true;
    };

    static halt = function(_cut) {
        custom(_cut, {
            cut: _cut,
            init: function() { cut._ready = false; },
            update: false
        });
    };

    static endOnQueue = function(_cut) {
        custom(_cut, {
            cut: _cut,
            init: function() { instance_destroy(cut); },
            update: false
        });
    };
    
    #endregion

    #region Basic Actions

    static action = function(_cut, _func) {
        custom(_cut, {
            init: _func,
            update: false
        });
    };

    static sleep = function(_cut, _frames) {
        custom(_cut, {
            timer: _frames,
            init: function() {},
            update: function() { return (--timer > 0); }
        });
    };

    #endregion

    #region Camera & Visuals

    static cameraMoveTween = function(_cut, _to, _time = 10, _tween = TweenLinear, _from = undefined) {
        var _startPos = _from ?? vec2(cameraManager.x, cameraManager.y);
        var _targetPos = is_array(_to) ? vec2(_to[0], _to[1]) : _to;

        custom(_cut, {
            f: _startPos,
            t: _targetPos,
            tm: _time,
            tn: _tween,
            init: function() {
                doAnime(f.x, t.x, tm, tn, function(a) { cameraManager.x = a; });
                doAnime(f.y, t.y, tm, tn, function(a) { cameraManager.y = a; });
            },
            update: function() {
                return !(cameraManager.x == t.x && cameraManager.y == t.y);
            }
        });
        return true;
    };

    #endregion

    #region Character Logic

    static playerMoveable = function(_cut, _moveable) {
        custom(_cut, {
            moveBool: _moveable,
            init: function() {
                if (instance_exists(charPlayer)) charPlayer._canMoveCutscene = moveBool;
            },
            update: false
        });
    };

    static charMove = function(_cut, _targetChar, _dir, _amount, _wait = true) {
        custom(_cut, {
            charTar: _targetChar,
            wait: _wait,
            dir: _dir,
            amt: _amount,
            init: function() { charTar._move[dir] = amt; },
            update: function() {
                return wait ? (charTar._move[dir] != 0) : false;
            }
        });
    };

    static charMoveTarget = function(_cut, _char, _tx, _ty, _wait = true) {
        custom(_cut, {
            charTar: _char,
            tVec: [_tx, _ty],
            wait: _wait,
            init: function() { charWalk(charTar, tVec[0], tVec[1]); },
            update: function() {
                if (!wait) return false;
                // Check if any movement key in the buffer is non-zero
                return (charTar._move[0] != 0 || charTar._move[1] != 0 || charTar._move[2] != 0 || charTar._move[3] != 0);
            }
        });
    };

    static charTurn = function(_cut, _char, _dir) {
        custom(_cut, {
            charTar: _char,
            dir: _dir,
            init: function() { charTar.dir = dir; },
            update: false
        });
    };

    #endregion

    #region Dialogue

    static startDialogue = function(_cut, _text, _voice = sndTextDefault, _pitch = [0.8, 1.2]) {
        custom(_cut, {
            tx: _text,
            v: _voice,
            pit: _pitch,
            diaInst: noone,
            init: function() {
                var _dia = dialogueStart(tx, v, pit);
                diaInst = _dia.getTyper();
            },
            update: function() {
                return instance_exists(diaInst);
            }
        });
    };

    #endregion
}

// Initialisation
#macro Cutscene global.__externalCutsceneLib
Cutscene = new __InternalCutsceneLibrary();