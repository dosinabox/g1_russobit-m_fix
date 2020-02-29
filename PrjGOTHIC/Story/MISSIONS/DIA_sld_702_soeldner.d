
instance DIA_SLD_702_EXIT(C_INFO)
{
	npc = sld_702_soeldner;
	nr = 999;
	condition = dia_sld_702_exit_condition;
	information = dia_sld_702_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_sld_702_exit_condition()
{
	return 1;
};

func void dia_sld_702_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_702_FIRST(C_INFO)
{
	npc = sld_702_soeldner;
	nr = 1;
	condition = dia_sld_702_first_condition;
	information = dia_sld_702_first_info;
	permanent = 0;
	important = 1;
};


func int dia_sld_702_first_condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_sld_702_first_info()
{
	AI_Output(self,other,"DIA_Sld_702_First_04_00");	//�� ��� ������, ���� �� �����?
	AI_Output(other,self,"DIA_Sld_702_First_15_01");	//� ����?
	AI_Output(self,other,"DIA_Sld_702_First_04_02");	//�� ����� � ������ ������������, ��.
	AI_Output(other,self,"DIA_Sld_702_PERM_15_00");		//� ��� � ������ �������, ����� �� ��������� ���� � ��?
	AI_Output(self,other,"DIA_Sld_702_PERM_04_01");		//������!
	AI_Output(self,other,"DIA_Sld_702_PERM_04_02");		//����� ���� �� ������ ������, � �� �� �����, ��� �����.
	AI_Output(self,other,"DIA_Sld_702_PERM_04_03");		//��� �� ����� ����� ������������, �� �������� ����� ����������. �� � ��� ������ ���� ��������.
	AI_Output(self,other,"DIA_Sld_702_PERM_04_04");		//�� �������� ��� � �������� ������ �����, ����� ��� ������������� �����.
};

