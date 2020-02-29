
instance DIA_ROSCOE_EXIT(C_INFO)
{
	npc = org_840_roscoe;
	nr = 999;
	condition = dia_roscoe_exit_condition;
	information = dia_roscoe_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_roscoe_exit_condition()
{
	return 1;
};

func void dia_roscoe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSCOE_BRINGLIST(C_INFO)
{
	npc = org_840_roscoe;
	nr = 1;
	condition = dia_roscoe_bringlist_condition;
	information = dia_roscoe_bringlist_info;
	permanent = 0;
	description = "У меня есть список припасов для Старой шахты.";
};


func int dia_roscoe_bringlist_condition()
{
	if(Npc_HasItems(other,thelist) >= 1)
	{
		return 1;
	};
};

func void dia_roscoe_bringlist_info()
{
	AI_Output(other,self,"DIA_Roscoe_BringList_15_00");	//У меня есть список припасов для Старой шахты.
	AI_Output(self,other,"DIA_Roscoe_BringList_10_01");	//Неплохо. Как ты его достал?
	if(Npc_KnowsInfo(hero,stt_301_ian_getlist))
	{
		AI_Output(other,self,"DIA_Roscoe_BringList_15_02");	//Его дал мне Ян.
	}
	else
	{
		AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//Ну...
	};
	if(hero.guild != GIL_ORG)
	{
		AI_Output(self,other,"DIA_Roscoe_BringList_10_03");	//Ты смелый! Тебя прислали испытать меня, ведь так? Торус должно быть уже сходит с ума, я уверен.
		if(Npc_KnowsInfo(hero,info_diego_bringlist_offer))
		{
			AI_Output(other,self,"DIA_Roscoe_BringList_15_04");	//Я получил задание от Диего.
			AI_Output(self,other,"DIA_Roscoe_BringList_10_05");	//А Диего приказывает Торус.
		};
		AI_Output(other,self,"DIA_Roscoe_BringList_15_06");	//Так я могу пройти?
	};
	AI_Output(self,other,"DIA_Roscoe_BringList_10_07");	//Да, проходи! Ларс не поверит своим глазам.
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_ROSCOE_MORDRAG(C_INFO)
{
	npc = org_840_roscoe;
	nr = 2;
	condition = dia_roscoe_mordrag_condition;
	information = dia_roscoe_mordrag_info;
	important = 0;
	description = "Меня прислал Мордраг.";
};


func int dia_roscoe_mordrag_condition()
{
	if(Npc_HasItems(hero,mordragsring))
	{
		return 1;
	};
};

func void dia_roscoe_mordrag_info()
{
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_00");	//Меня прислал Мордраг.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_01");	//Его уже давно здесь никто не видел. Похоже на то, что он переметнулся к Старому лагерю.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_02");	//Он показал мне дорогу сюда.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_03");	//Мордраг вернулся? Если встретишь его, то передай, что Ларс хочет видеть его.
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_04");	//Мордраг передал кое-что для Ларса.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_05");	//Что?
	AI_Output(other,self,"DIA_Roscoe_Mordrag_15_06");	//Кольцо.
	AI_Output(self,other,"DIA_Roscoe_Mordrag_10_07");	//Наверняка дорогая вещь... Хорошо, можешь увидеться с ним.
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_ROSCOE_WANNAJOIN(C_INFO)
{
	npc = org_840_roscoe;
	nr = 2;
	condition = dia_roscoe_wannajoin_condition;
	information = dia_roscoe_wannajoin_info;
	permanent = 0;
	description = "Я хочу присоединиться к вам.";
};


func int dia_roscoe_wannajoin_condition()
{
	if(!Npc_KnowsInfo(hero,dia_roscoe_mordrag) && !Npc_KnowsInfo(hero,dia_roscoe_bringlist) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (OLDHEROGUILD == 0))
	{
		return 1;
	};
};

func void dia_roscoe_wannajoin_info()
{
	AI_Output(other,self,"DIA_Roscoe_WannaJoin_15_00");	//Я хочу присоединиться к вам.
	AI_Output(self,other,"DIA_Roscoe_WannaJoin_10_01");	//Ты не один такой. Если хочешь пройти, тебе придется предложить нечто особенное.
};


instance DIA_ROSCOE_COMEAGAIN(C_INFO)
{
	npc = org_840_roscoe;
	nr = 2;
	condition = dia_roscoe_comeagain_condition;
	information = dia_roscoe_comeagain_info;
	permanent = 0;
	important = 1;
};


func int dia_roscoe_comeagain_condition()
{
	if(((Npc_HasItems(other,thelist) >= 1) && Npc_KnowsInfo(hero,org_801_lares_mordragsentme)) || (Npc_KnowsInfo(hero,org_826_mordrag_atnewcamp) && Npc_KnowsInfo(hero,org_801_lares_bringlist)))
	{
		return 1;
	};
};

func void dia_roscoe_comeagain_info()
{
	AI_Output(self,other,"DIA_Roscoe_ComeAgain_10_00");	//Опять ты.
};


const string ROSCOE_CHECKPOINT = "NC_HUT22_IN_MOVEMENT";

instance INFO_ROSCOE_FIRSTWARN(C_INFO)
{
	npc = org_840_roscoe;
	nr = 2;
	condition = info_roscoe_firstwarn_condition;
	information = info_roscoe_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_roscoe_firstwarn_condition()
{
	if((LARES_STOP == FALSE) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_roscoe_firstwarn_info()
{
	printglobals(PD_MISSION);
	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_00");	//И куда это ты собрался?
	AI_Output(hero,self,"Info_Roscoe_FirstWarn_Info_15_01");	//Я хочу поговорить с Ларсом.
	AI_Output(self,hero,"Info_Roscoe_FirstWarn_Info_10_02");	//Ларс здесь, но у тебя должна быть веская причина, чтобы побеспокоить его.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ROSCOE_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
};


instance INFO_ROSCOE_LASTWARN(C_INFO)
{
	npc = org_840_roscoe;
	nr = 1;
	condition = info_roscoe_lastwarn_condition;
	information = info_roscoe_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_roscoe_lastwarn_condition()
{
	if((LARES_STOP == FALSE) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,ROSCOE_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_roscoe_lastwarn_info()
{
	AI_Output(self,hero,"Info_Roscoe_LastWarn_10_00");	//Ты что, глухой?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ROSCOE_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_ROSCOE_ATTACK(C_INFO)
{
	npc = org_840_roscoe;
	nr = 1;
	condition = info_roscoe_attack_condition;
	information = info_roscoe_attack_info;
	permanent = 1;
	important = 1;
};


func int info_roscoe_attack_condition()
{
	if((LARES_STOP == FALSE) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,ROSCOE_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_roscoe_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	b_fullstop(self);
	AI_StopProcessInfos(self);
	b_intruderalert(self,other);
	b_setattackreason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

instance INFO_ROSCOE_NEWWARN(C_INFO)
{
	npc = org_840_roscoe;
	nr = 2;
	condition = info_roscoe_newwarn_condition;
	information = info_roscoe_newwarn_info;
	permanent = 1;
	important = 1;
};


func int info_roscoe_newwarn_condition()
{
	if((LARES_STOP == TRUE) && ((other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_KDF)) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_roscoe_newwarn_info()
{
	AI_Output(self,hero,"SVM_11_YouDeafOrWhat");	//Ты хочешь, чтобы я лично занялся тобой? Убирайся!
	AI_StopProcessInfos(self);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	LARES_STOP = FALSE;
};

