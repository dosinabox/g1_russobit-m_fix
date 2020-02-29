
func void b_aidanlearn()
{
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		Info_ClearChoices(org_859_aidan_creatures);
		Info_AddChoice(org_859_aidan_creatures,DIALOG_BACK,org_859_aidan_creatures_back);
		if(KNOWS_GETTEETH == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_859_aidan_creatures,"Добыча клыков (2 очка обучения, 50 руды)",org_859_aidan_creatures_zahn);
			}
			else
			{
				Info_AddChoice(org_859_aidan_creatures,"Добыча клыков (1 очко обучения, 50 руды)",org_859_aidan_creatures_zahn);
			};
		};
		if(KNOWS_GETFUR == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_859_aidan_creatures,"Добыча шкур (2 очка обучения, 100 руды)",org_859_aidan_creatures_fell);
			}
			else
			{
				Info_AddChoice(org_859_aidan_creatures,"Добыча шкур (1 очко обучения, 100 руды)",org_859_aidan_creatures_fell);
			};
		};
		if(KNOWS_GETCLAWS == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_859_aidan_creatures,"Добыча когтей (2 очка обучения, 50 руды)",org_859_aidan_creatures_kralle);
			}
			else
			{
				Info_AddChoice(org_859_aidan_creatures,"Добыча когтей (1 очко обучения, 50 руды)",org_859_aidan_creatures_kralle);
			};
		};
		if(KNOWS_GETHIDE == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_859_aidan_creatures,"Добыча шкур рептилий (2 очка обучения, 100 руды)",org_859_aidan_creatures_haut);
			}
			else
			{
				Info_AddChoice(org_859_aidan_creatures,"Добыча шкур рептилий (1 очко обучения, 100 руды)",org_859_aidan_creatures_haut);
			};
		};
	}
	else
	{
		AI_Output(self,other,"SVM_13_NoLearnOverMax");	//Ты уже освоил эту науку. Тебе стоит научиться чему-нибудь еще.
		AIDAN_CAN_LEARN = FALSE;
	};
};

instance DIA_AIDAN_EXIT(C_INFO)
{
	npc = org_859_aidan;
	nr = 999;
	condition = dia_aidan_exit_condition;
	information = dia_aidan_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_aidan_exit_condition()
{
	return 1;
};

func void dia_aidan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AIDAN_HELLO(C_INFO)
{
	npc = org_859_aidan;
	nr = 1;
	condition = dia_aidan_hello_condition;
	information = dia_aidan_hello_info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int dia_aidan_hello_condition()
{
	return 1;
};

func void dia_aidan_hello_info()
{
	AI_Output(other,self,"DIA_Aidan_Hello_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Aidan_Hello_13_01");	//Я охотник. Добываю шкуры и клыки, тем и живу.
	AI_Output(other,self,"DIA_Aidan_Hello_15_02");	//За них хорошо платят?
	AI_Output(self,other,"DIA_Aidan_Hello_13_03");	//Да, можно неплохо зарабатывать, если знать, как разделывать добычу.
	AIDAN_CAN_LEARN = TRUE;
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"Эйдан, охотник, живущий между Старым и Новым лагерями, может научить меня разделывать добычу.");
	};
};


instance ORG_859_AIDAN_CREATURES(C_INFO)
{
	npc = org_859_aidan;
	nr = 990;
	condition = org_859_aidan_creatures_condition;
	information = org_859_aidan_creatures_info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int org_859_aidan_creatures_condition()
{
	if(AIDAN_CAN_LEARN == TRUE)
	{
		return 1;
	};
};

func void org_859_aidan_creatures_info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//Я хочу научиться правильно разделывать добычу.
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01");	//А чему ты хочешь научиться?
	};
	b_aidanlearn();
};

func void org_859_aidan_creatures_back()
{
	Info_ClearChoices(org_859_aidan_creatures);
};

func void org_859_aidan_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00");	//Как добывать клыки?
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("Отдано руды: 50");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("Навык: добыча клыков",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01");	//Ты должен следить за тем, чтобы клыки не сломались. Чтобы этого избежать, используй очень острый нож.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02");	//Лучше всего продаются клыки волков, глорхов и мракорисов.
			KNOWS_GETTEETH = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"Навык добычи клыков: волк, орочья собака, глорх, жерх, ищейка, мракорис.");
		}
		else
		{
			AI_Output(self,other,"SVM_13_NoLearnNoPoints");	//Я не могу обучить тебя. У тебя недостаточно опыта.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"SVM_13_ShitNoOre");	//Да у тебя же совсем нет руды!
	};
	if((KNOWS_GETTEETH == TRUE) && (KNOWS_GETFUR == TRUE) && (KNOWS_GETCLAWS == TRUE) && (KNOWS_GETHIDE == TRUE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Я научил тебя всему, что знал сам.
		Info_ClearChoices(org_859_aidan_creatures);
		AIDAN_CAN_LEARN = FALSE;
	}
	else
	{
		b_aidanlearn();
	};
};

func void org_859_aidan_creatures_fell()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00");	//Как снимать шкуры?
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("Отдано руды: 100");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("Навык: добыча шкур",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01");	//Важно знать, что начинать разделывать тушу следует с головы. Шкуры здесь высоко ценятся, поэтому главное не повредить их при снятии.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02");	//Из шкур волков и мракорисов шьют хорошую одежду. С практикой к тебе придет умение распознавать, годится та или иная шкура на одежду или нет.
			KNOWS_GETFUR = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"Навык добычи шкур: волк, орочья собака, мракорис, тролль.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//Сначала заплати мне. Как говорится, всему своя цена.
	};
	if((KNOWS_GETTEETH == TRUE) && (KNOWS_GETFUR == TRUE) && (KNOWS_GETCLAWS == TRUE) && (KNOWS_GETHIDE == TRUE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Я научил тебя всему, что знал сам.
		Info_ClearChoices(org_859_aidan_creatures);
		AIDAN_CAN_LEARN = FALSE;
	}
	else
	{
		b_aidanlearn();
	};
};

func void org_859_aidan_creatures_kralle()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00");	//Научи меня добывать когти.
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("Отдано руды: 50");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("Навык: добыча когтей",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01");	//Это проще, чем кажется на первый взгляд. Нужно отогнуть коготь вперед, но при этом не пытаться его выдернуть и не отгибать назад.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02");	//Конечно, пригодные когти можно добыть не у всякого зверя. Обычно в дело идут когти ящериц.
			KNOWS_GETCLAWS = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"Навык добычи когтей: ящерица, глорх, шныг, жерх, штек.");
		}
		else
		{
			AI_Output(self,other,"SVM_13_NoLearnNoPoints");	//Я не могу обучить тебя. У тебя недостаточно опыта.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"SVM_13_ShitNoOre");	//Да у тебя же совсем нет руды!
	};
	if((KNOWS_GETTEETH == TRUE) && (KNOWS_GETFUR == TRUE) && (KNOWS_GETCLAWS == TRUE) && (KNOWS_GETHIDE == TRUE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Я научил тебя всему, что знал сам.
		Info_ClearChoices(org_859_aidan_creatures);
		AIDAN_CAN_LEARN = FALSE;
	}
	else
	{
		b_aidanlearn();
	};
};

func void org_859_aidan_creatures_haut()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00");	//Что мне нужно знать, чтобы добывать шкуры рептилий?
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("Отдано руды: 100");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("Навык: добыча шкур рептилий",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01");	//Для этого подходят не всякие рептилии, а лишь шныги и болотожоры.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02");	//Если ты подрежешь шкуру по краям, то ты сможешь легко ее снять. Теперь ты сможешь легко справляться с этой задачей.
			KNOWS_GETHIDE = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"Навык добычи шкур рептилий: шныг, болотожор.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//Сначала заплати мне. Как говорится, всему своя цена.
	};
	if((KNOWS_GETTEETH == TRUE) && (KNOWS_GETFUR == TRUE) && (KNOWS_GETCLAWS == TRUE) && (KNOWS_GETHIDE == TRUE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Я научил тебя всему, что знал сам.
		Info_ClearChoices(org_859_aidan_creatures);
		AIDAN_CAN_LEARN = FALSE;
	}
	else
	{
		b_aidanlearn();
	};
};

