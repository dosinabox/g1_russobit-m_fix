
instance DIA_STT_331_FINGERS_EXIT(C_INFO)
{
	npc = stt_331_fingers;
	nr = 999;
	condition = dia_stt_331_fingers_exit_condition;
	information = dia_stt_331_fingers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_stt_331_fingers_exit_condition()
{
	return 1;
};

func void dia_stt_331_fingers_exit_info()
{
	AI_StopProcessInfos(self);
};


var int fingers_canteach;

instance DIA_FINGERS_BECOMESHADOW(C_INFO)
{
	npc = stt_331_fingers;
	nr = 2;
	condition = dia_fingers_becomeshadow_condition;
	information = dia_fingers_becomeshadow_info;
	permanent = 1;
	description = "Я хочу стать Призраком.";
};


func int dia_fingers_becomeshadow_condition()
{
	if((FINGERS_CANTEACH == FALSE) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_fingers_becomeshadow_info()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00");	//Я хочу стать Призраком.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01");	//И что?
	Info_ClearChoices(dia_fingers_becomeshadow);
	Info_AddChoice(dia_fingers_becomeshadow,DIALOG_BACK,dia_fingers_becomeshadow_back);
	if(Npc_KnowsInfo(hero,info_diego_teachers))
	{
		Info_AddChoice(dia_fingers_becomeshadow,"Мне нужен человек, который сможет меня чему-нибудь научить.",dia_fingers_becomeshadow_teachme);
	};
	Info_AddChoice(dia_fingers_becomeshadow,"Ты мог бы помочь мне?",dia_fingers_becomeshadow_anytips);
};

func void dia_fingers_becomeshadow_back()
{
	Info_ClearChoices(dia_fingers_becomeshadow);
};

func void dia_fingers_becomeshadow_anytips()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00");	//Ты мог бы помочь мне?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01");	//Я не знаю, как...
};

func void dia_fingers_becomeshadow_teachme()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00");	//Мне нужен человек, который сможет меня чему-нибудь научить.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01");	//Зачем ты меня нашел?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02");	//Меня прислал Диего.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03");	//Ты должен был сразу сказать это мне.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04");	//Если ты хочешь, чтобы тебя приняли в лагерь, ты должен стать хорошим вором или бойцом.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05");	//Влиятельные Призраки будут испытывать тебя. Они дадут задание, на котором ты не должен попасться.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06");	//Поэтому для начала тебе следует избрать путь вора.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07");	//К счастью, я лучший вор, какого только можно найти в Старом лагере.
	FINGERS_CANTEACH = TRUE;
	Info_ClearChoices(dia_fingers_becomeshadow);
};


var int fingers_wherecavalorn;

instance DIA_FINGERS_LEHRER(C_INFO)
{
	npc = stt_331_fingers;
	nr = 2;
	condition = dia_fingers_lehrer_condition;
	information = dia_fingers_lehrer_info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_fingers_lehrer_condition()
{
	if(FINGERS_CANTEACH == TRUE)
	{
		return 1;
	};
};

func void dia_fingers_lehrer_info()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00");	//Ты можешь научить меня чему-нибудь?
	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 2))
	{
		AI_Output(self,other,"SVM_5_NoLearnOverMax");	//Ты выучил все, что нужно. Тебе стоит поучиться чему-нибудь еще.
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_05_02");	//Зависит от того, что ты хочешь узнать.
		Info_ClearChoices(dia_fingers_lehrer);
		Info_AddChoice(dia_fingers_lehrer,DIALOG_BACK,dia_fingers_lehrer_back);
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
		{
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_2,LPCOST_TALENT_PICKPOCKET_2,0),dia_fingers_lehrer_pickpocket2);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
		{
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_1,LPCOST_TALENT_PICKPOCKET_1,0),dia_fingers_lehrer_pickpocket);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
		{
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_2,LPCOST_TALENT_PICKLOCK_2,0),dia_fingers_lehrer_lockpick2);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
		{
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_1,LPCOST_TALENT_PICKLOCK_1,0),dia_fingers_lehrer_lockpick);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
		{
			Info_AddChoice(dia_fingers_lehrer,"Я хочу научиться подкрадываться.",dia_fingers_lehrer_schleichen);
		};
	};
};

func void dia_fingers_lehrer_schleichen()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00");	//Я хочу научиться подкрадываться.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01");	//Я думаю, мое мнение разделяют многие, что я лучший вор, когда-либо попадавший в эту колонию.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02");	//Но если ты действительно хочешь научиться подкрадываться, то тебе следует обратиться к Кавалорну!
	FINGERS_WHERECAVALORN = TRUE;
};

func void dia_fingers_lehrer_lockpick()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00");	//Я хотел бы знать, как вскрывать замки.
	if(b_giveskill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01");	//Хочешь, я тебя научу? Это не слишком сложно.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02");	//Очень важно следить за тем, чтобы у тебя не сломалась отмычка.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03");	//Если ты будешь действовать очень осторожно, ты заметишь, что во многих случаях тебе не понадобится больше одной отмычки.
		Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_2,LPCOST_TALENT_PICKLOCK_2,0),dia_fingers_lehrer_lockpick2);
	};
};

func void dia_fingers_lehrer_lockpick2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00");	//Я хочу знать все о взломе замков.
	if(b_giveskill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01");	//После некоторых тренировок ты сможешь распознать момент, когда отмычка вот-вот сломается. Это будет заметно по звуку.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02");	//С опытом к тебе придет умение различать щелчки в замке при повороте отмычки. При этом ты будешь ломать их гораздо реже.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03");	//Настоящему профессионалу часто удается открыть замок, не сломав ни одной отмычки.
	};
};

func void dia_fingers_lehrer_pickpocket()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00");	//Я хочу стать хорошим карманником.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(b_giveskill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01");	//Так ты хочешь облегчать кошельки местных богачей, да? Что ж.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02");	//Риск будет оправдан только в том случае, если ты остаешься один на один со своей жертвой.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03");	//Но только профессиональный вор может совершенно незаметно вытащить что-нибудь ценное из кармана зазевавшегося прохожего!
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04");	//Незаметно вытащить вещь из чьего-то кармана ты сможешь только тогда, когда станешь настоящим профессионалом.
			Info_AddChoice(dia_fingers_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_2,LPCOST_TALENT_PICKPOCKET_2,0),dia_fingers_lehrer_pickpocket2);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05");	//Ничего не выйдет! Тот, кто не умеет подкрадываться, никогда не станет настоящим вором.
	};
};

func void dia_fingers_lehrer_pickpocket2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00");	//Я хочу знать все о карманных кражах.
	if(b_giveskill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01");	//Думаю, ты уже готов постичь тайны моего мастерства.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02");	//Но даже лучшего вора могут застать на месте преступления.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//Будь осторожен.
	};
};

func void dia_fingers_lehrer_back()
{
	Info_ClearChoices(dia_fingers_lehrer);
};


instance DIA_FINGERS_WHERECAVALORN(C_INFO)
{
	npc = stt_331_fingers;
	nr = 2;
	condition = dia_fingers_wherecavalorn_condition;
	information = dia_fingers_wherecavalorn_info;
	permanent = 1;
	description = "Где можно найти Кавалорна?";
};


func int dia_fingers_wherecavalorn_condition()
{
	if(FINGERS_WHERECAVALORN == TRUE && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_fingers_wherecavalorn_info()
{
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00");	//Где можно найти Кавалорна?
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01");	//Он охотится в диких лесах. Ты найдешь его на пути к Новому лагерю. К западу от Старого лагеря расположено широкое ущелье.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02");	//В нем ты увидишь старую хижину лесорубов. Он живет именно там.
	if(LOG_CAVALORNTRAIN_SNEAK == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"Кавалорн может научить меня подкрадываться. Его дом находится в неглубоком ущелье к западу от Старого лагеря, по дороге в Новый лагерь.");
		LOG_CAVALORNTRAIN_SNEAK = TRUE;
	};
};

var int fingers_learnt;

instance DIA_FINGERS_LEARNT(C_INFO)
{
	npc = stt_331_fingers;
	nr = 2;
	condition = dia_fingers_learnt_condition;
	information = dia_fingers_learnt_info;
	permanent = 1;
	description = "Ты можешь замолвить за меня словечко перед Диего?";
};


func int dia_fingers_learnt_condition()
{
	if((FINGERS_LEARNT != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_fingers_learnt_info()
{
	var int log;
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00");	//Ты можешь замолвить за меня словечко перед Диего?
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) + Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) + Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) > 0)
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01");	//Да, ты уже многое знаешь, твои знания пригодятся нашему лагерю.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02");	//Нам нужны опытные воры. Я отдам за тебя свой голос.
		FINGERS_LEARNT = LOG_SUCCESS;
		b_givexp(XP_FINGERSTRAIN);
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
		b_logentry(CH1_JOINOC,"Фингерсу нравится, как я работаю.");
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03");	//Все не так просто...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04");	//Если ты покажешь себя с лучшей стороны, мы примем тебя!
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05");	//И как это сделать?
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06");	//Найди себе хорошего учителя. Когда ты научишься подкрадываться или открывать замки, тогда я смогу тебе помочь.
		FINGERS_LEARNT = LOG_RUNNING;
		if(log == FALSE)
		{
			Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
			b_logentry(CH1_JOINOC,"Фингерс сможет замолвить за меня словечко, если я смогу обучиться одному из воровских навыков.");
			log = TRUE;
		};
	};
};

