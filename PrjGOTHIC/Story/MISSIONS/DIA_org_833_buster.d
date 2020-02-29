
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
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01");	//ѕохоже, ты не слишком проворен. я могу помочь тебе.
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
	permanent = 1;
	description = "ј чем ты сможешь мне помочь?";
};


func int dia_org_833_buster3_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return 1;
	};
};

func void dia_org_833_buster3_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01");	//ј чем ты сможешь мне помочь?
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//я могу обучить теб€ контролю над телом. Ёто искусство называетс€ акробатика.
	Info_ClearChoices(dia_org_833_buster3);
	Info_AddChoice(dia_org_833_buster3,DIALOG_BACK,dia_org_833_buster_back);
	if(hero.guild == GIL_ORG)
	{
		Info_AddChoice(dia_org_833_buster3,b_buildlearnstring(NAME_LEARNACROBAT,5,0),dia_org_833_buster_train1);
	}
	else
	{
		Info_AddChoice(dia_org_833_buster3,b_buildlearnstring(NAME_LEARNACROBAT,LPCOST_TALENT_ACROBAT,100),dia_org_833_buster_train1);
	};
	if(LOG_BUSTERTRAIN == 0)
	{
		Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
		b_logentry(GE_TEACHERNC,"¬ор Ѕастер может научить мен€ акробатике.");
		LOG_BUSTERTRAIN = 1;
	};
};

func void dia_org_833_buster_train1()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//Ќачнем пр€мо сейчас.
	Info_ClearChoices(dia_org_833_buster3);
	if(hero.guild == GIL_ORG)
	{
		if(b_giveskill(other,NPC_TALENT_ACROBAT,1,5))
		{
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	// огда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//я научу теб€ откатыватьс€ в сторону, покажу, как приземл€тьс€ после падени€. Ќо не стоит забывать, что ты все-таки не бессмертный!
			AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//јкробатика также очень полезна в бою. “ы сможешь быстро мен€ть дистанцию между собой и противником. Ќу, с богом!
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_ACROBAT)
			{
				b_giveinvitems(other,self,itminugget,100);
			};
			if(b_giveskill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
			{
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	// огда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//я научу теб€ откатыватьс€ в сторону, покажу, как приземл€тьс€ после падени€. Ќо не стоит забывать, что ты все-таки не бессмертный!
				AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//јкробатика также очень полезна в бою. “ы сможешь быстро мен€ть дистанцию между собой и противником. Ќу, с богом!
				
			};
		}
		else
		{
			AI_Output(self,other,"SVM_2_ShitNoOre");	//„то, преследуют неудачи, при€тель? —овсем нет руды?
		};
	};
};

func void dia_org_833_buster_back()
{
	Info_ClearChoices(dia_org_833_buster3);
};

