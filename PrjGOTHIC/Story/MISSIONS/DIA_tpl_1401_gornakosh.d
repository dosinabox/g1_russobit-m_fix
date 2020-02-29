
instance TPL_1401_GORNAKOSH_EXIT(C_INFO)
{
	npc = tpl_1401_gornakosh;
	nr = 999;
	condition = tpl_1401_gornakosh_exit_condition;
	information = tpl_1401_gornakosh_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1401_gornakosh_exit_condition()
{
	return 1;
};

func void tpl_1401_gornakosh_exit_info()
{
	AI_Output(self,other,"Tpl_1401_GorNaKosh_Exit_Info_13_02");	//�� ���������� ������!
	AI_StopProcessInfos(self);
};


instance TPL_1401_GORNAKOSH_SUGGEST(C_INFO)
{
	npc = tpl_1401_gornakosh;
	condition = tpl_1401_gornakosh_suggest_condition;
	information = tpl_1401_gornakosh_suggest_info;
	important = 0;
	permanent = 0;
	description = "� ����, ��� ��������� ������ ��������...";
};


func int tpl_1401_gornakosh_suggest_condition()
{
	if(Npc_KnowsInfo(hero,grd_263_asghan_open) && !Npc_KnowsInfo(hero,grd_263_asghan_open_now))
	{
		return TRUE;
	};
};

func void tpl_1401_gornakosh_suggest_info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01");	//� ����, ��� ��������� ������ ��������, � ��������� ����� ����, ����� ������ �� ����� ��� ����� ��� ������.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02");	//��� ��� � ����� �������. � ����� � �����.
	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03");	//������. ���������� � �������� �������.
	Npc_ExchangeRoutine(self,"GATE");
	npc_setpermattitude(self,ATT_FRIENDLY);
	b_givexp(XP_HIREGORNAKOSH);
	b_logentry(CH2_MCEGGS,"� ���� ��������� ������ ��� �� ���� �������� ������ ������ � ��������. �� ����� ����� ���� � �����.");
	AI_StopProcessInfos(self);
};


instance TPL_1401_GORNAKOSH_INFO(C_INFO)
{
	npc = tpl_1401_gornakosh;
	condition = tpl_1401_gornakosh_info_condition;
	information = tpl_1401_gornakosh_info_info;
	important = 0;
	permanent = 1;
	description = "��� �� ����� �������?";
};


func int tpl_1401_gornakosh_info_condition()
{
	if(!Npc_KnowsInfo(hero,grd_263_asghan_nest))
	{
		return 1;
	};
};

func void tpl_1401_gornakosh_info_info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_01");	//��� �� ����� �������?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_02");	//� ������� �� ��������.
	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_03");	//�� ������ ���������� ���, ��� ��������� �� ��������?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_04");	//��� �, ����� ���� ������ ���� �������. ����� �� ������ ����� ����� �������, ������ ��� ������ ��� ������, ��� ������ �������.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_05");	//���� ���������� � ������ �������� ���� ������� ������.
	AI_StopProcessInfos(self);
};


instance TPL_1401_GORNAKOSH_CRAWLER(C_INFO)
{
	npc = tpl_1401_gornakosh;
	condition = tpl_1401_gornakosh_crawler_condition;
	information = tpl_1401_gornakosh_crawler_info;
	important = 0;
	permanent = 1;
	description = "�� ������ ���������� � �������� ��� ���-������?";
};


func int tpl_1401_gornakosh_crawler_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1401_gornakosh_info))
	{
		return 1;
	};
};

func void tpl_1401_gornakosh_crawler_info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01");	//�� ������ ���������� � �������� ��� ���-������?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02");	//�� ������� - ������� ���! ��� ��� ��������, - ���, ��� �� ������ �� ��� �����.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03");	//������� ��� �����, ��� ���� ��� ����������.
};


instance TPL_1401_GORNAKOSH_VICTORY(C_INFO)
{
	npc = tpl_1401_gornakosh;
	condition = tpl_1401_gornakosh_victory_condition;
	information = tpl_1401_gornakosh_victory_info;
	important = 0;
	permanent = 0;
	description = "� ����� ������ ��������!";
};


func int tpl_1401_gornakosh_victory_condition()
{
	if(Npc_HasItems(hero,itat_crawlerqueen) > 3)
	{
		return TRUE;
	};
};

func void tpl_1401_gornakosh_victory_info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01");	//� ����� ������ ��������!
	AI_Output(self,other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02");	//�������! ������ ��� � ������ � �������� �� ��������� ����� ������. ��� ����� ���� ����.
	b_logentry(CH2_MCEGGS,"� ������ ������� ��� ������ ���� ��������. �� ��� ����� ���� ����� �����������.");
};

