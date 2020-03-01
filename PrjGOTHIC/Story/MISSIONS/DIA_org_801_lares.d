
func void b_lareslearn()
{
	Info_ClearChoices(org_801_lares_teach);
	Info_AddChoice(org_801_lares_teach,DIALOG_BACK,org_801_lares_teach_back);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY * 5),org_801_lares_teach_str_5);
		Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),org_801_lares_teach_str_1);
		Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),org_801_lares_teach_dex_5);
		Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),org_801_lares_teach_dex_1);
	}
	else
	{
		Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_5);
		Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_1);
		Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_5);
		Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_1);
	};
};

instance ORG_801_LARES_EXIT(C_INFO)
{
	npc = org_801_lares;
	nr = 999;
	condition = org_801_lares_exit_condition;
	information = org_801_lares_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_801_lares_exit_condition()
{
	return 1;
};

func void org_801_lares_exit_info()
{
	AI_StopProcessInfos(self);
};


var int lares_vorbeigemogelt;

instance ORG_801_LARES_YOUHERE(C_INFO)
{
	npc = org_801_lares;
	nr = 1;
	condition = org_801_lares_youhere_condition;
	information = org_801_lares_youhere_info;
	permanent = 1;
	important = 1;
};


func int org_801_lares_youhere_condition()
{
	var C_NPC roscoe;
	roscoe = Hlp_GetNpc(org_840_roscoe);
	if(roscoe.aivar[AIV_PASSGATE] == FALSE && LARES_VORBEIGEMOGELT == FALSE)
	{
		return 1;
	};
};

func void org_801_lares_youhere_info()
{
	var C_NPC roscoe;
	roscoe = Hlp_GetNpc(org_840_roscoe);
	if((Npc_IsInState(roscoe,zs_magicsleep) || (npc_gettempattitude(roscoe,other) == ATT_FRIENDLY) || Npc_IsInState(roscoe,zs_unconscious) || Npc_IsDead(roscoe)) && (hero.guild != GIL_GRD) && (hero.guild != GIL_STT))
	{
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00");	//��� �� ����� ����, � ��� ��������� � �����?
		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01");	//�� �� ������� ���� �������������.
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02");	//��� ���� �� ���� �����?
		roscoe.aivar[AIV_PASSGATE] = TRUE;
		LARES_VORBEIGEMOGELT = TRUE;
		b_givexp(XP_CHEATEDINTOLARESHUT);
	}
	else
	{
		AI_StopProcessInfos(self);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		b_intruderalert(self,other);
		b_setattackreason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,1,"");
	};
};


instance ORG_801_LARES_WANNAJOIN(C_INFO)
{
	npc = org_801_lares;
	nr = 1;
	condition = org_801_lares_wannajoin_condition;
	information = org_801_lares_wannajoin_info;
	permanent = 0;
	description = "� ���� ����� ����� �� ���.";
};


func int org_801_lares_wannajoin_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void org_801_lares_wannajoin_info()
{
	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00");	//� ���� ����� ����� �� ���.
	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01");	//��? � ��� �� ������ �����?
};

instance ORG_801_LARES_BRINGLIST(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_bringlist_condition;
	information = org_801_lares_bringlist_info;
	permanent = 0;
	description = "� ���� ���� ������ �������� ��� ������ �����.";
};


func int org_801_lares_bringlist_condition()
{
	if(Npc_HasItems(hero,thelist) && (Npc_KnowsInfo(hero,org_801_lares_newlist) || Npc_KnowsInfo(hero,info_diego_bringlist_offer)) && !Npc_KnowsInfo(hero,info_diego_ocwarn) && !Npc_KnowsInfo(hero,info_milten_ocwarn))
	{
		return 1;
	};
};

func void org_801_lares_bringlist_info()
{
	AI_Output(other,self,"ORG_801_Lares_BringList_15_00");	//� ���� ���� ������ �������� ��� ������ �����.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_01");	//�� �� ���? ����������! � �� ������ ������, ��� � �������.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_02");	//������ ��� ���!
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//��� ��...
	b_printtrademsg1("����� ������.");
	b_usefakescroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_04");	//���, ���. ������, ��� �� ������ �������? �� ��� ������� ���������, � ����� �� �������� ��� � ������ ������.
//	AI_Output(self,other,"ORG_801_Lares_BringList_11_05");	//� �����, ����� ��� �������� ����� � �����, �� ������ ������� ��� ����! ��, ���, ������ �� ��� �������... ����! ��� � ��������. �� ������, ��� ������.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05_01");	//� �����, ����� ��� �������� ����� � �����, �� ������ ������� ��� ����! ��, ���, ������ �� ��� �������...
	b_usefakescroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05_02");	//����! ��� � ��������. �� ������, ��� ������.
	b_printtrademsg2("������� ����������� ������.");
	//b_logentry(CH1_BRINGLIST,"����, ������� �����, �������� ������ � ����� ������� ��� �����.");
	POINTS_NC = POINTS_NC + 10;
	LARES_BRINGLISTBACK = LOG_RUNNING;
	Npc_RemoveInvItem(hero,thelist);
	CreateInvItem(hero,thelistnc);
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINNC,LOG_RUNNING);
		b_logentry(CH1_JOINNC,"����, ������� ����� �����, ��� ������ �������, ����� � ������ ��� ������. �� �������� ��� � ����� ������� �����.");
	};
	if(Npc_KnowsInfo(hero,info_diego_bringlist_offer))
	{
		b_logentry(CH1_BRINGLIST,"� ����� ������ ������ �����, ������� �����. �� �������� ��� � ����� ������� �����.");
	}
	else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,info_diego_bringlist_offer))
	{
		b_logentry(THELISTFORNC,"���� �������� ���������� ���� ������ � ����� ������� ��� �����.");
	};
	b_givexp(XP_GIVELISTTOLARES);
};


instance ORG_801_LARES_BRINGLISTBACK(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_bringlistback_condition;
	information = org_801_lares_bringlistback_info;
	permanent = 0;
	description = "� ������� ������ �����.";
};


func int org_801_lares_bringlistback_condition()
{
	if((LARES_BRINGLISTBACK == LOG_RUNNING) && (DIEGO_BRINGLIST == LOG_SUCCESS))
	{
		return 1;
	};
};

func void org_801_lares_bringlistback_info()
{
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00");	//� ������� ������ �����.
	AI_Output(self,other,"ORG_801_Lares_BringListBack_11_01");	//������! � ��� ��� �������� ����� ����� � ������ �����. ��������� ������ ������ ������ ������ ���� �������� � ����.
	POINTS_NC = POINTS_NC + 10;
	LARES_BRINGLISTBACK = LOG_SUCCESS;
	if(Npc_KnowsInfo(hero,info_diego_bringlist_offer))
	{
		b_logentry(CH1_BRINGLIST,"���� �� ����� ������ ����� �� ������ � ������ ��� ������ �����. �������, �� �� ������� ����� ����� �����������.");
		Log_SetTopicStatus(CH1_BRINGLIST,LOG_SUCCESS);
	}
	else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,info_diego_bringlist_offer))
	{
		b_logentry(THELISTFORNC,"���� �� ����� ������ ����� �� ������ � ������ ��� ������ �����. �������, �� �� ������� ����� ����� �����������.");
		Log_SetTopicStatus(THELISTFORNC,LOG_SUCCESS);
	};
	Log_SetTopicStatus(THELISTFORNC,LOG_SUCCESS);
	b_givexp(XP_REPORTLISTDELIVERYTOLARES);
	if(KAPITEL < 4)
	{
		b_exchangeroutine(grd_896_gardist,"dead2");
		b_exchangeroutine(grd_895_gardist,"dead2");
		b_exchangeroutine(grd_894_gardist,"dead2");
		b_exchangeroutine(grd_893_gardist,"dead2");
		b_exchangeroutine(grd_872_gardist,"dead2");
		b_killnpc(grd_896_gardist);
		b_killnpc(grd_895_gardist);
		b_killnpc(grd_894_gardist);
		b_killnpc(grd_893_gardist);
		b_killnpc(grd_872_gardist);
		Npc_RemoveInvItems(grd_896_gardist,itambolt,Npc_HasItems(grd_896_gardist,itambolt));
		Npc_RemoveInvItems(grd_895_gardist,itambolt,Npc_HasItems(grd_895_gardist,itambolt));
		Npc_RemoveInvItems(grd_894_gardist,itambolt,Npc_HasItems(grd_894_gardist,itambolt));
		Npc_RemoveInvItems(grd_893_gardist,itambolt,Npc_HasItems(grd_893_gardist,itambolt));
		Npc_RemoveInvItems(grd_872_gardist,itambolt,Npc_HasItems(grd_872_gardist,itambolt));
		Npc_RemoveInvItem(grd_896_gardist,itfomutton);
		Npc_RemoveInvItem(grd_895_gardist,itfomutton);
		Npc_RemoveInvItem(grd_894_gardist,itfomutton);
		Npc_RemoveInvItem(grd_893_gardist,itfomutton);
		Npc_RemoveInvItem(grd_872_gardist,itfomutton);
		Npc_RemoveInvItem(grd_896_gardist,itmw_1h_lightguardssword_03);
		Npc_RemoveInvItem(grd_895_gardist,itmw_1h_sword_03);
		Npc_RemoveInvItem(grd_894_gardist,itmw_1h_sword_03);
		Npc_RemoveInvItem(grd_893_gardist,itmw_1h_sword_03);
		Npc_RemoveInvItem(grd_872_gardist,itmw_1h_sword_03);
		Npc_RemoveInvItem(grd_896_gardist,itrw_crossbow_03);
		Npc_RemoveInvItem(grd_895_gardist,itrw_crossbow_03);
		Npc_RemoveInvItem(grd_894_gardist,itrw_crossbow_03);
		Npc_RemoveInvItem(grd_893_gardist,itrw_crossbow_03);
		Npc_RemoveInvItem(grd_872_gardist,itrw_crossbow_03);
		Npc_RemoveInvItem(grd_896_gardist,itfo_potion_health_01);
		Npc_RemoveInvItem(grd_895_gardist,itfo_potion_health_01);
		Npc_RemoveInvItem(grd_894_gardist,itfo_potion_health_01);
		Npc_RemoveInvItem(grd_893_gardist,itfo_potion_health_01);
		Npc_RemoveInvItem(grd_872_gardist,itfo_potion_health_01);
	};
};


instance ORG_801_LARES_BRINGLISTANTEIL(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_bringlistanteil_condition;
	information = org_801_lares_bringlistanteil_info;
	permanent = 0;
	description = "��� ���� �� ������� ������ ��� ��������? � ��� �� ��� ����?";
};


func int org_801_lares_bringlistanteil_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_bringlistback))
	{
		return 1;
	};
};

func void org_801_lares_bringlistanteil_info()
{
	var C_NPC gorn;
	AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_00");	//��� ���� �� ������� ������ ��� ��������? � ��� �� ��� ����?
	AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_01");	//��� � �����. �� ������ ���� ���� ����.
	gorn = Hlp_GetNpc(pc_fighter);
	if(gorn.aivar[AIV_FINDABLE] == TRUE)
	{
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_02");	//� ���� �����. �� ���� �� ���������, ������� �������� �����.
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_03");	//��, ��� � ����.
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_04");	//��� �� ���� � ���� ����������?
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_05");	//�� ������� ���������. ���� ��� ����� �� ��������. ������ ��� � ���� � ������ ���� ����.
	};
	b_logentry(CH1_JOINNC,"������� ���� �����-�� ������� ���������� � ��������� �� ���� �� ������� ������. � ���� ����� ���� ���� � ����.");
	gorn.aivar[AIV_FINDABLE] = TRUE;
};


instance ORG_801_LARES_MORDRAGSENTME(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_mordragsentme_condition;
	information = org_801_lares_mordragsentme_info;
	permanent = 0;
	description = "���� ������� �������. �� ������� ���� ��� ������.";
};


func int org_801_lares_mordragsentme_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wannajoin) && Npc_HasItems(hero,mordragsring) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void org_801_lares_mordragsentme_info()
{
	b_giveinvitems(other,self,mordragsring,1);
	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00");	//���� ������� �������. �� ������� ���� ��� ������.
	b_printtrademsg1("������ ������ ��������.");
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01");	//������� ������! � ��� ��� �������: ���� ���-��, �������� � �������� �����.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02");	//�� ��, ��� �� ������� ��� ������ ����, ������� � ���� ������.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03");	//� ����, ����� �� ������ � ���� � ������� ��� ���-��� �� ����.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04");	//����� ���, ��� ��� ����� ������� � ������ ��������� ������ ��������. � ���� �����, ��� ��� ��� ��������.
	LARES_INFORMMORDRAG = LOG_RUNNING;
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINNC,LOG_RUNNING);
		b_logentry(CH1_JOINNC,"���� ������ ���� � ��������. � ������ ������� ���, ��� � ������ ��������� ����� ������� ������. ���������� ���������, ��� ������� ������.");
	};
	b_givexp(XP_GIVERINGTOLARES);
	POINTS_NC = POINTS_NC + 10;
};


instance ORG_801_LARES_VORBEIGEMOGELT(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_vorbeigemogelt_condition;
	information = org_801_lares_vorbeigemogelt_info;
	permanent = 0;
	description = "�� � �� ���� ������ ���� ����� ����������.";
};


func int org_801_lares_vorbeigemogelt_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wannajoin) && (LARES_VORBEIGEMOGELT == TRUE))
	{
		return 1;
	};
};

func void org_801_lares_vorbeigemogelt_info()
{
	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00");	//�� � �� ���� ������ ���� ����� ����������.
	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01");	//�� ����. �� ����� ������������.
	POINTS_NC = POINTS_NC + 10;
};


var int lares_get400ore;

instance ORG_801_LARES_GETKRAUT(C_INFO)
{
	npc = org_801_lares;
	nr = 10;
	condition = org_801_lares_getkraut_condition;
	information = org_801_lares_getkraut_info;
	permanent = 0;
	description = "� ��� ��� ����� �������?";
};


func int org_801_lares_getkraut_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_bringlist) || Npc_KnowsInfo(hero,org_801_lares_mordragsentme) || Npc_KnowsInfo(hero,org_801_lares_vorbeigemogelt))
	{
		return 1;
	};
};

func void org_801_lares_getkraut_info()
{
	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00");	//� ��� ��� ����� �������?
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01");	//� ����� ������ �� ������ ��������� ���� ����� �� ��������� ������ ����. � ����, ����� �� ������ � ���� ��� �����. ��� �������, ����� �������.
	if((BAALISIDRO_DEALERJOB == LOG_RUNNING) || (BAALISIDRO_DEALERJOB == LOG_SUCCESS))
	{
		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02");	//������-��, � ���� ��� ���� �� ���� ���������, � ������� �� ��������.
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03");	//��, ����� �� ������!
	};
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04");	//���� ���, �� ������ � ������� ��� ��������� ������ ����.
	LARES_GET400ORE = LOG_RUNNING;
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05");	//����� ����� ����� ���������� � ����� ������ � ���� �����.
		Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINNC,LOG_RUNNING);
		b_logentry(CH1_JOINNC,"� ������ ����� �������� � ����� ������ � ������� ��� �� 400 ������ ����, ������� ����� �������� �����.");
	};
};


instance ORG_801_LARES_400ORE(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_400ore_condition;
	information = org_801_lares_400ore_info;
	permanent = 1;
	description = "� ���� ���� ��������� ������ ����.";
};


func int org_801_lares_400ore_condition()
{
	if((LARES_GET400ORE == LOG_RUNNING) && ((BAALISIDRO_DEALERJOB == LOG_RUNNING) || (BAALISIDRO_DEALERJOB == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void org_801_lares_400ore_info()
{
	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00");	//� ���� ���� ��������� ������ ����.
	if(Npc_HasItems(other,itminugget) >= 400)
	{
		b_printtrademsg1("������ ����: 400");
		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01");	//�������! �������, ��� ����� ��� ����������.
		LARES_GET400ORE = LOG_SUCCESS;
		POINTS_NC = POINTS_NC + 10;
		b_giveinvitems(other,self,itminugget,400);
		if(BAALISIDRO_DEALERJOB == LOG_RUNNING)
		{
			b_logentry(CH1_JOINNC,"���� ��� ����� ������� ���, ��� � ������ ��� 400 ������ ����, ���������� �� �������� ����� ������.");
		}
		else
		{
			b_logentry(CH1_JOINNC,"���� ��� ����� ������� ���, ��� � ������ ��� 400 ������ ����.");
		};
		b_givexp(XP_BAALISIDROPAYLARES);
	}
	else
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00");	//����������-�� ��� ���, ��� �� ���� �� �����.
	};
};


instance ORG_801_LARES_REICHT(C_INFO)
{
	npc = org_801_lares;
	nr = 5;
	condition = org_801_lares_reicht_condition;
	information = org_801_lares_reicht_info;
	permanent = 1;
	description = "����� ����������, ����� ���� ������� � �����?";
};


func int org_801_lares_reicht_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wannajoin) && (Npc_KnowsInfo(hero,org_801_lares_mordragsentme) || Npc_KnowsInfo(hero,org_801_lares_bringlist) || LARES_GET400ORE == LOG_SUCCESS) && (Npc_GetTrueGuild(other) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void org_801_lares_reicht_info()
{
	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00");	//����� ����������, ����� ���� ������� � �����?
	if((POINTS_NC >= 30) && (hero.level >= 5))
	{
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00");	//�����, ��.
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01");	//� ���� ���������� ���� ������� - ������, ���� ���� ������. �������, �������, ���������, �� �����������.
		b_printtrademsg1("������� ������ ������ ����.");
		CreateInvItem(hero,org_armor_l);
//		AI_EquipArmor(hero,org_armor_l);
		Npc_SetTrueGuild(hero,GIL_ORG);
		hero.guild = GIL_ORG;
		b_givexp(XP_BECOMEBANDIT);
		b_logentry(CH1_JOINNC,"���� ������ ���� � ���� �����. ������ ����� ������ ����� ���� �����!");
		Log_SetTopicStatus(CH1_JOINNC,LOG_SUCCESS);
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_FAILED);
		b_logentry(CH1_JOINOC,"��� ���� �� ����� ����� � �� ���� ���� ������ � ������ ������.");
		Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINPSI,LOG_FAILED);
		b_logentry(CH1_JOINPSI,"�������� �� ������ ����, ��� ��� � ��� ���� ������ ������ ������.");
		if(DIFF_HARD == FALSE)
		{
			Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
			b_logentry(GE_TEACHERNC,"� ������� � ����� ������ � ������ ��������� ������� ����� �������� ����� ���� ���������.");
			FREELEARN_NC = TRUE;
		};
		if(BAALORUN_FETCHWEED == LOG_RUNNING)
		{
			b_logentry(CH1_DELIVERWEED,"����� ����� ����� �� �������� ���� �� ���������� � ���������. �����, � ��� � ��� ���� ��������, ���� ������� ���� � ������.");
			Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
			BAALORUN_FETCHWEED = LOG_FAILED;
		};
		if(THORUS_MORDRAGKO == LOG_RUNNING)
		{
			THORUS_MORDRAGKO = LOG_FAILED;
			Log_SetTopicStatus(CH1_MORDRAGKO,LOG_FAILED);
			b_logentry(CH1_MORDRAGKO,"������ � � ������, � ��� ������� ����� ������ � ������ ������ ���, ��� �������!");
		};
		if(KIRGO_CHARGED == TRUE && KIRGO_CHARGED_END == FALSE)
		{
			KIRGO_CHARGED = FALSE;
			b_exchangeroutine(grd_251_kirgo,"START");
		};
		if(KHARIM_CHARGED == TRUE && KHARIM_CHARGED_END == FALSE)
		{
			KHARIM_CHARGED = FALSE;
			b_exchangeroutine(sld_729_kharim,"START");
		};
		b_exchangeroutine(tpl_1422_gorhanis,"START");
	}
	else
	{
		if(Npc_KnowsInfo(hero,org_801_lares_mordragsentme))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02");	//������� ��������� ��� � ����.
		};
		if(Npc_KnowsInfo(hero,org_801_lares_bringlist))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03");	//�� ������� ���� ����������� ���, ����� ������ ������.
		};
		if(LARES_GET400ORE == LOG_SUCCESS)
		{
			AI_Output(self,other,"SVM_11_ITookYourOre");	//��� ������, ��� �� ��������� �� ���� ���� �����!
		};
		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04");	//�� �� ��� �� �����. ���, �������� ������ ���������.
		if(hero.level < 5)
		{
			b_printguildcondition(5);
		};	
	};
};


instance ORG_801_LARES_GOTOKALOM(C_INFO)
{
	npc = org_801_lares;
	nr = 10;
	condition = org_801_lares_gotokalom_condition;
	information = org_801_lares_gotokalom_info;
	permanent = 0;
	description = "� ��� �� ��� ������ ������?";
};


func int org_801_lares_gotokalom_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		return 1;
	};
};

func void org_801_lares_gotokalom_info()
{
	var C_NPC mordrag;
	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00");	//� ��� �� ��� ������ ������?
	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01");	//������ �� ���� �� ���. ��� ���� �� �� �������� �� ���� �������. ����� ���, ��� ��������.
	Log_CreateTopic(CH1_GOTOPSICAMP,LOG_MISSION);
	Log_SetTopicStatus(CH1_GOTOPSICAMP,LOG_RUNNING);
	b_logentry(CH1_GOTOPSICAMP,"������ �� ��������� ������ � ����-�� ���������. ����, ������� ����� �����, ����� �����, � ���� ������.");
	if(LARES_INFORMMORDRAG == LOG_RUNNING)
	{
		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02");	//���� �� ������������� ������ ���� ��� �������, ��� � �������� � ������ ��� ���������� � ����� ���������.
		b_logentry(CH1_GOTOPSICAMP,"� ������ ������ �������� ���������, ��� ��� ����������!");
	}
	else
	{
		mordrag = Hlp_GetNpc(org_826_mordrag);
		if(Npc_IsDead(mordrag))
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03");	//���� �� ����� ����� �� ������� ������, �������, ��� ����. ����� ������� �� �������� ��� ��������. � ������ ��������� ���������� ���-�� ���������.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04");	//����� � ������ �������� � ������, ��� ��� ���������.
			b_logentry(CH1_GOTOPSICAMP,"�� �������� ���� ����� � ������ ��������.");
		}
		else
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05");	//�������, ���� �� ����� ����� � ������ ������, �������� �������.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06");	//��� � �������� � ���. ����� ���, ��� � ��� ��� ���� ���� ������� � ������ ���������. �������� �������� ���-�� ���������. � ���� �����, ��� ������.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07");	//������ ���.
			b_logentry(CH1_GOTOPSICAMP,"��� ���� ���� ��������� �� ���� �� ����� �������. � ���� ����� ��� � ���� �� �����, � ����� ������.");
			b_exchangeroutine(org_826_mordrag,"START");
			LARES_INFORMMORDRAG = LOG_RUNNING;
		};
	};
};


instance ORG_801_LARES_WHERELEARN(C_INFO)
{
	npc = org_801_lares;
	nr = 20;
	condition = org_801_lares_wherelearn_condition;
	information = org_801_lares_wherelearn_info;
	permanent = 0;
	description = "��� ����� ����� ���� ����-������ �������?";
};


func int org_801_lares_wherelearn_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		return 1;
	};
};

func void org_801_lares_wherelearn_info()
{
	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01");	//��� ����� ����� ���� ����-������ �������?
	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02");	//� ���� ������� ����, ��� ����� ����� ������� � ������.
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"���� ����� ������ ��� ��������� ���� � ��������.");
};


instance ORG_801_LARES_TEACH(C_INFO)
{
	npc = org_801_lares;
	nr = 20;
	condition = org_801_lares_teach_condition;
	information = org_801_lares_teach_info;
	permanent = 1;
	description = DIALOG_LEARN;
};


func int org_801_lares_teach_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wherelearn))
	{
		return TRUE;
	};
};

func void org_801_lares_teach_info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//� ���� �������� ���� ������.
	b_lareslearn();
};

func void org_801_lares_teach_back()
{
	Info_ClearChoices(org_801_lares_teach);
};

func void org_801_lares_teach_str_1()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_STRENGTH] < 100)
		{
			b_printtrademsg1("������ ����: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//�� ���� �� ����!
	};
	b_lareslearn();
};

func void org_801_lares_teach_str_5()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_STRENGTH] < 96)
		{
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//�� ���� �� ����!
	};
	b_lareslearn();
};

func void org_801_lares_teach_dex_1()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_DEXTERITY] < 100)
		{
			b_printtrademsg1("������ ����: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//�� ���� �� ����!
	};
	b_lareslearn();
};

func void org_801_lares_teach_dex_5()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_DEXTERITY] < 96)
		{
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_11_YouWannaFoolMe");	//�� ���� �� ����!
	};
	b_lareslearn();
};

instance ORG_801_LARES_NEWLIST(C_INFO)
{
	npc = org_801_lares;
	nr = 1;
	condition = org_801_lares_newlist_condition;
	information = org_801_lares_newlist_info;
	permanent = 0;
	description = "� ���� ���� ��� ���� ��� �����-������ �������?";
};


func int org_801_lares_newlist_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_ORG && Npc_KnowsInfo(hero,org_801_lares_gotokalom) && !Npc_KnowsInfo(hero,info_diego_bringlist_success) && !Npc_KnowsInfo(hero,org_801_lares_bringlist) && KAPITEL < 4)
	{
		return 1;
	};
};

func void org_801_lares_newlist_info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//� ���� ���� ��� ���� ��� �����-������ �������?
	AI_Output(self,other,"ORG_801_Lares_NewList_01");	//� ������ ����� ���� ���������� ������� �� ����� ��. �� �������� �� �������� � ������ ��������� ������ ����� ������ ������ ��������.
	AI_Output(self,other,"ORG_801_Lares_NewList_02");	//� ����, ����� �� ���������� ����, ������ � ��� ���� ������ � ������ ��� ���. �������� � ����� � ����� ������, �� ��������� ������ ���� ����� ������������. 
	if(!Npc_KnowsInfo(hero,info_diego_bringlist_offer))
	{
		Log_CreateTopic(THELISTFORNC,LOG_MISSION);
		Log_SetTopicStatus(THELISTFORNC,LOG_RUNNING);
		b_logentry(THELISTFORNC,"����� ����� ������ ��������, ������� � ������� � ��� � ������ �����.");
	}
	else
	{
		b_logentry(CH1_BRINGLIST,"���� ��������� ����������� ����� ������ � �������� ������ �� ����� �� �����, � ���.");
	};
};

