
instance SLD_700_LEE_EXIT(C_INFO)
{
	npc = sld_700_lee;
	nr = 999;
	condition = sld_700_lee_exit_condition;
	information = sld_700_lee_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int sld_700_lee_exit_condition()
{
	return TRUE;
};

func void sld_700_lee_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_700_LEE_GREET(C_INFO)
{
	npc = sld_700_lee;
	nr = 1;
	condition = sld_700_lee_greet_condition;
	information = sld_700_lee_greet_info;
	permanent = 0;
	description = "�� ����� ���������, ��?";
};


func int sld_700_lee_greet_condition()
{
	return 1;
};

func void sld_700_lee_greet_info()
{
	AI_Output(other,self,"DIA_Lee_Greet_15_00");	//�� ����� ���������, ��?
	AI_Output(self,other,"DIA_Lee_Greet_08_01");	//��, �� ���������� ����!
};


instance SLD_700_LEE_DEFINE(C_INFO)
{
	npc = sld_700_lee;
	nr = 1;
	condition = sld_700_lee_define_condition;
	information = sld_700_lee_define_info;
	permanent = 0;
	description = "��� ������ �������� �� ������ � �����?";
};


func int sld_700_lee_define_condition()
{
	if(Npc_KnowsInfo(hero,sld_700_lee_greet))
	{
		return 1;
	};
};

func void sld_700_lee_define_info()
{
	AI_Output(other,self,"DIA_Lee_Define_15_00");	//��� ������ �������� �� ������ � �����?
	AI_Output(self,other,"DIA_Lee_Define_08_01");	//� ��� �� ����� �� ������� ������. �� ������ �������� ���� � �������� �����.
	AI_Output(self,other,"DIA_Lee_Define_08_02");	//������ ���� ���� ����-������ �� ��� ������ �������.
};


instance SLD_700_LEE_MITMACHEN(C_INFO)
{
	npc = sld_700_lee;
	nr = 2;
	condition = sld_700_lee_mitmachen_condition;
	information = sld_700_lee_mitmachen_info;
	permanent = 0;
	description = "� ���� ����� ����� �� ���.";
};


func int sld_700_lee_mitmachen_condition()
{
	if(Npc_KnowsInfo(hero,sld_700_lee_greet) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (OLDHEROGUILD == 0))
	{
		return 1;
	};
};

func void sld_700_lee_mitmachen_info()
{
	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00");	//� ���� ����� ����� �� ���.
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01");	//� �� �����! �������, � ��� ������ �������� �������, ��� �� ��� ��������?
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02");	//������� ����������� � ������ ������ ������, � � ���� �� ����� ������������!
};


var int lee_sldpossible;

instance SLD_700_LEE_NOWREADY(C_INFO)
{
	npc = sld_700_lee;
	nr = 700;
	condition = sld_700_lee_nowready_condition;
	information = sld_700_lee_nowready_info;
	permanent = 1;
	description = "� ���� ����� ��������� � �������� �����. �� ������� ����?";
};


func int sld_700_lee_nowready_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Npc_KnowsInfo(hero,sld_700_lee_mitmachen) || (hero.level >= 10)))
	{
		return 1;
	};
};

func void sld_700_lee_nowready_info()
{
	AI_Output(other,self,"DIA_Lee_NowReady_15_00");	//� ���� ����� ��������� � �������� �����. �� ������� ����?
	if(CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01");	//�� ����� ��������, � ���� ���� � ������ ����� ������� ���� �� ����.
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02");	//� �������� ������� ���� � ��������.
		if(hero.level < 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03");	//�� �� ��� �� ����� ����� ����� �� ���. �������� ������� �����, � ��� ���������.
			AI_StopProcessInfos(self);
			b_printguildcondition(10);
		}
		else if(hero.level >= 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//� ��� ���� ����������� �������� ����.
			LEE_SLDPOSSIBLE = TRUE;
		};
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"DIA_Lee_NowReady_08_01");	//�� ������������ ������. ���� ����� ��� ������� ���������.
		b_printguildcondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//� ��� ���� ����������� �������� ����.
		LEE_SLDPOSSIBLE = TRUE;
	};
};


instance SLD_700_LEE_BECOMESLDNOW(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_becomesldnow_condition;
	information = sld_700_lee_becomesldnow_info;
	important = 0;
	permanent = 0;
	description = "� ���� ����� ���������.";
};


func int sld_700_lee_becomesldnow_condition()
{
	if((LEE_SLDPOSSIBLE == TRUE) && (hero.level >= 10))
	{
		return TRUE;
	};
};

func void sld_700_lee_becomesldnow_info()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01");	//� ���� ����� ���������.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02");	//��� ������� �����. �� � ��� �� ���������.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03");	//����� ��� ������, ������? ������ �� ����� �������������� � ������ ������, � �� � ������ ��� � ��������?
	Log_CreateTopic(GE_BECOMEMERCENARY,LOG_NOTE);
	b_logentry(GE_BECOMEMERCENARY,"�� ������ ���� � ���� ���������.");
	Info_ClearChoices(sld_700_lee_becomesldnow);
	Info_AddChoice(sld_700_lee_becomesldnow,"������ ������ ���� �� �����.",sld_700_lee_becomesldnow_noother);
	Info_AddChoice(sld_700_lee_becomesldnow,"� ����� ������� � ��� ��� ��� ����� ����.",sld_700_lee_becomesldnow_freedom);
	Info_AddChoice(sld_700_lee_becomesldnow,"��� �� �����.",sld_700_lee_becomesldnow_justbecause);
};

func void sld_700_lee_becomesldnow_noother()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01");	//������ ������ ���� �� �����.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02");	//��, ������������, ��� ���� ����-�� ����� � ���� ������� - ��� ������� �� ������������. ����� ����������, �������!
	CreateInvItem(self,sld_armor_l);
	b_giveinvitems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};

func void sld_700_lee_becomesldnow_freedom()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01");	//� ����� ������� � ��� ��� ��� ����� ����.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02");	//� �� ������ �� ����. ����� ����������, �������!
	CreateInvItem(self,sld_armor_l);
	b_giveinvitems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};

func void sld_700_lee_becomesldnow_justbecause()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01");	//��� �� �����.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02");	//�������, ����� �� �� �������� � ����� ����� ������� �������. ����� ����������, �������!
	CreateInvItem(self,sld_armor_l);
	b_giveinvitems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos(self);
};


instance SLD_700_LEE_DAMNPAST(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_damnpast_condition;
	information = sld_700_lee_damnpast_info;
	important = 1;
	permanent = 0;
};


func int sld_700_lee_damnpast_condition()
{
	if((SATURAS_BRINGFOCI == 5) && (Npc_GetDistToNpc(hero,self) < 1000) && (Npc_GetDistToWP(self,"NC_DAM") < 1000))
	{
		return TRUE;
	};
};

func void sld_700_lee_damnpast_info()
{
	var C_NPC homer;
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01");	//� ���� �����-�� � ��� ������ ������ �����.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02");	//� ��� ����� �� ������ ��������� �����������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03");	//��� ���� ����� � ������� �� ��� �������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04");	//����� �� ��������� ����, �� ������ ������������� � ���� �������. �������� �������, ��� � ����������� ������ �� ������� ��������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05");	//� ������������ �� ���������. ��� �� ��������� ����� �������� ���� ������ ���� ����.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06");	//� ���� ������������� �������� �������� ����. � ������ ������ �� �������� ����� ������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07");	//��� ������� ����� ������������ ������ ���� �� ������. �� � ���� ������� �������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08");	//�����-������ � ������� ������. ��� ����� ��� �� ��� ����������.
	AI_AlignToWP(self);
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09");	//� ������ �� ���������.
	Npc_ExchangeRoutine(self,"START");
	homer = Hlp_GetNpc(bau_935_homer);
	Npc_ExchangeRoutine(homer,"START");
	AI_ContinueRoutine(homer);
};


instance SLD_700_LEE_FMTAKEN(C_INFO)
{
	npc = sld_700_lee;
	nr = 1;
	condition = sld_700_lee_fmtaken_condition;
	information = sld_700_lee_fmtaken_info;
	permanent = 1;
	description = "��� �� ������� � ��������� �� �����?";
};


func int sld_700_lee_fmtaken_condition()
{
	if(FMTAKEN)
	{
		return TRUE;
	};
};

func void sld_700_lee_fmtaken_info()
{
	AI_Output(other,self,"DIA_Lee_FMTaken_15_00");	//��� �� ������� � ��������� �� �����?
	if(LEE_FREEMINEREPORT == 0)
	{
		AI_Output(self,other,"DIA_Lee_FMTaken_08_01");	//����� ����� ������� ������. �� ��� �������� �� ����.
	}
	else
	{
		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01");	//���� ������ ������ �� ������!
		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//�� ����� ������ ��� ���. ��� ����� ����� ����, ��� ��.
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//�������. � ������ ��� ����� �������.
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//�������!
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//������ ��� ���� � ���� ����� ������������� �� ���� ������.
		AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//������� ����!
		AI_Output(hero,self,"Info_Exit_Info_15_01");	//�� �������!
		b_logentry(CH4_BANNEDFROMOC,"� ��������� �� � ���, ��� �� � ������ �������� ��������� �����. �� ��� ����� �������.");
		b_giveinvitems(self,other,itarrunefirestorm,1);
		b_givexp(500);
		LEE_FREEMINEREPORT = 0;
	};
};


instance SLD_700_LEE_CHANGESIDE(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_changeside_condition;
	information = sld_700_lee_changeside_info;
	important = 0;
	permanent = 0;
	description = "���� �������� �� ������� ������. � ���� �������������� � ���?";
};


func int sld_700_lee_changeside_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_gotolee))
	{
		return TRUE;
	};
};

func void sld_700_lee_changeside_info()
{
	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01");	//���� �������� �� ������� ������. � ���� �������������� � ���?
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//�� ����� ������ ��� ���. ��� ����� ����� ����, ��� ��.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03");	//��� �, ����� ���������� � ����� ������, �������!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04");	//������ ��� �������. � ���, ��� �� ������ � ���.
	CreateInvItem(self,sld_armor_m);
	b_giveinvitems(self,hero,sld_armor_m,1);
	Npc_GetInvItemBySlot(hero,INV_ARMOR,2);
	if(Hlp_GetInstanceID(item) == sld_armor_m)
	{
		AI_EquipArmor(hero,item);
	};
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	b_logentry(CH4_BANNEDFROMOC,"� ������� � ������ ������. ����� ���� ��� ���� ������� �� ������� ������, �� ������ ���� � ��������. ��� ����� ������� � ��������!");
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"�� ����� ������� ���� ����� ��� ��������� �����. ��� �� ����� ������ ��� ��������� ���� � ��������.");
};


instance SLD_700_LEE_ARMOR(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_armor_condition;
	information = sld_700_lee_armor_info;
	important = 0;
	permanent = 1;
	description = "� ���� ���� ������� �������?";
};


func int sld_700_lee_armor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void sld_700_lee_armor_info()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01");	//� ���� ���� ������� �������?
	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02");	//������� ����� ���������. � ���� ��, ������� ������� ������� ����� ������.
	Info_ClearChoices(sld_700_lee_armor);
	Info_AddChoice(sld_700_lee_armor,DIALOG_BACK,sld_700_lee_armor_back);
	Info_AddChoice(sld_700_lee_armor,b_buildbuyarmorstring("������� ������: ������ 55, ������ 10, ����� 25",VALUE_SLD_ARMOR_M),sld_700_lee_armor_m);
	Info_AddChoice(sld_700_lee_armor,b_buildbuyarmorstring("������� ������: ������ 70, ������ 10, ����� 35",VALUE_SLD_ARMOR_H),sld_700_lee_armor_h);
};

func void sld_700_lee_armor_back()
{
	Info_ClearChoices(sld_700_lee_armor);
};

func void sld_700_lee_armor_m()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_M_Info_08_01");	//��� ��� ������� ������.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02");	//�� ��� �� ������ ������ ����� �������. �������, ����� � ���� ����� ������ �����.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_SLD_ARMOR_M)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03");	//� �� ������ ������� ���������.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04");	//��� �������� ��������� �������. ��� ������� ������� ����.
		b_giveinvitems(hero,self,itminugget,VALUE_SLD_ARMOR_M);
		CreateInvItem(hero,sld_armor_m);
		CreateInvItem(self,itamarrow);
		b_giveinvitems(self,hero,itamarrow,1);
		Npc_RemoveInvItem(hero,itamarrow);
	};
};

func void sld_700_lee_armor_h()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_H_Info_08_01");	//��� ��� ������� ������.
	if(KAPITEL < 4)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02");	//�� ��� �� ������ ������ ����� �������. �������, ����� � ���� ����� ������ �����.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_SLD_ARMOR_H)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03");	//� �� ������ ������� ���������.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04");	//��� ������ �������, ������� ����� ������� � �������, ������ ���. ��� ����� ��� ����, ������� � �� ��� ����.
		b_giveinvitems(hero,self,itminugget,VALUE_SLD_ARMOR_H);
		CreateInvItem(hero,sld_armor_h);
		CreateInvItem(self,itamarrow);
		b_giveinvitems(self,hero,itamarrow,1);
		Npc_RemoveInvItem(hero,itamarrow);
	};
};


instance SLD_700_LEE_TEACH(C_INFO)
{
	npc = sld_700_lee;
	nr = 10;
	condition = sld_700_lee_teach_condition;
	information = sld_700_lee_teach_info;
	permanent = 1;
	description = "�� ������ ������� ���� ����-������?";
};


func int sld_700_lee_teach_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void sld_700_lee_teach_info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01");	//� ���� ������ ���� ����� ����� ������ � �������.
	Info_ClearChoices(sld_700_lee_teach);
	Info_AddChoice(sld_700_lee_teach,DIALOG_BACK,sld_700_lee_teach_back);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_1);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_1);
};

func void sld_700_lee_teach_back()
{
	Info_ClearChoices(sld_700_lee_teach);
};

func void sld_700_lee_teach_str_1()
{
	b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(sld_700_lee_teach);
	Info_AddChoice(sld_700_lee_teach,DIALOG_BACK,sld_700_lee_teach_back);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_1);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_1);
};

func void sld_700_lee_teach_str_5()
{
	b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(sld_700_lee_teach);
	Info_AddChoice(sld_700_lee_teach,DIALOG_BACK,sld_700_lee_teach_back);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_1);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_1);
};

func void sld_700_lee_teach_dex_1()
{
	b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(sld_700_lee_teach);
	Info_AddChoice(sld_700_lee_teach,DIALOG_BACK,sld_700_lee_teach_back);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_1);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_1);
};

func void sld_700_lee_teach_dex_5()
{
	b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(sld_700_lee_teach);
	Info_AddChoice(sld_700_lee_teach,DIALOG_BACK,sld_700_lee_teach_back);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),sld_700_lee_teach_str_1);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_5);
	Info_AddChoice(sld_700_lee_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),sld_700_lee_teach_dex_1);
};


instance SLD_700_LEE_ZWEIHAND1(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_zweihand1_condition;
	information = sld_700_lee_zweihand1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_1,LPCOST_TALENT_2H_1,0);
};


func int sld_700_lee_zweihand1_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && (KAPITEL >= 4))))
	{
		return TRUE;
	};
};

func void sld_700_lee_zweihand1_info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01");	//����� ���� ������� ��������� �����.
	if(b_giveskill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02");	//������, ������ � ����� ����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03");	//����� ������ �������������. ����� ������� ���� ����� ������� �������, ���������� ������ ������������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04");	//������� ��� � ������ ���� ������. ������ ����� ���� ����� ���������� ����������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05");	//��������� ������� ��������, ����� ������� ���� �����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06");	//��������� ����� ����� �������� ����� ������� ������� �����. ��� ���� ��������� �� ������ � ���� ������������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07");	//��� �, ��� ������� ����� ����������. ���, ����������.
		sld_700_lee_zweihand1.permanent = 0;
	};
};


instance SLD_700_LEE_ZWEIHAND2(C_INFO)
{
	npc = sld_700_lee;
	condition = sld_700_lee_zweihand2_condition;
	information = sld_700_lee_zweihand2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_2,LPCOST_TALENT_2H_2,0);
};


func int sld_700_lee_zweihand2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && (KAPITEL >= 4))))
	{
		return TRUE;
	};
};

func void sld_700_lee_zweihand2_info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01");	//� ���� ������ ������ � �������� ��������� �����.
	if(b_giveskill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02");	//��� ������ ���� ����� �������� ������. ����� ������ �����������, �������� �� ������� ������ ������ � ������ ��� ������� � �������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03");	//������ ������� ���� ������, ��������� ������ ��� ������. � ���� �������� ����������� ������� � �������� ����� �����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04");	//��� ���� � ���������� �� ����� ������� ������ ������������ � ����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05");	//�� ������ ��� ������� ���� ����� ������, ����� ���������� ����������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06");	//������ ������� ��������, � �� ������� ������� ���������� � �����, ����������� ��� ����, ����� ���������� �����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07");	//���� ��������� ���� �������� ����� �����, ��������� ������� ����, ����� ������� ��������� ����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08");	//����� ����� ����� �������������� ������ � ��� ����������� ������� ��� ���������� �����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09");	//����� ������ � ���������� ����� ������� �������� ������� ��������� ������� ���.
		sld_700_lee_zweihand2.permanent = 0;
	};
};
