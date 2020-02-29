
instance ORG_867_RAEUBER(NPC_DEFAULT)
{
	name[0] = NAME_RAEUBER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 12;
	voice = 12;
	id = 867;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",32,4,org2l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,3);
	CreateInvItems(self,itminugget,14);
	CreateInvItems(self,itfobooze,1);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_867;
};


func void rtn_start_867()
{
	ta_guard(13,0,14,0,"LOCATION_11_02");
	ta_guard(14,0,13,0,"LOCATION_11_02");
};


instance INFO_RAEUBER1_EXIT(C_INFO)
{
	npc = org_867_raeuber;
	nr = 998;
	condition = info_raeuber1_exit_condition;
	information = info_raeuber1_exit_info;
	permanent = 0;
	description = "����� � ����� ������...";
};

func int info_raeuber1_exit_condition()
{
	if(!Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void info_raeuber1_exit_info()
{
	AI_Output(hero,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01");	//����� � ����� ������...
	AI_Output(self,hero,"SVM_12_GetOutOfHere");	//�����! ����� ���� �� �����!
	AI_StopProcessInfos(self);
};

instance INFO_RAEUBER1_EXIT2(C_INFO)
{
	npc = org_867_raeuber;
	nr = 999;
	condition = info_raeuber1_exit2_condition;
	information = info_raeuber1_exit2_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int info_raeuber1_exit2_condition()
{
	if(Npc_KnowsInfo(hero,info_raeuber1_exit) || Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void info_raeuber1_exit2_info()
{
	AI_StopProcessInfos(self);
};

const string ORG_867_RAEUBER_CHECKPOINT = "LOCATION_11_03";

instance ORG_867_RAEUBER_GOAWAY(C_INFO)
{
	npc = org_867_raeuber;
	nr = 1;
	condition = org_867_raeuber_goaway_condition;
	information = org_867_raeuber_goaway_info;
	permanent = 1;
	important = 1;
};

func int org_867_raeuber_goaway_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return 1;
	};
};

func void org_867_raeuber_goaway_info()
{
	AI_Output(self,hero,"SVM_12_WhatsThisSupposedToBe");	//��, ��! �� ��� ����� �����?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ORG_867_RAEUBER_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
};

instance ORG_867_RAEUBER_GOAWAY2(C_INFO)
{
	npc = org_867_raeuber;
	nr = 1;
	condition = org_867_raeuber_goaway2_condition;
	information = org_867_raeuber_goaway2_info;
	permanent = 1;
	important = 1;
};

func int org_867_raeuber_goaway2_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,ORG_867_RAEUBER_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 95)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return 1;
	};
};

func void org_867_raeuber_goaway2_info()
{
	AI_Output(self,hero,"SVM_12_IWillTeachYouRespectForForeignProperty");	//������ � ���� ������ ������!
	AI_StopProcessInfos(self);
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ORG_867_RAEUBER_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
};

instance ORG_867_RAEUBER_ATTACK(C_INFO)
{
	npc = org_867_raeuber;
	nr = 1;
	condition = org_867_raeuber_attack_condition;
	information = org_867_raeuber_attack_info;
	permanent = 1;
	important = 1;
};

func int org_867_raeuber_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,ORG_867_RAEUBER_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 80)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return 1;
	};
};

func void org_867_raeuber_attack_info()
{
	AI_Output(self,hero,"SVM_12_IntruderAlert");	//�������!
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	b_setorg2hostile();
	AI_StopProcessInfos(self);
};

instance INFO_ORG2_JOIN(C_INFO)
{
	npc = org_867_raeuber;
	condition = info_org2_join_condition;
	information = info_org2_join_info;
	important = 0;
	permanent = 0;
	description = "� ���� �������������� � ���.";
};

func int info_org2_join_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void info_org2_join_info()
{
	AI_Output(hero,self,"DIA_Roscoe_WannaJoin_15_00");	//� ���� �������������� � ���.
	AI_Output(self,hero,"DIA_Cipher_Fisk_12_01");	//� ��� ��� �����������.
	AI_Output(hero,self,"DIA_Roscoe_BringList_15_06");	//��� � ���� ������?
	AI_Output(self,hero,"SVM_12_CheerFight");	//������!
	AI_Output(self,hero,"SVM_12_YouDefeatedVLK_Guard");	//���� �� ������ ����� � ���� ����������, � ����� � ����� ���������!
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		b_logentry(QUENTIN_GANG,"� ����� ������ ���������� � ����� �������������� � ���. ������ ��� ����� ���������� � �� ��������, ���������.");
	}
	else if(QUENTIN_GANG_QUEST_STARTED != LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_RUNNING;
		Log_CreateTopic(QUENTIN_GANG,LOG_MISSION);
		Log_SetTopicStatus(QUENTIN_GANG,LOG_RUNNING);
		b_logentry(QUENTIN_GANG,"� ����� ������ ���������� � ����� �������������� � ���. ������ ��� ����� ���������� � �� ��������.");
	};
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

instance INFO_ORG2_KILL(C_INFO)
{
	npc = org_867_raeuber;
	condition = info_org2_kill_condition;
	information = info_org2_kill_info;
	important = 0;
	permanent = 0;
	description = "� �� ������ ���� ����������?";
};

func int info_org2_kill_condition()
{
	if(!Npc_KnowsInfo(hero,info_org2_join))
	{
		return 1;
	};
};

func void info_org2_kill_info()
{
	AI_Output(hero,self,"Info_TPL_1455_GorBoba1_15_01");	//� �� ������ ���� ����������?
	AI_Output(self,hero,"SVM_12_IWillTeachYouRespectForForeignProperty");	//������ � ���� ������ ������!
	AI_Output(self,hero,"SVM_12_IntruderAlert");	//�������!
	b_setorg2hostile();
	AI_StopProcessInfos(self);
	if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING)
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
		Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
		b_logentry(QUENTIN_GANG,"� ����� ������ ���������� ��������, ������� ���������� � �����. ��� ����� �� ������ ���, ��� � ����������: ��� ����� ����������� �� ����.");
	};
};

