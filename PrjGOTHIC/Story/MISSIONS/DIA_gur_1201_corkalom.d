
instance GUR_1201_CORKALOM_FIRST(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = gur_1201_corkalom_first_condition;
	information = gur_1201_corkalom_first_info;
	permanent = 1;
	important = 1;
};


func int gur_1201_corkalom_first_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return 1;
	};
};

func void gur_1201_corkalom_first_info()
{
	AI_Output(self,other,"GUR_1201_CorKalom_FIRST_10_00");	//��� ���� �����?
	KALOM_TALKEDTO = TRUE;
};


instance GUR_1201_CORKALOM_WANNAJOIN(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = gur_1201_corkalom_wannajoin_condition;
	information = gur_1201_corkalom_wannajoin_info;
	permanent = 0;
	description = "� ���� ���� �������� � ��������.";
};


func int gur_1201_corkalom_wannajoin_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void gur_1201_corkalom_wannajoin_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_00");	//� ���� ���� �������� � ��������.
	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_01");	//� ������, ��� �� ����������� ����������� � �������, ��� �� ��� ����� ������.
	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_02");	//� ���� ������� ����� ���! � ������� ����� ������ ������������, ������� �� ���� ������� ���� �� ������.
	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_03");	//� ��������� � ������� ������. ���� ��� ������, ��� �� ����� ������ ������ ����������, �� ����������� �� ���.
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"��� ����� ������ ���� � �������� �����������, ���� �� ���� ������ ���� ����� ��� ������� ������ ����.");
};


instance GUR_1201_CORKALOM_RECIPE(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 20;
	condition = gur_1201_corkalom_recipe_condition;
	information = gur_1201_corkalom_recipe_info;
	permanent = 0;
	description = "�������� �� ������� ������ ����� �������� ������ ��������� �����.";
};


func int gur_1201_corkalom_recipe_condition()
{
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		return 1;
	};
};

func void gur_1201_corkalom_recipe_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Recipe_15_00");	//���� �������� �� ������� ������ ����� �������� ������ ��������� �����.
	AI_Output(self,other,"GUR_1201_CorKalom_Recipe_10_01");	//� ������ �� ������ ���� �������!
	b_logentry(CH1_KALOMSRECIPE,"��� ����� ������������ �������� ���� �������. �� � ��� ����������� ���� ������... �, �������, ���� �������� ������ ����� ����� ����� �� ��������...");
};


instance GUR_1201_CORKALOM_EXPERIMENTE(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 2;
	condition = gur_1201_corkalom_experimente_condition;
	information = gur_1201_corkalom_experimente_info;
	permanent = 1;
	description = "��� �� ������������ �� ����� ���������?";
};


func int gur_1201_corkalom_experimente_condition()
{
	if(KAPITEL < 2)
	{
		return 1;
	};
};

func void gur_1201_corkalom_experimente_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Experimente_15_00");	//��� �� ������������ �� ����� ���������?
	AI_Output(self,other,"GUR_1201_CorKalom_Experimente_10_01");	//��� ������������ ��� ������, ��� �� � ��� ������ �� �������. �� �������� ���� �� ������!
};


instance GUR_1201_CORKALOM_BRINGWEED(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 2;
	condition = gur_1201_corkalom_bringweed_condition;
	information = gur_1201_corkalom_bringweed_info;
	permanent = 1;
	description = "� ������ ���� ������� ���� ���������.";
};


func int gur_1201_corkalom_bringweed_condition()
{
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void gur_1201_corkalom_bringweed_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_BRINGWEED_15_00");	//� ������ ���� ������� ���� ���������.
	if(Npc_HasItems(hero,itmi_plants_swampherb_01) < 100)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_01");	//� ��� ���? ��� ����� ���� ������, � ��� ��� ������� ��� �������!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_02");	//�, ����� ����. � �� ����� ��� ��������!
		b_printtrademsg1("����� �������� (100).");
		b_giveinvitems(hero,self,itmi_plants_swampherb_01,100);
		Npc_RemoveInvItems(self,itmi_plants_swampherb_01,100);
		BAALORUN_FETCHWEED = LOG_SUCCESS;
		b_logentry(CH1_DELIVERWEED,"��� ����� ���������, ��� ������. � ������� ��� ���� ������ ���������, � ��� ��� ����.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_SUCCESS);
		b_givexp(XP_DELIVEREDWEEDHARVEST);
		BAALORUN_FETCHWEED = LOG_SUCCESS;
		//BALOR_CAN_GIVE = TRUE;
		AI_StopProcessInfos(self);
	};
};


var int corkalom_potions;

instance GUR_1201_CORKALOM_CRAWLERZANGEN(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 800;
	condition = gur_1201_corkalom_crawlerzangen_condition;
	information = gur_1201_corkalom_crawlerzangen_info;
	permanent = 1;
	description = "� ������ ���� ������� ��������...";
};


func int gur_1201_corkalom_crawlerzangen_condition()
{
	if(Npc_HasItems(other,itat_crawler_01) > 0 && Npc_KnowsInfo(hero,gur_1201_corkalom_sache))
	{
		return 1;
	};
};

func void gur_1201_corkalom_crawlerzangen_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Crawlerzangen_15_00");	//� ������ ���� ������� ��������...
	b_printtrademsg1("������ ��� ������� ��������.");
	if(Npc_HasItems(other,itat_crawler_01) > 25)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01");	//����� ������. ���, ������ �� ��� ��������� �� ���� ������ �����.
		b_printtrademsg2("�������� 10 ����� ���������� �������.");
		CreateInvItems(self,itfo_potion_mana_03,5);
		b_giveinvitems(self,hero,itfo_potion_mana_03,5);
	}
	else if(Npc_HasItems(other,itat_crawler_01) > 15)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01");	//����� ������. ���, ������ �� ��� ��������� �� ���� ������ �����.
		//CORKALOM_POTIONS = Npc_HasItems(hero,itat_crawler_01) / 3;
		b_printtrademsg2("�������� 5 ����� ���������� �������.");
		CreateInvItems(self,itfo_potion_mana_03,5);
		b_giveinvitems(self,hero,itfo_potion_mana_03,5);
	}
	else if(Npc_HasItems(other,itat_crawler_01) > 5)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_02");	//������. ������ ��������� ���� ����� � �������� �������.
		//CORKALOM_POTIONS = Npc_HasItems(hero,itat_crawler_01) / 2;
		b_printtrademsg2("�������� 5 ���������� ���������� �������.");
		CreateInvItems(self,itfo_potion_mana_02,5);
		b_giveinvitems(self,hero,itfo_potion_mana_02,5);
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_03");	//��. � ��� ���? ���, ������ ���������� ����� � �����.
		b_printtrademsg2("�������� �������� ���������� �������.");
		CreateInvItems(self,itfo_potion_mana_01,1);
		b_giveinvitems(self,hero,itfo_potion_mana_01,1);
		AI_StopProcessInfos(self);
	};
	b_giveinvitems(other,self,itat_crawler_01,Npc_HasItems(other,itat_crawler_01));
};


instance GUR_1201_CORKALOM_JOINPSI(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = gur_1201_corkalom_joinpsi_condition;
	information = gur_1201_corkalom_joinpsi_info;
	permanent = 1;
	description = "��-�����, � ���� �������� ������ ���� �����������.";
};


func int gur_1201_corkalom_joinpsi_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && Npc_KnowsInfo(hero,gur_1201_corkalom_wannajoin))
	{
		return 1;
	};
};

func void gur_1201_corkalom_joinpsi_info()
{
	var int counter;
	counter = 0;
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_00");	//��-�����, � ���� �������� ������ ���� �����������.
	if(Npc_KnowsInfo(hero,dia_baalorun_gotweed))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_01");	//���� ���� �������, ��� � ������� ����� ������ ������ �������.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baalcadar_sleepspell))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_02");	//������...
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_03");	//���� ����� �������, ��� � ������ �����.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baalnamib_firsttalk))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_04");	//���� ����� ������, ��� � �������� ������������� ���� � �������.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baaltyon_vision))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_05");	//��������� ��� ����� ����� ���� �������.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baaltondral_sendtokalom))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_06");	//�?
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_07");	//���� ������� ������, ��� � ���� �������� ������ ����������. � ������ � ���� ������ �������������.
		counter = counter + 1;
	};
	if(hero.level >= 5)
	{
		if(counter >= 4)
		{
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_08");	//������. ���� ������ ��� ������ ����������.
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_09");	//���, ������ ��� ������. � ������ ��� � ���������� ���� ��������.
			b_printtrademsg1("������� ������ ������ ����������.");
			CreateInvItem(self,nov_armor_m);
			b_giveinvitems(self,hero,nov_armor_m,1);
			AI_EquipArmor(hero,nov_armor_m);
			Npc_SetTrueGuild(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			b_logentry(CH1_JOINPSI,"������� ��� ����� �������� ���� � ����������. �� ��� �� ����� ���� � �������, ��, ��� �� �� �� ����, ������ � ������ � ��������.");
			Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
			b_logentry(GE_TRADERPSI,"������� ����������� � ���� �������� � ����� ������.");
			Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
			b_logentry(GE_TEACHERPSI,"� ������� � �������� ������ � ������ ��������� ������� ����� �������� ����� ���� ���������.");
			Log_SetTopicStatus(CH1_JOINPSI,LOG_SUCCESS);
			b_givexp(XP_BECOMENOVICE);
			Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JOINOC,LOG_FAILED);
			b_logentry(CH1_JOINOC,"� ����� �������������� � �������� ������� �� ��������� ������, ������� � ������ �� ����� ����� ���������.");
			Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JOINNC,LOG_FAILED);
			b_logentry(CH1_JOINNC,"������ ���� �� ������ ������� � ����� ����� �� ������ ������, ��� ��� �������� ����� ���� ����� �����.");
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
			if(THORUS_MORDRAGKO == LOG_RUNNING)
			{
				THORUS_MORDRAGKO = LOG_FAILED;
				Log_SetTopicStatus(CH1_MORDRAGKO,LOG_FAILED);
				b_logentry(CH1_MORDRAGKO,"����� ����� ��� ����������� �� ������ ����������, ��� ���� ������ �� ��������.");
			};
			if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
			{
				DEXTER_GETKALOMSRECIPE = LOG_FAILED;
				Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_FAILED);
				if(!Npc_KnowsInfo(hero,gur_1201_corkalom_recipe))
				{
					b_logentry(CH1_KALOMSRECIPE,"� ���� ����� �� �������������� �������� �������, ����� � �������� ��������� ����� ���� �������� �� ������ �������?");
				}
				else if(Npc_HasItems(hero,kalomsrecipe) > 0)
				{
					b_logentry(CH1_KALOMSRECIPE,"� ���� ����� �� �������������� �������� �������, ����� � �������� ������ � ����? �������, ����� ������ ��� ������ �� �����!");
				}
				else
				{
					b_logentry(CH1_KALOMSRECIPE,"� ���� ����� �� �������������� �������� �������, ����� � �������� ������ � ����?");
				};
			};
		}
		else
		{
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00");	//�?
			AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01");	//� ��� ���.
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02");	//�� ���������� ���� �� ����� ������ ������! �������, ����� ��������� ������� ������� ������.
		};
	}
	else
	{
		b_printguildcondition(5);
		AI_Output(self,other,"SVM_10_NoLearnYouAlreadyKnow");	//������� ���� ����� ������� ������, � ������ ����� �� ������� ������� ����������.
	};
};


instance GUR_1201_CORKALOM_JOINPSI2(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = gur_1201_corkalom_joinpsi2_condition;
	information = gur_1201_corkalom_joinpsi2_info;
	permanent = 0;
	description = "� ��� ���? ���� '����� ����������' ������ ���� �������?";
};


func int gur_1201_corkalom_joinpsi2_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void gur_1201_corkalom_joinpsi2_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_10");	//� ��� ���? ���� '����� ����������' ������ ���� �������?
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_11");	//����� ����������.
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_12");	//��� ������� �����.
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_13");	//�� ������ ������ �� �������? ���, ������ ��� ����� � ������ �� ������ � ������ ������.
	b_printtrademsg1("������� �������� (30).");
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_14");	//���� ��� ���� ��������� ���� ����������, ����� ��, ��� ���� ������� ��� �����.
	CreateInvItems(self,itmijoint_3,30);
	b_giveinvitems(self,hero,itmijoint_3,30);
	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic(CH1_KRAUTBOTE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_RUNNING);
	b_logentry(CH1_KRAUTBOTE,"� ����� ������� ������������� ������ ��� ����� ������ ���� � ������ � ������ ������, ����� ������� ��� ��������.");
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_15");	//��, ������ �� ��� ��� �����?
	AI_StopProcessInfos(self);
};


instance INFO_KALOM_DRUGMONOPOL(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_kalom_drugmonopol_condition;
	information = info_kalom_drugmonopol_info;
	permanent = 0;
	description = "� ���� ���� ��� ���� ��� �����-������ �������?";
};


func int info_kalom_drugmonopol_condition()
{
	if(KALOM_KRAUTBOTE == LOG_SUCCESS)
	{
		return 1;
	};
};

func void info_kalom_drugmonopol_info()
{
	var C_NPC renyu;
	var C_NPC killian;
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//� ���� ���� ��� ���� ��� �����-������ �������?
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_01");	//� ����� ������ ���������� ������, ������� ���� ����� ��������� ��������.
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_03");	//���������� � ���, ����� �� ���� ���� �������.
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_04");	//� ���...
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_05");	//��� �����������, ���!
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_06");	//�����, ��� ������������ ���-�� �� ��������� ������ ������. ��� � ����� ��.
	KALOM_DRUGMONOPOL = LOG_RUNNING;
	Log_CreateTopic(CH1_DRUGMONOPOL,LOG_MISSION);
	Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_RUNNING);
	b_logentry(CH1_DRUGMONOPOL,"��� ����� ������� ���������� �� �����������, ��������� ���������� � ����� ������. � �� ����, ��� �� ������, ��, ����� ����, ��� ������� �������� ����� ����� �������...");
	renyu = Hlp_GetNpc(org_860_renyu);
	renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	killian = Hlp_GetNpc(org_861_killian);
	killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};


instance INFO_KALOM_SUCCESS(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_kalom_success_condition;
	information = info_kalom_success_info;
	permanent = 1;
	description = "�� ������ �������� ���������� � ����� ������...";
};


func int info_kalom_success_condition()
{
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_kalom_success_info()
{
	var C_NPC killian;
	var C_NPC renyu;
	var C_NPC jacko;
	killian = Hlp_GetNpc(org_861_killian);
	renyu = Hlp_GetNpc(org_860_renyu);
	jacko = Hlp_GetNpc(org_862_jacko);
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_00");	//�� ������ �������� ���������� � ����� ������...
	AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_01");	//��?
	if((STOOGES_FLED == TRUE) || (Npc_IsDead(jacko) && Npc_IsDead(renyu) && Npc_IsDead(killian)))
	{
		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_05");	//� �������. � ������������ ����. ����� ����, �� ������������� ������ ��� �������.
		KALOM_DRUGMONOPOL = LOG_SUCCESS;
		b_logentry(CH1_DRUGMONOPOL,"� ��������� ��� ������ ���, ��� ���� ������ � �����������. �� ��� ��� ������ ����� '�������'.");
		Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_SUCCESS);
		b_givexp(XP_DRUGMONOPOL);
	}
	else
	{
		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_02");	//� �� ���� ������ �����.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_03");	//��, ��� � �����. ����� ���� ����� ���� �������� ��� ����?!
	};
};


instance INFO_KALOM_KRAUTBOTEBACK(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = info_kalom_krautboteback_condition;
	information = info_kalom_krautboteback_info;
	permanent = 1;
	description = "� ������ ��������.";
};


func int info_kalom_krautboteback_condition()
{
	if((KALOM_DELIVEREDWEED == TRUE) && (KALOM_KRAUTBOTE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_kalom_krautboteback_info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00");	//� ������ ��������.
	if(Npc_HasItems(hero,itminugget) >= 500)
	{
		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01");	//������. ���, ����� ���� �����-������ ����.
		b_printtrademsg1("������ ����: 500");
		KALOM_KRAUTBOTE = LOG_SUCCESS;
		b_logentry(CH1_KRAUTBOTE,"��� ����� ������� ���� �� �������� ��� ������� �� ������� ������.");
		Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_SUCCESS);
		b_giveinvitems(hero,self,itminugget,500);
		b_givexp(XP_WEEDSHIPMENTREPORTED);
	}
	else
	{
		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02");	//� ��� ������� ������ ����? ���������� � ������� �� ��� ����!
	};
};


instance INFO_CORKALOM_BRINGFOCUS(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_corkalom_bringfocus_condition;
	information = info_corkalom_bringfocus_info;
	permanent = 0;
	important = 0;
	description = "���� ������� �������. � ������ ������.";
};


func int info_corkalom_bringfocus_condition()
{
	if((YBERION_BRINGFOCUS == LOG_SUCCESS) && Npc_HasItems(hero,focus_1))
	{
		return 1;
	};
};

func void info_corkalom_bringfocus_info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01");	//���� ������� �������. � ������ ������.
	b_printtrademsg1("����� ������.");
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02");	//�-�, ������... ������-�� � ����� ������� �������� ����� ������� ���������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03");	//���� �� � ���� ���� ���������� ����� ���� ������� ������...
	b_logentry(CH2_FOCUS,"� ������ ������ ��� ������!");
	Log_SetTopicStatus(CH2_FOCUS,LOG_SUCCESS);
	//b_giveinvitems(hero,self,focus_1,1);
	Npc_RemoveInvItem(hero,focus_1);
	b_givexp(XP_BRINGFOCUSTOCORKALOM);
};


instance INFO_CORKALOM_BLUFF(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 10;
	condition = info_corkalom_bluff_condition;
	information = info_corkalom_bluff_info;
	permanent = 0;
	description = "������� ������ ���, ��� �� ���� ��� ������� �� ������.";
};


func int info_corkalom_bluff_condition()
{
	if(Npc_KnowsInfo(hero,info_corkalom_bringfocus) && (CORKALOM_BRINGMCQBALLS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void info_corkalom_bluff_info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01");	//������� ������ ���, ��� �� ���� ��� ������� �� ������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02");	//��? �� ��� ������? �����, ��������� ������ ���� ���� �������?
	b_printtrademsg1("�������� ����: 50");
	CreateInvItems(self,itminugget,50);
	b_giveinvitems(self,other,itminugget,50);
};


instance GUR_1201_CORKALOM_SACHE(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_sache_condition;
	information = gur_1201_corkalom_sache_info;
	important = 0;
	permanent = 0;
	description = "�����?";
};


func int gur_1201_corkalom_sache_condition()
{
	if(Npc_KnowsInfo(hero,info_corkalom_bringfocus))
	{
		return 1;
	};
};

func void gur_1201_corkalom_sache_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_Info_15_01");	//�����?
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_02");	//��, ��� �� ��� ������, � ����� ����� ��� ������� ���������. ����� �������� �������� ����� �� ����� ������ �����������!
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_03");	//�� ���� ������, ��� ����� �������?
	Info_ClearChoices(gur_1201_corkalom_sache);
	Info_AddChoice(gur_1201_corkalom_sache,"���.",gur_1201_corkalom_sache_nein);
	Info_AddChoice(gur_1201_corkalom_sache,"��.",gur_1201_corkalom_sache_ja);
};

func void gur_1201_corkalom_sache_nein()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//���.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_02");	//��� ����� ������� �����. ����� � ������ ������ � ���� ���, � ���� ����� ����������.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03");	//� �� ����� ���� ������, ���������� ������ �����.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04");	//�� ��� � ����� ������ �����, ������� ��������� ��� �������� ���� � �������.
	Info_ClearChoices(gur_1201_corkalom_sache);
};

func void gur_1201_corkalom_sache_ja()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//��.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_JA_10_02");	//�������!
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03");	//� �� ����� ���� ������, ���������� ������ �����.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04");	//�� ��� � ����� ������ �����, ������� ��������� ��� �������� ���� � �������.
	Info_ClearChoices(gur_1201_corkalom_sache);
};


instance GUR_1201_CORKALOM_VISION(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_vision_condition;
	information = gur_1201_corkalom_vision_info;
	important = 0;
	permanent = 0;
	description = "�������� ���!";
};


func int gur_1201_corkalom_vision_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_sache))
	{
		return 1;
	};
};

func void gur_1201_corkalom_vision_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_01");	//�������� ���!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_02");	//��� �, ������� ������ ������ ��� ���� �������. �� ����� ��� ����.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_03");	//� �����, ��� ����� ����� �������� � ����� ����� �������� ���-�� ���.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_04");	//� �� ������ ���� ��� ���� ������. �� �������� ������� �� �� ����. ��� ����� ����� ������� ���� ����� ������!
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_05");	//����������!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_06");	//�����, ������!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_07");	//�� ��� ��� ������, ��� ��������� ���� ���� �����, �� �������� ������������ ������.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_08");	//��� ������, ��� ������ ��������� ���� ����� �������� � ��������. �� ��� �� �����.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_09");	//������ ���� ���-�� ���.
};


instance GUR_1201_CORKALOM_NEST(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_nest_condition;
	information = gur_1201_corkalom_nest_info;
	important = 0;
	permanent = 0;
	description = "� �� ������� �� ������ ��������?";
};


func int gur_1201_corkalom_nest_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_vision))
	{
		return 1;
	};
};

func void gur_1201_corkalom_nest_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_NEST_Info_15_01");	//� �� ������� �� ������ ��������? � ����� �������... �����, � ��� ���� ���� ��� ���-������, ��� ����� ������� �����.
	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_02");	//�������, �� ������� ��������� ��������. ��, �������, ������ ��� �������� ���������� ������ � ������� � �����.
	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_03");	//������ ���� ���-��, � ��� �� ��� �� �����. ��� � ����� ����� � �� ������!
	CORKALOM_BRINGMCQBALLS = LOG_RUNNING;
};

func void gur_1201_corkalom_weg_accept()
{
	Log_CreateTopic(CH2_MCEGGS,LOG_MISSION);
	Log_SetTopicStatus(CH2_MCEGGS,LOG_RUNNING);
	b_logentry(CH2_MCEGGS,"���� ��� ����� ��� ��� ������� ����� �������� ������������������ ��������, ���������� � ���������. �� ����� �� ����������� ����� ���� ������, �� ��� ��������� ������������ �������. ����� ����� ���-�� ������.");
	if(PRESSETOURJANUAR2001)
	{
		CreateInvItems(hero,itat_crawlerqueen,3);
	};
};


instance GUR_1201_CORKALOM_WEG(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_weg_condition;
	information = gur_1201_corkalom_weg_info;
	nr = 21;
	important = 0;
	permanent = 0;
	description = "�����, � ����� ����� �� ������� ������.";
};


func int gur_1201_corkalom_weg_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_nest) && !Npc_KnowsInfo(hero,gur_1201_corkalom_rat))
	{
		return 1;
	};
};

func void gur_1201_corkalom_weg_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_WEG_Info_15_01");	//�����, � ����� ����� �� ������� ������.
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_02");	//������ ������ � ����������� ����� � ��������� ��, ����� �������� ����.
	b_printtrademsg1("�������� 5 ������� �����.");
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_03");	//������ � ����� ������� ����.
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_04");	//�� �������� � ����� ���� �������, �� ������� �� ���� ���� ����� ������, ��������� ���� ��� � ������� ���� ����!
	CreateInvItems(self,itarscrolllight,5);
	b_giveinvitems(self,other,itarscrolllight,5);
	gur_1201_corkalom_weg_accept();
};


instance GUR_1201_CORKALOM_RAT(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_rat_condition;
	information = gur_1201_corkalom_rat_info;
	nr = 20;
	important = 0;
	permanent = 0;
	description = "��, ���� ���� ��������� �������� �����������...";
};


func int gur_1201_corkalom_rat_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_nest) && !Npc_KnowsInfo(hero,gur_1201_corkalom_weg))
	{
		return 1;
	};
};

func void gur_1201_corkalom_rat_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_RAT_Info_15_01");	//��, ���� ���� ��������� �������� �����������...
	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_02");	//������ ��� �������� �����.
	b_printtrademsg1("�������� 5 ���������� ���������� �������.");
	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_03");	//� ��� �� ���� �� ������, ��� ������� ���������� �� ���� �����, � ������ ��� ��� ������� ��� ���� ������� �����.
	CreateInvItems(self,itfo_potion_health_02,5);
	b_giveinvitems(self,other,itfo_potion_health_02,5);
	gur_1201_corkalom_weg_accept();
};


instance GUR_1201_CORKALOM_RUN(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_run_condition;
	information = gur_1201_corkalom_run_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ���� ��������?";
};


func int gur_1201_corkalom_run_condition()
{
	if((CORKALOM_BRINGMCQBALLS == LOG_RUNNING) && (Npc_HasItems(hero,itat_crawlerqueen) < 1))
	{
		return 1;
	};
};

func void gur_1201_corkalom_run_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_01");	//��� ����� ���� ��������?
	AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_02");	//� ������ �����.
	if(!ENTEREDOLDMINE)
	{
		AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_03");	//��� ��������� ������ �����?
		AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_04");	//������ ��� �����. �� ��� �������� ��� ������ ����� � �������.
		b_printtrademsg1("�������� ����� �������.");
		CreateInvItem(self,itwrworldmap);
		b_giveinvitems(self,other,itwrworldmap,1);
	};
};


instance GUR_1201_CORKALOM_CRAWLER(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_crawler_condition;
	information = gur_1201_corkalom_crawler_info;
	important = 0;
	permanent = 0;
	description = "���� �����-������ ������ ������ ����� �� ��������?";
};


func int gur_1201_corkalom_crawler_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_run) && (CORKALOM_BRINGMCQBALLS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void gur_1201_corkalom_crawler_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01");	//���� �����-������ ������ ������ ����� �� ��������?
	AI_Output(self,other,"GUR_1201_CorKalom_CRAWLER_Info_10_02");	//� ����� ��������� ��������� ����� �������, ������� �������� �� �������. �������� � ��� �� �����. �� ������� ����.
};


instance GUR_1201_CORKALOM_FIND(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_find_condition;
	information = gur_1201_corkalom_find_info;
	important = 0;
	permanent = 0;
	description = "� � ����� ����� ����� ��������� ������ ��������?";
};


func int gur_1201_corkalom_find_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_crawler))
	{
		return 1;
	};
};

func void gur_1201_corkalom_find_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_01");	//� � ����� ����� ����� ��������� ������ ��������?
	AI_Output(self,other,"GUR_1201_CorKalom_FIND_Info_10_02");	//��� ����� ������� ����� ������. � ������ �� ���� ���� ������������. �� ��� ������ ��� �����. ���� ������� ����� ������������ ����.
	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_03");	//��, �� ���� ��������.
};


instance INFO_CORKALOM_BRINGMCQBALLS_SUCCESS(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_corkalom_bringmcqballs_success_condition;
	information = info_corkalom_bringmcqballs_success_info;
	permanent = 0;
	description = "� ����� ���� �������� ��������.";
};


func int info_corkalom_bringmcqballs_success_condition()
{
	if(Npc_HasItems(hero,itat_crawlerqueen) >= 3 && CORKALOM_BRINGMCQBALLS == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_corkalom_bringmcqballs_success_info()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01");	//� ����� ���� �������� ��������.
	b_printtrademsg1("������ 3 ����.");
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02");	//� ���� ���! ��� ������� ������������� ���� ������. ����� ������� �������� ��� ����� ���������� � �����.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03");	//�������, ����� ��� ������, ����� ������� �����, ������� ������� ��� �������� �������!
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04");	//� ��� ��� �������?
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05");	//��, ��, �������... ������� ����.
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06");	//�� ���, � ���� � ���� ����� ����� ������������...
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07");	//��? ������, ���� �� �� ������?
	CORKALOM_BRINGMCQBALLS = LOG_SUCCESS;
	b_giveinvitems(hero,self,itat_crawlerqueen,3);
	Npc_RemoveInvItems(self,itat_crawlerqueen,3);
	b_givexp(XP_BRINGMCEGGS);
	b_logentry(CH2_MCEGGS,"� ����� ��� ������ ��� ���� ��������. �� ��� ��������, ��� � ������. ��� ����� ����������� ����� �� ��� ��� ���� �������!");
	Log_SetTopicStatus(CH2_MCEGGS,LOG_SUCCESS);
	b_exchangeroutine(tpl_1439_gornadrak,"GC");
	b_exchangeroutine(tpl_1440_templer,"GC");
	Wld_InsertNpc(tpl_1400_gornabar_psi,"PSI_24_HUT_EX_SMALLTALK");
	Wld_InsertNpc(tpl_1401_gornakosh_psi,"PSI_24_HUT_EX_SMALLTALK");
	Wld_InsertNpc(tpl_1433_gornavid_psi,"PSI_24_HUT_EX_SMALLTALK");
	if(c_npcbelongstonewcamp(hero))
	{
		b_logentry(CH1_GOTOPSICAMP,"�����, ������ ��� �������� ���������� � ���, ��� �������� ������� ����. � ������ �������� �� ���� ��������.");
	};
	if(c_npcbelongstooldcamp(hero))
	{
		b_logentry(CH1_GOTOPSI,"�����, ������ � ����, ��� ������ �������� ������� ���� ��������. � ������ ���������� �� ���� ������ �� ������� ������.");
	};
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"����.",info_corkalom_bringmcqballs_success_rune);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"������.",info_corkalom_bringmcqballs_success_waffe);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"�������� �����.",info_corkalom_bringmcqballs_success_heal);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"����.",info_corkalom_bringmcqballs_success_ore);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"����� ���������� ����.",info_corkalom_bringmcqballs_success_mana);
};

func void info_corkalom_bringmcqballs_success_rune()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01");	//����.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02");	//����� ��� ���� ������� ���� ����!
	b_printtrademsg1("�������� ���� �����.");
	CreateInvItem(self,itarrunelight);
	b_giveinvitems(self,hero,itarrunelight,1);
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};

func void info_corkalom_bringmcqballs_success_waffe()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01");	//������.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02");	//����� ��� ������ ��������� ���� ����� ������!
	b_printtrademsg1("������� ��������.");
	CreateInvItem(self,itmw_1h_mace_war_03);
	b_giveinvitems(self,hero,itmw_1h_mace_war_03,1);
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};

func void info_corkalom_bringmcqballs_success_heal()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01");	//�������� �����.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02");	//����� ��� ����� ������� ���� �����!
	b_printtrademsg1("�������� �������� �����.");
	CreateInvItem(self,itfo_potion_health_perma_01);
	b_giveinvitems(self,hero,itfo_potion_health_perma_01,1);
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};

func void info_corkalom_bringmcqballs_success_ore()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01");	//����.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02");	//������ ��� ���� � ���� ������������� ����� ��������!
	b_printtrademsg1("�������� ����: 100");
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,hero,itminugget,100);
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};

func void info_corkalom_bringmcqballs_success_mana()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01");	//����� ���������� ����.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02");	//����� ��� ����� �������� ���� ���������� ����!
	if(!c_npcbelongstopsicamp(hero))
	{
		b_printtrademsg1("�������� �������� ���� ����.");
		CreateInvItem(self,itfo_potion_mana_perma_01);
		b_giveinvitems(self,hero,itfo_potion_mana_perma_01,1);
	}
	else
	{
		b_printtrademsg1("�������� ����� �� ��� �������� ��������.");
		CreateInvItem(self,itfo_potion_elixier_egg);
		b_giveinvitems(self,hero,itfo_potion_elixier_egg,1);
	};
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};


instance INFO_CORKALOM_BRINGBOOK(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_corkalom_bringbook_condition;
	information = info_corkalom_bringbook_info;
	permanent = 0;
	description = "������ �� ����� ������ ���������?";
};


func int info_corkalom_bringbook_condition()
{
	if(CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)
	{
		return 1;
	};
};

func void info_corkalom_bringbook_info()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_01");	//������ �� ����� ������ ���������?
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_02");	//���! ��� �� ��� ��� �� ������� ����� ������ �������� ������.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_03");	//���� ������ ��� ����� ������������.
	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_04");	//������, � ��� ������� ��� ����, ��� ��� ��?
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_05");	//���, ��������. ���-�� ���� ��������, � ������� ���������� ������ ��� ������.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_06");	//�� ������ ��� ����� � ������ ������ � ��������, ���� ����.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_07");	//�� �� ���� � ��� ������ ��� ���� ��������.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_08");	//����� ������ ��� �������� �����, ���� �� �����������. �� ���� ������ � ��������.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_09");	//�� ���� �����������, �� � ��� ��� ��� ���� ����. �� ������ ����� ���������� ��������.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_10");	//�������� � ���. ��� ���������� ���� ������.
	CORKALOM_BRINGBOOK = LOG_RUNNING;
	Log_CreateTopic(CH2_BOOK,LOG_MISSION);
	Log_SetTopicStatus(CH2_BOOK,LOG_RUNNING);
	b_logentry(CH2_BOOK,"��� ������ ����� ��� ���� �������, ����� �������� ������� ���������. ���� ���� � �����, � ������� ���������, ��� ������������ ������. ���������� ������ �� ������� �������� �� � ������, ��� ��� ��� �������� �������. ������ �� ����� �� ������� ����� ������ � ���� ������ � ������� ���������.");
	Info_ClearChoices(info_corkalom_bringbook);
	Info_AddChoice(info_corkalom_bringbook,DIALOG_BACK,info_corkalom_bringbook_back);
	Info_AddChoice(info_corkalom_bringbook,"� � �� ��� ���-������ ������?",info_corkalom_bringbook_earn);
	Info_AddChoice(info_corkalom_bringbook,"��� ����� ��������?",info_corkalom_bringbook_who);
	Info_AddChoice(info_corkalom_bringbook,"��� ������ ��������� �����?",info_corkalom_bringbook_where);
};

func void info_corkalom_bringbook_back()
{
	Info_ClearChoices(info_corkalom_bringbook);
};

func void info_corkalom_bringbook_where()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Where_15_01");	//��� ������ ��������� �����?
	AI_Output(self,other,"Info_CorKalom_BringBook_Where_10_02");	//�� �������� ����� �����, ������� ������ �� ��� ������. �� ��������� ��� �� ������� ����� ������.
};

func void info_corkalom_bringbook_who()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Who_15_01");	//��� ����� ��������?
	AI_Output(self,other,"Info_CorKalom_BringBook_Who_10_02");	//����� ������, ��� �� ���� ������ ������ �������. �������, �������, �� ������ ��������.
};

func void info_corkalom_bringbook_earn()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Earn_15_01");	//� � �� ��� ���-������ ������?
	AI_Output(self,other,"Info_CorKalom_BringBook_Earn_10_02");	//����� ���� ���� ������������� ���� ��������? �� �� ���������� ��� �������.
};


instance INFO_CORKALOM_BRINGBOOK_SUCCESS(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_corkalom_bringbook_success_condition;
	information = info_corkalom_bringbook_success_info;
	permanent = 0;
	description = "� ����� �����.";
};


func int info_corkalom_bringbook_success_condition()
{
	if(Npc_HasItems(hero,itwrfokusbuch) && (CORKALOM_BRINGBOOK == LOG_RUNNING))
	{
		return 1;
	};
};

func void info_corkalom_bringbook_success_info()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_01");	//� ����� �����.
	b_printtrademsg1("����� ��������.");
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_02");	//������� ������. ������ �� ������ ���, ��� ��� �����.
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_03");	//��� �������, � ��� ����� ������.
	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_04");	//��� ��������� ���������?
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_05");	//������� ����� �� ������� ����� ������. �� ��� ��������� ���, ����� �������� �������.
	//b_giveinvitems(hero,self,itwrfokusbuch,1);
	Npc_RemoveInvItem(hero,itwrfokusbuch);
	b_givexp(XP_BRINGBOOK);
	CORKALOM_BRINGBOOK = LOG_SUCCESS;
	b_logentry(CH2_BOOK,"����� ���� ��� � ������ �������� ��� ������, ��� ������ ����� ���������� � ������� ���������. �� �������� ����� �� ������� ����� ������.");
	Log_SetTopicStatus(CH2_BOOK,LOG_SUCCESS);
	AI_StopProcessInfos(self);
	b_story_prepareritual();
};


instance INFO_CORKALOM_BELOHNUNG(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = info_corkalom_belohnung_condition;
	information = info_corkalom_belohnung_info;
	permanent = 0;
	description = "����� ��������� � ���� �������.";
};


func int info_corkalom_belohnung_condition()
{
	if(Npc_KnowsInfo(hero,info_corkalom_bringbook_success))
	{
		return 1;
	};
};

func void info_corkalom_belohnung_info()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_15_00");	//����� ��������� � ���� �������.
	AI_Output(self,other,"Info_CorKalom_Belohnung_10_01");	//��� �� ������ ��������?
	Info_ClearChoices(info_corkalom_belohnung);
	Info_AddChoice(info_corkalom_belohnung,"��� ��� ������ � ������������.",info_corkalom_belohnung_scroll);
	Info_AddChoice(info_corkalom_belohnung,"� ������ ����.",info_corkalom_belohnung_ore);
	Info_AddChoice(info_corkalom_belohnung,"� ������ �����.",info_corkalom_belohnung_mana);
};

func void info_corkalom_belohnung_scroll()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_SCROLL_15_00");	//��� ��� ������ � ������������.
	AI_Output(self,other,"Info_CorKalom_Belohnung_SCROLL_10_01");	//��������� ��� ���������� � ����!
	b_printtrademsg1("�������� 3 ������ ���.");
	CreateInvItems(self,itarscrollsleep,3);
	b_giveinvitems(self,hero,itarscrollsleep,3);
	Info_ClearChoices(info_corkalom_belohnung);
};

func void info_corkalom_belohnung_ore()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_ORE_15_00");	//� ������ ����.
	AI_Output(self,other,"Info_CorKalom_Belohnung_ORE_10_01");	//�������, ��� ���� ������ ���� ��������.
	b_printtrademsg1("�������� ����: 300");
	CreateInvItems(self,itminugget,300);
	b_giveinvitems(self,hero,itminugget,300);
	Info_ClearChoices(info_corkalom_belohnung);
};

func void info_corkalom_belohnung_mana()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_MANA_15_00");	//� ������ �����.
	AI_Output(self,other,"Info_CorKalom_Belohnung_MANA_10_01");	//����� ��� ����� �������� ���� ���!
	b_printtrademsg1("�������� 5 ���������� ���������� �������.");
	CreateInvItems(self,itfo_potion_mana_02,5);
	b_giveinvitems(self,hero,itfo_potion_mana_02,5);
	Info_ClearChoices(info_corkalom_belohnung);
};


instance GUR_1201_CORKALOM_EXIT(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 999;
	condition = gur_1201_corkalom_exit_condition;
	information = gur_1201_corkalom_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int gur_1201_corkalom_exit_condition()
{
	return 1;
};

func void gur_1201_corkalom_exit_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Exit_15_01");	//�� �������!
	AI_Output(self,other,"GUR_1201_CorKalom_Exit_10_02");	//�� ��������� ���� ������!
	AI_StopProcessInfos(self);
};

