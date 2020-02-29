
instance INFO_ORCSHAMAN_EXIT(C_INFO)
{
	npc = orc_2200_shaman;
	nr = 999;
	condition = info_orcshaman_exit_condition;
	information = info_orcshaman_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_orcshaman_exit_condition()
{
	return TRUE;
};

func void info_orcshaman_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORCSHAMAN_THX(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_thx_condition;
	information = info_orcshaman_thx_info;
	important = 1;
	permanent = 0;
};


func int info_orcshaman_thx_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void info_orcshaman_thx_info()
{
	AI_Output(self,hero,"Info_OrcShaman_THX_17_01");	//������� �����!
	AI_Output(self,hero,"Info_OrcShaman_THX_17_02");	//������ ���� ������ ����� ����.
	AI_Output(self,hero,"Info_OrcShaman_THX_17_03");	//������ ����� �����.
};


instance INFO_ORCSHAMAN_WHO(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_who_condition;
	information = info_orcshaman_who_info;
	important = 0;
	permanent = 0;
	description = "��� ��?";
};


func int info_orcshaman_who_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_thx))
	{
		return TRUE;
	};
};

func void info_orcshaman_who_info()
{
	AI_Output(hero,self,"Info_OrcShaman_WHO_15_01");	//��� ��?
	AI_Output(self,hero,"Info_OrcShaman_WHO_17_02");	//��� ��-���.
	AI_Output(self,hero,"Info_OrcShaman_WHO_17_03");	//���� ��� ����. ���� ����� ��� �����.
};


instance INFO_ORCSHAMAN_TONGUE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_tongue_condition;
	information = info_orcshaman_tongue_info;
	important = 0;
	permanent = 0;
	description = "������ �� ������ ���� �����?";
};


func int info_orcshaman_tongue_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_thx))
	{
		return TRUE;
	};
};

func void info_orcshaman_tongue_info()
{
	AI_Output(hero,self,"Info_OrcShaman_TONGUE_15_01");	//������ �� ������ ���� �����?
	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_02");	//��-��� ���� ��� ����� � �����.
	AI_Output(self,hero,"Info_OrcShaman_TONGUE_17_03");	//�������. ����� ���� ����� �������.
};


instance INFO_ORCSHAMAN_MINE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_mine_condition;
	information = info_orcshaman_mine_info;
	important = 0;
	permanent = 0;
	description = "�� ��� ����� � �����? � � �����?";
};


func int info_orcshaman_mine_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_tongue))
	{
		return TRUE;
	};
};

func void info_orcshaman_mine_info()
{
	AI_Output(hero,self,"Info_OrcShaman_MINE_15_01");	//�� ��� ����� � �����? � � �����?
	AI_Output(self,hero,"Info_OrcShaman_MINE_17_02");	//����� ����� ������� � ������.
};


instance INFO_ORCSHAMAN_WHY(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_why_condition;
	information = info_orcshaman_why_info;
	important = 0;
	permanent = 0;
	description = "������ ���� ������ ������ ����� ����?";
};


func int info_orcshaman_why_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_thx))
	{
		return TRUE;
	};
};

func void info_orcshaman_why_info()
{
	AI_Output(hero,self,"Info_OrcShaman_WHY_15_01");	//������ ���� ������ ������ ����� ����?
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_02");	//��� ��-��� �� ������.
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_03");	//��-��� ������� �� ���� � ������.
	AI_Output(self,hero,"Info_OrcShaman_WHY_17_04");	//������� ������ ������ �����.
};


instance INFO_ORCSHAMAN_KRUSHAK(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_krushak_condition;
	information = info_orcshaman_krushak_info;
	important = 0;
	permanent = 0;
	description = "� ��� ����� ������?";
};


func int info_orcshaman_krushak_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_why))
	{
		return TRUE;
	};
};

func void info_orcshaman_krushak_info()
{
	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_01");	//� ��� ����� ������?
	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_02");	//���� ����� ������ ����.
	AI_Output(hero,self,"Info_OrcShaman_KRUSHAK_15_03");	//�� ������ ������� ������?
	AI_Output(self,hero,"Info_OrcShaman_KRUSHAK_17_04");	//��, ���� �������� ������!
};


instance INFO_ORCSHAMAN_SLEEPER(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_sleeper_condition;
	information = info_orcshaman_sleeper_info;
	important = 0;
	permanent = 0;
	description = "��� �� ������ � ������?";
};


func int info_orcshaman_sleeper_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_krushak))
	{
		return TRUE;
	};
};

func void info_orcshaman_sleeper_info()
{
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_01");	//��� �� ������ � ������?
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_02");	//����� ��� ����� ���� ���� ������!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_03");	//���� ���� ��� ��-���.
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_04");	//��� ������� ���� ����!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_05");	//��� ������� ������!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_06");	//������ �������� ���� �����!
	AI_Output(self,hero,"Info_OrcShaman_SLEEPER_17_07");	//���� ������ ������� ���� ��� ������ ��� ������!
	AI_Output(hero,self,"Info_OrcShaman_SLEEPER_15_08");	//��������� ���� �������! ������ ����, ������� ������� ��� ��� � ���, ���� �� ��������� ��� ������� �����.
};


instance INFO_ORCSHAMAN_CURSE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_curse_condition;
	information = info_orcshaman_curse_info;
	important = 0;
	permanent = 0;
	description = "��� ��������� � ��������� �����?";
};


func int info_orcshaman_curse_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_sleeper))
	{
		return TRUE;
	};
};

func void info_orcshaman_curse_info()
{
	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_01");	//��� ��������� � ��������� �����?
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_02");	//����� ������ ������ �������.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_03");	//�� ������ ������. ������ ���������� ���, ��� ������� ����.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_04");	//����� ��� ������. �� ���� �� ����� �� �������. ����� ��� ������.
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_05");	//������ ����� ������ �����. � ��� ���� ������.
	AI_Output(hero,self,"Info_OrcShaman_CURSE_15_06");	//� ��� ��������� � ����, ��� ������ ����?
	AI_Output(self,hero,"Info_OrcShaman_CURSE_17_07");	//������ ���� ����������. � ���������. ��� ����� ����� � �������, �� � ������.
};


instance INFO_ORCSHAMAN_OUTSIDE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_outside_condition;
	information = info_orcshaman_outside_info;
	important = 0;
	permanent = 0;
	description = "� ����, ���������� �� �����������, ���-������ �������?";
};


func int info_orcshaman_outside_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_curse))
	{
		return TRUE;
	};
};

func void info_orcshaman_outside_info()
{
	AI_Output(hero,self,"Info_OrcShaman_OUTSIDE_15_01");	//� ����, ���������� �� �����������, ���-������ �������?
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_02");	//��� ������� ����. ����� ������ ������� ������.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_03");	//������ �������� ������ � �� �������.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_04");	//��-��� ������ ������ �����. �������� ����� ������ ������.
	AI_Output(self,hero,"Info_OrcShaman_OUTSIDE_17_05");	//��� �� �������. ��� ������� ��-��� �������. ��� ������ ��-���.
};


instance INFO_ORCSHAMAN_INTEMPLE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_intemple_condition;
	information = info_orcshaman_intemple_info;
	important = 0;
	permanent = 0;
	description = "� ������ ������� � ��������� ����.";
};


func int info_orcshaman_intemple_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_outside))
	{
		return TRUE;
	};
};

func void info_orcshaman_intemple_info()
{
	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_01");	//� ������ ������� � ��������� ����. �� ������ ������� ���� ����?
	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_02");	//��-��� �������� ������� �����. ����� ������ ��-���.
	AI_Output(self,hero,"Info_OrcShaman_INTEMPLE_17_03");	//������ ���� � ���� � ��� ��-���. ��-��� �� ���� � ���.
	AI_Output(hero,self,"Info_OrcShaman_INTEMPLE_15_04");	//��� ��� �� ��������� ���� ������� � �����, ��?
};


instance INFO_ORCSHAMAN_MAP(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_map_condition;
	information = info_orcshaman_map_info;
	important = 0;
	permanent = 0;
	description = "� �� ������ �������� ��� �� �����, ��� ���� ����� ���������?";
};


func int info_orcshaman_map_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_intemple) && Npc_HasItems(hero,itwrworldmap))
	{
		return TRUE;
	};
};

func void info_orcshaman_map_info()
{
	AI_Output(hero,self,"Info_OrcShaman_MAP_15_01");	//� �� ������ �������� ��� �� �����, ��� ���� ����� ���������?
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_02");	//��� ��-��� ���, �� ������ ����� �����.
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_03");	//������ ������ �����, ��-��� �������� ���.
	b_printtrademsg1("������ ����� �������.");
	AI_TurnAway(self,hero);
	AI_Output(self,hero,"Info_OrcShaman_MAP_17_04");	//(������ �� �����)
	AI_WhirlAround(self,hero);
	b_printtrademsg2("�������� ����������� ����� �������.");
	AI_Output(hero,self,"Info_OrcShaman_MAP_15_05");	//�! � �� ������� �������! �������!
	Npc_RemoveInvItem(hero,itwrworldmap);
	CreateInvItem(hero,itwrworldmap_orc);
};


instance INFO_ORCSHAMAN_FIGHT(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_fight_condition;
	information = info_orcshaman_fight_info;
	important = 0;
	permanent = 0;
	description = "��, ������, ��� ��� �������� ��������� ������ �����!";
};


func int info_orcshaman_fight_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_intemple))
	{
		return TRUE;
	};
};

func void info_orcshaman_fight_info()
{
	AI_Output(hero,self,"Info_OrcShaman_FIGHT_15_01");	//��, ������, ��� ��� �������� ��������� ������ �����!
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_02");	//���� ����� ����� �������! ��� ����� ����� ����!
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_03");	//����� �� ������! ����� �������! ����� �������.
	AI_Output(self,hero,"Info_OrcShaman_FIGHT_17_04");	//���� ���� ������ ���� ����. ������� ����� ������ � �������.
};


instance INFO_ORCSHAMAN_OTHERWAY(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_otherway_condition;
	information = info_orcshaman_otherway_info;
	important = 0;
	permanent = 0;
	description = "��, ��� �������, �� ��� ��� ����� �������� ���� �������!";
};


func int info_orcshaman_otherway_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_fight))
	{
		return TRUE;
	};
};

func void info_orcshaman_otherway_info()
{
	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_01");	//��, ��� �������, �� ��� ��� ����� �������� ���� �������!
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_02");	//��-��� ����� ���� ������! ����� ������ ���-����.
	AI_Output(hero,self,"Info_OrcShaman_OTHERWAY_15_03");	//���-����? � ��� ��� �����?
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_04");	//���� ���� ������. ����� ������� ���-����.
	AI_Output(self,hero,"Info_OrcShaman_OTHERWAY_17_05");	//����� ����� ���-���� � �� �������!
};


instance INFO_ORCSHAMAN_ULUMULU(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_ulumulu_condition;
	information = info_orcshaman_ulumulu_info;
	important = 0;
	permanent = 0;
	description = "� ��� ��� ������� ��� ����� ���-����?";
};


func int info_orcshaman_ulumulu_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_otherway))
	{
		return TRUE;
	};
};

func void info_orcshaman_ulumulu_info()
{
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_01");	//� ��� ��� ������� ��� ����� ���-����?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_02");	//����� ������ � ���� ��-���!
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_03");	//���� ��-��� ������ ����� ���-����. ����� ����� ���-���� � �� �������!
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_04");	//��, ��, �� ��� � ���� ������ � '�� �������', � ��� �����. �� ��� � ����� ������ �����?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_05");	//���� ��-��� � ����� ����, � �����. ���� �� ������� � ��-���. ���� ������ ������.
	b_story_foundurshak();
	Info_ClearChoices(info_orcshaman_ulumulu);
	Info_AddChoice(info_orcshaman_ulumulu,"�� ������� � ��������� �����?",info_orcshaman_ulumulu_fm);
	Info_AddChoice(info_orcshaman_ulumulu,"�� ������� � ����������� �����?",info_orcshaman_ulumulu_vm);
	Info_AddChoice(info_orcshaman_ulumulu,"�� ������� � ������ �����?",info_orcshaman_ulumulu_am);
};

func void info_orcshaman_ulumulu_vm()
{
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_08");	//�� ������� � ����������� �����?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_09");	//��-��� �� ��������.
};

func void info_orcshaman_ulumulu_am()
{
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_10");	//�� ������� � ������ �����?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_11");	//��-��� �� ��������.
};

func void info_orcshaman_ulumulu_fm()
{
	AI_Output(hero,self,"Info_OrcShaman_ULUMULU_15_12");	//�� ������� � ��������� �����?
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_13");	//��-��� ���� ��� � ����� ��� �������.
	AI_Output(self,hero,"Info_OrcShaman_ULUMULU_17_14");	//��-��� ������ ���� �������� ����� ���.
	Info_ClearChoices(info_orcshaman_ulumulu);
};


instance INFO_ORCSHAMAN_BYEBYE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_byebye_condition;
	information = info_orcshaman_byebye_info;
	important = 0;
	permanent = 0;
	description = "������� �� ������.";
};


func int info_orcshaman_byebye_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_ulumulu))
	{
		return TRUE;
	};
};

func void info_orcshaman_byebye_info()
{
	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_01");	//������� �� ������.
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_02");	//��-��� �������� ����� �������. ����� ������� ��-���. ������ ����� ����!
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_03");	//���� �������� �������. ���� ��-���. ���� �������� �� ����� ������� ����.
	b_printtrademsg1("������� �������� �����.");
	AI_Output(self,hero,"Info_OrcShaman_BYEBYE_17_04");	//��-��� �� ����� �����. ��-��� ������ ���� �����. ���� ��������� ����� ����� ������.
	AI_Output(hero,self,"Info_OrcShaman_BYEBYE_15_05");	//��������, � ���� �����-������ ������������.
	b_story_friendofurshak();
	AI_StopProcessInfos(self);
};


instance INFO_ORCSHAMAN_FRIENDLYHELLO(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_friendlyhello_condition;
	information = info_orcshaman_friendlyhello_info;
	important = 0;
	permanent = 0;
	description = "��� � ���� ����?";
};


func int info_orcshaman_friendlyhello_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_byebye) && FRIENDOFURSHAK)
	{
		return TRUE;
	};
};

func void info_orcshaman_friendlyhello_info()
{
	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_01");	//��� � ���� ����?
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_02");	//��-��� ���� ��������!
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_03");	//��-��� ������ ������ ���� ���-����!
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_04");	//����� ��-��� ��������� ����� � ���-����.
	AI_Output(self,hero,"Info_OrcShaman_FRIENDLYHELLO_17_05");	//���� ���������, ����� ����� ������!
	AI_Output(hero,self,"Info_OrcShaman_FRIENDLYHELLO_15_06");	//������ ����!
	AI_StopProcessInfos(self);
};


instance INFO_ORCSHAMAN_ORCCITY(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_orccity_condition;
	information = info_orcshaman_orccity_info;
	important = 1;
	permanent = 0;
};


func int info_orcshaman_orccity_condition()
{
	if(Npc_GetDistToWP(hero,"SPAWN_OW_WARAN_ORC_01") < 1000)
	{
		return TRUE;
	};
};

func void info_orcshaman_orccity_info()
{
	b_fullstop(hero);
	AI_GotoNpc(hero,self);
	AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_01");	//��-��� �������� ���� ������!
	if(Npc_HasItems(hero,ulumulu))
	{
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_02");	//���� ����� ���-����! ����� �������!
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_03");	//���� �� ������ ����� ���-���� � ����, ����� ���� �� ����!
	}
	else
	{
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_04");	//���� �� ����� ���-����! �����!
		AI_Output(self,hero,"Info_OrcShaman_ORCCITY_17_05");	//���� �� ���� �� ����, � �� �������!
	};
};


instance INFO_ORCSHAMAN_YOUHERE(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_youhere_condition;
	information = info_orcshaman_youhere_info;
	important = 0;
	permanent = 0;
	description = "��� �� ������� ��� ������ � ������ �����?";
};


func int info_orcshaman_youhere_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_orccity))
	{
		return TRUE;
	};
};

func void info_orcshaman_youhere_info()
{
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_01");	//��� �� ������� ��� ������ � ������ �����?
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_02");	//��-��� �������� �� ������ �� ����!
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_03");	//��-��� ������ ������ ������ ����������� �����!
	AI_Output(self,hero,"Info_OrcShaman_YOUHERE_17_04");	//��-��� ����� ����� � ������� ������ ������, ����� �� ����������!
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_05");	//��� ������ ������������� ����� ����������? � �� �� ����������?
	AI_Output(hero,self,"Info_OrcShaman_YOUHERE_15_06");	//� ���-��� ������ �� ���� ������. ���� �� �����, ���� ����� �����, ���� �� ��� � ��������� �����.
};


instance INFO_ORCSHAMAN_SEAL(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_seal_condition;
	information = info_orcshaman_seal_info;
	important = 0;
	permanent = 0;
	description = "� ������� ��� �� �����������, ��� ���� ������ ���������� ����.";
};


func int info_orcshaman_seal_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_orccity))
	{
		return TRUE;
	};
};

func void info_orcshaman_seal_info()
{
	AI_Output(hero,self,"Info_OrcShaman_SEAL_15_01");	//� ������� ��� �� �����������, ��� ���� ������ ���������� ����.
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_02");	//������ ��-��� ������� ���� � ����� ����� ������!
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_03");	//���� ������ ���� � ����!
	AI_Output(self,hero,"Info_OrcShaman_SEAL_17_04");	//���� ������������ ����� ������, ���� ���� ��� ��-���!
};


instance INFO_ORCSHAMAN_SCROLL(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_scroll_condition;
	information = info_orcshaman_scroll_info;
	important = 0;
	permanent = 0;
	description = "��� � ����� ��� ����������?";
};


func int info_orcshaman_scroll_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_seal))
	{
		return TRUE;
	};
};

func void info_orcshaman_scroll_info()
{
	AI_Output(hero,self,"Info_OrcShaman_SCROLL_15_01");	//��� � ����� ��� ����������?
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_02");	//���� ���� � ������ ��� ������ ���� ���� ��� ��-���!
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_03");	//�� ���� ���� ������ ����� ���������!
	AI_Output(self,hero,"Info_OrcShaman_SCROLL_17_04");	//������ ��-��� �� ������! ���-���� �� ������, ���� ���� ������������ �����!
	b_logentry(CH4_ENTERTEMPLE,"� ����� �������� ������ ��-���� ����� ������� �����. �� ������ ���, ��� � ��������� ���� ����� ������� ������ �����, ����� � ������ ����������� ������ ����������. ������ ����-������ ������ ����� ���������� � ����� �����.");
};


instance INFO_ORCSHAMAN_IDOL(C_INFO)
{
	npc = orc_2200_shaman;
	condition = info_orcshaman_idol_condition;
	information = info_orcshaman_idol_info;
	important = 0;
	permanent = 0;
	description = "���� �� ������ ���� � ���� �������?";
};


func int info_orcshaman_idol_condition()
{
	if(Npc_KnowsInfo(hero,info_orcshaman_scroll) && !ORCCITY_SANCTUM_OUTERGATEOPEN)
	{
		return TRUE;
	};
};

func void info_orcshaman_idol_info()
{
	AI_Output(hero,self,"Info_OrcShaman_IDOL_15_01");	//���� �� ������ ���� � ���� �������?
	if(Npc_HasItems(hero,itmi_stuff_idol_sleeper_01))
	{
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_03");	//���� ����� ����, ��� ������ �� �������!
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_04");	//���� ������ ������� ������ � ����!
		b_logentry(CH4_ENTERTEMPLE,"���� � ������ ���� � ���� �������. ����� ��������� ������ ������� �� ��������� ����� �������� �������� � �����.");
	}
	else
	{
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_05");	//���� ���� ����� ����, ��� ������ �� �������!
		AI_Output(self,hero,"Info_OrcShaman_IDOL_17_06");	//������ ���� ������� ����� � ����!
		b_logentry(CH4_ENTERTEMPLE,"� ���� ������� ����� ������� � ������ �����. �� ��������� ������� ����� ������ �������, ������� ��������� ������ � ����. �� ���� ������ ������� ���� � ����� �������, ��� �� ����������.");
	};
};

