
instance NOV_1327_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	voice = 5;
	id = 1327;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",29,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1327;
};


func void rtn_start_1327()
{
	ta_sleep(0,0,7,0,"PSI_31_HUT_IN");
	ta_stand(7,0,0,0,"PSI_31_HUT_EX");
};

func void rtn_wait_1327()
{
	ta_stand(0,0,7,0,"PSI_31_HUT_EX");
	ta_stand(7,0,0,0,"PSI_31_HUT_EX");
};

instance DIA_WHEREISFORTUNO(C_INFO)
{
	npc = nov_1327_novize;
	condition = dia_whereisfortuno_condition;
	information = dia_whereisfortuno_info;
	important = 1;
	permanent = 0;
};


func int dia_whereisfortuno_condition()
{
	if(CORKALOMLEFT == TRUE && !Npc_KnowsInfo(hero,dia_fortuno_help))
	{
		return TRUE;
	};
};

func void dia_whereisfortuno_info()
{
	AI_Output(self,other,"Info_WhereIsFortuno_01");	//Если ты ищешь Фортуно, то он теперь работает в лаборатории Кор Галома. Варит какие-то зелья и провонял всю мою хижину!
	Npc_ExchangeRoutine(self,"start");
	AI_StopProcessInfos(self);
};

