
func void b_buyattributepoints(var C_NPC typ,var int atr,var int atrplus)
{
	var int typ_atr;
	var string atrplusstring;
	var string printstring;
	if(atr == ATR_STRENGTH)
	{
		typ_atr = typ.attribute[ATR_STRENGTH];
	}
	else if(atr == ATR_DEXTERITY)
	{
		typ_atr = typ.attribute[ATR_DEXTERITY];
	}
	else if(atr == ATR_MANA_MAX)
	{
		typ_atr = typ.attribute[ATR_MANA_MAX];
	};
	atrplusstring = IntToString(atrplus);
	if(typ.lp >= atrplus)
	{
		if((typ_atr + atrplus) <= 100)
		{
			typ.lp = typ.lp - atrplus;
			if(atr == ATR_STRENGTH)
			{
				typ.attribute[ATR_STRENGTH] = typ.attribute[ATR_STRENGTH] + atrplus;
				printstring = ConcatStrings("Сила +",atrplusstring);
				PrintScreen(printstring,-1,-1,"FONT_OLD_20_WHITE.TGA",1);
			}
			else if(atr == ATR_DEXTERITY)
			{
				typ.attribute[ATR_DEXTERITY] = typ.attribute[ATR_DEXTERITY] + atrplus;
				printstring = ConcatStrings("Ловкость +",atrplusstring);
				PrintScreen(printstring,-1,-1,"FONT_OLD_20_WHITE.TGA",1);
			}
			else if(atr == ATR_MANA_MAX)
			{
				typ.attribute[ATR_MANA_MAX] = typ.attribute[ATR_MANA_MAX] + atrplus;
				printstring = ConcatStrings("Маг. сила +",atrplusstring);
				PrintScreen(printstring,-1,-1,"FONT_OLD_20_WHITE.TGA",1);
			};
		}
		else
		{
			PrintScreen("Дальнейшее улучшение невозможно!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
			b_say(self,other,"$NOLEARNOVERMAX");
		};
	}
	else
	{
		PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void learn_str_1()
{
	b_buyattributepoints(other,ATR_STRENGTH,1);
};

func void learn_str_5()
{
	b_buyattributepoints(other,ATR_STRENGTH,5);
};

func void learn_dex_1()
{
	b_buyattributepoints(other,ATR_DEXTERITY,1);
};

func void learn_dex_5()
{
	b_buyattributepoints(other,ATR_DEXTERITY,5);
};

func void learn_mana_1()
{
	b_buyattributepoints(other,ATR_MANA_MAX,1);
};

func void learn_mana_5()
{
	b_buyattributepoints(other,ATR_MANA_MAX,5);
};

