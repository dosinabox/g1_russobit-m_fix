
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
	hero.exp = hero.exp + add_xp;
	msg = NAME_XPGAINED;
	msg = ConcatStrings(msg,IntToString(add_xp));
	PrintScreen(msg,-1,_YPOS_MESSAGE_XPGAINED,"font_old_10_white.tga",_TIME_MESSAGE_XPGAINED);
	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;
		hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HP_PER_LEVEL;
		hero.lp = hero.lp + LP_PER_LEVEL;
		PrintScreen(NAME_LEVELUP,-1,_YPOS_MESSAGE_LEVELUP,"font_old_20_white.tga",_TIME_MESSAGE_LEVELUP);
		Snd_Play("LevelUp");
	};
};

func void b_deathxp()
{
	printdebugnpc(PD_ZS_FRAME,"B_DeathXP");
	printglobals(PD_ZS_CHECK);
	if(c_npcishuman(self) && Npc_WasInState(self,zs_unconscious))
	{
		printdebugnpc(PD_ZS_CHECK,"...Opfer ist bewuﬂtloser Mensch!");
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Opfer ist entweder nicht bewuﬂtlos oder kein Mensch!");
		b_givexp(self.level * XP_PER_LEVEL_DEAD);
	};
};

func void b_unconciousxp()
{
	printdebugnpc(PD_ZS_FRAME,"B_UnconciousXP");
	printglobals(PD_ZS_CHECK);
	if(!c_npcishuman(self) || !self.aivar[AIV_WASDEFEATEDBYSC])
	{
		printdebugnpc(PD_ZS_CHECK,"...erster Sieg!");
		b_givexp(self.level * XP_PER_LEVEL_DEAD);
	};
};

