
instance DIA_SHRAT_EXIT(C_INFO)
{
	npc = nov_1356_shrat;
	nr = 999;
	condition = dia_shrat_exit_condition;
	information = dia_shrat_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_shrat_exit_condition()
{
	return 1;
};

func void dia_shrat_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SHRAT_WHYHERE(C_INFO)
{
	npc = nov_1356_shrat;
	nr = 1;
	condition = dia_shrat_whyhere_condition;
	information = dia_shrat_whyhere_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int dia_shrat_whyhere_condition()
{
	return 1;
};

func void dia_shrat_whyhere_info()
{
	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01");	//����� � �������� ���� ���������� �� ���?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02");	//����! � �����, ������ ��� ��� �������� ��������� ��� �� �����!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03");	//�� ���� ���������� �� ���: '���� ������� � ��������! ��� ������� ����������� ��������!'
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04");	//����� ������ ���� ������� ������, ����� ����������, ����� ������ �������� � ���.
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05");	//� ����, ������ ������� �����, �� �� � ��������!
};


instance DIA_SHRAT_JOINPSI(C_INFO)
{
	npc = nov_1356_shrat;
	nr = 1;
	condition = dia_shrat_joinpsi_condition;
	information = dia_shrat_joinpsi_info;
	permanent = 0;
	description = "� ���� �������� � ��������. �� ������ ��� ������?";
};


func int dia_shrat_joinpsi_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrat_whyhere))
	{
		return 1;
	};
};

func void dia_shrat_joinpsi_info()
{
	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00");	//� ���� �������� � ��������. �� ������ ��� ������?
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01");	//�� ������������� �������������� � ���� �����? � � ������ � ����� � ���, ��� �������� ������.
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02");	//�� ����� �� ������ ������������� �� �������. �������� �������� ������� �����������, ���������� ����, ��� �������?
};


instance DIA_SHRAT_COMEWITHME(C_INFO)
{
	npc = nov_1356_shrat;
	nr = 1;
	condition = dia_shrat_comewithme_condition;
	information = dia_shrat_comewithme_info;
	permanent = 1;
	description = "��� �, ������ ������. ����!";
};


func int dia_shrat_comewithme_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrat_joinpsi) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};
};

func void dia_shrat_comewithme_info()
{
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//��� �, ������ ������. ����!
	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01");	//��, ��� � ����� ��������! ������!
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_SHRAT_LEAVEME(C_INFO)
{
	npc = nov_1356_shrat;
	nr = 700;
	condition = dia_shrat_leaveme_condition;
	information = dia_shrat_leaveme_info;
	permanent = 1;
	description = "����� �� ������ �����������. ������ � ����� ����.";
};


func int dia_shrat_leaveme_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return 1;
	};
};

func void dia_shrat_leaveme_info()
{
	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00");	//����� �� ������ �����������. ������ � ����� ����.
	AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01");	//�����. � � ������� � ���� ������� �� �������. ������ ����!
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

