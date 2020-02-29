
instance DIA_BAALNAMIB_EXIT(C_INFO)
{
	npc = gur_1204_baalnamib;
	nr = 999;
	condition = dia_baalnamib_exit_condition;
	information = dia_baalnamib_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalnamib_exit_condition()
{
	return 1;
};

func void dia_baalnamib_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_NOTALK(C_INFO)
{
	npc = gur_1204_baalnamib;
	nr = 1;
	condition = dia_baalnamib_notalk_condition;
	information = dia_baalnamib_notalk_info;
	permanent = 1;
	important = 1;
};


func int dia_baalnamib_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BAALNAMIB_ANSPRECHBAR == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_baalnamib_notalk_info()
{
	Info_ClearChoices(dia_baalnamib_notalk);
	Info_AddChoice(dia_baalnamib_notalk,DIALOG_ENDE,dia_baalnamib_notalk_ende);
	Info_AddChoice(dia_baalnamib_notalk,"С тобой все нормально, приятель?",dia_baalnamib_notalk_imp);
	Info_AddChoice(dia_baalnamib_notalk,"Да пребудет с тобой Спящий!",dia_baalnamib_notalk_sleeper);
	Info_AddChoice(dia_baalnamib_notalk,"Привет! Я здесь новенький!",dia_baalnamib_notalk_hi);
};

func void dia_baalnamib_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Привет! Я здесь новенький!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	BAALNAMIB_SAKRILEG = TRUE;
};

func void dia_baalnamib_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	BAALNAMIB_SAKRILEG = TRUE;
};

func void dia_baalnamib_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//С тобой все нормально, приятель?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//
	BAALNAMIB_SAKRILEG = TRUE;
};

func void dia_baalnamib_notalk_ende()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_FIRSTTALK(C_INFO)
{
	npc = gur_1204_baalnamib;
	nr = 1;
	condition = dia_baalnamib_firsttalk_condition;
	information = dia_baalnamib_firsttalk_info;
	permanent = 0;
	important = 1;
};


func int dia_baalnamib_firsttalk_condition()
{
	if(BAALNAMIB_ANSPRECHBAR == TRUE)
	{
		return 1;
	};
};

func void dia_baalnamib_firsttalk_info()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01");	//Спящий избрал тебя. Ты и в самом деле хочешь присоединиться к нам?
	Info_ClearChoices(dia_baalnamib_firsttalk);
	Info_AddChoice(dia_baalnamib_firsttalk,"ПРОМОЛЧАТЬ",dia_baalnamib_firsttalk_mute);
	Info_AddChoice(dia_baalnamib_firsttalk,"Да, я хочу вступить на путь, указанный Спящим.",dia_baalnamib_firsttalk_sleeper);
};

func void dia_baalnamib_firsttalk_mute()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Mute_15_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01");	//Ну?
};

func void dia_baalnamib_firsttalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00");	//Да, я хочу вступить на путь, указанный Спящим.
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01");	//Иди к Кор Галому. Скажи ему, что я считаю тебя истинно верующим!
	Info_ClearChoices(dia_baalnamib_firsttalk);
	b_logentry(CH1_JOINPSI,"Задумка Лестера удалась. Идол Намиб заговорил со мной. Теперь он думает, что я стал убежденным верующим. Мне нужно увидеть Гуру Кор Галома в лаборатории!");
	b_givexp(XP_IMPRESSBAALNAMIB);
};


instance GUR_1204_BAALNAMIB_ARMOR(C_INFO)
{
	npc = gur_1204_baalnamib;
	condition = gur_1204_baalnamib_armor_condition;
	information = gur_1204_baalnamib_armor_info;
	important = 0;
	permanent = 1;
	description = "Мне нужны хорошие доспехи.";
};


func int gur_1204_baalnamib_armor_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) && !Npc_HasItems(hero,nov_armor_h))
	{
		return TRUE;
	};
};

func void gur_1204_baalnamib_armor_info()
{
	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");	//Мне нужны хорошие доспехи.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");	//Тебе еще рано носить тяжелые доспехи послушника.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_NOV_ARMOR_H)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Возвращайся, когда соберешь достаточно руды.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Эти доспехи защитят тело твое, так же как Спящий защищает твою душу!
		CreateInvItem(self,nov_armor_h);
		b_giveinvitems(self,hero,nov_armor_h,1);
		b_giveinvitems(hero,self,itminugget,VALUE_NOV_ARMOR_H);
	};
};


instance INFO_BAALNAMIB_BROTHERHOOD(C_INFO)
{
	npc = gur_1204_baalnamib;
	condition = info_baalnamib_brotherhood_condition;
	information = info_baalnamib_brotherhood_info;
	important = 0;
	permanent = 0;
	description = "Я могу что-нибудь сделать для Братства?";
};


func int info_baalnamib_brotherhood_condition()
{
};

func void info_baalnamib_brotherhood_info()
{
	var C_NPC kalom;
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_15_01");	//Я могу что-нибудь сделать для Братства?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_02_02");	//Нашему Мастеру, мудрейшему Юбериону, нужен послушник. Иди к нему и предложи свои услуги.
	Info_ClearChoices(info_baalnamib_brotherhood);
	Info_AddChoice(info_baalnamib_brotherhood,"Я пойду и поговорю с ним прямо сейчас.",info_baalnamib_brotherhood_ok);
	Info_AddChoice(info_baalnamib_brotherhood,"Где я могу найти Юбериона?",info_baalnamib_brotherhood_ybwo);
	Info_AddChoice(info_baalnamib_brotherhood,"Ты знаешь, какое задание даст мне Юберион?",info_baalnamib_brotherhood_ybwas);
	kalom = Hlp_GetNpc(gur_1201_corkalom);
	Npc_ExchangeRoutine(kalom,"kapitel2");
	AI_ContinueRoutine(kalom);
};

func void info_baalnamib_brotherhood_ybwo()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01");	//А где я могу найти Юбериона?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02");	//На холме. Как и всегда, впрочем.
};

func void info_baalnamib_brotherhood_ybwas()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01");	//Ты знаешь, какое задание даст мне Юберион?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02");	//Все мы ждем Великой Церемонии. Но прежде чем она начнется, нам потребуется магический артефакт.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03");	//Юберион ищет храбреца, который найдет его.
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04");	//Кажется, это простое дело.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05");	//Если бы это было так просто, артефакт был бы уже у нас. Прежде поговори с Юберионом. Он тебе все объяснит.
};

func void info_baalnamib_brotherhood_ok()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_OK_15_01");	//Я пойду и поговорю с ним прямо сейчас.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_OK_02_02");	//Да хранит тебя Спящий!
	Info_ClearChoices(info_baalnamib_brotherhood);
};

