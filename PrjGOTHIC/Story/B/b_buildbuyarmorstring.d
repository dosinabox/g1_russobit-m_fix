
func string b_buildbuyarmorstring(var string text,var int price)
{
	var string msg;
	msg = ConcatStrings(text,NAME_BUYARMORPREFIX);
	msg = ConcatStrings(msg,IntToString(price));
	msg = ConcatStrings(msg,NAME_BUYARMORPOSTFIX);
	return msg;
};

