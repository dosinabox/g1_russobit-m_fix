
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
	description = "� ���� ��������� ������� ���������� �����.";
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
	AI_Output(other,self,"SLD_709_Cord_TRAINOFFER_Info_15_01");	//� ���� ��������� ������� ���������� �����.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		AI_Output(self,other,"SLD_709_Cord_TRAINOFFER_Info_14_02");	//������. �� �� ���������. �� ��� � ���� �������� ������ ����.
	}
	else
	{
		AI_Output(self,other,"SVM_14_WiseMove");	//��� ��� ���������!
	};
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"������� ���� ����� ������� ���� ���������� � ���������� �����. �� ��������� ����������� �� �������� ����� �����.");
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
	AI_Output(other,self,"SLD_709_Cord_TRAIN_Info_15_00");	//� ���� �������� ������� ������� ��� � ���������� �����.
	if(Npc_HasItems(hero,itminugget) >= 30)
	{
		if(b_giveskill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			b_printtrademsg1("������ ����: 30");
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_01");	//���������� �������! �� ������, ��� ������� ������� ���, ���� ����� ��������� ��������� ������� ���.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_02");	//����� ��� ������� �������� ������� ������ ����� ������. ��� �����������.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_03");	//������ ����� ��� ����� �����, ������� �����.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_04");	//�� ������ ����� ������������ ����� ����, ������� � �� ���������. ��� �������� ���� ��������� ������� �������.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_05");	//���� ������� ���, ��� � ���� ������, ���� ����� ������ ����� �������� � ��������.
			b_practicecombat("NC_WATERFALL_TOP01");
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_06");	//� ���: ���� ��� ����� ������ ������, �� � ������� �� ��� �� ����� ������ ��������� ��.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_07");	//�� ��� ���������: ������ � ������, ���� ����� � ���. ����������, ������!
			b_giveinvitems(hero,self,itminugget,30);
			sld_709_cord_train.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//���� �� ������� ����.
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
	AI_Output(other,self,"SLD_709_Cord_TRAINAGAIN_Info_15_01");	//����� ���� ����� ������� ���������� �����.
	if(Npc_HasItems(hero,itminugget) >= 50)
	{
		if(b_giveskill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			b_printtrademsg1("������ ����: 50");
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_02");	//������. �������� �� ��� ������. ��� ���: ���� ������� ��� ������� ����, �� ������ ���� ����� ����� �������.
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_03");	//��, ������� ����, �� �������?! ����� ����� ��������, ��� ��������� ���������. �������� ��� ����� � ����� ����������������. ����, ������ �����, �����������, � ��� ���� ��� �������� ������:
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_04");	//������� ��� ���� ���� ������ ������...
			b_practicecombat("NC_WATERFALL_TOP01");
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_05");	//...� ������������� � �������� �������. ��� ��� ���������� � ������� ��������� ��������������.
			b_giveinvitems(hero,self,itminugget,50);
			sld_709_cord_trainagain.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//���� �� ������� ����.
	};
};

