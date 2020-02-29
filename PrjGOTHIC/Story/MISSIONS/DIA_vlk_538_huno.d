
instance DIA_HUNO_EXIT(C_INFO)
{
	npc = vlk_538_huno;
	nr = 999;
	condition = dia_huno_exit_condition;
	information = dia_huno_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_huno_exit_condition()
{
	return 1;
};

func void dia_huno_exit_info()
{
	if(Npc_HasItems(self,itmiswordraw) < 5)
	{
		CreateInvItems(self,itmiswordraw,5);
	};
	if(Npc_HasItems(self,itmiswordbladehot) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordbladehot,Npc_HasItems(self,itmiswordbladehot));
	};
	if(Npc_HasItems(self,itmiswordrawhot) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordrawhot,Npc_HasItems(self,itmiswordrawhot));
	};
	if(Npc_HasItems(self,itmiswordblade) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
	};
	if(Npc_HasItems(self,goldensword))
	{
		Npc_RemoveInvItem(self,goldensword);
	};
	AI_StopProcessInfos(self);
};


instance DIA_HUNO_YOUKNOWYOURJOB(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_youknowyourjob_condition;
	information = dia_huno_youknowyourjob_info;
	permanent = 0;
	important = 0;
	description = "� � ���� ������� ����������, ��� � ����.";
};


func int dia_huno_youknowyourjob_condition()
{
	return TRUE;
};

func void dia_huno_youknowyourjob_info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//� � ���� ������� ����������, ��� � ����.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//�� ��, ����������� � ��� �� ��������.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//�� ���� ������� � ��������, �� �� ����. ����� ����� �� ����� ���������� ��� ������, � ������ ������� ���� ���� ������ �.
};


instance DIA_HUNO_HOWLONG(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_howlong_condition;
	information = dia_huno_howlong_info;
	permanent = 0;
	important = 0;
	description = "����� ������� ������ �� ���� ���?";
};


func int dia_huno_howlong_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob))
	{
		return TRUE;
	};
};

func void dia_huno_howlong_info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//����� ������� ������ �� ���� ���?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//��� ������� �� ����. ������� ��� � ���� �������� ����� ������. �� � ������ �������� �� �������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//����, �������, ��� ������ ����� �������� ��������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//� ��� �����, ��� �������, ���������� ����� ������ ����.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//������? ������ ������� ����?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//�� ���, ��� ��� ��������. �� ��������� ��� �� �������� ��� 150 ������ ����.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//��� ������� �� ������� ���, � � ����������� � ������� ������� ��������, � ��� ����� ��������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//��, ��� �������, �� ���� �� ��������!
};


instance DIA_HUNO_HOWSYOURBUSINESS(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_howsyourbusiness_condition;
	information = dia_huno_howsyourbusiness_info;
	permanent = 1;
	important = 0;
	description = "��, ������, ��� ����?";
};


func int dia_huno_howsyourbusiness_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob) && HUNO_GOLDENSWORD == FALSE && KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_huno_howsyourbusiness_info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//��, ������, ��� ����?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//� ����� �� ������ ��� �����?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//����� ����, � ������ ���� ���-������.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03");	//������? � ��� �� ���?
	if(Npc_HasItems(hero,goldensword))
	{
		AI_UnequipWeapons(other);
		AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01");	//� ����� ���� ����� �������� ���.
		b_printtrademsg1("����� ������� ���.");
		CreateInvItem(self,goldensword);
		AI_EquipBestMeleeWeapon(self);
		AI_ReadyMeleeWeapon(self);
		AI_PlayAni(self,"T_URISELINSPECT");
		AI_RemoveWeapon(self);
		AI_UnequipWeapons(self);
		AI_Output(self,other,"Info_Wolf_MCPLATESENOUGH_09_04");	//�� ����. � �� ������� ��� �� ����������� ����� ��������.
		AI_Output(self,other,"SVM_9_NotNow");	//���, �� ������.
		b_printtrademsg2("������� ������� ���.");
		HUNO_GOLDENSWORD = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//� ��� �� �����.
		AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//������� �� ���, ����� ���� ������������� ���-������ �����������, � �� ������� ���� �� ��������.
	};
};


var int huno_learnsmith;

instance DIA_HUNO_LEARNSMITH(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_learnsmith_condition;
	information = dia_huno_learnsmith_info;
	permanent = 0;
	important = 0;
	description = "� ����� �� ����������� ���������� � ���� � �������.";
};


func int dia_huno_learnsmith_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob))
	{
		return TRUE;
	};
};

func void dia_huno_learnsmith_info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//� ����� �� ����������� ���������� � ���� � �������.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//���, ���... ������ � ������� ���� � ���� ��� ����� �� ��������� �������� ������� ������!
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//��� ��� ����� ������?
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//��� �, ������ ��������� � ������� �� ��� �����.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//����������� �������� ��������� ������ �� ���������� � ��������� ���.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//����� �� ����� �����, ��� ����� ��������, ������� � ����� � �����.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//����� ����������� ������ ����� ����� �������� �� ��������� �����.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07");	//� ��� �����.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08");	//�� ��� ���������� � ���� ������ �� ������. ���� ������, ������ ������ �� � ����.
	if(Npc_HasItems(self,itmiswordraw) < 5)
	{
		CreateInvItems(self,itmiswordraw,5);
	};
	if(Npc_HasItems(self,itmiswordbladehot) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordbladehot,Npc_HasItems(self,itmiswordbladehot));
	};
	if(Npc_HasItems(self,itmiswordrawhot) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordrawhot,Npc_HasItems(self,itmiswordrawhot));
	};
	if(Npc_HasItems(self,itmiswordblade) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
	};
	if(Npc_HasItems(self,goldensword))
	{
		Npc_RemoveInvItem(self,goldensword);
	};
	HUNO_LEARNSMITH = TRUE;
};


instance DIA_HUNO_BUYSMITH(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_buysmith_condition;
	information = dia_huno_buysmith_info;
	permanent = 1;
	important = 0;
	description = "� ���� ������ � ���� ���������.";
	trade = 1;
};


func int dia_huno_buysmith_condition()
{
	if(HUNO_LEARNSMITH == TRUE && KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_huno_buysmith_info()
{
	if(Npc_HasItems(self,itmiswordraw) < 5)
	{
		CreateInvItems(self,itmiswordraw,5);
	};
	if(Npc_HasItems(self,itmiswordbladehot) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordbladehot,Npc_HasItems(self,itmiswordbladehot));
	};
	if(Npc_HasItems(self,itmiswordrawhot) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordrawhot,Npc_HasItems(self,itmiswordrawhot));
	};
	if(Npc_HasItems(self,itmiswordblade) >= 1)
	{
		Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
	};
	if(Npc_HasItems(self,goldensword))
	{
		Npc_RemoveInvItem(self,goldensword);
	};
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//� ���� ������ � ���� ���������.
};

