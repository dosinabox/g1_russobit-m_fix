
func void g_cannotcast(var int bisplayer,var int ncircleneeded,var int ncirclepossessed)
{
	var int ndifference;
	var string strdifference;
	var string strmessage;
	ndifference = ncircleneeded - ncirclepossessed;
	strdifference = IntToString(ndifference);
	if(bisplayer)
	{
		strmessage = _STR_CANNOTUSE_PRE_PLAYER;
	}
	else
	{
		strmessage = ConcatStrings(self.name,_STR_CANNOTUSE_PRE_NPC);
		strmessage = ConcatStrings(strmessage,IntToString(self.id));
		strmessage = ConcatStrings(strmessage,_STR_CANNOTUSE_POST_NPC);
	};
	strmessage = ConcatStrings(strmessage,strdifference);
	strmessage = ConcatStrings(strmessage," ");
	strmessage = ConcatStrings(strmessage,_STR_ATTRIBUTE_MAGIC_CIRCLE);
	strmessage = ConcatStrings(strmessage,_STR_CANNOTUSE_LEVELS);
	strmessage = ConcatStrings(strmessage,_STR_CANNOTUSE_POST);
	g_printscreen(strmessage);
};

