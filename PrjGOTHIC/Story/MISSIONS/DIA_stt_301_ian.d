
instance STT_301_IAN_EXIT(C_INFO)
{
	npc = stt_301_ian;
	nr = 999;
	condition = stt_301_ian_exit_condition;
	information = stt_301_ian_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_301_ian_exit_condition()
{
	return 1;
};

func void stt_301_ian_exit_info()
{
	AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01");	//���� ��������� �����?
	AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02");	//������ �� �������� ��� ������ �������.
	AI_StopProcessInfos(self);
};


instance STT_301_IAN_HI(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_hi_condition;
	information = stt_301_ian_hi_info;
	important = 0;
	permanent = 0;
	description = "�� ��, ������� ������� � ���� �����?";
};


func int stt_301_ian_hi_condition()
{
	if(!Npc_KnowsInfo(hero,stt_301_ian_nest))
	{
		return TRUE;
	};
};

func void stt_301_ian_hi_info()
{
	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01");	//�� ��, ������� ������� � ���� �����?
	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02");	//��, ���� ����� ��. ��� ��� �����. ���� ����� ������ ����� �� �������, � ���������� ������ �� �������.
};


instance STT_301_IAN_GOMEZ(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_gomez_condition;
	information = stt_301_ian_gomez_info;
	important = 0;
	permanent = 0;
	description = "� �����, ��� ��� ����� ����������� ������.";
};


func int stt_301_ian_gomez_condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void stt_301_ian_gomez_info()
{
	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01");	//� �����, ��� ��� ����� ����������� ������.
	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02");	//�������, ��� ����� ����������� ������� ������, �� �����, �����, ��� ������ ����������� ��� � ������ ������.
};


instance STT_301_IAN_ORE(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_ore_condition;
	information = stt_301_ian_ore_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ���������� ��� � ������ ����?";
};


func int stt_301_ian_ore_condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_gomez))
	{
		return TRUE;
	};
};

func void stt_301_ian_ore_info()
{
	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01");	//�� ������ ���������� ��� � ������ ����?
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02");	//�������� �������� ����� ���� ���� � �����. ���� ��������� ���������� 220 ������ ����, 20 �� ��� ���� �� ����������.
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03");	//�� ���� ����, ������� �� ���������� ������, ����� �������� �� ���� ����� �������.
};


instance STT_301_IAN_MORE(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_more_condition;
	information = stt_301_ian_more_info;
	important = 0;
	permanent = 0;
	description = "� ������, ��� ��� �� ������� ����... �� ������ ���������� � ���?";
};


func int stt_301_ian_more_condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_ore);
};

func void stt_301_ian_more_info()
{
	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01");	//� ������, ��� ��� �� ������� ����, � ����������. �� ������ ���������� ��� � ���?
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02");	//���������� ���� �������� ������� ����������. ������ �� ��� ������� �� ��������, � ������ ������� ������� ������, ��� �� �������� ������.
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03");	//����� ������ � ����� ������� ����� ��������� ������������ � ����� �����.
};


instance STT_301_IAN_MAGIC(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_magic_condition;
	information = stt_301_ian_magic_info;
	important = 0;
	permanent = 0;
	description = "� �� ������ � ���� ��� ���-������?";
};


func int stt_301_ian_magic_condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_more);
};

func void stt_301_ian_magic_info()
{
	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01");	//� �� ������ � ���� ��� ���-������?
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02");	//� ���������, ���� ������ ���������� �������� ��� ����������. ������ � ���������� �������� ����� ���������� ������.
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03");	//�� ���� � ���� ������ ������ �� ����� ���� ����������� ������� ������ �� ������ ���������� � ������� ������� ���� �����.
};


instance STT_301_IAN_MINE(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_mine_condition;
	information = stt_301_ian_mine_info;
	important = 0;
	permanent = 0;
	description = "�������� ��� �� ���� �����.";
};


func int stt_301_ian_mine_condition()
{
	if((KAPITEL < 3) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void stt_301_ian_mine_info()
{
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01");	//�������� ��� �� ���� �����.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02");	//���� �� �������� ��������� �����, ���� �� ������� ������ �������� �� ��������� ������. � ������� ������ ������� ����� ����� ��������.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03");	//� ���������� �� ��������� ����������. ������� ����� ������� ��� ������ �� ������, �� �� ���� ���������� �������� ������, ��� ������ ���� ��������.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04");	//������, � ��� �������.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05");	//�����, � ���� ��� ����� ���. �� �����, �� ����� ���� ����� ��������.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06");	//� ������ �������� �����.
};


instance STT_301_IAN_WANTLIST(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_wantlist_condition;
	information = stt_301_ian_wantlist_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ������� ������ ��� ������.";
};


func int stt_301_ian_wantlist_condition()
{
	if((DIEGO_BRINGLIST == LOG_RUNNING) && !Npc_KnowsInfo(hero,info_diego_ianpassword))
	{
		return TRUE;
	};
};

func void stt_301_ian_wantlist_info()
{
	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01");	//��� ����� ������� ������ ��� ������.
	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02");	//��� ��� ������ ����� �������. ��������!
};


instance STT_301_IAN_GETLIST(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_getlist_condition;
	information = stt_301_ian_getlist_info;
	important = 0;
	permanent = 0;
	description = "����� ������� ���� ����. � ������ ������� ������.";
};


func int stt_301_ian_getlist_condition()
{
	if((DIEGO_BRINGLIST == LOG_RUNNING) && Npc_KnowsInfo(hero,info_diego_ianpassword) && !Npc_KnowsInfo(hero,stt_301_ian_steallist))
	{
		return TRUE;
	};
};

func void stt_301_ian_getlist_info()
{
	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//����� ������� ���� ����. � ������ ������� ������.
	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02");	//�������, ��� ���� ������. ��� ������ ������������ � ���������.
	b_printtrademsg1("������� ������.");
	b_logentry(CH1_BRINGLIST,"�� ��� ������� ������� ��� ������ ��� �����.");
	b_giveinvitems(self,hero,thelist,1);
	Npc_RemoveInvItem(self,thelist);
};


instance STT_301_IAN_NEST(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_nest_condition;
	information = stt_301_ian_nest_info;
	important = 0;
	permanent = 0;
	description = "���-�� ����� ������ ���� ������ ��������.";
};


func int stt_301_ian_nest_condition()
{
	if((CORKALOM_BRINGMCQBALLS == LOG_RUNNING) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return 1;
	};
};

func void stt_301_ian_nest_info()
{
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01");	//���-�� � ���� ����� ���� ������ ��� ������ ��������.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02");	//� �����, � ����� ����� ����� �� �����.
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03");	//������, ��� ����� ����� ���� �� ���...
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04");	//� ���� ������ ��� �� ��� �������. � ��� ����� ��������. ���� ����� ����� ��������� ����������. ��� ������ �����.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05");	//� � �� ����, ��� ����� ����� ����� �����.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06");	//�� ���� �� �������� �������� �����. � ������ ����.
	b_logentry(CH2_MCEGGS,"�� �� ����� �������� ��� ������ ������ ��������. ������� � ������ ����� ��� ����� ����������. �� ������, ��� ������� ���������� � ����� �� ����������� ������. ���-�� ��� ������ ������ ������ �����.");
	IAN_GEARWHEEL = LOG_RUNNING;
};


instance STT_301_IAN_GEAR_RUN(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_gear_run_condition;
	information = stt_301_ian_gear_run_info;
	important = 0;
	permanent = 0;
	description = "� ��� � ���� ����� ��� ����� ����������?";
};


func int stt_301_ian_gear_run_condition()
{
	printdebugint(PD_MISSION,"Ian_gearwheel:",IAN_GEARWHEEL);
	if((IAN_GEARWHEEL == LOG_RUNNING) && !Npc_HasItems(hero,itmi_stuff_gearwheel_01))
	{
		return 1;
	};
};

func void stt_301_ian_gear_run_info()
{
	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01");	//� ��� � ���� ����� ��� ����� ����������?
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02");	//������� �� ����. � ���� ������� ��, ������� � ��.
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03");	//������, ��-�����, � ����� �� ������ ���� ������ ��������� �����.
};


instance STT_301_IAN_GEAR_SUC(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_gear_suc_condition;
	information = stt_301_ian_gear_suc_info;
	important = 0;
	permanent = 0;
	description = "� ����� ����������.";
};


func int stt_301_ian_gear_suc_condition()
{
	if(Npc_HasItems(hero,itmi_stuff_gearwheel_01) && (IAN_GEARWHEEL == LOG_RUNNING))
	{
		return 1;
	};
};

func void stt_301_ian_gear_suc_info()
{
	IAN_GEARWHEEL = LOG_SUCCESS;
	b_givexp(XP_BRINGGEARWHEEL);
	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01");	//� ����� ����������.
	b_printtrademsg1("������ ����������.");
	Npc_RemoveInvItem(hero,itmi_stuff_gearwheel_01);
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02");	//�! �������� ������! �����, ��� ��� ��� ��������. ��� �, �������� � ����� ��������. �� ����� ������ ��������, ��? ��...
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03");	//����� � �������, �� ������� ���� ������. ��������, ��, ��� �� �����, ��������� ������ ���.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04");	//����� ���: '��� ����� � �������'. ��� �� ������, ��� � ��� ���� ��������.
	b_logentry(CH2_MCEGGS,"� ������ ��� ����������, ������ �� ������� ������� ������. �� ������, ��� ����� � ���� �������� � ��������, � ������ �������� ��� ����� '��� ����� � �������'. ����� �� ������� ������ � ����������� ����� �����.");
};


instance STT_301_IAN_GOTOASGHAN(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_gotoasghan_condition;
	information = stt_301_ian_gotoasghan_info;
	important = 0;
	permanent = 0;
	description = "� ��� ��� �� ����� ������ ��������!";
};


func int stt_301_ian_gotoasghan_condition()
{
	if((IAN_GEARWHEEL == LOG_SUCCESS) && !Npc_KnowsInfo(hero,grd_263_asghan_nest))
	{
		return 1;
	};
};

func void stt_301_ian_gotoasghan_info()
{
	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01");	//� ��� ��� �� ����� ������ ��������!
	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02");	//� �� ������, ����� � �������. �� ����������� ����������. �� ������� ��� �� ������ ���������.
	b_logentry(CH2_MCEGGS,"���� � ���� ����� ������ ��������, �� ������ ���������� � ��������.");
};


instance STT_301_IAN_AFTERALL(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_afterall_condition;
	information = stt_301_ian_afterall_info;
	important = 0;
	permanent = 0;
	description = "� ����� ������ ��������!";
};


func int stt_301_ian_afterall_condition()
{
	if(Npc_HasItems(hero,itat_crawlerqueen) >= 3)
	{
		return 1;
	};
};

func void stt_301_ian_afterall_info()
{
	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01");	//� ����� ������ ��������!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02");	//� ����� ����� ����� ���� � ��������!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03");	//�����, �� ��������. �� ������ ���������!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04");	//���, ������ ���� ���� ���� ����. ��� ���� �������.
	b_printtrademsg1("�������� 5 ������� �������� ����.");
	CreateInvItems(self,itfo_om_beer_01,5);
	b_giveinvitems(self,hero,itfo_om_beer_01,5);
};


instance STT_301_IAN_NOTENOUGH(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_notenough_condition;
	information = stt_301_ian_notenough_info;
	important = 0;
	permanent = 0;
	description = "� ����� ������ ��������. � ��� � ��� ���� ��� ��� ����.";
};


func int stt_301_ian_notenough_condition()
{
	if((Npc_HasItems(hero,itat_crawlerqueen) > 1) && (Npc_HasItems(hero,itat_crawlerqueen) < 3))
	{
		return TRUE;
	};
};

func void stt_301_ian_notenough_info()
{
	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01");	//� ����� ������ ��������. � ��� � ��� ���� ��� ��� ����.
	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02");	//���? �� ����� ��� ���� ���? ��, ��� �, �� ���� �� �������, ��� ������ �������.
};

instance STT_301_IAN_STEALLIST(C_INFO)
{
	npc = stt_301_ian;
	nr = 990;
	condition = stt_301_ian_steallist_condition;
	information = stt_301_ian_steallist_info;
	important = 0;
	permanent = 0;
	description = "(������� ������)";
};


func int stt_301_ian_steallist_condition()
{
	if(!Npc_KnowsInfo(hero,org_801_lares_bringlistback) && !Npc_KnowsInfo(hero,stt_301_ian_getlist) && !Npc_KnowsInfo(hero,info_diego_bringlist_success) && Npc_KnowsInfo(hero,org_801_lares_newlist) && Npc_HasItems(self,thelist) && Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1 && Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1)
	{
		return TRUE;
	};
};

func void stt_301_ian_steallist_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11");	//������ ����... �... ��� ��� ����� �������!
	AI_Output(self,other,"DIA_ARTO_PERM_13_01");	//�����.
	AI_TurnAway(self,other);
	AI_PlayAni(other,"T_STAND_2_IGET");
	AI_PlayAni(other,"T_IGET_2_STAND");
	AI_PlayAni(self,"T_SEARCH");
	PrintScreen("������� ������.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,thelist);
	Npc_RemoveInvItem(self,thelist);
	AI_WhirlAround(self,other);
	AI_Output(self,other,"SVM_13_YouWannaFoolMe");	//�������� ���� �������? ������ ��������!
	b_logentry(THELISTFORNC,"�� �������� ��� � �������� ���� ������. ������ ����� ������� ��� ������ � ����� ������.");
	AI_StopProcessInfos(self);
};

