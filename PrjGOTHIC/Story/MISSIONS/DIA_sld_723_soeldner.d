
const string SLD_723_CHECKPOINT = "NC_PLACE02";

instance INFO_SLD_723_FIRSTWARN(C_INFO)
{
	npc = sld_723_soeldner;
	nr = 1;
	condition = info_sld_723_firstwarn_condition;
	information = info_sld_723_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_sld_723_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_sld_723_firstwarn_info()
{
	printglobals(PD_MISSION);
	AI_Output(self,hero,"Info_SLD_723_FirstWarn_11_01");	//Стой! Назови пароль, иначе я не пропущу тебя!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,SLD_723_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	if(Npc_KnowsInfo(hero,info_cronos_sleeper))
	{
		Info_ClearChoices(info_sld_723_firstwarn);
		Info_AddChoice(info_sld_723_firstwarn,"Кронос разрешил мне пройти!",info_sld_723_parole_cronos);
		Info_AddChoice(info_sld_723_firstwarn,"Я забыл пароль!",info_sld_723_parole_forgot);
		Info_AddChoice(info_sld_723_firstwarn,"Пароль: Териантрох.",info_sld_723_parole_false2);
		Info_AddChoice(info_sld_723_firstwarn,"Пароль: Тетриандох.",info_sld_723_parole_true);
		Info_AddChoice(info_sld_723_firstwarn,"Пароль: Тетриданох.",info_sld_723_parole_false1);
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

func void info_sld_723_parole_cronos()
{
	AI_Output(hero,self,"Info_SLD_723_Parole_CRONOS_15_01");	//Кронос разрешил мне пройти!
	AI_Output(self,hero,"Info_SLD_723_Parole_CRONOS_11_02");	//Если бы это было так, он сказал бы тебе пароль. Исчезни отсюда, лжец!
	AI_StopProcessInfos(self);
};

func void info_sld_723_parole_forgot()
{
	AI_Output(hero,self,"Info_SLD_723_Parole_FORGOT_15_01");	//Я забыл пароль!
	AI_Output(self,hero,"Info_SLD_723_Parole_FORGOT_11_02");	//Так возвращайся, когда вспомнишь, и не отвлекай меня от работы.
	AI_StopProcessInfos(self);
};

func void info_sld_723_parole_false1()
{
	AI_Output(hero,self,"Info_SLD_723_Parole_FALSE1_15_01");	//Пароль: 'Тетриданох'.
	AI_Output(self,hero,"Info_SLD_723_Parole_FALSE1_11_02");	//Неправильно!
	AI_StopProcessInfos(self);
};

func void info_sld_723_parole_false2()
{
	AI_Output(hero,self,"Info_SLD_723_Parole_FALSE2_15_01");	//Пароль: 'Териантрох'.
	AI_Output(self,hero,"Info_SLD_723_Parole_FALSE2_11_02");	//Неправильно!
	AI_StopProcessInfos(self);
};

func void info_sld_723_parole_true()
{
	var C_NPC guard;
	AI_Output(hero,self,"Info_SLD_723_Parole_TRUE_15_01");	//Пароль: 'Тетриандох'.
	AI_Output(self,hero,"Info_SLD_723_Parole_TRUE_11_02");	//Правильно. Проходи.
	AI_StopProcessInfos(self);
	guard = Hlp_GetNpc(sld_732_soeldner);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
	guard.aivar[AIV_PASSGATE] = TRUE;
	b_givexp(XP_SAYCORRECTPAROLE);
};


instance INFO_SLD_723_LASTWARN(C_INFO)
{
	npc = sld_723_soeldner;
	nr = 2;
	condition = info_sld_723_lastwarn_condition;
	information = info_sld_723_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_sld_723_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,SLD_723_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_sld_723_lastwarn_info()
{
	AI_Output(self,hero,"Info_SLD_723_LastWarn_11_01");	//Стой! Я повторять не буду!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,SLD_723_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_SLD_723_ATTACK(C_INFO)
{
	npc = sld_723_soeldner;
	nr = 3;
	condition = info_sld_723_attack_condition;
	information = info_sld_723_attack_info;
	permanent = 1;
	important = 1;
};


func int info_sld_723_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,SLD_723_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_sld_723_attack_info()
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


instance INFO_SLD_723_PAROLE(C_INFO)
{
	npc = sld_723_soeldner;
	nr = 10;
	condition = info_sld_723_parole_condition;
	information = info_sld_723_parole_info;
	permanent = 1;
	important = 0;
	description = "(Сказать пароль)";
};


func int info_sld_723_parole_condition()
{
	if(Npc_KnowsInfo(hero,info_cronos_sleeper) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func int info_sld_723_parole_info()
{
	Info_ClearChoices(info_sld_723_parole);
	Info_AddChoice(info_sld_723_parole,"Кронос разрешил мне пройти!",info_sld_723_parole_cronos);
	Info_AddChoice(info_sld_723_parole,"Я забыл пароль!",info_sld_723_parole_forgot);
	Info_AddChoice(info_sld_723_parole,"Пароль: Териантрох.",info_sld_723_parole_false2);
	Info_AddChoice(info_sld_723_parole,"Пароль: Тетриандох.",info_sld_723_parole_true);
	Info_AddChoice(info_sld_723_parole,"Пароль: Тетриданох.",info_sld_723_parole_false1);
};

