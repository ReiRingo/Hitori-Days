for (var i = 0; i < array_length(eventCleanUp); ++i) {
	if (is_callable(eventCleanUp[i])) eventCleanUp[i]();
}