
instance NOV_1308_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 9;
	voice = 14;
	id = 1308;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",34,3,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItems(self,itmijoint_1,20);
	CreateInvItems(self,itminugget,50);
	daily_routine = rtn_start_1308;
};

func void rtn_start_1308()
{
	ta_herbalchemy(7,5,0,5,"PSI_HERB_PLACE_3");
	ta_sleep(0,5,7,5,"PSI_6_HUT_IN_BED1");
};

func void rtn_ch5_1308()
{
	ta_stay(8,0,16,0,"NC_TAVERN_ROOM07");
	ta_smalltalk(16,0,17,0,"NC_TAVERN_SIDE02");
	ta_standaround(17,0,23,0,"NC_TAVERN_ROOM07");
	ta_sitaround(23,0,8,0,"NC_TAVERN_SIT");
};

instance DIA_1308_NOVIZE_EXIT(C_INFO)
{
	npc = nov_1308_novize;
	nr = 999;
	condition = dia_1308_novize_exit_condition;
	information = dia_1308_novize_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_1308_novize_exit_condition()
{
	return 1;
};

func void dia_1308_novize_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_1308_NOVIZE_HI(C_INFO)
{
	npc = nov_1308_novize;
	nr = 1;
	condition = dia_1308_novize_hi_condition;
	information = dia_1308_novize_hi_info;
	permanent = 0;
	important = 1;
};

func int dia_1308_novize_hi_condition()
{
	if(KAPITEL > 2 && BAALISIDRO_DEALERJOB != LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_1308_novize_hi_info()
{
	AI_Output(self,other,"DIA_Baal1308_01");	//Приветствую тебя, незнакомец! Я продаю косяки из свежайшего болотника, прямиком из Болотного лагеря! Обращайся ко мне, договоримся...
	if(BAALISIDRO_JOINTS_STARTED == TRUE && !Npc_KnowsInfo(hero,dia_baalisidro_revenge) && !Npc_KnowsInfo(hero,dia_baalisidro_hello_ch5))
	{
		AI_Output(other,self,"DIA_Baal1308_02");	//Где я могу найти...
		AI_Output(self,other,"DIA_Baal1308_03");	//...Идола Исидро? Теперь я вместо него. Он поддался искушению мирской жизни вдали от своих братьев и больше не мог выполнять свои обязанности.
		AI_Output(self,other,"DIA_Baal1308_04");	//Гуру решили вернуть его к более простой работе.
	};
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"В баре на озере появился послушник из Болотного лагеря. Он продает косяки из болотника.");
};

instance DIA_1308_NOVIZE_TRADE(C_INFO)
{
	npc = nov_1308_novize;
	nr = 800;
	condition = dia_1308_novize_trade_condition;
	information = dia_1308_novize_trade_info;
	permanent = 1;
	description = "Покажи, что ты там продаешь.";
	trade = 1;
};

func int dia_1308_novize_trade_condition()
{
	if(KAPITEL > 2 && Npc_KnowsInfo(hero,dia_1308_novize_hi))
	{
		return 1;
	};
};

func void dia_1308_novize_trade_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_TRADE_15_00");	//Покажи, что ты там продаешь.
};

instance DIA_1308_NOVIZE_PRECH2(C_INFO)
{
	npc = nov_1308_novize;
	nr = 2;
	condition = dia_1308_novize_prech2_condition;
	information = dia_1308_novize_prech2_info;
	permanent = 1;
	description = "Как дела?";
};

func int dia_1308_novize_prech2_condition()
{
	if(KAPITEL < 2 || BAALISIDRO_DEALERJOB == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_1308_novize_prech2_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_01");	//Спящий говорит с нами во снах и видениях.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_02");	//Только Гуру посвящены в таинство магии Спящего.
};

