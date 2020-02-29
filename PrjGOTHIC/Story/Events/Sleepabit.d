
func void pc_sleep(var int t)
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if(Wld_IsTime(0,0,t,0))
	{
		Wld_SetTime(t,0);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t,0);
	};
	PrintScreen("Ты хорошо выспался!",-1,-1,"font_old_20_white.tga",3);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	printglobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
	b_sayoverlay(hero,NULL,"SVM_15_Awake");
	PLAYER_MOBSI_PRODUCTION = MOBSI_SLEEPABITEND;
};

func void sleepabit_s1()
{
	var C_NPC her;
	var C_NPC rock;
	her = Hlp_GetNpc(pc_hero);
	rock = Hlp_GetNpc(pc_rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		if(Npc_RefuseTalk(self) == TRUE)
	    {
	    	PrintScreen("Сейчас здесь нельзя спать...",-1,-1,"font_old_20_white.tga",3);
			self.aivar[AIV_INVINCIBLE] = FALSE;
	    };
		AI_ProcessInfos(her);
		PLAYER_MOBSI_PRODUCTION = MOBSI_SLEEPABIT;
	};
};


instance PC_NOSLEEP(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_nosleep_condition;
	information = pc_nosleep_info;
	important = 0;
	permanent = 1;
	description = "ОТМЕНА";
};


func int pc_nosleep_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return TRUE;
	};
};

func void pc_nosleep_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SLEEPTIME_MORNING(C_INFO)
{
	npc = pc_hero;
	condition = pc_sleeptime_morning_condition;
	information = pc_sleeptime_morning_info;
	important = 0;
	permanent = 1;
	description = "Спать до утра.";
};


func int pc_sleeptime_morning_condition()
{
	if(Npc_RefuseTalk(self) == FALSE && PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void pc_sleeptime_morning_info()
{
	pc_sleep(8);
};


instance PC_SLEEPTIME_NOON(C_INFO)
{
	npc = pc_hero;
	condition = pc_sleeptime_noon_condition;
	information = pc_sleeptime_noon_info;
	important = 0;
	permanent = 1;
	description = "Спать до полудня.";
};


func int pc_sleeptime_noon_condition()
{
	if(Npc_RefuseTalk(self) == FALSE && PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void pc_sleeptime_noon_info()
{
	pc_sleep(12);
};


instance PC_SLEEPTIME_EVENING(C_INFO)
{
	npc = pc_hero;
	condition = pc_sleeptime_evening_condition;
	information = pc_sleeptime_evening_info;
	important = 0;
	permanent = 1;
	description = "Спать до вечера.";
};


func int pc_sleeptime_evening_condition()
{
	if(Npc_RefuseTalk(self) == FALSE && PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void pc_sleeptime_evening_info()
{
	pc_sleep(19);
};


instance PC_SLEEPTIME_MIDNIGHT(C_INFO)
{
	npc = pc_hero;
	condition = pc_sleeptime_midnight_condition;
	information = pc_sleeptime_midnight_info;
	important = 0;
	permanent = 1;
	description = "Спать до полуночи.";
};


func int pc_sleeptime_midnight_condition()
{
	if(Npc_RefuseTalk(self) == FALSE && PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void pc_sleeptime_midnight_info()
{
	pc_sleep(0);
};

