
instance TPL_1400_GORNABAR_EXIT(C_INFO)
{
	npc = tpl_1400_gornabar;
	nr = 999;
	condition = tpl_1400_gornabar_exit_condition;
	information = tpl_1400_gornabar_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1400_gornabar_exit_condition()
{
	return 1;
};

func void tpl_1400_gornabar_exit_info()
{
	AI_Output(self,other,"Tpl_1400_GorNaBar_Exit_Info_09_02");	//�� ������ ���� ������!
	AI_StopProcessInfos(self);
};


instance TPL_1400_GORNABAR_SUGGEST(C_INFO)
{
	npc = tpl_1400_gornabar;
	condition = tpl_1400_gornabar_suggest_condition;
	information = tpl_1400_gornabar_suggest_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ��� ������? ";
};


func int tpl_1400_gornabar_suggest_condition()
{
	if(Npc_KnowsInfo(hero,grd_263_asghan_open) && !Npc_KnowsInfo(hero,grd_263_asghan_open_now))
	{
		return TRUE;
	};
};

func void tpl_1400_gornabar_suggest_info()
{
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01");	//�� ������ ��� ������?
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02");	//��� ����� ������ ����� �������� ��� ��� ������. � ����, ��� ��������� ������ ���� ������.
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03");	//������� �� �� �������� ����, ����� � ������ ������?
	AI_Output(self,other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04");	//������ ��������! �������-��! ��� ��� � ����� �������!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GATE");
	npc_setpermattitude(self,ATT_FRIENDLY);
	b_givexp(XP_HIREGORNABAR);
	b_logentry(CH2_MCEGGS,"��� ������ � �������� ������ ��������, ����� ��� �� ��� ���������� ������ ������� �������� ������. � ����� ����� ��� ���.");
};


instance TPL_1400_GORNABAR_INFO(C_INFO)
{
	npc = tpl_1400_gornabar;
	condition = tpl_1400_gornabar_info_condition;
	information = tpl_1400_gornabar_info_info;
	important = 0;
	permanent = 1;
	description = "��� �� ������ � ��������?";
};


func int tpl_1400_gornabar_info_condition()
{
	if(!Npc_KnowsInfo(hero,grd_263_asghan_nest))
	{
		return 1;
	};
};

func void tpl_1400_gornabar_info_info()
{
	AI_Output(other,self,"Tpl_1400_GorNaBar_INFO_Info_15_01");	//��� �� ������ � ��������?
	AI_Output(self,other,"Tpl_1400_GorNaBar_INFO_Info_09_02");	//���-�� � ����� � ��� ���� ������. ���� �� �� ������ ������, ��� ������, �� ������ �� ���������� �� ��� � ��������.
};


instance TPL_1400_GORNABAR_VICTORY(C_INFO)
{
	npc = tpl_1400_gornabar;
	condition = tpl_1400_gornabar_victory_condition;
	information = tpl_1400_gornabar_victory_info;
	important = 0;
	permanent = 0;
	description = "� ����� ������ �������� ��������!";
};


func int tpl_1400_gornabar_victory_condition()
{
	if(Npc_HasItems(hero,itat_crawlerqueen) >= 1)
	{
		return TRUE;
	};
};

func void tpl_1400_gornabar_victory_info()
{
	AI_Output(other,self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01");	//� ����� ������ �������� ��������!
	AI_Output(self,other,"SVM_9_YeahWellDone");	//�������, ������!
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		AI_Output(self,other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02");	//�� ���� � ����� �����, � �� ����� �������� ���. ��� ����� ����� ����, ��� ��!
		if(!Npc_KnowsInfo(hero,tpl_1415_torwache_templeraufnahme))
		{
			Log_CreateTopic(GE_BECOMETEMPLAR,LOG_NOTE);
			b_logentry(GE_BECOMETEMPLAR,"��� ������ � ����� � �������� ������, ��� ����� ����� ���������� � ��� �������. ����� ����, �� ������� ���� ����� �� �������.");
		};
	};
};

