
instance DIA_FORTUNO_EXIT(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 999;
	condition = dia_fortuno_exit_condition;
	information = dia_fortuno_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_fortuno_exit_condition()
{
	return 1;
};

func void dia_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FORTUNO_GREET(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_greet_condition;
	information = dia_fortuno_greet_info;
	permanent = 0;
	important = 1;
};


func int dia_fortuno_greet_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void dia_fortuno_greet_info()
{
	AI_Output(self,other,"DIA_Fortuno_Greet_05_00");	//���-�� ����. � �� ������ ������� �� �������� ��� �������.
};


var int fortuno_rationday;

instance DIA_FORTUNO_GETGESCHENK(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_getgeschenk_condition;
	information = dia_fortuno_getgeschenk_info;
	permanent = 0;
	description = "��� ��� �� �������?";
};


func int dia_fortuno_getgeschenk_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_greet) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_fortuno_getgeschenk_info()
{
	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00");	//��� ��� �� �������?
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01");	//���, ������ ���� ��������. ��� '�������� ������'. �������� ����!
	b_printtrademsg1("�������� 3 '�������� ������'.");
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02");	//������ ���� � ���� ������ ���� ������� ���������, �� ���� ���� ����� ������, ��� ��� ��������, �� ������ ������ ���������.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03");	//���� ������� �����-������ ����� ��� �����, ������ �� ���. � � ������������� ����� �� � ����.
	CreateInvItems(self,itmijoint_2,3);
	b_giveinvitems(self,other,itmijoint_2,3);
	FORTUNO_RATIONDAY = Wld_GetDay();
	Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
	b_logentry(GE_TRADERPSI,"������� ������� ������� � ������������� ����������������. ��� ��� ��������� ��� ������������ ��� ������.");
};


instance DIA_FORTUNO_DAILYRATION(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 3;
	condition = dia_fortuno_dailyration_condition;
	information = dia_fortuno_dailyration_info;
	permanent = 1;
	description = "� ���� ����� ������� ������ ���������.";
};


func int dia_fortuno_dailyration_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_getgeschenk) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_fortuno_dailyration_info()
{
	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00");	//� ���� ����� ������� ������ ���������.
	if(FORTUNO_RATIONDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01");	//���, ������. ��� '�������� ������'. ������ �� ����� ������ �� ��� �����!
		b_printtrademsg1("�������� 3 '�������� ������'.");
		CreateInvItems(self,itmijoint_2,3);
		b_giveinvitems(self,other,itmijoint_2,3);
		FORTUNO_RATIONDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02");	//���� ������� ������ �� ��� �������. ���� ���� ����� ������, ������� �����, ��� ���� ������.
	};
};


instance DIA_FORTUNO_BUYJOINTS(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 4;
	condition = dia_fortuno_buyjoints_condition;
	information = dia_fortuno_buyjoints_info;
	permanent = 0;
	description = "����� ��������.";
	trade = 1;
};


func int dia_fortuno_buyjoints_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_getgeschenk) || KAPITEL > 2)
	{
		return 1;
	};
};

func void dia_fortuno_buyjoints_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//����� ��������.
	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01");	//��� �� �� ���� ������? ���� �����, ���-������ ������?
};

instance DIA_FORTUNO_BUYJOINTS2(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 4;
	condition = dia_fortuno_buyjoints2_condition;
	information = dia_fortuno_buyjoints2_info;
	permanent = 1;
	description = "����� ��������.";
	trade = 1;
};


func int dia_fortuno_buyjoints2_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_buyjoints))
	{
		return 1;
	};
};

func void dia_fortuno_buyjoints2_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//����� ��������.
};

instance DIA_FORTUNO_HELP(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_help_condition;
	information = dia_fortuno_help_info;
	permanent = 0;
	description = "��� ��� ������ �� �����, ������� ������� ��������?";
};


func int dia_fortuno_help_condition()
{
	if(CORANGAR_FINDHERB == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_fortuno_help_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//��� ��� ������ �� �����, ������� ������� ��������?
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_01");	//�� ����� ����� ��� ��������? ���� ������� ��� �����?
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//��.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_02");	//� �� ������� ���� �������� ��� �����-�� �������� ������? �, ������, ��� �� �������! � �������� ������� ���������� ������!
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_03");	//��������, � ������ ������ � ������� ��� ������ ����� ��� �����... �������, �������� ����� ������.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_04");	//� ���������� ������ ������� ��������� �����, ������� ������� ��� ���. �� ����� ����������� ��� �����, ��� �� ������� ������ ����� ������� ����������...
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_05");	//��� �������� ���������� ������� ����. � �������, � ���� ��� ��� ����� �����.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_06");	//���� �� ������� ����, ������� ������������� ��������� � ������ ������, ��������� ����� � ���������� ������. ����� ������ ���, �� �������.
	AI_Output(other,self,"Info_FreemineOrc_OFFER_15_01");	//� ���������� ����� ��� ����!
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_07");	//���� ������� ����� � ��� ���, �� ���� ���� �� ������ ����. ����������, � ��� ����� ���� �������!
	b_logentry(CH3_FINDHERBS,"������� ��������� ������ ����: ����� ������ �������� � ���������� ����� �� ����� � ������� �� ���� �������� �����.");
	AI_StopProcessInfos(self);
};

instance DIA_FORTUNO_DEADLEAFFOUND(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_deadleaffound_condition;
	information = dia_fortuno_deadleaffound_info;
	permanent = 0;
	description = "���, ������ ���. ��� �� � ������.";
};


func int dia_fortuno_deadleaffound_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_help) && Npc_HasItems(other,itfo_plants_deadleaf) && CORANGAR_FINDHERB == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_fortuno_deadleaffound_info()
{
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//���, ������ ���. ��� �� � ������.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_08");	//�������! ��� ������! �����, �� ������ � ��������?
	if(ALCHEMYACTIVE == TRUE)
	{
		AI_Output(other,self,"Info_Milten_SHWAIT_15_03");	//���, ��������...
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_09");	//���� ���� �� ����, � ���������� ������ �� ����, ��� ����. ����� ������ � ������� �����, � ����� ������ ������ ��� ��� ������!
		b_printtrademsg1("������� ������ � ������ �����.");
		if(!Npc_HasItems(hero,itmiflask))
		{
			CreateInvItem(hero,itmiflask);
		};
		CreateInvItem(hero,specialwater);
		CreateInvItem(hero,alchemy_fortuno);
		b_logentry(CH3_FINDHERBS,"������� ��� ��� ������ � ������ �����, ����� ������ ����������� ��� � ������� � ���� ��� ������.");
	}
	else
	{
		AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//��� ���.
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_10");	//��, ����� � ��� ���������� �����... �������...
		b_printtrademsg1("����� ������� ����.");
		Npc_RemoveInvItems(hero,itfo_plants_deadleaf,1);
		AI_UseMob(self,"LAB",1);
		AI_Wait(self,13);
		AI_UseMob(self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_11");	//���, ������� ������ ��� ��� ������! ��������!
		b_printtrademsg2("�������� �������� ����� �������.");
		CreateInvItem(hero,healthwater);
		b_logentry(CH3_FINDHERBS,"�������� ����� ������! ������ ����� ������� ������� ��� � ���� � ������ ��� ������.");
	};
	AI_StopProcessInfos(self);
};

