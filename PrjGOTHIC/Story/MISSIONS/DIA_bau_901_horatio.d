
instance DIA_HORATIO_EXIT(C_INFO)
{
	npc = bau_901_horatio;
	nr = 999;
	condition = dia_horatio_exit_condition;
	information = dia_horatio_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_horatio_exit_condition()
{
	return 1;
};

func void dia_horatio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_HORATIO_WASSER(C_INFO)
{
	npc = bau_901_horatio;
	nr = 800;
	condition = info_horatio_wasser_condition;
	information = info_horatio_wasser_info;
	permanent = 1;
	description = "Меня послал Лефти. Я принес тебе воды.";
};


func int info_horatio_wasser_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(((LEFTY_MISSION == LOG_RUNNING) || ((LEFTY_MISSION == LOG_SUCCESS) && Npc_HasItems(other,itfo_potion_water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void info_horatio_wasser_info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00");	//Меня послал Лефти. Я принес тебе воды.
	if(Npc_HasItems(other,itfo_potion_water_01) >= 1)
	{
		b_printtrademsg1("Отдана бутылка воды.");
		AI_Output(self,other,"Info_Horatio_Wasser_09_01");	//Спасибо, парень. А то я уже был готов пить хоть из лужи.
		b_giveinvitems(other,self,itfo_potion_water_01,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfo_potion_water_01);
		AN_BAUERN_VERTEILT = AN_BAUERN_VERTEILT + 1;
		if(AN_BAUERN_VERTEILT >= DURSTIGEBAUERN)
		{
			LEFTY_MISSION = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00");	//У тебя же ничего нет. Ладно, может у других есть.
	};
};


var int horatio_trouble;

instance DIA_HORATIO_HELLO(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_hello_condition;
	information = dia_horatio_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_horatio_hello_condition()
{
	return 1;
};

func void dia_horatio_hello_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_Horatio_Hello_09_00");	//Что тебе здесь надо? Хочешь проблем?
	Info_ClearChoices(dia_horatio_hello);
	Info_AddChoice(dia_horatio_hello,"Проблемы? С крестьянином что ли?",dia_horatio_hello_pissoff);
	Info_AddChoice(dia_horatio_hello,"Эй, успокойся! Я новенький.",dia_horatio_hello_becool);
};

func void dia_horatio_hello_becool()
{
	AI_Output(other,self,"DIA_Horatio_Hello_BeCool_15_00");	//Эй, успокойся! Я новенький.
	AI_Output(self,other,"DIA_Horatio_Hello_BeCool_09_01");	//А-а... ну, тогда ладно. Сам понимаешь, тут такая толпа людей, и каждый думает, что он самый крутой.
	Info_ClearChoices(dia_horatio_hello);
};

func void dia_horatio_hello_pissoff()
{
	AI_Output(other,self,"DIA_Horatio_Hello_PissOff_15_00");	//Проблемы? С крестьянином что ли?
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_01");	//Парень, если я работаю в поле, это не значит, что я не могу постоять за себя.
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_02");	//Нужны неприятности? Тогда давай, вперед!
	HORATIO_TROUBLE = TRUE;
	Info_ClearChoices(dia_horatio_hello);
	AI_StopProcessInfos(self);
};


instance DIA_HORATIO_SORRY(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_sorry_condition;
	information = dia_horatio_sorry_info;
	permanent = 1;
	description = "Прости, я не собирался тебя обижать.";
};


func int dia_horatio_sorry_condition()
{
	if(HORATIO_TROUBLE == TRUE)
	{
		return 1;
	};
};

func void dia_horatio_sorry_info()
{
	AI_Output(other,self,"DIA_Horatio_SORRY_15_00");	//Прости, я не собирался тебя обижать.
	AI_Output(self,other,"DIA_Horatio_SORRY_09_01");	//Надо было раньше подумать об этом!
};


instance DIA_HORATIO_STORY(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_story_condition;
	information = dia_horatio_story_info;
	permanent = 0;
	description = "Что такой человек, как ты делает среди крестьян?";
};


func int dia_horatio_story_condition()
{
	if((HORATIO_TROUBLE == FALSE) && Npc_KnowsInfo(hero,dia_horatio_hello))
	{
		return 1;
	};
};

func void dia_horatio_story_info()
{
	AI_Output(other,self,"DIA_Horatio_Story_15_00");	//Что такой человек, как ты делает среди крестьян?
	AI_Output(self,other,"DIA_Horatio_Story_09_01");	//Ли мне предложил. Я уже больше не дерусь, разве только для самозащиты.
	AI_Output(self,other,"DIA_Horatio_Story_09_02");	//Я убил одного парня, а это уже серьезно. В общем меня вышвырнули в эту Богом забытую колонию справедливо, правда.
	AI_Output(other,self,"DIA_Horatio_Story_15_03");	//Как это тебя угораздило?
	AI_Output(self,other,"DIA_Horatio_Story_09_04");	//Да в кабаке подрался. Я не хотел убивать того парня. Просто сильно его ударил.
	AI_Output(self,other,"DIA_Horatio_Story_09_05");	//Я был кузнецом в то время и не очень осознавал свою силу...
};


instance DIA_HORATIO_WHYHERE(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_whyhere_condition;
	information = dia_horatio_whyhere_info;
	permanent = 0;
	description = "Почему ты пришел именно в этот лагерь?";
};


func int dia_horatio_whyhere_condition()
{
	if(Npc_KnowsInfo(hero,dia_horatio_story))
	{
		return 1;
	};
};

func void dia_horatio_whyhere_info()
{
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_00");	//Почему ты пришел именно в этот лагерь?
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_01");	//Что я тебе скажу: я мог бы присоединиться к сектантам, но не хотел, чтобы эти Гуру промывали мне мозги.
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_02");	//В Старом лагере у меня были проблемы со стражниками, а вот воры и наемники были более приветливы ко мне.
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_03");	//Они боятся тебя...
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_04");	//Может и так. В любом случае здесь меня оставили в покое. Может, и тебе попробовать стоит.
};


var int horatio_strfree;

instance DIA_HORATIO_PLEASETEACHSTR(C_INFO)
{
	npc = bau_901_horatio;
	nr = 2;
	condition = dia_horatio_pleaseteachstr_condition;
	information = dia_horatio_pleaseteachstr_info;
	permanent = 0;
	description = "Я бы хотел быть сильным, таким как ты. Можешь научить?";
};


func int dia_horatio_pleaseteachstr_condition()
{
	if(Npc_KnowsInfo(hero,dia_horatio_story))
	{
		return 1;
	};
};

func void dia_horatio_pleaseteachstr_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_15_00");	//Я бы хотел быть сильным, как ты. Можешь научить?
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_09_01");	//Может, и могу. Вот только зачем тебе нужна сила?
	Info_ClearChoices(dia_horatio_pleaseteachstr);
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	if(Npc_KnowsInfo(hero,dia_jeremiah_horatio))
	{
		Info_AddChoice(dia_horatio_pleaseteachstr,"Хочу уничтожить Лорда и его головорезов!",dia_horatio_pleaseteachstr_ricelord);
	}
	else
	{
		Info_AddChoice(dia_horatio_pleaseteachstr,"Хороший вопрос. Я подумаю об этом...",dia_horatio_pleaseteachstr_back);
	};
	Info_AddChoice(dia_horatio_pleaseteachstr,"Просто для самозащиты.",dia_horatio_pleaseteachstr_defend);
	Info_AddChoice(dia_horatio_pleaseteachstr,"Хочу поставить на место всех этих уродов!",dia_horatio_pleaseteachstr_attack);
	Log_CreateTopic(CH1_HORATIOSTEACHINGS,LOG_MISSION);
	Log_SetTopicStatus(CH1_HORATIOSTEACHINGS,LOG_RUNNING);
	b_logentry(CH1_HORATIOSTEACHINGS,"Горацио, крестьянин, который работает на рисовых полях в Новом лагере, может помочь мне стать сильнее. Но я должен сказать ему, зачем мне это нужно.");
};

func void dia_horatio_pleaseteachstr_attack()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00");	//Хочу поставить на место всех этих уродов!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01");	//Да, но, сделав это, ты сам станешь одним из них. Так что... я тебя учить не буду.
	Info_ClearChoices(dia_horatio_pleaseteachstr);
};

func void dia_horatio_pleaseteachstr_defend()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00");	//Просто для самозащиты.
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01");	//Чтобы остаться в живых лучше иметь быстрые ноги, чем силу. Или ты думаешь выбивать челюсти лучше, чем жить спокойно?
};

func void dia_horatio_pleaseteachstr_back()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00");	//Хороший вопрос. Я подумаю об этом...
	Info_ClearChoices(dia_horatio_pleaseteachstr);
};

func void dia_horatio_pleaseteachstr_ricelord()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00");	//Хочу уничтожить Лорда и его головорезов!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01");	//Хм... Ты не первый, кто этого хотел.
	HORATIO_STRFREE = TRUE;
	Info_ClearChoices(dia_horatio_pleaseteachstr);
};


instance DIA_HORATIO_THOUGHTSTR(C_INFO)
{
	npc = bau_901_horatio;
	nr = 2;
	condition = dia_horatio_thoughtstr_condition;
	information = dia_horatio_thoughtstr_info;
	permanent = 1;
	description = "Я уже много думал об этом...";
};


func int dia_horatio_thoughtstr_condition()
{
	if(Npc_KnowsInfo(hero,dia_horatio_pleaseteachstr) && (HORATIO_STRFREE == FALSE))
	{
		return 1;
	};
};

func void dia_horatio_thoughtstr_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_15_00");	//Я уже много думал об этом...
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_09_01");	//И? Придумал что-нибудь получше?
	Info_ClearChoices(dia_horatio_thoughtstr);
	Info_AddChoice(dia_horatio_thoughtstr,"Нет.",dia_horatio_thoughtstr_noidea);
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	if(Npc_KnowsInfo(hero,dia_jeremiah_horatio))
	{
		Info_AddChoice(dia_horatio_thoughtstr,"Да. Я просто обязан избавиться от Лорда и его головорезов!",dia_horatio_thoughtstr_ricelord);
	};
};

func void dia_horatio_thoughtstr_noidea()
{
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00");	//Нет.
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01");	//Вот и я тоже.
	Info_ClearChoices(dia_horatio_thoughtstr);
};

func void dia_horatio_thoughtstr_ricelord()
{
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00");	//Да. Я просто обязан избавиться от Лорда и его головорезов!
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01");	//Хм... Ты будешь далеко не первым из тех, кто пытался сделать это.
	HORATIO_STRFREE = TRUE;
	Info_ClearChoices(dia_horatio_thoughtstr);
};

func void dia_horatio_helpstr_learn_now()
{
	if(DIFF_HARD == TRUE)
	{
		Npc_ChangeAttribute(other,ATR_STRENGTH,2);
		PrintScreen("Сила +2",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		Npc_ChangeAttribute(other,ATR_STRENGTH,5);
		PrintScreen("Сила +5",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00");	//Если хочешь иметь сильный удар, ты должен знать основные принципы, как это делается. Это первое, что должен знать кузнец.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01");	//Старайся наносить удар всей рукой, от плеча до запястья.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02");	//Чем лучше у тебя это получится, тем сильнее удар. Я думаю, научиться этому тебе будет не так уж сложно.
};


instance DIA_HORATIO_HELPSTR(C_INFO)
{
	npc = bau_901_horatio;
	nr = 2;
	condition = dia_horatio_helpstr_condition;
	information = dia_horatio_helpstr_info;
	permanent = 0;
	description = "Я избавлюсь от Лорда и его головорезов... не без твоей помощи!";
};


func int dia_horatio_helpstr_condition()
{
	if(HORATIO_STRFREE == TRUE)
	{
		return 1;
	};
};

func void dia_horatio_helpstr_info()
{
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_00");	//Я избавлюсь от Лорда и его головорезов, конечно, не без твоей помощи!
	AI_Output(self,other,"DIA_Horatio_HelpSTR_09_01");	//Ладно! Я дал клятву, что больше никогда не буду бить человека, но это не значит, что я не могу другого научить этому.
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_02");	//Слушаю тебя!
	dia_horatio_helpstr_learn_now();
	Log_SetTopicStatus(CH1_HORATIOSTEACHINGS,LOG_SUCCESS);
	b_logentry(CH1_HORATIOSTEACHINGS,"Горацио помог мне стать сильнее. Хорошо, что есть такие люди как он.");
};


instance DIA_HORATIO_THANKS(C_INFO)
{
	npc = bau_901_horatio;
	nr = 2;
	condition = dia_horatio_thanks_condition;
	information = dia_horatio_thanks_info;
	permanent = 1;
	description = "Спасибо, что помог!";
};


func int dia_horatio_thanks_condition()
{
	if(Npc_KnowsInfo(hero,dia_horatio_helpstr))
	{
		return 1;
	};
};

func void dia_horatio_thanks_info()
{
	AI_Output(other,self,"DIA_Horatio_Thanks_15_00");	//Спасибо, что помог!
	AI_Output(self,other,"DIA_Horatio_Thanks_09_01");	//Используй свою силу только в крайних случаях и никак больше.
};

instance INFO_HORATIO_WASSER_NOLEFTY(C_INFO)
{
	npc = bau_901_horatio;
	nr = 800;
	condition = info_horatio_wasser_nolefty_condition;
	information = info_horatio_wasser_nolefty_info;
	permanent = 1;
	description = "Я принес тебе воды.";
};

func int info_horatio_wasser_nolefty_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(Npc_HasItems(other,itfo_potion_water_01) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_horatio_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//Я принес тебе воды.
	b_printtrademsg1("Отдана бутылка воды.");
	AI_Output(self,other,"SVM_9_LookAway");	//Да! Погода сегодня отличная!
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	b_giveinvitems(other,self,itfo_potion_water_01,1);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfo_potion_water_01);
};

instance DIA_HORATIO_HELLO2(C_INFO)
{
	npc = bau_901_horatio;
	nr = 1;
	condition = dia_horatio_hello2_condition;
	information = dia_horatio_hello2_info;
	permanent = 0;
	important = 1;
};


func int dia_horatio_hello2_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if((lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (Npc_KnowsInfo(hero,dia_horatio_helpstr)))
	{
		return 1;
	};
};

func void dia_horatio_hello2_info()
{
	AI_Output(self,other,"SVM_9_YouDefeatedMeWell");	//Хороший бой! Учеба пошла тебе на пользу.
	AI_StopProcessInfos(self);
};

