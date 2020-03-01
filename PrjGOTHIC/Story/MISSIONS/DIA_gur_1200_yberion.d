
instance INFO_YBERION_EXIT(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 999;
	condition = info_yberion_exit_condition;
	information = info_yberion_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_yberion_exit_condition()
{
	return 1;
};

func void info_yberion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_YBERION_WACHE(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = dia_yberion_wache_condition;
	information = dia_yberion_wache_info;
	permanent = 1;
	important = 1;
};


func int dia_yberion_wache_condition()
{
	if(KAPITEL == 1)
	{
		return 1;
	};
};

func void dia_yberion_wache_info()
{
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//Как ты здесь оказался? Кто тебя впустил? Стража!
	//b_intruderalert(self,other);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};


instance DIA_YBERION_KENNEN(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = dia_yberion_kennen_condition;
	information = dia_yberion_kennen_info;
	permanent = 0;
	description = "Приветствую тебя, Учитель Юберион!";
};


func int dia_yberion_kennen_condition()
{
	if(KAPITEL == 2)
	{
		return 1;
	};
};

func void dia_yberion_kennen_info()
{
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00");	//Приветствую тебя, Учитель Юберион!
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//А! Я тебя знаю!
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//Это невозможно. Мы еще ни разу не встречались.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//Я думал ты... Хорошо. Что тебе нужно?
};


instance INFO_YBERION_BRINGFOCUS(C_INFO)
{
	npc = gur_1200_yberion;
	condition = info_yberion_bringfocus_condition;
	information = info_yberion_bringfocus_info;
	permanent = 1;
	description = "Я слышал, что ты хочешь что-то найти.";
};


func int info_yberion_bringfocus_condition()
{
	if(Npc_KnowsInfo(hero,dia_yberion_kennen) && (Npc_GetTrueGuild(hero) != GIL_NONE) && (YBERION_BRINGFOCUS != LOG_RUNNING) && (YBERION_BRINGFOCUS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void info_yberion_bringfocus_info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//Я слышал, что ты хочешь что-то найти.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//Так и есть. Нам нужен магический юнитор.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//Мы уже отправили за ним новенького, Нираса, но он все еще не вернулся.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//Может, ты сможешь выяснить, что с ним случилось?
	Info_ClearChoices(info_yberion_bringfocus);
	Info_AddChoice(info_yberion_bringfocus,DIALOG_BACK,info_yberion_bringfocus_back);
	Info_AddChoice(info_yberion_bringfocus,"Я верну вам юнитор!",info_yberion_bringfocus_ok);
	Info_AddChoice(info_yberion_bringfocus,"Где я должен его искать?",info_yberion_bringfocus_wo);
	Info_AddChoice(info_yberion_bringfocus,"Почему этот юнитор так важен?",info_yberion_bringfocus_fokus);
};

func void info_yberion_bringfocus_back()
{
	Info_ClearChoices(info_yberion_bringfocus);
};

func void info_yberion_bringfocus_ok()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//Я верну вам юнитор!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//Вот карта. На ней отмечено, где должен быть юнитор.
	b_printtrademsg1("Получена карта Юбериона.");
	b_story_bringfirstfocus();
	b_logentry(CH2_FOCUS,"Юберион послал послушника Нираса за юнитором. Но он до сих пор не вернулся. Гуру дал мне карту, на которой отмечен путь к юнитору.");
};

func void info_yberion_bringfocus_wo()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//Где я должен его искать?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//Будешь выходить из лагеря, поверни направо и дальше вдоль скалы. Дальше будет лес, за ним море. Там и должен быть юнитор.
};

func void info_yberion_bringfocus_fokus()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//Почему этот юнитор так важен?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//В нем сокрыта магия, способная концентрировать нашу силу.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//Он один из пяти камней, участвоваших в сотворении Барьера.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//Мое видение сказало, что сила этого камня поможет нам.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//Интересное видение!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//Мое видение - это послание Спящего. И с помощью юнитора мы сможем призвать его!
};


instance INFO_YBERION_BRINGFOCUS_RUNNING(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = info_yberion_bringfocus_running_condition;
	information = info_yberion_bringfocus_running_info;
	permanent = 1;
	description = "Я все еще не нашел юнитор.";
};


func int info_yberion_bringfocus_running_condition()
{
	if((YBERION_BRINGFOCUS == LOG_RUNNING) && !Npc_HasItems(hero,focus_1))
	{
		return TRUE;
	};
};

func void info_yberion_bringfocus_running_info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//Я все еще не нашел юнитор.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//Продолжай поиски! Спящий поможет тебе.
};


instance INFO_YBERION_BRINGFOCUS_SUCCESS(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = info_yberion_bringfocus_success_condition;
	information = info_yberion_bringfocus_success_info;
	permanent = 0;
	description = "Я нашел юнитор.";
};


func int info_yberion_bringfocus_success_condition()
{
	if((YBERION_BRINGFOCUS == LOG_RUNNING) && Npc_HasItems(hero,focus_1))
	{
		return 1;
	};
};

func void info_yberion_bringfocus_success_info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//Я нашел юнитор.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//Замечательно! Ты очень сильно помог нам.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//Отнеси его теперь Кор Галому. Он знает, что с ним делать.
	if(KALOM_TALKEDTO == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//Где я могу найти этого Кор Галома?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//Он почти все время работает в своей лаборатории на втором уровне.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//У входа в лагерь должен быть Лестер. Обычно он помогает новичкам не заблудиться здесь.
		b_logentry(CH2_FOCUS,"Юберион поручил мне отнести юнитор Кор Галому, одному из Гуру. Он постоянно работает в своей лаборатории.");
	}
	else
	{
		b_logentry(CH2_FOCUS,"Юберион поручил мне отнести юнитор Кор Галому. Как 'приятно' снова встретить этого всенародно любимого человека.");
	};
	tpl_1406_templer.aivar[AIV_PASSGATE] = TRUE;
	YBERION_BRINGFOCUS = LOG_SUCCESS;
	b_givexp(XP_BRINGFOCUSTOYBERION);
	var C_NPC nyras;
	nyras = Hlp_GetNpc(nov_1303_nyras);
	if(!Npc_IsDead(nyras))
	{
		b_exchangeroutine(nyras,"hide");
		Npc_ChangeAttribute(nyras,ATR_HITPOINTS,+100);
	};
};


instance INFO_YBERION_NYRAS(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 1;
	condition = info_yberion_nyras_condition;
	information = info_yberion_nyras_info;
	permanent = 0;
	description = "Послушник Нирас сошел с ума!";
};


func int info_yberion_nyras_condition()
{
	if(Npc_KnowsInfo(hero,nov_1303_nyras_leave))
	{
		return 1;
	};
};

func void info_yberion_nyras_info()
{
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//Послушник Нирас сошел с ума!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//Он сказал, будто Спящий явился ему и избрал его своим единственным слугой!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//Потом он напал на меня и захотел убить!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//Могущество Спящего слишком велико для разума послушника.
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//Лишь мы, Гуру, после долгих лет медитации смогли достичь той силы духа, что позволяет нам выносить голос всемогущего Спящего.
};


instance GUR_1200_YBERION_EARN(C_INFO)
{
	npc = gur_1200_yberion;
	condition = gur_1200_yberion_earn_condition;
	information = gur_1200_yberion_earn_info;
	important = 0;
	permanent = 0;
	description = "А я не заслужил награды?";
};


func int gur_1200_yberion_earn_condition()
{
	if((YBERION_BRINGFOCUS == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_NOV) && (Npc_GetTrueGuild(hero) != GIL_TPL) && c_ischapter(2))
	{
		return 1;
	};
};

func void gur_1200_yberion_earn_info()
{
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//А я не заслужил награды?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//Так и быть, ты не из нашего Братства, но я награжу тебя.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//Возьми этот амулет в благодарность за твою помощь.
	b_printtrademsg1("Получен амулет пламени.");
	CreateInvItem(self,schutzamulett_feuer);
	b_giveinvitems(self,hero,schutzamulett_feuer,1);
};

instance YBERION_STEALKEY(C_INFO)
{
	npc = gur_1200_yberion;
	nr = 990;
	condition = yberion_stealkey_condition;
	information = yberion_stealkey_info;
	important = 0;
	permanent = 0;
	description = "(украсть ключ)";
};


func int yberion_stealkey_condition()
{
	if(Npc_HasItems(self,itke_yberion) && Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 2 && Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1)
	{
		return TRUE;
	};
};

func void yberion_stealkey_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Кто он, этот Спящий?
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_02");	//Убирайся отсюда, пока я не разозлился!
	PrintScreen("Украден ключ.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	YBERION_KEY_STOLEN = TRUE;
	CreateInvItem(hero,itke_yberion);
	Npc_RemoveInvItem(self,itke_yberion);
	AI_StopProcessInfos(self);
};

