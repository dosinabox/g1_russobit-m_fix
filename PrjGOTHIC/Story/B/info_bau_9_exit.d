
instance INFO_BAU_9_EXIT(C_INFO)
{
	nr = 999;
	condition = info_bau_9_exit_condition;
	information = info_bau_9_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_bau_9_exit_condition()
{
	return 1;
};

func void info_bau_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_BAU_9_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_bau_9_wichtigepersonen_condition;
	information = info_bau_9_wichtigepersonen_info;
	permanent = 1;
	description = "А кто следит, как продвигается работа на полях?";
};


func int info_bau_9_wichtigepersonen_condition()
{
	return 1;
};

func void info_bau_9_wichtigepersonen_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00");	//А кто следит, как продвигается работа на полях?
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01");	//Вообще-то, это обязанность Лорда, но мне кажется, он только и делает, что считает мешки в своих закромах.
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02");	//Ну, они с Гомером все это организовали...
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_BAU_9_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_bau_9_daslager_condition;
	information = info_bau_9_daslager_info;
	permanent = 1;
	description = "Расскажи мне об этом лагере.";
};


func int info_bau_9_daslager_condition()
{
	return 1;
};

func void info_bau_9_daslager_info()
{
	AI_Output(other,self,"Info_Bau_9_DasLager_15_00");	//Расскажи мне об этом лагере.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_01");	//Лагерь полон всяким отродьем. Была б моя воля, я вышвырнул бы всех этих воров из лагеря.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_02");	//Лентяи еще те, да и неприятностей от них не оберешься.
};


instance INFO_BAU_9_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_bau_9_dielage_condition;
	information = info_bau_9_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_bau_9_dielage_condition()
{
	return 1;
};

func void info_bau_9_dielage_info()
{
	AI_Output(other,self,"Info_Bau_9_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Bau_9_DieLage_09_01");	//Мы надрываемся здесь, чтобы получить хоть немного еды.
};


instance INFO_BAU_9_WASSER(C_INFO)
{
	nr = 800;
	condition = info_bau_9_wasser_condition;
	information = info_bau_9_wasser_info;
	permanent = 1;
	description = "Меня прислал Лефти, я принес тебе воды.";
};


func int info_bau_9_wasser_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(((LEFTY_MISSION == LOG_RUNNING) || ((LEFTY_MISSION == LOG_SUCCESS) && Npc_HasItems(other,itfo_potion_water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void info_bau_9_wasser_info()
{
	AI_Output(other,self,"Info_Bau_9_Wasser_15_00");	//Меня прислал Лефти, я принес тебе воды.
	if(Npc_HasItems(other,itfo_potion_water_01) >= 1)
	{
		b_giveinvitems(other,self,itfo_potion_water_01,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfo_potion_water_01);
		AI_Output(self,other,"Info_Bau_9_Wasser_09_01");	//Спасибо, парень. А то я уже был готов пить хоть из лужи.
		AN_BAUERN_VERTEILT = AN_BAUERN_VERTEILT + 1;
		if(AN_BAUERN_VERTEILT >= DURSTIGEBAUERN)
		{
			LEFTY_MISSION = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00");	//У тебя же ничего нет. Ладно, может, у других есть.
	};
};

instance INFO_BAU_9_WASSER_NOLEFTY(C_INFO)
{
	nr = 800;
	condition = info_bau_9_wasser_nolefty_condition;
	information = info_bau_9_wasser_nolefty_info;
	permanent = 1;
	description = "Я принес тебе воды.";
};

func int info_bau_9_wasser_nolefty_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(Npc_HasItems(other,itfo_potion_water_01) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_bau_9_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//Я принес тебе воды.
	AI_Output(self,other,"SVM_9_YeahWellDone");	//Отлично, парень!
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	b_giveinvitems(other,self,itfo_potion_water_01,1);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfo_potion_water_01);
};

func void b_assignambientinfos_bau_9(var C_NPC slf)
{
	info_bau_9_exit.npc = Hlp_GetInstanceID(slf);
	info_bau_9_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_bau_9_daslager.npc = Hlp_GetInstanceID(slf);
	info_bau_9_dielage.npc = Hlp_GetInstanceID(slf);
	info_bau_9_wasser.npc = Hlp_GetInstanceID(slf);
	info_bau_9_wasser_nolefty.npc = Hlp_GetInstanceID(slf);
};

