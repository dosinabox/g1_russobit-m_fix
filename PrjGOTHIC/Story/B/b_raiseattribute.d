
func void b_raiseattribute(var int attribute,var int value)
{
	var string msg;
	printdebugnpc(PD_ZS_FRAME,"B_RaiseAttribute");
	Npc_ChangeAttribute(self,attribute,value);
	if(attribute == ATR_STRENGTH)
	{
		msg = ConcatStrings(NAME_RAISESTRENGTH,IntToString(value));
	}
	else if(attribute == ATR_DEXTERITY)
	{
		msg = ConcatStrings(NAME_RAISEDEXTERITY,IntToString(value));
	}
	else if(attribute == ATR_MANA_MAX)
	{
		msg = ConcatStrings(NAME_RAISEMANAMAX,IntToString(value));
	}
	else if(attribute == ATR_HITPOINTS_MAX)
	{
		msg = ConcatStrings(NAME_RAISEHEALTHMAX,IntToString(value));
	};
	PrintScreen(msg,-1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
};

