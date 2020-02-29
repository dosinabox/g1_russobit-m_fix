
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
	description = "„ем ты можешь мне помочь?";
};


func int dia_org_833_buster3_condition()
{
	return Npc_KnowsInfo(hero,dia_org_833_buster);
};

func void dia_org_833_buster3_info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//я могу обучить теб€ контролю над телом. Ёто искусство называетс€ акробатика.
	Info_ClearChoices(dia_org_833_buster3);
	Info_AddChoice(dia_org_833_buster3,DIALOG_BACK,dia_org_833_buster_back);
	Info_AddChoice(dia_org_833_buster3,b_buildlearnstring(NAME_LEARNACROBAT,LPCOST_TALENT_ACROBAT,0),dia_org_833_buster_train1);
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"¬ор Ѕустер может научить мен€ акробатике.");
};

func void dia_org_833_buster_train1()
{
	Info_ClearChoices(dia_org_833_buster3);
	if(b_giveskill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
	{
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	// огда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//я научу теб€ откатыватьс€ в сторону, покажу, как приземл€тьс€ после падени€. Ќо не стоит забывать, что ты все-таки не бессмертный!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//јкробатика также очень полезна в бою. “ы сможешь быстро мен€ть дистанцию между собой и противником. Ќу, с богом!
	};
};

func void dia_org_833_buster_back()
{
	Info_ClearChoices(dia_org_833_buster3);
};

