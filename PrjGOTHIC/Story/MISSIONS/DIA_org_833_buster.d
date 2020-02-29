
func void b_busterlearn()
{
	Info_ClearChoices(dia_org_833_buster4);
	Info_AddChoice(dia_org_833_buster4,DIALOG_BACK,dia_org_833_buster_back);
	if(DIFF_HARD == TRUE)
	{
		if(hero.attribute[ATR_DEXTERITY] >= 20)
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (10 очков обучения, 100 руды)",dia_org_833_buster_train1);
		}
		else
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (20 ловкости, 10 очков обучения, 100 руды)",dia_org_833_buster_train1);
		};
	}
	else if(FREELEARN_NC == FALSE)
	{
		if(hero.attribute[ATR_DEXTERITY] >= 20)
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (10 очков обучения, 100 руды)",dia_org_833_buster_train1);
		}
		else
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (20 ловкости, 10 очков обучения, 100 руды)",dia_org_833_buster_train1);
		};
	}
	else if(hero.guild == GIL_ORG)
	{
		if(hero.attribute[ATR_DEXTERITY] >= 20)
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (5 очков обучения)",dia_org_833_buster_train1);
		}
		else
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (20 ловкости, 5 очков обучения)",dia_org_833_buster_train1);
		};
	}
	else
	{
		if(hero.attribute[ATR_DEXTERITY] >= 20)
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (10 очков обучения)",dia_org_833_buster_train1);
		}
		else
		{
			Info_AddChoice(dia_org_833_buster4,"Акробатика (20 ловкости, 10 очков обучения)",dia_org_833_buster_train1);
		};
	};
};

instance DIA_ORG_833_BUSTER(C_INFO)
{
	npc = org_833_buster;
	condition = dia_org_833_buster_condition;
	information = dia_org_833_buster_info;
	important = 1;
	permanent = 0;
};


func int dia_org_833_buster_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void dia_org_833_buster_info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01");	//Похоже, ты не слишком проворен. Я могу помочь тебе.
};


instance DIA_ORG_833_BUSTER_EXIT(C_INFO)
{
	npc = org_833_buster;
	nr = 999;
	condition = dia_org_833_buster_exit_condition;
	information = dia_org_833_buster_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_org_833_buster_exit_condition()
{
	return 1;
};

func void dia_org_833_buster_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORG_833_BUSTER3(C_INFO)
{
	npc = org_833_buster;
	condition = dia_org_833_buster3_condition;
	information = dia_org_833_buster3_info;
	important = 0;
	permanent = 0;
	description = "А чем ты сможешь мне помочь?";
};


func int dia_org_833_buster3_condition()
{
	if(Npc_KnowsInfo(hero,dia_org_833_buster))
	{
		return 1;
	};
};

func void dia_org_833_buster3_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01");	//А чем ты сможешь мне помочь?
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Я могу обучить тебя контролю над телом. Это искусство называется акробатика.
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"Вор Бастер может научить меня акробатике.");
};

instance DIA_ORG_833_BUSTER4(C_INFO)
{
	npc = org_833_buster;
	condition = dia_org_833_buster4_condition;
	information = dia_org_833_buster4_info;
	important = 0;
	permanent = 1;
	description = DIALOG_LEARN;
};

func int dia_org_833_buster4_condition()
{
	if(Npc_KnowsInfo(hero,dia_org_833_buster3) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0))
	{
		return 1;
	};
};

func void dia_org_833_buster4_info()
{
	b_busterlearn();
};

func void dia_org_833_buster_train1()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//Начнем прямо сейчас.
	if(hero.attribute[ATR_DEXTERITY] < 20)
	{
		PrintScreen("Условие: 20 ловкости.",-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",_TIME_MESSAGE_JOINCAMP);
		AI_Output(self,other,"SVM_2_NoLearnNoPoints");	//Я не смогу стать твоим учителем. У тебя недостаточно практических навыков.
		b_busterlearn();
	}
	else if(DIFF_HARD == TRUE)
	{
		if(Npc_HasItems(hero,itminugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_ACROBAT)
			{
				b_printtrademsg1("Отдано руды: 100");
				b_giveinvitems(other,self,itminugget,100);
			};
			if(b_giveskill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
			{
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
				Info_ClearChoices(dia_org_833_buster4);
			}
			else
			{
				b_busterlearn();
			};
		}
		else
		{
			AI_Output(self,other,"SVM_2_ShitNoOre");	//Что, преследуют неудачи, приятель? Совсем нет руды?
			b_busterlearn();
		};
	}
	else if(FREELEARN_NC == FALSE)
	{
		if(Npc_HasItems(hero,itminugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_ACROBAT)
			{
				b_printtrademsg1("Отдано руды: 100");
				b_giveinvitems(other,self,itminugget,100);
			};
			if(b_giveskill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
			{
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
				Info_ClearChoices(dia_org_833_buster4);
			}
			else
			{
				b_busterlearn();
			};
		}
		else
		{
			AI_Output(self,other,"SVM_2_ShitNoOre");	//Что, преследуют неудачи, приятель? Совсем нет руды?
			b_busterlearn();
		};
	}
	else if(hero.guild == GIL_ORG)
	{
		if(b_giveskill(other,NPC_TALENT_ACROBAT,1,5))
		{
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
			Info_ClearChoices(dia_org_833_buster4);
		}
		else
		{
			b_busterlearn();
		};
	}
	else
	{
		if(b_giveskill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
		{
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
			Info_ClearChoices(dia_org_833_buster4);
		}
		else
		{
			b_busterlearn();
		};
	};
};

func void dia_org_833_buster_back()
{
	Info_ClearChoices(dia_org_833_buster4);
};

