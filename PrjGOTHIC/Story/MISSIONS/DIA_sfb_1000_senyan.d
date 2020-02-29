
instance DIA_SENYAN_EXIT(C_INFO)
{
	npc = sfb_1000_senyan;
	nr = 999;
	condition = dia_senyan_exit_condition;
	information = dia_senyan_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_senyan_exit_condition()
{
	return 1;
};

func void dia_senyan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENYAN_HELLO(C_INFO)
{
	npc = sfb_1000_senyan;
	nr = 1;
	condition = dia_senyan_hello_condition;
	information = dia_senyan_hello_info;
	permanent = 0;
	description = "�� ��������� � ��������� �����?";
};


func int dia_senyan_hello_condition()
{
	return 1;
};

func void dia_senyan_hello_info()
{
	AI_Output(other,self,"DIA_Senyan_Hello_15_00");	//�� ��������� � ��������� �����?
	AI_Output(self,other,"DIA_Senyan_Hello_01_01");	//�����. � ��� �� ��� �����?
	AI_StopProcessInfos(self);
};


instance DIA_SENYAN_JUSTTALK(C_INFO)
{
	npc = sfb_1000_senyan;
	nr = 1;
	condition = dia_senyan_justtalk_condition;
	information = dia_senyan_justtalk_info;
	permanent = 1;
	description = "� ����� ���������� � �����.";
};


func int dia_senyan_justtalk_condition()
{
	if(Npc_KnowsInfo(hero,dia_senyan_hello))
	{
		return 1;
	};
};

func void dia_senyan_justtalk_info()
{
	AI_Output(other,self,"DIA_Senyan_JustTalk_15_00");	//� ����� ���������� � �����.
	AI_Output(self,other,"DIA_Senyan_JustTalk_01_01");	//��� ������� �������������.
	AI_StopProcessInfos(self);
};

