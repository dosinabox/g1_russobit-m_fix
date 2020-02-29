
instance DIA_HEREK_EXIT(C_INFO)
{
	npc = vlk_511_herek;
	nr = 999;
	condition = dia_herek_exit_condition;
	information = dia_herek_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_herek_exit_condition()
{
	return 1;
};

func void dia_herek_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HEREK_BULLY(C_INFO)
{
	npc = vlk_511_herek;
	nr = 2;
	condition = dia_herek_bully_condition;
	information = dia_herek_bully_info;
	permanent = 0;
	important = 1;
};


func int dia_herek_bully_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST) && (HEREK_PROTECTIONBULLY == TRUE))
	{
		return 1;
	};
};

func void dia_herek_bully_info()
{
	AI_Output(self,other,"DIA_Herek_Bully_01_00");	//��, �������! � ������, ��� �� ������������ � ���������.
	AI_Output(other,self,"DIA_Herek_Bully_15_01");	//�� � ���? 
	AI_Output(self,other,"DIA_Herek_Bully_01_02");	//� ��� ������ � ���� �������� ������� ���������� ������� ��� ������ �� ������!
	AI_Output(self,other,"DIA_Herek_Bully_01_03");	//������ �� �����, ��� ��, ������ �������������� ������� ��������.
	AI_Output(self,other,"DIA_Herek_Bully_01_04");	//� ���������� ��������� ���� �� ����, ����� �� ��������� ��� � ��������� ���.
	npc_setpermattitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance DIA_HEREK_MOTZ(C_INFO)
{
	npc = vlk_511_herek;
	nr = 2;
	condition = dia_herek_motz_condition;
	information = dia_herek_motz_info;
	permanent = 0;
	description = "��� � ���� ����?";
};


func int dia_herek_motz_condition()
{
	if(HEREK_PROTECTIONBULLY == FALSE)
	{
		return 1;
	};
};

func void dia_herek_motz_info()
{
	AI_Output(other,self,"DIA_Herek_Motz_15_00");	//��� � ���� ����?
	AI_Output(self,other,"DIA_Herek_Motz_01_01");	//� ���� ������ ����� �������� ������ ���� �� ���!
	AI_Output(other,self,"DIA_Herek_Motz_15_02");	//������, � �� �����.
	AI_Output(self,other,"DIA_Herek_Motz_01_03");	//���� �� ��� �������� �� ����, �� �� ����� ����� �� ����������!
	AI_Output(self,other,"DIA_Herek_Motz_01_04");	//�� ������, ������ � �����? ���-�� �� ���� ���� � ���� ����� ������ �������. ��� ���.
	npc_setpermattitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};


instance DIA_HEREK_ANLEGEN(C_INFO)
{
	npc = vlk_511_herek;
	nr = 2;
	condition = dia_herek_anlegen_condition;
	information = dia_herek_anlegen_info;
	permanent = 1;
	description = "��� �� �������� ���� ������� ����? �����, ������� ���� ����?";
};


func int dia_herek_anlegen_condition()
{
	if(Npc_KnowsInfo(hero,dia_herek_motz) || Npc_KnowsInfo(hero,dia_herek_bully))
	{
		return 1;
	};
};

func void dia_herek_anlegen_info()
{
	AI_Output(other,self,"DIA_Herek_Anlegen_15_00");	//��� �� �������� ���� ������� ����? �����, ������� ���� ����?
	AI_Output(self,other,"DIA_Herek_Anlegen_01_01");	//������ ��������� ������? ������ ������!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

