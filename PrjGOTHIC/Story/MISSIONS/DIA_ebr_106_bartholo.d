
instance DIA_BARTHOLO_EXIT(C_INFO)
{
	npc = ebr_106_bartholo;
	nr = 999;
	condition = dia_bartholo_exit_condition;
	information = dia_bartholo_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_bartholo_exit_condition()
{
	return 1;
};

func void dia_bartholo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_BARTHOLO_HALLO(C_INFO)
{
	npc = ebr_106_bartholo;
	nr = 4;
	condition = info_bartholo_hallo_condition;
	information = info_bartholo_hallo_info;
	permanent = 0;
	description = "��� ��?";
};


func int info_bartholo_hallo_condition()
{
	return 1;
};

func void info_bartholo_hallo_info()
{
	AI_Output(other,self,"Info_Bartholo_HAllo_15_00");	//��� ��?
	AI_Output(self,other,"Info_Bartholo_HAllo_12_01");	//� �������. �����, ����� ������ �������� ������� �������.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_02");	//���, ��������, �������������� ��� ������...
	AI_Output(self,other,"Info_Bartholo_HAllo_12_03");	//����� ���������� ������� �� ����� �������� ��������.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_04");	//����� �� ����� �����������. ��������� ���� ������� �� ������� ������ ������.
};


instance INFO_BARTHOLO_PERM(C_INFO)
{
	npc = ebr_106_bartholo;
	nr = 4;
	condition = info_bartholo_perm_condition;
	information = info_bartholo_perm_info;
	permanent = 0;
	description = "� ���� ����������� � �����.";
	trade = 1;
};


func int info_bartholo_perm_condition()
{
};

func void info_bartholo_perm_info()
{
	AI_Output(other,self,"Info_Bartholo_PERM_15_00");	//� ���� ����������� � �����.
	AI_Output(self,other,"Info_Bartholo_PERM_12_01");	//� ���� ����� ���� ���� ��� ���, � ���� ���� ����, �������.
};


instance INFO_BARTHOLO_KRAUTBOTE(C_INFO)
{
	npc = ebr_106_bartholo;
	nr = 4;
	condition = info_bartholo_krautbote_condition;
	information = info_bartholo_krautbote_info;
	permanent = 1;
	description = "� ���� �������� ��� ������. ��� ������ ��� �����.";
};


func int info_bartholo_krautbote_condition()
{
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_bartholo_krautbote_info()
{
	AI_Output(other,self,"Info_Bartholo_Krautbote_15_00");	//� ���� �������� ��� ������. ��� ������ ��� �����.
	AI_Output(self,other,"Info_Bartholo_Krautbote_12_01");	//������!
	if(Npc_HasItems(other,itmijoint_3) >= 30)
	{
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_02");	//
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_03");	//��� ������. � �� ����� ��� ����� ������ ��������. ��� ������ �����, ��� �� ��������� �������.
		AI_Output(other,self,"Info_Bartholo_Krautbote_15_04");	//��� ������ �����?
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_05");	//�� ��� ������... ���, �����. ��� �������������� - ���� �����.
		b_giveinvitems(other,self,itmijoint_3,30);
		CreateInvItems(self,itminugget,500);
		b_giveinvitems(self,other,itminugget,500);
		KALOM_DELIVEREDWEED = TRUE;
		b_logentry(CH1_KRAUTBOTE,"������� ��� ��� 500 ������ ���� �� ��������, ������� � ������ ��� ������.");
		b_givexp(XP_WEEDSHIPMENTDELIVERED);
		info_bartholo_krautbote.permanent = 0;
	}
	else
	{
		AI_Output(self,other,"Info_Bartholo_Krautbote_NoKraut_12_00");	//� ���� ������� ���� ���������! �������, �� �� ������ ��� �� �������. ����� ���������� �����, ����� � �������.
	};
};


instance DIA_EBR_106_BARTHOLO_WAIT4SC(C_INFO)
{
	npc = ebr_106_bartholo;
	condition = dia_ebr_106_bartholo_wait4sc_condition;
	information = dia_ebr_106_bartholo_wait4sc_info;
	important = 1;
	permanent = 0;
};


func int dia_ebr_106_bartholo_wait4sc_condition()
{
	if(EXPLORESUNKENTOWER)
	{
		return TRUE;
	};
};

func void dia_ebr_106_bartholo_wait4sc_info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bartholo_12_01");	//� ����, ��� ���-������ ���������� ��������� �� ��� ����� �����������!
	AI_Output(self,other,"Info_Bartholo_12_02");	//�� � ������� �� ����� ��������� ������� ������, �� ��� ������ �� �����!
	AI_Output(other,self,"Info_Bartholo_15_03");	//��� �����?
	AI_Output(self,other,"Info_Bartholo_12_04");	//�� ��������! � �� ����� ������ ��������� �� �������� ����.
	AI_Output(self,other,"Info_Bartholo_12_05");	//����� ���, �����! �������� �� �����!
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
};

