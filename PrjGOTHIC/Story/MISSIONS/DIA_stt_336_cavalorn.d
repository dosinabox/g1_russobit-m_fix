
func void b_cavalornearn()
{
	Info_ClearChoices(dia_cavalorn_lehrer);
	Info_AddChoice(dia_cavalorn_lehrer,DIALOG_BACK,dia_cavalorn_lehrer_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1)
	{
		if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
		{
			Info_AddChoice(dia_cavalorn_lehrer,b_buildlearnstring(NAME_LEARNBOW_2,LPCOST_TALENT_BOW_2,0),dia_cavalorn_lehrer_bow_2);
		}
		else
		{
			Info_AddChoice(dia_cavalorn_lehrer,b_buildlearnstring(NAME_LEARNBOW_2,LPCOST_TALENT_BOW_2,100),dia_cavalorn_lehrer_bow_2);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0)
	{
		if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
		{
			Info_AddChoice(dia_cavalorn_lehrer,b_buildlearnstring(NAME_LEARNBOW_1,LPCOST_TALENT_BOW_1,0),dia_cavalorn_lehrer_bow);
		}
		else
		{
			Info_AddChoice(dia_cavalorn_lehrer,b_buildlearnstring(NAME_LEARNBOW_1,LPCOST_TALENT_BOW_1,50),dia_cavalorn_lehrer_bow);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
		{
			Info_AddChoice(dia_cavalorn_lehrer,b_buildlearnstring(NAME_LEARNSNEAK,LPCOST_TALENT_SNEAK,0),dia_cavalorn_lehrer_schleichen);
		}
		else
		{
			Info_AddChoice(dia_cavalorn_lehrer,b_buildlearnstring(NAME_LEARNSNEAK,LPCOST_TALENT_SNEAK,50),dia_cavalorn_lehrer_schleichen);
		};
	};
};

instance DIA_CAVALORN_EXIT(C_INFO)
{
	npc = stt_336_cavalorn;
	nr = 999;
	condition = dia_cavalorn_exit_condition;
	information = dia_cavalorn_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_cavalorn_exit_condition()
{
	return 1;
};

func void dia_cavalorn_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_CAVALORN_HUNTER(C_INFO)
{
	npc = stt_336_cavalorn;
	nr = 2;
	condition = dia_cavalorn_hunter_condition;
	information = dia_cavalorn_hunter_info;
	permanent = 0;
	description = "Чем ты занимаешься?";
};

func int dia_cavalorn_hunter_condition()
{
	return 1;
};

func void dia_cavalorn_hunter_info()
{
	AI_Output(other,self,"DIA_cavalorn_Hunter_15_00");	//Чем ты занимаешься?
	AI_Output(self,other,"DIA_cavalorn_Hunter_12_01");	//Я охотник. Здесь я охочусь на падальщиков.
};

instance DIA_CAVALORN_LEHRER(C_INFO)
{
	npc = stt_336_cavalorn;
	nr = 2;
	condition = dia_cavalorn_lehrer_condition;
	information = dia_cavalorn_lehrer_info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};

func int dia_cavalorn_lehrer_condition()
{
	if(Npc_KnowsInfo(hero,dia_cavalorn_hunter))
	{
		return 1;
	};
};

func void dia_cavalorn_lehrer_info()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_cavalorn_Lehrer_12_01");	//А чему бы ты хотел научиться?
	if(LOG_CAVALORNTRAIN_BOW == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"Кавалорн - охотник. Я могу научиться у него стрелять из лука. Он живет в доме между Старым и Новым лагерями.");
		LOG_CAVALORNTRAIN_BOW = TRUE;
	};
	if(LOG_CAVALORNTRAIN_SNEAK == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"Также Кавалорн может научить меня подкрадываться.");
		LOG_CAVALORNTRAIN_SNEAK = TRUE;
	};
	b_cavalornearn();
};

func void dia_cavalorn_lehrer_back()
{
	Info_ClearChoices(dia_cavalorn_lehrer);
};

func void dia_cavalorn_lehrer_bow()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00");	//Научи меня стрелять из лука.
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
	{
		if(b_giveskill(other,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01");	//Начинающему воину нетрудно совершенствовать свое мастерство. Главное здесь - положение тела.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02");	//Ноги должны быть широко расставлены, руки на одной линии, вдох и - выстрел!
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03");	//Иногда, чтобы убить жертву, достаточно направить стрелу в уязвимое место на теле. У новичка не так уж много шансов найти эти места.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04");	//Но если ты будешь следовать моим советам, твои выстрелы будут более точными.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 50)
		{
			if(hero.lp >= LPCOST_TALENT_BOW_1)
			{
				b_printtrademsg1("Отдано руды: 50");
				b_giveinvitems(hero,self,itminugget,50);
			};
			if(b_giveskill(other,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
			{
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01");	//Начинающему воину нетрудно совершенствовать свое мастерство. Главное здесь - положение тела.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02");	//Ноги должны быть широко расставлены, руки на одной линии, вдох и - выстрел!
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03");	//Иногда, чтобы убить жертву, достаточно направить стрелу в уязвимое место на теле. У новичка не так уж много шансов найти эти места.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04");	//Но если ты будешь следовать моим советам, твои выстрелы будут более точными.
			};
		}
		else
		{
			AI_Output(self,other,"SVM_12_ShitNoOre");	//Да у тебя же совсем нет руды!
		};
	};
	b_cavalornearn();
};

func void dia_cavalorn_lehrer_bow_2()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00");	//Научи меня стрелять из лука.
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
	{
		if(b_giveskill(other,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02");	//Ты уже стал хорошим охотником. Теперь ты можешь узнать самое главное.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03");	//Ты должен научиться двигаться бессознательно, не раздумывая над тем, что делать в следующий момент.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04");	//Запомни закон стрельбы: рассчитываешь расстояние до цели, скорость полета, силу натяжения тетивы - и стрела летит в цель. Будь всегда внимателен.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05");	//Технику ты очень хорошо освоил. Теперь настало время применить свои знания на практике.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_BOW_2)
			{
				b_printtrademsg1("Отдано руды: 100");
				b_giveinvitems(hero,self,itminugget,100);
			};
			if(b_giveskill(other,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
			{
				AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02");	//Ты уже стал хорошим охотником. Теперь ты можешь узнать самое главное.
				AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03");	//Ты должен научиться двигаться бессознательно, не раздумывая над тем, что делать в следующий момент.
				AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04");	//Запомни закон стрельбы: рассчитываешь расстояние до цели, скорость полета, силу натяжения тетивы - и стрела летит в цель. Будь всегда внимателен.
				AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05");	//Технику ты очень хорошо освоил. Теперь настало время применить свои знания на практике.
			};
		}
		else
		{
			AI_Output(self,other,"SVM_12_ShitNoOre");	//Да у тебя же совсем нет руды!
		};
	};
	b_cavalornearn();
};

func void dia_cavalorn_lehrer_schleichen()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Schleichen_15_00");	//Я хочу научиться подкрадываться.
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
	{
		if(b_giveskill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
		{
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01");	//Хороший выбор. Это умение пригодится тому, кто хочет незаметно пробраться в чужой дом и застать хозяина врасплох.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02");	//Если ты немного присядешь, тебе будет легче контролировать тело и видеть, куда ступают твои ноги.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03");	//Нужно тебя предупредить: когда ты крадешься, это привлекает много внимания. Постарайся, чтобы тебя не заметили.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04");	//Запомни это и никогда не попадайся.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 50)
		{
			if(hero.lp >= LPCOST_TALENT_SNEAK)
			{
				b_printtrademsg1("Отдано руды: 50");
				b_giveinvitems(hero,self,itminugget,50);
			};
			if(b_giveskill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
			{
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01");	//Хороший выбор. Это умение пригодится тому, кто хочет незаметно пробраться в чужой дом и застать хозяина врасплох.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02");	//Если ты немного присядешь, тебе будет легче контролировать тело и видеть, куда ступают твои ноги.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03");	//Нужно тебя предупредить: когда ты крадешься, это привлекает много внимания. Постарайся, чтобы тебя не заметили.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04");	//Запомни это и никогда не попадайся.
			};
		}
		else
		{
			AI_Output(self,other,"SVM_12_ShitNoOre");	//Да у тебя же совсем нет руды!
		};
	};
	b_cavalornearn();
};

instance STT_336_CAVALORN_SELLBOW(C_INFO)
{
	npc = stt_336_cavalorn;
	condition = stt_336_cavalorn_sellbow_condition;
	information = stt_336_cavalorn_sellbow_info;
	important = 0;
	permanent = 0;
	description = "У кого я могу купить хороший лук?";
};


func int stt_336_cavalorn_sellbow_condition()
{
	if(Npc_KnowsInfo(hero,dia_cavalorn_hunter))
	{
		return TRUE;
	};
};

func void stt_336_cavalorn_sellbow_info()
{
	AI_Output(other,self,"STT_336_cavalorn_SELLBOW_Info_15_01");	//У кого я могу купить хороший лук?
	AI_Output(self,other,"STT_336_cavalorn_SELLBOW_Info_12_02");	//У меня. Лучших луков ты в Старом лагере ни у кого не найдешь.
	Log_CreateTopic(GE_TRADEROW,LOG_NOTE);
	b_logentry(GE_TRADEROW,"Кавалорн продает луки и стрелы. Он живет в неглубоком ущелье между Старым и Новым лагерями.");
};


instance STT_336_CAVALORN_TRADE(C_INFO)
{
	npc = stt_336_cavalorn;
	condition = stt_336_cavalorn_trade_condition;
	information = stt_336_cavalorn_trade_info;
	important = 0;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int stt_336_cavalorn_trade_condition()
{
	if(Npc_KnowsInfo(hero,stt_336_cavalorn_sellbow))
	{
		return TRUE;
	};
};

func void stt_336_cavalorn_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//Покажи мне свои товары.
};

