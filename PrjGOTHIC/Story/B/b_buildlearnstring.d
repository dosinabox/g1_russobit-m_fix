
func string b_buildlearnstring(var string text,var int lp,var int ore)
{
	var string msg;
	msg = ConcatStrings(text,NAME_LEARNPREFIX);
	if(ore > 0)
	{
		msg = ConcatStrings(msg,IntToString(ore));
		msg = ConcatStrings(msg,NAME_LEARNMIDFIX);
	};
	msg = ConcatStrings(msg,IntToString(lp));
	if(lp == 1)
	{
		msg = ConcatStrings(msg,NAME_LEARNPOSTFIXS);
	}
	else
	{
		msg = ConcatStrings(msg,NAME_LEARNPOSTFIXP);
	};
	return msg;
};

