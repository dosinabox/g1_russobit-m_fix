
instance INFO_BAU_4_EXIT(C_INFO)
{
	nr = 999;
	condition = info_bau_4_exit_condition;
	information = info_bau_4_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_bau_4_exit_condition()
{
	return 1;
};

func void info_bau_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_BAU_4_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_bau_4_wichtigepersonen_condition;
	information = info_bau_4_wichtigepersonen_info;
	permanent = 1;
	description = "У вас есть главный?";
};


func int info_bau_4_wichtigepersonen_condition()
{
	return 1;
};

func void info_bau_4_wichtigepersonen_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00");	//У вас есть главный?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01");	//Ну, здесь все подчиняются Лорду. Но большая часть людей работает на его полях из страха перед ним и его головорезами.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02");	//Но я их не боюсь. Я живу здесь уже несколько лет и мне давно надоело иметь дело с ворами из лагеря... Поэтому рисовые поля для меня как раз то, что нужно.
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_BAU_4_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_bau_4_daslager_condition;
	information = info_bau_4_daslager_info;
	permanent = 1;
	description = "Есть что-нибудь, что я должен узнать об этом месте?";
};


func int info_bau_4_daslager_condition()
{
	return 1;
};

func void info_bau_4_daslager_info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00");	//Есть что-нибудь, что я должен узнать об этом месте?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01");	//Будь осторожен, в этом лагере с тобой всякое может случиться. Здесь полно головорезов, которые могут избить до полусмерти такого новичка, как ты, просто ради забавы.
};


instance INFO_BAU_4_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_bau_4_dielage_condition;
	information = info_bau_4_dielage_info;
	permanent = 1;
	description = "Как идут дела?";
};


func int info_bau_4_dielage_condition()
{
	return 1;
};

func void info_bau_4_dielage_info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00");	//Как идут дела?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01");	//У нас здесь полно работы. Нужно много риса, чтобы прокормить всех, кто живет в лагере.
};


instance INFO_BAU_4_WASSER(C_INFO)
{
	nr = 800;
	condition = info_bau_4_wasser_condition;
	information = info_bau_4_wasser_info;
	permanent = 1;
	description = "Меня прислал Лефти. Я принес тебе воды.";
};


func int info_bau_4_wasser_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(((LEFTY_MISSION == LOG_RUNNING) || ((LEFTY_MISSION == LOG_SUCCESS) && Npc_HasItems(other,itfo_potion_water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void info_bau_4_wasser_info()
{
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00");	//Меня прислал Лефти. Я принес тебе воды.
	if(Npc_HasItems(other,itfo_potion_water_01) >= 1)
	{
		b_giveinvitems(other,self,itfo_potion_water_01,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfo_potion_water_01);
		AI_Output(self,other,"Info_Bau_4_Wasser_04_01");	//Спасибо! Мне ее так не хватало!
		AN_BAUERN_VERTEILT = AN_BAUERN_VERTEILT + 1;
		if(AN_BAUERN_VERTEILT >= DURSTIGEBAUERN)
		{
			LEFTY_MISSION = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00");	//Да, у тебя же не осталось ни капли. Ладно, я спрошу у кого-нибудь другого.
	};
};

instance INFO_BAU_4_WASSER_NOLEFTY(C_INFO)
{
	nr = 800;
	condition = info_bau_4_wasser_nolefty_condition;
	information = info_bau_4_wasser_nolefty_info;
	permanent = 1;
	description = "Я принес тебе воды.";
};

func int info_bau_4_wasser_nolefty_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(Npc_HasItems(other,itfo_potion_water_01) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_bau_4_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//Я принес тебе воды.
	AI_Output(self,other,"Info_Pock_Wasser_04_01");	//Спасибо, приятель. Воды мне как раз не хватало!
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	b_giveinvitems(other,self,itfo_potion_water_01,1);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfo_potion_water_01);
};

func void b_assignambientinfos_bau_4(var C_NPC slf)
{
	info_bau_4_exit.npc = Hlp_GetInstanceID(slf);
	info_bau_4_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_bau_4_daslager.npc = Hlp_GetInstanceID(slf);
	info_bau_4_dielage.npc = Hlp_GetInstanceID(slf);
	info_bau_4_wasser.npc = Hlp_GetInstanceID(slf);
	info_bau_4_wasser_nolefty.npc = Hlp_GetInstanceID(slf);
};

