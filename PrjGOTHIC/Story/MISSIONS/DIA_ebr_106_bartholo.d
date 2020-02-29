
var int bartholo_key_removed;

instance DIA_BARTHOLO_EXIT(C_INFO)
{
	npc = ebr_106_bartholo;
	nr = 999;
	condition = dia_bartholo_exit_condition;
	information = dia_bartholo_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_bartholo_exit_condition()
{
	return 1;
};

func void dia_bartholo_exit_info()
{
	if(!Npc_HasItems(self,itke_storage_01) && bartholo_key_removed == 1)
	{
		CreateInvItem(self,itke_storage_01);
		bartholo_key_removed = 0;
	};
	AI_StopProcessInfos(self);
};

instance INFO_BARTHOLO_HALLO(C_INFO)
{
	npc = ebr_106_bartholo;
	nr = 4;
	condition = info_bartholo_hallo_condition;
	information = info_bartholo_hallo_info;
	permanent = 0;
	description = "��� ��?";
};


func int info_bartholo_hallo_condition()
{
	return 1;
};

func void info_bartholo_hallo_info()
{
	AI_Output(other,self,"Info_Bartholo_HAllo_15_00");	//��� ��?
	AI_Output(self,other,"Info_Bartholo_HAllo_12_01");	//� �������. �����, ����� ������ �������� ������� �������.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_02");	//���, ��������, �������������� ��� ������...
	AI_Output(self,other,"Info_Bartholo_HAllo_12_03");	//����� ���������� ������� �� ����� �������� ��������.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_04");	//����� �� ����� �����������. ��������� ���� ������� �� ������� ������ ������.
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"� ������� ����� ������ ���, �������� � ������ �������. � ���� ����� ��� � ����� �������.");
};


instance INFO_BARTHOLO_PERM(C_INFO)
{
	npc = ebr_106_bartholo;
	nr = 4;
	condition = info_bartholo_perm_condition;
	information = info_bartholo_perm_info;
	permanent = 1;
	description = "� ���� ����������� � �����.";
	trade = 1;
};

func int info_bartholo_perm_condition()
{
	if((KAPITEL <= 3) && Npc_KnowsInfo(hero,info_bartholo_hallo))
	{
		return 1;
	};
};

func void info_bartholo_perm_info()
{
	AI_Output(other,self,"Info_Bartholo_PERM_15_00");	//� ���� ����������� � �����.
	AI_Output(self,other,"Info_Bartholo_PERM_12_01");	//� ���� ����� ���� ���� ��� ���, � ���� ���� ����, �������.
	if(Npc_HasItems(self,itke_storage_01))
	{
		Npc_RemoveInvItems(self,itke_storage_01,1);
		bartholo_key_removed = 1;
	};
	if(Npc_HasItems(self,itmilute))
	{
		Npc_RemoveInvItems(self,itmilute,Npc_HasItems(self,itmilute));
	};
};

instance INFO_BARTHOLO_KRAUTBOTE(C_INFO)
{
	npc = ebr_106_bartholo;
	nr = 4;
	condition = info_bartholo_krautbote_condition;
	information = info_bartholo_krautbote_info;
	permanent = 1;
	description = "� ���� �������� ��� ������. ��� ������ ��� �����.";
};


func int info_bartholo_krautbote_condition()
{
	if(KALOM_KRAUTBOTE == LOG_RUNNING && KALOM_DELIVEREDWEED == FALSE)
	{
		return 1;
	};
};

func void info_bartholo_krautbote_info()
{
	AI_Output(other,self,"Info_Bartholo_Krautbote_15_00");	//� ���� �������� ��� ������. ��� ������ ��� �����.
	AI_Output(self,other,"Info_Bartholo_Krautbote_12_01");	//������!
	if(Npc_HasItems(other,itmijoint_3) >= 30)
	{
		b_printtrademsg1("����� �������� (30).");
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_02");	//�-���������...
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_03");	//��� ������. � �� ����� ��� ����� ������ ��������. ��� ������ �����, ��� �� ��������� �������.
		AI_Output(other,self,"Info_Bartholo_Krautbote_15_04");	//��� ������ �����?
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_05");	//�� ��� ������... ���, �����. ��� �������������� - ���� �����.
		b_printtrademsg2("�������� ����: 500");
		b_giveinvitems(other,self,itmijoint_3,30);
		CreateInvItems(self,itminugget,500);
		b_giveinvitems(self,other,itminugget,500);
		KALOM_DELIVEREDWEED = TRUE;
		b_logentry(CH1_KRAUTBOTE,"������� ��� ��� 500 ������ ���� �� ��������, ������� � ������ ��� ������.");
		b_givexp(XP_WEEDSHIPMENTDELIVERED);
	}
	else
	{
		AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//��...
		AI_Output(self,other,"Info_Bartholo_Krautbote_NoKraut_12_00");	//� ���� ������� ���� ���������! �������, �� �� ������ ��� �� �������. ����� ���������� �����, ����� � �������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_EBR_106_BARTHOLO_WAIT4SC(C_INFO)
{
	npc = ebr_598_bartholo;
	condition = dia_ebr_106_bartholo_wait4sc_condition;
	information = dia_ebr_106_bartholo_wait4sc_info;
	important = 1;
	permanent = 0;
};


func int dia_ebr_106_bartholo_wait4sc_condition()
{
	if(EXPLORESUNKENTOWER && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400) && Npc_HasItems(hero,itarrune_1_3_teleport1))
	{
		return TRUE;
	};
};

func void dia_ebr_106_bartholo_wait4sc_info()
{
	var C_NPC grd_220;
	var C_NPC grd_221;
	AI_SetWalkMode(self,NPC_WALK);
	AI_UnreadySpell(hero);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bartholo_12_01");	//� ����, ��� ���-������ ���������� ��������� �� ��� ����� �����������!
	AI_Output(self,other,"Info_Bartholo_12_02");	//�� � ������� �� ����� ��������� ������� ������, �� ��� ������ �� �����!
	AI_Output(other,self,"Info_Bartholo_15_03");	//��� �����?
	AI_Output(self,other,"Info_Bartholo_12_04");	//�� ��������! � �� ����� ������ ��������� �� �������� ����.
	AI_Output(self,other,"Info_Bartholo_12_05");	//����� ���, �����! �������� �� �����!
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
	b_setpermattitude(self,ATT_HOSTILE);
	grd_220 = Hlp_GetNpc(grd_220_gardist);
	grd_221 = Hlp_GetNpc(grd_221_gardist);
	grd_220.guild = GIL_GRD;
	Npc_SetTrueGuild(grd_220,GIL_GRD);
	grd_221.guild = GIL_GRD;
	Npc_SetTrueGuild(grd_221,GIL_GRD);
	b_setpermattitude(grd_220,ATT_HOSTILE);
	b_setpermattitude(grd_221,ATT_HOSTILE);
};

instance DIA_EBR_106_BARTHOLO_WAIT4SC2(C_INFO)
{
	npc = ebr_598_bartholo;
	condition = dia_ebr_106_bartholo_wait4sc2_condition;
	information = dia_ebr_106_bartholo_wait4sc2_info;
	important = 1;
	permanent = 0;
};


func int dia_ebr_106_bartholo_wait4sc2_condition()
{
	if(KAPITEL > 3 && !Npc_HasItems(hero,itarrune_1_3_teleport1) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void dia_ebr_106_bartholo_wait4sc2_info()
{
	var C_NPC grd_220;
	var C_NPC grd_221;
	AI_SetWalkMode(self,NPC_WALK);
	AI_UnreadySpell(hero);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"SVM_12_YouViolatedForbiddenTerritory");	//��� ��� �� ����� �������?
	AI_Output(self,other,"Info_Bartholo_12_05");	//����� ���, �����! �������� �� �����!
	if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_fletcher_die) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	};
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
	if(c_npcbelongstooldcamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_NONE);
		hero.guild = GIL_NONE;
	};
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
	b_setpermattitude(self,ATT_HOSTILE);
	grd_220 = Hlp_GetNpc(grd_220_gardist);
	grd_221 = Hlp_GetNpc(grd_221_gardist);
	grd_220.guild = GIL_GRD;
	Npc_SetTrueGuild(grd_220,GIL_GRD);
	grd_221.guild = GIL_GRD;
	Npc_SetTrueGuild(grd_221,GIL_GRD);
	b_setpermattitude(grd_220,ATT_HOSTILE);
	b_setpermattitude(grd_221,ATT_HOSTILE);
};
