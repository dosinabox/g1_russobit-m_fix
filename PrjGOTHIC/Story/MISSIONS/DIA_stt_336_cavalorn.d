
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
	description = "��� �� �����������?";
};

func int dia_cavalorn_hunter_condition()
{
	return 1;
};

func void dia_cavalorn_hunter_info()
{
	AI_Output(other,self,"DIA_cavalorn_Hunter_15_00");	//��� �� �����������?
	AI_Output(self,other,"DIA_cavalorn_Hunter_12_01");	//� �������. ����� � ������� �� �����������.
};

instance DIA_CAVALORN_LEHRER(C_INFO)
{
	npc = stt_336_cavalorn;
	nr = 2;
	condition = dia_cavalorn_lehrer_condition;
	information = dia_cavalorn_lehrer_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
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
	AI_Output(other,self,"DIA_cavalorn_Lehrer_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_cavalorn_Lehrer_12_01");	//� ���� �� �� ����� ���������?
	if(LOG_CAVALORNTRAIN_BOW == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"�������� - �������. � ���� ��������� � ���� �������� �� ����. �� ����� � ���� ����� ������ � ����� ��������.");
		LOG_CAVALORNTRAIN_BOW = TRUE;
	};
	if(LOG_CAVALORNTRAIN_SNEAK == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"����� �������� ����� ������� ���� ��������������.");
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
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00");	//����� ���� �������� �� ����.
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
	{
		if(b_giveskill(other,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01");	//����������� ����� �������� ���������������� ���� ����������. ������� ����� - ��������� ����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02");	//���� ������ ���� ������ �����������, ���� �� ����� �����, ���� � - �������!
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03");	//������, ����� ����� ������, ���������� ��������� ������ � �������� ����� �� ����. � ������� �� ��� �� ����� ������ ����� ��� �����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04");	//�� ���� �� ������ ��������� ���� �������, ���� �������� ����� ����� �������.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 50)
		{
			if(hero.lp >= LPCOST_TALENT_BOW_1)
			{
				b_printtrademsg1("������ ����: 50");
				b_giveinvitems(hero,self,itminugget,50);
			};
			if(b_giveskill(other,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
			{
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_01");	//����������� ����� �������� ���������������� ���� ����������. ������� ����� - ��������� ����.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_02");	//���� ������ ���� ������ �����������, ���� �� ����� �����, ���� � - �������!
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_03");	//������, ����� ����� ������, ���������� ��������� ������ � �������� ����� �� ����. � ������� �� ��� �� ����� ������ ����� ��� �����.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Bow_12_04");	//�� ���� �� ������ ��������� ���� �������, ���� �������� ����� ����� �������.
			};
		}
		else
		{
			AI_Output(self,other,"SVM_12_ShitNoOre");	//�� � ���� �� ������ ��� ����!
		};
	};
	b_cavalornearn();
};

func void dia_cavalorn_lehrer_bow_2()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Bow_15_00");	//����� ���� �������� �� ����.
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
	{
		if(b_giveskill(other,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02");	//�� ��� ���� ������� ���������. ������ �� ������ ������ ����� �������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03");	//�� ������ ��������� ��������� ��������������, �� ���������� ��� ���, ��� ������ � ��������� ������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04");	//������� ����� ��������: ������������� ���������� �� ����, �������� ������, ���� ��������� ������ - � ������ ����� � ����. ���� ������ ����������.
			AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05");	//������� �� ����� ������ ������. ������ ������� ����� ��������� ���� ������ �� ��������.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 100)
		{
			if(hero.lp >= LPCOST_TALENT_BOW_2)
			{
				b_printtrademsg1("������ ����: 100");
				b_giveinvitems(hero,self,itminugget,100);
			};
			if(b_giveskill(other,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
			{
				AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02");	//�� ��� ���� ������� ���������. ������ �� ������ ������ ����� �������.
				AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03");	//�� ������ ��������� ��������� ��������������, �� ���������� ��� ���, ��� ������ � ��������� ������.
				AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04");	//������� ����� ��������: ������������� ���������� �� ����, �������� ������, ���� ��������� ������ - � ������ ����� � ����. ���� ������ ����������.
				AI_Output(self,other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05");	//������� �� ����� ������ ������. ������ ������� ����� ��������� ���� ������ �� ��������.
			};
		}
		else
		{
			AI_Output(self,other,"SVM_12_ShitNoOre");	//�� � ���� �� ������ ��� ����!
		};
	};
	b_cavalornearn();
};

func void dia_cavalorn_lehrer_schleichen()
{
	AI_Output(other,self,"DIA_cavalorn_Lehrer_Schleichen_15_00");	//� ���� ��������� ��������������.
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL >= 4)
	{
		if(b_giveskill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
		{
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01");	//������� �����. ��� ������ ���������� ����, ��� ����� ��������� ���������� � ����� ��� � ������� ������� ��������.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02");	//���� �� ������� ���������, ���� ����� ����� �������������� ���� � ������, ���� ������� ���� ����.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03");	//����� ���� ������������: ����� �� ���������, ��� ���������� ����� ��������. ����������, ����� ���� �� ��������.
			AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04");	//������� ��� � ������� �� ���������.
		};
	}
	else
	{
		if(Npc_HasItems(hero,itminugget) >= 50)
		{
			if(hero.lp >= LPCOST_TALENT_SNEAK)
			{
				b_printtrademsg1("������ ����: 50");
				b_giveinvitems(hero,self,itminugget,50);
			};
			if(b_giveskill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
			{
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_01");	//������� �����. ��� ������ ���������� ����, ��� ����� ��������� ���������� � ����� ��� � ������� ������� ��������.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_02");	//���� �� ������� ���������, ���� ����� ����� �������������� ���� � ������, ���� ������� ���� ����.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_03");	//����� ���� ������������: ����� �� ���������, ��� ���������� ����� ��������. ����������, ����� ���� �� ��������.
				AI_Output(self,other,"DIA_cavalorn_Lehrer_Schleichen_12_04");	//������� ��� � ������� �� ���������.
			};
		}
		else
		{
			AI_Output(self,other,"SVM_12_ShitNoOre");	//�� � ���� �� ������ ��� ����!
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
	description = "� ���� � ���� ������ ������� ���?";
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
	AI_Output(other,self,"STT_336_cavalorn_SELLBOW_Info_15_01");	//� ���� � ���� ������ ������� ���?
	AI_Output(self,other,"STT_336_cavalorn_SELLBOW_Info_12_02");	//� ����. ������ ����� �� � ������ ������ �� � ���� �� �������.
	Log_CreateTopic(GE_TRADEROW,LOG_NOTE);
	b_logentry(GE_TRADEROW,"�������� ������� ���� � ������. �� ����� � ���������� ������ ����� ������ � ����� ��������.");
};


instance STT_336_CAVALORN_TRADE(C_INFO)
{
	npc = stt_336_cavalorn;
	condition = stt_336_cavalorn_trade_condition;
	information = stt_336_cavalorn_trade_info;
	important = 0;
	permanent = 1;
	description = "������ ��� ���� ������.";
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
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//������ ��� ���� ������.
};

