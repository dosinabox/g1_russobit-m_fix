
func void g_cannotcast(var int bisplayer,var int ncircleneeded,var int ncirclepossessed)
{
	var int ndifference;
	var string strdifference;
	var string strmessage;
	if((ncircleneeded == 7) && bisplayer)
	{
		strmessage = "������ ������, � �� ���� ������������ ��� � ���.";
		g_printscreen(strmessage);
		return;
	};
	if((ncircleneeded == 8) && bisplayer)
	{
		strmessage = "������ ������ ����� �����, ��� ������������ ���� �������.";
		g_printscreen(strmessage);
		return;
	};
	strmessage = _STR_ATTRIBUTE_MAGIC_CIRCLE;
	strmessage = ConcatStrings(strmessage,IntToString(ncircleneeded));
	strmessage = ConcatStrings(strmessage," ");
	strmessage = ConcatStrings(strmessage,_STR_CANNOTUSE_LEVELS);
	strmessage = ConcatStrings(strmessage,_STR_CANNOTUSE_POST);
	if(bisplayer)
	{
		g_printscreen(strmessage);
	};
};

