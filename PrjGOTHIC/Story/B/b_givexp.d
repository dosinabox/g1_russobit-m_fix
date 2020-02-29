
const int LP_PER_LEVEL = 10;
const int HP_PER_LEVEL = 12;
const int XP_PER_LEVEL_UNCONSCIOUS = 5;
const int XP_PER_LEVEL_DEAD = 10;

func void b_givexp(var int add_xp)
{
	var string msg;
	printdebugnpc(PD_ZS_FRAME,"B_GiveXP");
	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};
	msg = NAME_XPGAINED;
	if(DIFF_HARD == TRUE)
	{
		hero.exp = hero.exp + (add_xp / 2);
		msg = ConcatStrings(msg,IntToString(add_xp / 2));
	}
	else
	{
		hero.exp = hero.exp + add_xp;
		msg = ConcatStrings(msg,IntToString(add_xp));
	};
	//msg = NAME_XPGAINED;
	//msg = ConcatStrings(msg,IntToString(add_xp));
	PrintScreen(msg,-1,_YPOS_MESSAGE_XPGAINED,"font_old_10_white.tga",_TIME_MESSAGE_XPGAINED);
	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;
		hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		if(!Npc_IsDead(hero))
		{
			if(DIFF_HARD == TRUE)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 8;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 8;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + HP_PER_LEVEL;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HP_PER_LEVEL;
			};
		};
		hero.lp = hero.lp + LP_PER_LEVEL;
		PrintScreen(NAME_LEVELUP,-1,_YPOS_MESSAGE_LEVELUP,"font_old_20_white.tga",_TIME_MESSAGE_LEVELUP);
		Snd_Play("LevelUp");
	};
};

func void b_deathxp()
{
	printdebugnpc(PD_ZS_FRAME,"B_DeathXP");
	printglobals(PD_ZS_CHECK);
	if((c_npcishuman(self) && (Npc_WasInState(self,zs_unconscious) || self.aivar[AIV_WASDEFEATEDBYSC])) || (self.level == 0) || (self.npctype == NPCTYPE_FRIEND))
	{
		printdebugnpc(PD_ZS_CHECK,"...Opfer ist bewußtloser Mensch!");
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Opfer ist entweder nicht bewußtlos oder kein Mensch!");
		if(c_npcishuman(self) && (self.npctype == NPCTYPE_MINE_AMBIENT || self.npctype == NPCTYPE_AMBIENT || self.id == 899 || self.id == 898))
		{
			if(self.npctype == NPCTYPE_AMBIENT && (self.id == 336 || self.id == 337 || self.id == 338 || self.id == 889 || self.id == 239 || self.id == 701 || self.id == 704 || self.id == 828))
			{
				b_givexp(self.level * XP_PER_LEVEL_DEAD);
			}
			else
			{
				b_givexp(10);
			};
		}
		else if(self.level > 0)
		{
			b_givexp(self.level * XP_PER_LEVEL_DEAD);
		};
	};
};

func void b_unconciousxp()
{
	printdebugnpc(PD_ZS_FRAME,"B_UnconciousXP");
	printglobals(PD_ZS_CHECK);
	if(!c_npcishuman(self) || !self.aivar[AIV_WASDEFEATEDBYSC])
	{
		printdebugnpc(PD_ZS_CHECK,"...erster Sieg!");
		if(c_npcishuman(self) && (self.npctype == NPCTYPE_MINE_AMBIENT || self.npctype == NPCTYPE_AMBIENT || self.id == 899 || self.id == 898))
		{
			if(self.npctype == NPCTYPE_AMBIENT && (self.id == 336 || self.id == 337 || self.id == 338 || self.id == 889 || self.id == 239 || self.id == 701 || self.id == 704 || self.id == 828))
			{
				b_givexp(self.level * XP_PER_LEVEL_DEAD);
			}
			else
			{
				b_givexp(10);
			};
		}
		else if(self.level > 0)
		{
			b_givexp(self.level * XP_PER_LEVEL_DEAD);
		};
	};
};

