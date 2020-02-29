
func void g_cannotuse(var int bisplayer,var int nattribute,var int nvalue)
{
	var int nattributevalue;
	var string strattribute;
	var int ndifference;
	var string strdifference;
	var string strmessage;
	if(nattribute == ATR_HITPOINTS)
	{
		strattribute = _STR_ATTRIBUTE_HITPOINTS;
		nattributevalue = self.attribute[ATR_HITPOINTS];
	}
	else if(nattribute == ATR_HITPOINTS_MAX)
	{
		strattribute = _STR_ATTRIBUTE_HITPOINTS_MAX;
		nattributevalue = self.attribute[ATR_HITPOINTS_MAX];
	}
	else if(nattribute == ATR_MANA)
	{
		strattribute = _STR_ATTRIBUTE_MANA;
		nattributevalue = self.attribute[ATR_MANA];
	}
	else if(nattribute == ATR_MANA_MAX)
	{
		strattribute = _STR_ATTRIBUTE_MANA_MAX;
		nattributevalue = self.attribute[ATR_MANA_MAX];
	}
	else if(nattribute == ATR_STRENGTH)
	{
		strattribute = _STR_ATTRIBUTE_STRENGTH;
		nattributevalue = self.attribute[ATR_STRENGTH];
	}
	else if(nattribute == ATR_DEXTERITY)
	{
		strattribute = _STR_ATTRIBUTE_DEXTERITY;
		nattributevalue = self.attribute[ATR_DEXTERITY];
	}
	else
	{
		strattribute = _STR_INVALID;
		nattributevalue = 0;
	};
	ndifference = nvalue - nattributevalue;
	strdifference = IntToString(ndifference);
	if(bisplayer)
	{
		strmessage = _STR_CANNOTUSE_PRE_PLAYER;
	}
	else
	{
		return;
	};
	strmessage = ConcatStrings(strmessage,strdifference);
	strmessage = ConcatStrings(strmessage," ");
	strmessage = ConcatStrings(strmessage,strattribute);
	strmessage = ConcatStrings(strmessage,"для использования.");
	if(bisplayer)
	{
		g_printscreen(strmessage);
	};
};

