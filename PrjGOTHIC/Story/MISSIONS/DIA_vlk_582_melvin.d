
instance DIA_MELVIN_EXIT(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 999;
	condition = dia_melvin_exit_condition;
	information = dia_melvin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_melvin_exit_condition()
{
	return 1;
};

func void dia_melvin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MELVIN_HELLO(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 1;
	condition = dia_melvin_hello_condition;
	information = dia_melvin_hello_info;
	permanent = 0;
	description = "Привет! Ты не похож на послушника. Ты из этого лагеря?";
};


func int dia_melvin_hello_condition()
{
	if(KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_melvin_hello_info()
{
	AI_Output(other,self,"DIA_Melvin_Hello_15_00");	//Привет! Ты не похож на послушника. Ты из этого лагеря?
	AI_Output(self,other,"DIA_Melvin_Hello_03_01");	//Да! Неделя прошла с тех пор, как я покинул Старый лагерь. Я предлагал моему другу Дасти пойти со мной, он засомневался и сказал, что подождет еще немного.
	GETNEWGUY_STARTED = TRUE;
	Log_CreateTopic(CH1_RECRUITDUSTY,LOG_MISSION);
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_RUNNING);
	b_logentry(CH1_RECRUITDUSTY,"Рудокоп Мелвин присоединился к Братству. Его друг Дасти остался в Старом лагере. Но он постоянно думает о том, чтобы тоже уйти в Болотный лагерь.");
};


instance DIA_MELVIN_METDUSTY(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 1;
	condition = dia_melvin_metdusty_condition;
	information = dia_melvin_metdusty_info;
	permanent = 0;
	description = "Я знаю Дасти. Разговаривал с ним совсем недавно.";
};


func int dia_melvin_metdusty_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(Npc_KnowsInfo(hero,dia_melvin_hello) && (Npc_GetDistToWP(dusty,"PSI_12_HUT_EX_TEACH2") >= 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE) && Npc_KnowsInfo(hero,dia_dusty_hello))
	{
		return 1;
	};
};

func void dia_melvin_metdusty_info()
{
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_00");	//Я знаю Дасти. Разговаривал с ним совсем недавно.
	AI_Output(self,other,"DIA_Melvin_MetDusty_03_01");	//Если ты увидишь его, передай, что он зря остался там. Здесь же гораздо лучше, чем в Старом лагере, где стражники издеваются над бедными рудокопами. Надеюсь, ему тоже здесь понравится.
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_02");	//Ну, если увижу, передам, конечно.
};

instance DIA_MELVIN_METDUSTY2(C_INFO)
{
	npc = vlk_582_melvin;
	nr = 1;
	condition = dia_melvin_metdusty2_condition;
	information = dia_melvin_metdusty2_info;
	permanent = 0;
	description = "Cо мной пришел человек...";
};


func int dia_melvin_metdusty2_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if(!Npc_KnowsInfo(hero,dia_baaltondral_loyality) && (Npc_GetDistToWP(dusty,"PSI_12_HUT_EX_TEACH2") < 1000) && (GETNEWGUY_DUSTY_JOINED == FALSE) && Npc_KnowsInfo(hero,dia_melvin_hello))
	{
		return 1;
	};
};

func void dia_melvin_metdusty2_info()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_03");	//Cо мной пришел человек...
	AI_Output(self,other,"SVM_3_YeahWellDone");	//Да! Отлично!
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		c_stoplookat(self);
	};
	AI_TurnToNPC(self,dusty);
	AI_PlayAni(self,"T_COMEOVERHERE");
	AI_Output(self,NULL,"SVM_3_SectGreetings");	//Пробудись!
	b_logentry(CH1_RECRUITDUSTY,"Дасти присоединился к Болотному лагерю. Я выполнил свое задание.");
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_SUCCESS);
	b_givexp(XP_DELIVEREDDUSTY);
	GETNEWGUY_DUSTY_JOINED = TRUE;
	GETNEWGUY_STARTED = LOG_SUCCESS;
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild(dusty,GIL_NOV);
	AI_StopProcessInfos(self);
};

