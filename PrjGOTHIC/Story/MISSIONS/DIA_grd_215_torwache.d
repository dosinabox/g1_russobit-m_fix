
instance DIA_GRD_215_TORWACHE_EXIT(C_INFO)
{
	npc = grd_215_torwache;
	nr = 999;
	condition = dia_grd_215_torwache_exit_condition;
	information = dia_grd_215_torwache_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_215_torwache_exit_condition()
{
	return 1;
};

func void dia_grd_215_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRD_215_TORWACHE_FIRST(C_INFO)
{
	npc = grd_215_torwache;
	nr = 2;
	condition = dia_grd_215_torwache_first_condition;
	information = dia_grd_215_torwache_first_info;
	permanent = 0;
	important = 1;
};


func int dia_grd_215_torwache_first_condition()
{
	if(!Npc_KnowsInfo(hero,dia_grd_216_first) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_grd_215_torwache_first_info()
{
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_00");	//� ���� ��� �� ����?
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_15_01");	//� ������.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_02");	//�� ���� ���� �� ����� �������������, �? ������?
	Info_ClearChoices(dia_grd_215_torwache_first);
	Info_AddChoice(dia_grd_215_torwache_first,"��, � ���, ������ ��, ����� ���� ������ ��������...",dia_grd_215_torwache_first_trouble);
	Info_AddChoice(dia_grd_215_torwache_first,"�� ������ ����� ����������, ��� ����� ����.",dia_grd_215_torwache_first_justlooking);
	if(Npc_KnowsInfo(hero,info_diego_kolonie))
	{
		Info_AddChoice(dia_grd_215_torwache_first,"����� ������, ��� � ������ ����������� � ��� � ������.",dia_grd_215_torwache_first_diego);
	};
};

func void dia_grd_215_torwache_first_trouble()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Trouble_15_00");	//��, � ���, ������ ��, ����� ���� ������ ��������...
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Trouble_06_01");	//� �� ������... �� ����� �����.
	Info_ClearChoices(dia_grd_215_torwache_first);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_grd_215_torwache_first_justlooking()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_JustLooking_15_00");	//�� ������ ����� ����������, ��� ����� ����.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_JustLooking_06_01");	//�� ��� � ���� ������ ������ ����.
	Info_ClearChoices(dia_grd_215_torwache_first);
	Info_AddChoice(dia_grd_215_torwache_first,"�, ������ �� ����.",dia_grd_215_torwache_first_nopay);
	Info_AddChoice(dia_grd_215_torwache_first,"�����, ��� ���� ������ ������.",dia_grd_215_torwache_first_pay);
};

func void dia_grd_215_torwache_first_diego()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Diego_15_00");	//����� ������, ��� � ������ ����������� � ��� � ������.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Diego_06_01");	//�����, ��� ��� - �������.
	Info_ClearChoices(dia_grd_215_torwache_first);
};

func void dia_grd_215_torwache_first_nopay()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_NoPay_15_00");	//�, ������ �� ����.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_NoPay_06_01");	//����� ��������.
	Info_ClearChoices(dia_grd_215_torwache_first);
};

func void dia_grd_215_torwache_first_pay()
{
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_15_00");	//�����, ��� ���� ������ ������.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_06_01");	//������ ��������, ������.
		b_giveinvitems(other,self,itminugget,10);
		CreateInvItems(self,itminugget,10);
	}
	else
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//�� � ���� �� ��� ����� ����.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01");	//������, ������ ���������� ��� ����, ��� ��� ����������. �� ������ ���� ���.
	};
	Info_ClearChoices(dia_grd_215_torwache_first);
	AI_StopProcessInfos(self);
};


instance DIA_GRD_215_TORWACHE_PERM(C_INFO)
{
	npc = grd_215_torwache;
	nr = 1;
	condition = dia_grd_215_torwache_perm_condition;
	information = dia_grd_215_torwache_perm_info;
	permanent = 1;
	description = "���� ���-������ ���������?";
};


func int dia_grd_215_torwache_perm_condition()
{
	return 1;
};

func void dia_grd_215_torwache_perm_info()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_PERM_15_00");	//���� ���-������ ���������?
	AI_Output(self,other,"DIA_Grd_215_Torwache_PERM_06_01");	//���. ��� ��-��������.
};

