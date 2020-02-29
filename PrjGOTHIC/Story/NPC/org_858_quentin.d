
instance ORG_858_QUENTIN(NPC_DEFAULT)
{
	name[0] = "�������";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 20;
	voice = 0;
	id = 858;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,4,"Hum_Head_Pony",11,1,org2m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,50);
	CreateInvItem(self,itke_quentin);
	CreateInvItems(self,itfo_potion_health_01,2);
	EquipItem(self,itmw_1h_mace_war_04);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_858;
};


func void rtn_start_858()
{
	ta_boss(13,0,14,0,"LOCATION_11_09");
	ta_boss(14,0,13,0,"LOCATION_11_09");
};

instance INFO_QUENTIN_EXIT(C_INFO)
{
	npc = org_858_quentin;
	nr = 999;
	condition = info_quentin_exit_condition;
	information = info_quentin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int info_quentin_exit_condition()
{
	return 1;
};

func void info_quentin_exit_info()
{
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA1(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia1_condition;
	information = quentin_dia1_info;
	permanent = 0;
	important = 1;
};

func int quentin_dia1_condition()
{
	if(Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void quentin_dia1_info()
{
	AI_Output(self,hero,"Quentin_DIA1_01");	//��� �� ����� �������, ������?
	if(OC_BANNED == TRUE)
	{
		AI_Output(hero,self,"Sld_700_Lee_CHANGESIDE_Info_15_01");	//���� �������� �� ������� ������. � ���� �������������� � ���?
		AI_Output(self,hero,"Quentin_DIA1_02");	//� ��� ��� ���������. ��� �� ������ �� �� ������? ����� ���-��? ���� ��������?
		AI_Output(self,hero,"Quentin_DIA1_03");	//�������, �������... ���� ������ - ��� ����. �� ��� ��� ������, ��� �� �� ��� �����?
		AI_Output(hero,self,"Info_Thorus_MordragKo_Offer_15_00");	//� ������� ���� �������.
	}
	else
	{
		AI_Output(hero,self,"DIA_Roscoe_WannaJoin_15_00");	//� ���� �������������� � ���.
		AI_Output(self,hero,"Quentin_DIA1_04");	//��������? ��� ��� ������? � ����� �� ��� �����?
		AI_Output(hero,self,"DIA_Gomez_Fault_15_00");	//� ������ ���������� ���� ������.
	};	
	AI_Output(self,hero,"Quentin_DIA1_05");	//���... �����, �� �� ����� �� ������� ��������. � ��� ���� ����.
	AI_Output(self,hero,"Quentin_DIA1_06");	//������ � ������ ��������� ��������� ����� � ����� ��� ���� �� ����� �����. �� �������� �� ����.
	b_usefakescroll();
	AI_Output(self,hero,"Quentin_DIA1_07");	//������� ��� ��� ������ - � �� ���� ������, �����?
	b_printtrademsg1("�������� ������.");
	AI_Output(hero,self,"DIA_Fletcher_Hello_ISee_15_00");	//��� �������.
	CreateInvItem(hero,calashnote);
	b_logentry(QUENTIN_GANG,"������� �������� ���� � ������ ��������� ��������� �����, ��� � ������ ���� �������� ������ ���� �� ����� �����.");
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA2(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia2_condition;
	information = quentin_dia2_info;
	permanent = 0;
	description = "��, ��� ��...";
};

func int quentin_dia2_condition()
{
	if(Npc_KnowsInfo(hero,info_calash_dia1) || Npc_HasItems(hero,calashnote2))
	{
		return 1;
	};
};

func void quentin_dia2_info()
{
	AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//��, ��� ��...
	AI_Output(self,hero,"Quentin_DIA2_01");	//��! � �� ��� �����? �����, ��� ����� �������� �� ���� �����-������ "��������� ������� ���������� ��������"?
	AI_Output(self,hero,"Quentin_DIA2_02");	//����� �������, ���, �� ����, ��������� ������...
	AI_Output(self,hero,"Quentin_DIA2_03");	//�����, ����� � �������. ����, ��� �� ��������, �� �������� ��������. ����� ��������� ��� �����������?
	Info_ClearChoices(quentin_dia2);
	Info_AddChoice(quentin_dia2,"��.",quentin_dia2_yes);
	Info_AddChoice(quentin_dia2,"� �� ����� �� ��...",quentin_dia2_fuckoff);
};

func void quentin_dia2_yes()
{
	AI_Output(hero,self,"Info_Swiney_Schuerfer_Ja_15_00");	//��.
	AI_Output(self,hero,"Quentin_DIA2_05");	//��� ��� ��� ��������! � ������ ������.
	AI_Output(self,hero,"Quentin_DIA2_06");	//��� ��������� ������� �� �������� �������� ������ �������� �� ������ ���������, �� ����������.
	AI_Output(self,hero,"Quentin_DIA2_07");	//�� �������� ���� ����������� ����, ������� ������ ��������� �� ����. � ��������� ���� ������ ��������� �����-�� �������� �� �������.
	AI_Output(self,hero,"Quentin_DIA2_08");	//�������� � ���, ��� ������ ����� ������ ��������� ����, � ��� ��� - ������� ����. ��� ���� �� ������� ����������� � ���.
	if(Npc_GetTrueGuild(hero) == GIL_NOV || Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(self,hero,"Quentin_DIA2_09");	//����� ������, ��� �� ��� ������������ � ���������, �� ������ ��� ����� �������.
	};
	AI_Output(self,hero,"Quentin_DIA2_10");	//����������� � �������� ������, ���������. �� �� ������� ����� ������ � ���� �� ��������. ������� �� ���, ���� ������� ������.
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//� ���������� ����� ��� ����!
	AI_Output(self,hero,"Quentin_DIA2_11");	// � ������ �� ����� � ����� ����� - �� ����� ������������ �� �����!
	Info_ClearChoices(quentin_dia2);
	b_logentry(QUENTIN_GANG,"����� ������� �� ��������, �� ���� ��� ���������� - ����� ������ ��������. �������, ��� ��� ����� ������ ����� ��������� �������� �� ��������� ������. ��� �� ��� ����� ������?");
	AI_StopProcessInfos(self);
};

func void quentin_dia2_fuckoff()
{
	AI_Output(hero,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00");	//� �� ����� �� ��...
	AI_Output(self,hero,"Quentin_DIA2_04");	//��, ��� ������. ��, �����, ����� ���!
	b_setorg2hostile();
	Info_ClearChoices(quentin_dia2);
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		b_logentry(QUENTIN_GANG,"� ������ ���� �������� �������� ������ � ��� �������. �������� ��� ���!");
	};
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA3(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia3_condition;
	information = quentin_dia3_info;
	permanent = 0;
	description = "���, ������ ���. ��� �� � ������.";
};

func int quentin_dia3_condition()
{
	if(Npc_KnowsInfo(hero,quentin_dia2) && Npc_HasItems(hero,itmi_amulet_psi_01))
	{
		return 1;
	};
};

func void quentin_dia3_info()
{
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//���, ������ ���. ��� �� � ������.
	b_printtrademsg1("����� ������.");
	b_giveinvitems(hero,self,itmi_amulet_psi_01,1);
	b_givexp(300);
	AI_Output(self,hero,"Quentin_DIA3_01");	//�� ����� ����! �� ������ ��, ��� �� ��������� ���� ������ ��������� �������! �������, � ������������ ����...
	AI_TurnToNPC(self,org_869_raeuber);
	AI_Output(self,hero,"Quentin_DIA3_02");	//��, ��������! ����������, ��� ������ ��� ������!
	AI_TurnToNPC(self,hero);
	AI_Output(self,hero,"Quentin_DIA3_03");	//�������, � ��� �� ����� ����, ������� ������ � ��������� ���� ���� �� �������� �������, �� ������ ��� �� � ������ ������� ��������.
	AI_Output(self,hero,"Quentin_DIA3_04");	//�������, � ��� ���� ���� � �������� ��������� ��� ���� ������� ��� ����. ��� �������?
	b_logentry(QUENTIN_GANG,"� ������ ������, ������� ��� � ������ ��������.");
};

instance QUENTIN_DIA33(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia33_condition;
	information = quentin_dia33_info;
	permanent = 0;
	description = "������ ����!";
};

func int quentin_dia33_condition()
{
	if(Npc_KnowsInfo(hero,quentin_dia3))
	{
		return 1;
	};
};

func void quentin_dia33_info()
{
	AI_Output(hero,self,"DIA_Horatio_HelpSTR_15_02");	//������ ����!
	AI_Output(self,hero,"Quentin_DIA3_05");	//������� �� ��������� ������ ��������� �� ����� ������� �� ����� �������.
	AI_Output(self,hero,"Quentin_DIA3_06");	//�� ������ ��� ������� ��� �������� ������ ������� �����, �� ��������� �����.
	AI_Output(self,hero,"Quentin_DIA3_07");	//�� ����, �� �����! ������� ���! �� ����� �����, ��� �� ��� � �������� ���-�� � ������ ������� ������. �� � �������� �� ����� �������.
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01");	//������ �� ���� �� ������� ������?
	AI_Output(self,hero,"Quentin_DIA3_08");	//���������, ��������.
	AI_Output(self,hero,"Quentin_DIA3_09");	//����� ��� � ������� ��� ��, ��� ����������� ���! � ������ ����� �������� ���� �� �������, ���� ����������� - ����.
	AI_Output(hero,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00");	//� ������� ��.
	AI_Output(self,hero,"Quentin_DIA3_10");	//��� ��� ������� �� ������. ������ ���� � ��� ������, �� �������� ���. ����� ���������� � �����!
	b_printtrademsg1("�������� ����: 400");
	b_printtrademsg2("������� ������ ���������.");
	CreateInvItems(self,itminugget,400);
	b_giveinvitems(self,hero,itminugget,400);
	if(KAPITEL == 1)
	{
		CreateInvItems(hero,org2n,1);
		AI_EquipArmor(hero,org2n);
	}
	else
	{
		CreateInvItems(hero,org2l,1);
		AI_EquipArmor(hero,org2l);
	};
	b_logentry(QUENTIN_GANG,"��������� �������� �������� �������� �� ������� ������, ������ �� ���� ��� �������. ���� �� ����, ��� ��� ��������, �� ��� ����� ����� ������ ��������, ������� �������� ���-�� ���������� �� ������� ������.");
};

instance QUENTIN_DIA4(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia4_condition;
	information = quentin_dia4_info;
	permanent = 0;
	description = "��� ���� ����.";
};

func int quentin_dia4_condition()
{
	if(Npc_KnowsInfo(hero,quentin_dia33) && Npc_HasItems(hero,itke_gilbert))
	{
		return 1;
	};
};

func void quentin_dia4_info()
{
	AI_Output(hero,self,"Info_Aaron_SELLNOW_15_01");	//��� ���� ����.
	AI_Output(self,hero,"Quentin_DIA4_01");	//�������! � ��� � ���������?
	if(Npc_IsDead(non_1500_gilbert))
	{
		AI_Output(hero,self,"DIA_Fletcher_WegenNek_15_04");	//���� ������ ��� ����...
	}
	else
	{
		AI_Output(hero,self,"KDW_600_Saturas_TIMESUP_Info_15_09");	//��� ������ �� ���, ��� �� �������...
	};
	AI_Output(self,hero,"Quentin_DIA4_02");	//�������. � ������ ������ ���� �����������, � ��� ���� �������.
	AI_Output(self,hero,"Quentin_DIA4_03");	//�� ������ �� ������ ������� ������� � ������ ������, ������� ������������ � ������ �����������.
	AI_Output(self,hero,"Quentin_DIA4_04");	//�������� �����, ������� �� ������, ��������� ���� �� ����� � ���� ������. � ��� ����� ��� �������, �����.
	AI_Output(self,hero,"Quentin_DIA4_05");	//��� ������� ��������� ������ ����� � �� �������� ���������� ���! ��� ����� ���� ������.
	if(FMTAKEN == TRUE)
	{
		AI_Output(hero,self,"Info_Saturas_MURDER_15_01");	//����� ���� ���� ����� ����� ����!
		AI_Output(hero,self,"Info_Saturas_MURDER_15_03");	//��� �� ���������� ������ � ��������� ������ ��������� �� ��������� �����.
		AI_Output(self,hero,"Quentin_DIA4_12");	//��������? ��� ��� ������, � ������ ������ ������ ������� ������... ������, � �������� � ����� ������ ��������.
		AI_Output(self,hero,"Quentin_DIA4_13");	//�� ����� ����� ���� � ����� �� ����� �������. �������� � ��� ��� ������ ������� ������ ������� � �����.
		AI_Output(self,hero,"Quentin_DIA4_14");	//���������� ������ � ������ ������������ � ������ �� ������.
		AI_Output(hero,self,"GUR_1201_CorKalom_RAT_Info_15_01");	//��, ���� ���� ��������� �������� �����������...
		b_logentry(QUENTIN_GANG,"�������� ��������, ������� � ������, ��� ��������� - ����� ����� �� ������ � ������ �������, ���� ������� ������ �� ����������, ������.");
		b_logentry(QUENTIN_GANG,"������� ����������� ����� � ������� ��� ������� ���� � ����� �����. ��� ������� ���� �� ����������, � ����� ��� �� ������ �������. ������ �� ��������� ������ � ��� ������ �������� � ������.");
		Wld_InsertNpc(org_897_mort,"OCC_CELLAR_LAST_ROOM");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(hero,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//��� � ���� ��� ������?
		AI_Output(self,hero,"Quentin_DIA4_06");	//� �� ���� ��������� � ����� ����� �������, ����� ����� ���������� � ���������� ������. � ��� ���� ����.
		if(Npc_GetTrueGuild(hero) == GIL_GRD || Npc_GetTrueGuild(hero) == GIL_STT || Npc_GetTrueGuild(hero) == GIL_KDF)
		{
			AI_Output(self,hero,"Quentin_DIA4_07");	//�� ��� ������������ � ������� ������, � ���� �� ������ ���������� �������.
		};
		AI_Output(self,hero,"Quentin_DIA4_08");	//������ ��� ������ ��������� � ���, ������� ��� ��� ������.
		b_printtrademsg1("�������� ����������.");
		AI_Output(self,hero,"Quentin_DIA4_09");	//����� ��� ����������� ����� ������� ������, ������ ��� �� �� ������� ����� ������ ������.
		AI_Output(self,hero,"Quentin_DIA4_10");	//�� ���� �������� �������� �� ��������������, ��� � �� ����� ���� ������.
		AI_Output(self,hero,"Quentin_DIA4_11");	//���������� � ������ �����, ����� ����������� ���������� � ����������� ����� �����.
		AI_Output(hero,self,"DIA_Jesse_Mission_YES_15_00");	//� ��������, ��� ��� ����� �������...
		AI_Output(self,hero,"Quentin_DIA4_15");	//���� ���������! �� ��� ������������ �� ����!
		CreateInvItems(self,alexstuff,1);
		b_giveinvitems(self,hero,alexstuff,1);
		b_logentry(QUENTIN_GANG,"�������� ��������, ������� � ������, ��� ��������� - ����� ����� �� ������ � ������ �������, ���� ������� ������ �� ����������, ������.");
		b_logentry(QUENTIN_GANG,"������� ����������� ��� ����� � ��� ��� ������ ��������� � ������ ���. ����� ��� ����������� ����� ������� ������. ��� ��� � ������ �������� ������ � ������� ��� �� ������. ������ �� ��������� ���.");
	};
	b_givexp(300);
};

var C_ITEM armor;

instance QUENTIN_DIA0(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia0_condition;
	information = quentin_dia0_info;
	permanent = 0;
	important = 1;
};

func int quentin_dia0_condition()
{
	armor = Npc_GetEquippedArmor(hero);
	if(!Npc_KnowsInfo(hero,quentin_dia33) && Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(org2l))
	{
		return 1;
	};
};

func void quentin_dia0_info()
{
	AI_DrawWeapon(self);
	AI_Output(self,hero,"Quentin_DIA0_01");	//�� ������� ���!
	b_setorg2hostile();
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING && !Npc_KnowsInfo(hero,dia_raven_quentin))
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		b_logentry(QUENTIN_GANG,"�� ��������� ��� ������� ���������� ����� � ��� ��� �����... ������ ����� ������ � ������ � ���������� �����!");
	};
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA5(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia5_condition;
	information = quentin_dia5_info;
	permanent = 0;
	important = 1;
};

func int quentin_dia5_condition()
{
	if(Npc_KnowsInfo(hero,info_alex_bye))
	{
		return 1;
	};
};

func void quentin_dia5_info()
{
	AI_Output(self,hero,"Quentin_DIA5_01");	//�������� ������! ��� ���� � ���������, ��������� ����! �� �� ���������� ���� ��������.
	AI_Output(self,hero,"Quentin_DIA5_02");	//�������, ��� ���� �������.
	b_printtrademsg1("�������� ����: 500");
	AI_Output(self,hero,"Quentin_DIA5_03");	//������ ����� � ����� ����� �����. ������ ����� ��� � ����� �� ����� ��� �����-������ ����, �� ������� ����.
	AI_Output(self,hero,"Quentin_DIA5_04");	//������ ��������� �������� �� �������, �� �������, ����� ��� ����� �������. �� � � ����� �� �� �������.
	b_givexp(400);
	CreateInvItems(self,itminugget,500);
	b_giveinvitems(self,hero,itminugget,500);
	QUENTIN_GANG_QUEST_STARTED = LOG_SUCCESS;
	Log_SetTopicStatus(QUENTIN_GANG,LOG_SUCCESS);
	b_logentry(QUENTIN_GANG,"����� ������� �������� �� ������ ����������. � ���� ���, ��� ��� ������ �� ����� �������� ���, ����� �����������. � � �������� ���� ��� ��� ���� ����� �������, ����� �������� ���-�� ������. ��������, ������� ����������� ����!");
	AI_StopProcessInfos(self);
};

instance QUENTIN_DIA51(C_INFO)
{
	npc = org_858_quentin;
	nr = 1;
	condition = quentin_dia51_condition;
	information = quentin_dia51_info;
	permanent = 0;
	important = 1;
};

func int quentin_dia51_condition()
{
	if(!Npc_KnowsInfo(hero,info_alex_bye) && Npc_KnowsInfo(hero,info_alex_letsgo) && FMTAKEN == TRUE)
	{
		return 1;
	};
};

func void quentin_dia51_info()
{
	AI_Output(self,hero,"Quentin_DIA5_01");	//�������� ������! ��� ���� � ���������, ��������� ����! �� �� ���������� ���� ��������.
	AI_Output(self,hero,"Quentin_DIA5_02");	//�������, ��� ���� �������.
	b_printtrademsg1("�������� ����: 500");
	AI_Output(self,hero,"Quentin_DIA5_03");	//������ ����� � ����� ����� �����. ������ ����� ��� � ����� �� ����� ��� �����-������ ����, �� ������� ����.
	AI_Output(self,hero,"Quentin_DIA5_04");	//������ ��������� �������� �� �������, �� �������, ����� ��� ����� �������. �� � � ����� �� �� �������.
	b_givexp(400);
	var C_NPC alex;
	alex = Hlp_GetNpc(org_899_alex);
	b_fullstop(alex);
	b_exchangeroutine(alex,"Camp");
	b_clearimmortal(alex);
	CreateInvItems(alex,itmw_1h_mace_03,1);
	EquipItem(alex,itmw_1h_mace_03);
	CreateInvItems(alex,itrw_bow_long_01,1);
	EquipItem(alex,itrw_bow_long_01);
	CreateInvItems(alex,itamarrow,200);
	alex.aivar[AIV_PARTYMEMBER] = FALSE;
	var C_NPC org897;
	org897 = Hlp_GetNpc(org_897_mort);
	b_fullstop(org897);
	b_exchangeroutine(org897,"Camp");
	org897.aivar[AIV_PARTYMEMBER] = FALSE;
	CreateInvItems(self,itminugget,500);
	b_giveinvitems(self,hero,itminugget,500);
	QUENTIN_GANG_QUEST_STARTED = LOG_SUCCESS;
	Log_SetTopicStatus(QUENTIN_GANG,LOG_SUCCESS);
	b_logentry(QUENTIN_GANG,"����� ������� �������� �� ������ ����������. � ���� ���, ��� ��� ������ �� ����� �������� ���, ����� �����������. � � �������� ���� ��� ��� ���� ����� �������, ����� �������� ���-�� ������. ��������, ������� ����������� ����!");
	AI_StopProcessInfos(self);
};
