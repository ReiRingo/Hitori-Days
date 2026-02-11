// 1. INPUT & STATE HANDLING
switch (state)
{
    case DawState.Editing:
        // --- Cursor Movement ---
        if (Input.Pressed(VKey.Right)) {
            cursorX++;
            // Scroll view if cursor goes off screen
            if (cursorX >= viewX + GRID_W) viewX = cursorX - GRID_W + 1;
        }
        
        if (Input.Pressed(VKey.Left)) {
            cursorX = max(0, cursorX - 1);
            if (cursorX < viewX) viewX = cursorX;
        }
        
        if (Input.Pressed(VKey.Up))   cursorY = min(24, cursorY + 1);
        if (Input.Pressed(VKey.Down)) cursorY = max(0, cursorY - 1);
        
        // --- Note Placement ---
        if (Input.Pressed(VKey.Confirm))
        {
            // Pitch Math: 12 is "Reference", every +12 is an octave up
            var _pitch = power(2, (cursorY - 12) / 12);
            
            // +1 because your SongClass uses 1-based indexing for logic
            currentSong.InsertSound(cursorX + 1, sndPiano, _pitch);
        }
        
        // --- Note Deletion ---
        // (Assuming you have a Delete key, or use a modifier)
        // For now, let's map "Cancel" to Menu, so maybe use a separate key for delete?
        // Or specific context:
        
        // --- Menu Access ---
        if (Input.Pressed(VKey.Cancel)) {
            state = DawState.Menu;
            isPlaying = false; // Stop music when opening menu
        }
        
        // --- Playback Toggle (Spacebar logic) ---
        // Assuming VKey.Special or similar, or just keyboard_check_pressed(vk_space)
        if (keyboard_check_pressed(vk_space)) {
            isPlaying = !isPlaying;
            if (!isPlaying) playhead = 0; // Reset or Pause? Reset is safer for now.
        }
    break;

    case DawState.Menu:
        if (Input.Pressed(VKey.Up))   menuIndex = max(0, menuIndex - 1);
        if (Input.Pressed(VKey.Down)) menuIndex = min(array_length(menuOptions) - 1, menuIndex + 1);
        
        if (Input.Pressed(VKey.Confirm))
        {
            switch(menuIndex) {
                case 0: songSave(currentSong.name, currentSong); break;
                case 1: loadSong("Save1"); break; // Hardcoded name for demo
                case 2: startNewSong("New", 128, 4); break;
                case 3: /*room_goto(rm_world);*/ break;
            }
            state = DawState.Editing; // Return to editing after action
        }
        
        if (Input.Pressed(VKey.Cancel)) state = DawState.Editing;
    break;
}

// 2. AUDIO PLAYBACK ENGINE (Your Logic)
if (currentSong != undefined && isPlaying)
{
    var _stepsPerSecond = (currentSong.bpm / 60) * currentSong.timeSig;
    var _lastSteps = floor(playhead);
    
    playhead += _stepsPerSecond * (delta_time / 1000000);
    
    var _currentSteps = floor(playhead);
    
    if (_currentSteps > _lastSteps)
    {
        // Loop through all steps we might have missed in this frame
        for (var i = _lastSteps + 1; i <= _currentSteps; i++)
        {
            // Modulo allows looping the song visual/logic if you want, 
            // or just prevents crash if playhead goes past song length.
            var _gridIndex = i % currentSong.GetSize(); 
            
            // Check if slot exists (SongClass auto-expands, so we are safe usually)
            if (_gridIndex < array_length(currentSong.grid))
            {
                var _note = currentSong.grid[_gridIndex];
                if (_note.active && _note.audio != noone)
                {
                    var _snd = audio_play_sound(_note.audio, 1, false);
                    audio_sound_pitch(_snd, _note.pitch);
                }
            }
        }
    }
}