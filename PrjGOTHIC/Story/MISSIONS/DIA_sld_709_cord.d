
instance DIA_SLD_709_CORD_EXIT(C_INFO)
{
	npc = sld_709_cord;
	nr = 999;
	condition = dia_sld_709_cord_exit_condition;
	information = dia_sld_709_cord_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_sld_709_cord_exit_condition()
{
	return 1;
};

func void dia_sld_709_cord_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_709_CORD_TRAINOFFER(C_INFO)
{
	npc = sld_709_cord;
	condition = sld_709_cord_trainoffer_condition;
	information = sld_709_cord_trainoffer_info;
	important = 0;
	permanent = 0;
	description = "Я хочу научиться владеть одноручным мечом.";
};


func int sld_709_cord_trainoffer_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};
};

func void sld_709_cord_trainoffer_info()
{
	AI_Output(other,self,"SLD_709_Cord_TRAINOFFER_Info_15_01");	//Я хочу научиться владеть одноручным мечом.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		AI_Output(self,other,"SLD_709_Cord_TRAINOFFER_Info_14_02");	//Хорошо. Но не бесплатно. За это я хочу тридцать кусков руды.
	}
	else
	{
		AI_Output(self,other,"SVM_14_WiseMove");	//Вот это правильно!
	};
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"Наемник Корд может научить меня обращаться с одноручным мечом. Он постоянно тренируется на площадке возле озера.");
};


instance SLD_709_CORD_TRAIN(C_INFO)
{
	npc = sld_709_cord;
	condition = sld_709_cord_train_condition;
	information = sld_709_cord_train_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN1H_1,LPCOST_TALENT_1H_1,30);
};


func int sld_709_cord_train_condition()
{
	if(Npc_KnowsInfo(hero,sld_709_cord_trainoffer) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0))
	{
		return TRUE;
	};
};

func void sld_709_cord_train_info()
{
	AI_Output(other,self,"SLD_709_Cord_TRAIN_Info_15_00");	//Я хочу улучшить технику ведения боя с одноручным мечом.
	if(Npc_HasItems(hero,itminugget) >= 30)
	{
		if(b_giveskill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			b_printtrademsg1("Отдано руды: 30");
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_01");	//Правильное решение! Но прежде, чем освоить технику боя, тебе нужно научиться правильно держать меч.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_02");	//Почти все новички привыкли держать оружие двумя руками. Это неправильно.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_03");	//Всегда держи меч одной рукой, острием вверх.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_04");	//Он должен стать продолжением твоей руки, слиться с ее движением. Это позволит тебе атаковать намного быстрее.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_05");	//Если усвоишь все, что я тебе сказал, твои удары станут более изящными и быстрыми.
			b_practicecombat("NC_WATERFALL_TOP01");
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_06");	//И еще: есть ряд более мощных ударов, но у новичка не так уж много шансов повторить их.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_07");	//Но как говорится: тяжело в учении, зато легко в бою. Тренируйся, парень!
			b_giveinvitems(hero,self,itminugget,30);
			sld_709_cord_train.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//Тебе не хватает руды.
	};
};


instance SLD_709_CORD_TRAINAGAIN(C_INFO)
{
	npc = sld_709_cord;
	condition = sld_709_cord_trainagain_condition;
	information = sld_709_cord_trainagain_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN1H_2,LPCOST_TALENT_1H_2,50);
};


func int sld_709_cord_trainagain_condition()
{
	if(Npc_KnowsInfo(hero,sld_709_cord_trainoffer) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1))
	{
		return TRUE;
	};
};

func void sld_709_cord_trainagain_info()
{
	AI_Output(other,self,"SLD_709_Cord_TRAINAGAIN_Info_15_01");	//Научи меня лучше владеть одноручным мечом.
	if(Npc_HasItems(hero,itminugget) >= 50)
	{
		if(b_giveskill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			b_printtrademsg1("Отдано руды: 50");
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_02");	//Хорошо. Основное ты уже знаешь. Вот еще: если держать меч немного ниже, то первый удар будет более сильным.
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_03");	//Ну, рубящий удар, ты помнишь?! Тогда давай расскажу, как правильно двигаться. Наносишь два удара и резко разворачиваешься. Враг, скорее всего, растеряется, а для тебя это отличный момент:
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_04");	//делаешь еще один удар справа налево...
			b_practicecombat("NC_WATERFALL_TOP01");
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_05");	//...и возвращаешься в исходную позицию. Так что тренируйся и станешь настоящим профессионалом.
			b_giveinvitems(hero,self,itminugget,50);
			sld_709_cord_trainagain.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//Тебе не хватает руды.
	};
};

