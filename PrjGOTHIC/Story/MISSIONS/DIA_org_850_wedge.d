
func void b_wedgelearn()
{
	Info_ClearChoices(dia_wedge_lehrer);
	Info_AddChoice(dia_wedge_lehrer,DIALOG_BACK,dia_wedge_lehrer_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_2,10,0),dia_wedge_lehrer_pickpocket2);
		}
		else
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_2,LPCOST_TALENT_PICKPOCKET_2,200),dia_wedge_lehrer_pickpocket2);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_1,5,0),dia_wedge_lehrer_pickpocket);
		}
		else
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKPOCKET_1,LPCOST_TALENT_PICKPOCKET_1,100),dia_wedge_lehrer_pickpocket);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_2,10,0),dia_wedge_lehrer_lockpick2);
		}
		else
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_2,LPCOST_TALENT_PICKLOCK_2,200),dia_wedge_lehrer_lockpick2);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_1,5,0),dia_wedge_lehrer_lockpick);
		}
		else
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNPICKLOCK_1,LPCOST_TALENT_PICKLOCK_1,100),dia_wedge_lehrer_lockpick);
		};
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		if(hero.guild == GIL_ORG)
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNSNEAK,5,0),dia_wedge_lehrer_schleichen);
		}
		else
		{
			Info_AddChoice(dia_wedge_lehrer,b_buildlearnstring(NAME_LEARNSNEAK,LPCOST_TALENT_SNEAK,100),dia_wedge_lehrer_schleichen);
		};
	};
};

instance DIA_WEDGE_EXIT(C_INFO)
{
	npc = org_850_wedge;
	nr = 999;
	condition = dia_wedge_exit_condition;
	information = dia_wedge_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_wedge_exit_condition()
{
	return TRUE;
};

func void dia_wedge_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WEDGE_PSST(C_INFO)
{
	npc = org_850_wedge;
	nr = 1;
	condition = dia_wedge_psst_condition;
	information = dia_wedge_psst_info;
	important = 1;
	permanent = 0;
};


func int dia_wedge_psst_condition()
{
	if((Npc_GetDistToNpc(hero,self) < 900) && Wld_IsTime(8,0,23,30))
	{
		return TRUE;
	};
};

func void dia_wedge_psst_info()
{
	AI_Output(self,other,"DIA_Wedge_Psst_05_00");	//Эй, ты!
	AI_Output(other,self,"DIA_Wedge_Psst_15_01");	//Кто?.. Я?
	AI_Output(self,other,"DIA_Wedge_Psst_05_02");	//Да, да, ты... Подойди-ка сюда!
	AI_StopProcessInfos(self);
};


instance DIA_WEDGE_HELLO(C_INFO)
{
	npc = org_850_wedge;
	condition = dia_wedge_hello_condition;
	information = dia_wedge_hello_info;
	important = 0;
	permanent = 0;
	description = "Что тебе от меня нужно?";
};


func int dia_wedge_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_wedge_psst))
	{
		return TRUE;
	};
};

func void dia_wedge_hello_info()
{
	AI_Output(other,self,"DIA_Wedge_Hello_15_00");	//Что тебе от меня нужно?
	AI_Output(self,other,"DIA_Wedge_Hello_05_01");	//Ты ведь не так давно здесь, да? Я сразу это заметил.
	AI_Output(self,other,"DIA_Wedge_Hello_05_02");	//Тебе нужно многое знать и уметь, чтобы выжить здесь. Я могу поучить тебя, если хочешь.
	AI_Output(self,other,"DIA_Wedge_Hello_05_03");	//Прежде всего следи за тем, с кем ты разговариваешь. Например, Бутч - вон тот вор у костра, очень опасный тип. Держись от него подальше!
};


instance DIA_WEDGE_WARNSOFBUTCH(C_INFO)
{
	npc = org_850_wedge;
	condition = dia_wedge_warnsofbutch_condition;
	information = dia_wedge_warnsofbutch_info;
	important = 0;
	permanent = 0;
	description = "Почему?";
};


func int dia_wedge_warnsofbutch_condition()
{
	if(Npc_KnowsInfo(hero,dia_wedge_hello))
	{
		return TRUE;
	};
};

func void dia_wedge_warnsofbutch_info()
{
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00");	//Почему?
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01");	//Есть у него одна нехорошая привычка - бить всех новичков. Так что постарайся не попадаться ему на глаза.
};


instance DIA_WEDGE_LEHRER(C_INFO)
{
	npc = org_850_wedge;
	nr = 700;
	condition = dia_wedge_lehrer_condition;
	information = dia_wedge_lehrer_info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_wedge_lehrer_condition()
{
	if(Npc_KnowsInfo(hero,dia_wedge_hello))
	{
		return TRUE;
	};
};

func void dia_wedge_lehrer_info()
{
	if(LOG_WEDGELEARN == FALSE)
	{
		Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
		b_logentry(GE_TEACHERNC,"Вор Ведж может научить меня подкрадываться, воровать и вскрывать замки.");
		LOG_WEDGELEARN = TRUE;
	};
	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00");	//Ты можешь научить меня чему-нибудь?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) < 2 || Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0 || Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_05_01");	//Зависит от того, что ты хочешь узнать!
		b_wedgelearn();
	}
	else
	{
		AI_Output(self,other,"SVM_5_NoLearnOverMax");	//Ты выучил все, что нужно. Тебе стоит поучиться чему-нибудь еще.
	};
};

func void dia_wedge_lehrer_schleichen()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00");	//Я хочу научиться подкрадываться.
	if(hero.guild == GIL_ORG)
	{
		if(b_giveskill(other,NPC_TALENT_SNEAK,1,5))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//Все решает твое умение сохранять равновесие. Так же немаловажно контролировать свое дыхание.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//Существует особый способ движения, при котором никто не сможет услышать твоих шагов.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_SNEAK)
			{
				b_giveinvitems(other,self,itminugget,100);
			};
			if(b_giveskill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
			{
				AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//Все решает твое умение сохранять равновесие. Так же немаловажно контролировать свое дыхание.
				AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//Существует особый способ движения, при котором никто не сможет услышать твоих шагов.
			};
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
			AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
		};
	};
	b_wedgelearn();
};

func void dia_wedge_lehrer_lockpick()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00");	//Я хочу научиться виртуозно вскрывать замки.
	if(hero.guild == GIL_ORG)
	{
		if(b_giveskill(other,NPC_TALENT_PICKLOCK,1,5))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//Ты ведь хотел бы это узнать, да? Научиться этому не очень сложно.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//Очень важно следить за тем, чтобы у тебя не сломалась отмычка.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//Если ты будешь действовать очень осторожно, ты заметишь, что во многих случаях тебе не понадобится больше одной отмычки.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_PICKLOCK_1)
			{
				b_giveinvitems(other,self,itminugget,100);
			};
			if(b_giveskill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
			{
				AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//Ты ведь хотел бы это узнать, да? Научиться этому не очень сложно.
				AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//Очень важно следить за тем, чтобы у тебя не сломалась отмычка.
				AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//Если ты будешь действовать очень осторожно, ты заметишь, что во многих случаях тебе не понадобится больше одной отмычки.
			};
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
			AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
		};
	};
	b_wedgelearn();
};

func void dia_wedge_lehrer_lockpick2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00");	//Я хочу стать мастером взлома замков.
	if(hero.guild == GIL_ORG)
	{
		if(b_giveskill(other,NPC_TALENT_PICKLOCK,2,10))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//Стоит немного потренироваться, и ты уже с легкостью будешь распознавать момент, когда отмычка готова вот-вот сломаться. При этом ты услышишь особый звук.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//С опытом к тебе придет умение различать щелчки в замке при повороте отмычки. При этом ты будешь ломать их гораздо реже.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//Настоящему профессионалу часто удается открыть замок, не сломав ни одной отмычки.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 200)
		{
			if(b_giveskill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
			{
				if(hero.lp >= LPCOST_TALENT_PICKLOCK_2)
				{
					b_giveinvitems(other,self,itminugget,200);
				};
				AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//Стоит немного потренироваться, и ты уже с легкостью будешь распознавать момент, когда отмычка готова вот-вот сломаться. При этом ты услышишь особый звук.
				AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//С опытом к тебе придет умение различать щелчки в замке при повороте отмычки. При этом ты будешь ломать их гораздо реже.
				AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//Настоящему профессионалу часто удается открыть замок, не сломав ни одной отмычки.
			};
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
			AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
		};
	};
	b_wedgelearn();
};

func void dia_wedge_lehrer_pickpocket()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00");	//Я хочу стать опытным карманником.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(hero.guild == GIL_ORG)
		{
			if(b_giveskill(other,NPC_TALENT_PICKPOCKET,1,5))
			{
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//Так ты хочешь облегчать кошельки местных богачей, да? Что ж.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//Я научу тебя этому, но у вора всегда есть небольшой шанс быть застигнутым на месте преступления.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//Риск будет оправдан только в том случае, если ты остаешься один на один со своей жертвой.
				AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//Но только профессиональный вор может совершенно незаметно вытащить что-нибудь ценное из кармана зазевавшегося прохожего!
			};
		}
		else
		{
			if(Npc_HasItems(hero,itminugget) >= 100)
			{
				if(hero.lp >= LPCOST_TALENT_PICKPOCKET_1)
				{
					b_giveinvitems(other,self,itminugget,100);
				};
				if(b_giveskill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
				{
					AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//Так ты хочешь облегчать кошельки местных богачей, да? Что ж.
					AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//Я научу тебя этому, но у вора всегда есть небольшой шанс быть застигнутым на месте преступления.
					AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//Риск будет оправдан только в том случае, если ты остаешься один на один со своей жертвой.
					AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//Но только профессиональный вор может совершенно незаметно вытащить что-нибудь ценное из кармана зазевавшегося прохожего!
				};
			}
			else
			{
				AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
				AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05");	//Даже не думай об этом! Тот, кто не умеет подкрадываться, никогда не станет вором.
	};
	b_wedgelearn();
};

func void dia_wedge_lehrer_pickpocket2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00");	//Я хочу стать мастером-карманником.
	if(hero.guild == GIL_ORG)
	{
		if(b_giveskill(other,NPC_TALENT_PICKPOCKET,2,10))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//Думаю, ты уже готов к тому, чтобы я посвятил тебя в секреты настоящего мастерства.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//Но знай, что даже самого лучше вора могут застать на месте преступления.
			AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//Будь осторожен.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 200)
		{
			if(hero.lp >= LPCOST_TALENT_PICKPOCKET_2)
			{
				b_giveinvitems(other,self,itminugget,200);
			};
			if(b_giveskill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
			{
				AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//Думаю, ты уже готов к тому, чтобы я посвятил тебя в секреты настоящего мастерства.
				AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//Но знай, что даже самого лучше вора могут застать на месте преступления.
				AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//Будь осторожен.
			};
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
			AI_Output(self,other,"SVM_5_NotNow");	//У меня нет времени.
		};
	};
	b_wedgelearn();
};

func void dia_wedge_lehrer_back()
{
	Info_ClearChoices(dia_wedge_lehrer);
};

