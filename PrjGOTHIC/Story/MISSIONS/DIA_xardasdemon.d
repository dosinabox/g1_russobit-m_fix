
instance INFO_XARDASDEMON_EXIT(C_INFO)
{
	npc = xardasdemon;
	nr = 999;
	condition = info_xardasdemon_exit_condition;
	information = info_xardasdemon_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_xardasdemon_exit_condition()
{
	return 1;
};

func void info_xardasdemon_exit_info()
{
	AI_Output(self,other,"DEM_AMBIENT02");	//
	AI_Output(hero,self,"Info_Saturas_EXIT_15_01");	//... �?.. ��������?.. � ��� �����!
	AI_StopProcessInfos(self);
};


instance INFO_XARDASDEMON_INTRO(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_intro_condition;
	information = info_xardasdemon_intro_info;
	permanent = 0;
	important = 1;
};


func int info_xardasdemon_intro_condition()
{
	if(FINDXARDAS)
	{
		return TRUE;
	};
};

func void info_xardasdemon_intro_info()
{
	Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL",self,self,3,0,DAM_FIRE,TRUE);
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	AI_PlayAni(self,"T_SPAWN");
	AI_TurnAway(hero,self);
	AI_PlayAni(hero,"T_SEARCH");
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_01");	//���... ���... ��� ��� �������?
	AI_WhirlAround(hero,self);
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_02");	//��� ��� �� �� ���� ��������? � ���... � ������ ���� ����� ������ ������ � ���� ������?
	AI_Output(self,other,"DEM_AMBIENT02");	//
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_03");	//��� ��?.. ������� ����� ������ �������?
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_04");	//��� �������, �� - ���� �� ���������� ���� ����!
	AI_Output(self,other,"DEM_AMBIENT03");	//
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_05");	//��� ���������?
};


instance INFO_XARDASDEMON_MASTERWHO(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_masterwho_condition;
	information = info_xardasdemon_masterwho_info;
	permanent = 0;
	important = 0;
	description = "� ���� ������, ��������, �� �������?";
};


func int info_xardasdemon_masterwho_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_intro))
	{
		return TRUE;
	};
};

func void info_xardasdemon_masterwho_info()
{
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_01");	//� ���� ������, ��������, �� �������?
	AI_Output(self,other,"DEM_AMBIENT04");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_02");	//��, ���... ����� �� ����� ��������... �����.
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_03");	//������ ��� �������, ��� ���-�� ����� ������ ���� ����� ��������. ��-�����, ��� ��� � ����.
};


instance INFO_XARDASDEMON_MASTERHOW(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_masterhow_condition;
	information = info_xardasdemon_masterhow_info;
	permanent = 0;
	important = 0;
	description = "� ���� ���������� � ����� ��������!";
};


func int info_xardasdemon_masterhow_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterwho))
	{
		return TRUE;
	};
};

func void info_xardasdemon_masterhow_info()
{
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_01");	//� ���� ���������� � ����� ��������!
	AI_Output(self,other,"DEM_AMBIENT03");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_02");	//�?.. ���������?.. � ��� �� ���������?..
	AI_Output(self,other,"DEM_AMBIENT01");	//
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_03");	//... �-�... �������... ���� ���-�� ����� ���������� � ����� ��������, �� ������ ��������, ��� �� ����� �������!
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_04");	//... �������, ��� �� ������?.. ��������������?.. �����-�� ������?.. ��� ��������?
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_05");	//... ������?.. ���?.. �����?
	FINDGOLEMHEARTS = 1;
	b_logentry(CH4_FINDXARDAS,"� ����� �������� ���� �������� �����, ������� ������� �� ����, ��������� ��� ���� �����. �� ����� �������� ��� �������������� ������ ��� �������� ����, ���� � �����, ����� ��� ��� � ����� ������� � ��� �������.");
};


instance INFO_XARDASDEMON_NOHEART(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_noheart_condition;
	information = info_xardasdemon_noheart_info;
	permanent = 1;
	important = 0;
	description = "� �� �������! ������� �����-��.";
};


func int info_xardasdemon_noheart_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterhow) && !Npc_HasItems(hero,itat_stonegolem_01) && !Npc_HasItems(hero,itat_icegolem_01) && !Npc_HasItems(hero,itat_firegolem_01) && (FINDGOLEMHEARTS < 4))
	{
		return TRUE;
	};
};

func void info_xardasdemon_noheart_info()
{
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_01");	//� �� �������! ������� �����-��.
	AI_Output(self,other,"DEM_AMBIENT04");	//
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_02");	//... ��� � ��� ������, ����� �� ��� ����������?..
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_03");	//... �, ��� ���� ����� �������������� ������ ��� �������� ����, ���� � �����!
};

func void b_xardasdemon_giveheart()
{
	if(FINDGOLEMHEARTS == 1)
	{
		AI_Output(self,other,"DEM_AMBIENT02");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_01");	//... ���? �-�!.. ������������ ��������������!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_02");	//...�����������? ���� ��� ���?
		FINDGOLEMHEARTS = 2;
	}
	else if(FINDGOLEMHEARTS == 2)
	{
		AI_Output(self,other,"DEM_AMBIENT01");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_03");	//... ������ ��������������?.. ������ � ���� �� ���?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_04");	//... �� ������� ��� ������?
		FINDGOLEMHEARTS = 3;
	}
	else if(FINDGOLEMHEARTS == 3)
	{
		AI_Output(self,other,"DEM_WARN01");	//
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_05");	//... ������������?.. � �������?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_06");	//���� ��� ���, �� � ���� ���������� � ����� ��������!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_07");	//... ������������?.. ������������ ����?.. ����?.. �� ���� ��� ����?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_08");	//����� � ������ ��� ���� ������������ � ���� ����, ��� � ������ ���������!
		b_printtrademsg1("�������� ���� ������������ � ����������.");
		b_story_accesstoxardas();
	};
};


instance INFO_XARDASDEMON_STONEHEART(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_stoneheart_condition;
	information = info_xardasdemon_stoneheart_info;
	permanent = 0;
	important = 0;
	description = "� ���� ���� ������ ��������� ������!";
};


func int info_xardasdemon_stoneheart_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterhow) && Npc_HasItems(hero,itat_stonegolem_01))
	{
		return TRUE;
	};
};

func void info_xardasdemon_stoneheart_info()
{
	AI_Output(hero,self,"Info_XardasDemon_STONEHEART_15_01");	//� ���� ���� ������ ��������� ������!
	b_printtrademsg1("������ ������ ��������� ������.");
	b_giveinvitems(hero,self,itat_stonegolem_01,1);
	Npc_RemoveInvItem(self,itat_stonegolem_01);
	b_xardasdemon_giveheart();
};


instance INFO_XARDASDEMON_ICEHEART(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_iceheart_condition;
	information = info_xardasdemon_iceheart_info;
	permanent = 0;
	important = 0;
	description = "��� ������ �������������� - ������ �������� ������!";
};


func int info_xardasdemon_iceheart_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterhow) && Npc_HasItems(hero,itat_icegolem_01))
	{
		return TRUE;
	};
};

func void info_xardasdemon_iceheart_info()
{
	AI_Output(hero,self,"Info_XardasDemon_ICEHEART_15_01");	//��� ������ �������������� - ������ �������� ������!
	b_printtrademsg1("������ ������ �������� ������.");
	b_giveinvitems(hero,self,itat_icegolem_01,1);
	b_xardasdemon_giveheart();
};


instance INFO_XARDASDEMON_FIREHEART(C_INFO)
{
	npc = xardasdemon;
	condition = info_xardasdemon_fireheart_condition;
	information = info_xardasdemon_fireheart_info;
	permanent = 0;
	important = 0;
	description = "������ ��������� ������ - ������������ ��������������?";
};


func int info_xardasdemon_fireheart_condition()
{
	if(Npc_KnowsInfo(hero,info_xardasdemon_masterhow) && Npc_HasItems(hero,itat_firegolem_01))
	{
		return TRUE;
	};
};

func void info_xardasdemon_fireheart_info()
{
	AI_Output(hero,self,"Info_XardasDemon_FIREHEART_15_01");	//������ ��������� ������ - ������������ ��������������?
	b_printtrademsg1("������ ������ ��������� ������.");
	b_giveinvitems(hero,self,itat_firegolem_01,1);
	b_xardasdemon_giveheart();
};

