
instance DIA_MILTEN_EXIT(C_INFO)
{
	npc = pc_mage;
	nr = 999;
	condition = dia_milten_exit_condition;
	information = dia_milten_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_milten_exit_condition()
{
	return 1;
};

func void dia_milten_exit_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"DIA_Milten_EXIT_02_00");	//����.
	}
	else
	{
		AI_Output(self,hero,"DIA_Milten_EXIT_02_01");	//��������.
	};
	if(Npc_HasItems(hero,demourizel))
	{
		Npc_RemoveInvItem(hero,demourizel);
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTEN_FIRST(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_first_condition;
	information = dia_milten_first_info;
	permanent = 0;
	important = 1;
};


func int dia_milten_first_condition()
{
	if((CORKALOM_BRINGMCQBALLS != LOG_SUCCESS) && !Npc_KnowsInfo(hero,grd_200_thorus_wannabemage) && (Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST))
	{
		return 1;
	};
};

func void dia_milten_first_info()
{
	AI_Output(self,other,"DIA_Milten_First_02_00");	//�� �� ������ ����������� ���� ����� �� ��� ���, ���� �� �������� ���������� �� ��������� ��������.
};


instance DIA_MILTEN_HELLO(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_hello_condition;
	information = dia_milten_hello_info;
	permanent = 0;
	description = "� ��� ���������� ���� ����� ����.";
};


func int dia_milten_hello_condition()
{
	if((SATURAS_BRINGFOCI == FALSE) && !Npc_KnowsInfo(hero,dia_milten_gotocorristo))
	{
		return 1;
	};
};

func void dia_milten_hello_info()
{
	AI_Output(other,self,"DIA_Milten_Hello_15_00");	//� ��� ���������� ���� ����� ����.
	AI_Output(self,other,"DIA_Milten_Hello_02_01");	//��� ��������. ����� �� ���� �����?
};


instance DIA_MILTEN_GOTOCORRISTO(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_gotocorristo_condition;
	information = dia_milten_gotocorristo_info;
	permanent = 0;
	important = 1;
};


func int dia_milten_gotocorristo_condition()
{
	if(((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) || Npc_KnowsInfo(hero,grd_200_thorus_wannabemage)) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return 1;
	};
};

func void dia_milten_gotocorristo_info()
{
	var C_NPC corristo;
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_01");	//�� ������� � ����� �������� � ������ �����. ��� �������� ������ ���� ���� ������� ���������.
	AI_Output(self,other,"DIA_Milten_GotoCorristo_02_02");	//�������� ���� ������ � ����. �� ����� ���������� � �����. ��� � ����.
	if((Npc_HasItems(other,itwr_fire_letter_01) >= 1) || (Npc_HasItems(other,itwr_fire_letter_02) >= 1))
	{
		AI_Output(other,self,"DIA_Milten_Letter_15_00");	//� ���� ���� ������ ��� ���������� ���� ����� ����.
		AI_Output(self,other,"DIA_Milten_Letter_02_03");	//������ ��� ��� ������.
		AI_Output(other,self,"DIA_Milten_Letter_Give_15_00");	//��� ���.
		b_usefakescroll();
		if(Npc_HasItems(other,itwr_fire_letter_01))
		{
			b_printtrademsg1("������ ������������ ������.");
			b_givexp(XP_XARDASLETTER);
			Npc_RemoveInvItem(other,itwr_fire_letter_01);
		}
		else if(Npc_HasItems(other,itwr_fire_letter_02))
		{
			b_printtrademsg1("������ �������� ������.");
			b_givexp(XP_XARDASLETTEROPEN);
			Npc_RemoveInvItem(other,itwr_fire_letter_02);
		};
		corristo = Hlp_GetNpc(kdf_402_corristo);
		CreateInvItem(corristo,itwr_fire_letter_02);
		AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//� � �� �������� �������?
		AI_Output(self,hero,"Info_Milten_SHSEAL_02_05");	//� ���� ������ ��� �������������.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			b_logentry(KDFLETTER,"� �������� ������ �����. ������� � ��� ��������, �� ������� �� �������, ����.");
			Log_SetTopicStatus(KDFLETTER,LOG_SUCCESS);
			PYROCAR_MESSENGER = LOG_SUCCESS;
		};
	};
};


var int milten_hasletter;

instance DIA_MILTEN_LETTER(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_letter_condition;
	information = dia_milten_letter_info;
	permanent = 0;
	description = "� ���� ���� ������ ��� ���������� ���� ����� ����.";
};


func int dia_milten_letter_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_hello) && ((Npc_HasItems(other,itwr_fire_letter_01) >= 1) || (Npc_HasItems(other,itwr_fire_letter_02) >= 1)) && (KAPITEL < 4) && (SATURAS_BRINGFOCI == FALSE))
	{
		return 1;
	};
};

func void dia_milten_letter_info()
{
	AI_Output(other,self,"DIA_Milten_Letter_15_00");	//� ���� ���� ������ ��� ���������� ���� ����� ����.
	AI_Output(self,other,"DIA_Milten_Letter_02_01");	//�� ����� �� �������� ����?
	AI_Output(other,self,"DIA_Milten_Letter_15_02");	//��, ���� ��� ������� ��� ������, ����� ��� ��� ���� ��������� � �������.
	AI_Output(self,other,"DIA_Milten_Letter_02_03");	//������ ��� ��� ������.
	Info_ClearChoices(dia_milten_letter);
	Info_AddChoice(dia_milten_letter,"������� � ���� �������� �������.",dia_milten_letter_no);
	Info_AddChoice(dia_milten_letter,"��� ���.",dia_milten_letter_give);
};

func void dia_milten_letter_give()
{
	var C_NPC corristo;
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_00");	//��� ���.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_03");	//��� ������ ���������� ��������!
	AI_Output(other,self,"DIA_Milten_Letter_Give_15_04");	//� ��� � ���� ����������?
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_05");	//������� ������� �������� ������ ����� ��� �����. �� ���� ������ � �������� ���� ����� ������ �����.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_06");	//�� ����� � ����� � ������ ������ ����� � ���������� ������ ������ ��������������.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_07");	//�� ������, ��� ������� ���, ��� ����� �� ��� ��� ���������� �������.
	AI_Output(self,other,"DIA_Milten_Letter_Give_02_08");	//��� �����. � ����� �������.
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP(self,"OCC_CHAPEL_ENTRANCE");
	if(Npc_HasItems(other,itwr_fire_letter_01))
	{
		b_printtrademsg1("������ ������������ ������.");
		b_givexp(XP_XARDASLETTER);
		Npc_RemoveInvItem(other,itwr_fire_letter_01);
	}
	else if(Npc_HasItems(other,itwr_fire_letter_02))
	{
		b_printtrademsg1("������ �������� ������.");
		b_givexp(XP_XARDASLETTEROPEN);
		Npc_RemoveInvItem(other,itwr_fire_letter_02);
	};
	corristo = Hlp_GetNpc(kdf_402_corristo);
	CreateInvItem(corristo,itwr_fire_letter_02);
	MILTEN_HASLETTER = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void dia_milten_letter_no()
{
	AI_Output(other,self,"DIA_Milten_Letter_NO_15_00");	//������� � ���� �������� �������.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_01");	//�������� �������� ������� ������ �� ����, ��� ������ ������� ������.
	AI_Output(self,other,"DIA_Milten_Letter_NO_02_02");	//� ��������� ������, � ������� �� ���. ������ �� ������ ������ ��� ������.
	Info_ClearChoices(dia_milten_letter);
	Info_AddChoice(dia_milten_letter,"���, � �� ��� ����� ������ ��� ������ �������.",dia_milten_letter_no_again);
	Info_AddChoice(dia_milten_letter,"��� ���.",dia_milten_letter_give);
};

func void dia_milten_letter_no_again()
{
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_00");	//���, � �� ��� ����� ������ ��� ������ �������.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_01");	//����� �� � ���� �����������?
	AI_Output(other,self,"DIA_Milten_Letter_NO_AGAIN_15_02");	//���. ������� � ���� �������� �������.
	AI_Output(self,other,"DIA_Milten_Letter_NO_AGAIN_02_03");	//������. ���� �� ����� ������. ��� �����.
	Info_ClearChoices(dia_milten_letter);
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP(self,"OCC_CHAPEL_ENTRANCE");
	MILTEN_HASLETTER = FALSE;
	Npc_SetRefuseTalk(self,10);
};


instance DIA_MILTEN_COMESBACK(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_comesback_condition;
	information = dia_milten_comesback_info;
	permanent = 0;
	important = 1;
};


func int dia_milten_comesback_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_letter) && (Npc_RefuseTalk(self) == FALSE) && (KAPITEL <= 3))
	{
		return 1;
	};
};

func void dia_milten_comesback_info()
{
	if(MILTEN_HASLETTER == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_ComesBack_02_00");	//�������� �������� �������� � ���, ��� �� �� ��������� ���������� ������.
		AI_Output(self,other,"DIA_Milten_ComesBack_02_01");	//�� �� �������� ���� ����������� � �������� � �������� ������� �������.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			b_logentry(KDFLETTER,"������� �������� ���� � �������. � �� ����� ����� ������ �������� ������ ���, ������� ��� ����� �������!");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_ComesBack_02_02");	//�������� ��� � ������ ��������. �� ������, ��� �� ������ ����������� � �������� � ������� ���� �������.
		if(PYROCAR_MESSENGER == LOG_RUNNING)
		{
			b_logentry(KDFLETTER,"������� ����� ������ ���������� ����, ��������. ��� ���������� ������� �� ��������, ������ ����� ���������� � ��������.");
		};
	};
};


instance DIA_MILTEN_WOTORREZ(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_wotorrez_condition;
	information = dia_milten_wotorrez_info;
	permanent = 0;
	description = "��� ����� �������?";
};


func int dia_milten_wotorrez_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_comesback) && (SATURAS_BRINGFOCI == FALSE))
	{
		return 1;
	};
};

func void dia_milten_wotorrez_info()
{
	AI_Output(other,self,"DIA_Milten_WoTorrez_15_00");	//��� ����� �������?
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_01");	//���� ���� �� ����� ����� ������.
	AI_Output(self,other,"DIA_Milten_WoTorrez_02_02");	//���� �� �� �������� � ����� �����. ��������� ���� ���� ����� ����� � ����, ���� �������� ���������� � ��� ����.
};


instance DIA_MILTEN_NOCHEINBRIEF(C_INFO)
{
	npc = pc_mage;
	nr = 2;
	condition = dia_milten_nocheinbrief_condition;
	information = dia_milten_nocheinbrief_info;
	permanent = 0;
	description = "� ���� ���� ������ �� ����� ����.";
};


func int dia_milten_nocheinbrief_condition()
{
	if((CRONOS_MESSENGER == LOG_RUNNING) && (KAPITEL <= 3) && (Npc_HasItems(hero,cronos_brief) >= 1))
	{
		return 1;
	};
};

func void dia_milten_nocheinbrief_info()
{
	var C_NPC corristo;
	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00");	//� ���� ���� ������ �� ����� ����.
	b_printtrademsg1("������ ������ �������.");
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_01");	//�! ����� ������! � ������� ��� ��������.
	AI_Output(self,other,"DIA_Milten_NochEinBrief_02_02");	//����� ��������� � ����� ������, ���� ���� ����������� ���� �� �����.
	b_logentry(KDWLETTER,"������� ������� ������ ����� ����, ����� �������� �� ������ �������.");
	Npc_RemoveInvItem(other,cronos_brief);
	corristo = Hlp_GetNpc(kdf_402_corristo);
	CreateInvItem(corristo,cronos_brief);
};


instance DIA_MILTEN_PERM(C_INFO)
{
	npc = pc_mage;
	nr = 1;
	condition = dia_milten_perm_condition;
	information = dia_milten_perm_info;
	permanent = 0;
	description = "�������� ��� ���-������ � ����� ����.";
};


func int dia_milten_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_comesback) && (KAPITEL <= 3))
	{
		return 1;
	};
};

func void dia_milten_perm_info()
{
	AI_Output(other,self,"DIA_Milten_PERM_15_00");	//�������� ��� ���-������ � ����� ����.
	AI_Output(self,other,"DIA_Milten_PERM_02_01");	//���� ���� �������� ���� ���� � ������������� ������. ��� ����� � ������ ���������� ���.
	AI_Output(self,other,"DIA_Milten_PERM_02_02");	//���� ������� ���� ����������, �� � �� ���� ��������� ��������� ��������������.
	AI_Output(self,other,"DIA_Milten_PERM_02_03");	//��� �������, ��� ���� �������. �������� ������ ���� ����� ��������. ��-�����, �� ������ ����� ������� ����������.
	AI_Output(self,other,"DIA_Milten_PERM_02_04");	//� ��� ��� � ��������� ������������� ���� ���������� ������, ����� ���� ���������� � ��������� ����.
};


instance DIA_MILTEN_WANNAMAGE(C_INFO)
{
	npc = pc_mage;
	nr = 2;
	condition = dia_milten_wannamage_condition;
	information = dia_milten_wannamage_info;
	permanent = 1;
	description = "� ���� ���� ����� �������� ����. �����, ��� ��.";
};


func int dia_milten_wannamage_condition()
{
	if(Npc_KnowsInfo(hero,dia_milten_perm) && (CORKALOM_BRINGMCQBALLS != LOG_SUCCESS) && Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return 1;
	};
};

func void dia_milten_wannamage_info()
{
	AI_Output(other,self,"DIA_Milten_WannaMage_15_00");	//� ���� ���� ����� �������� ����. �����, ��� ��.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_01");	//�������� ������ ����, ������ ��� � ������� �������.
	AI_Output(self,other,"DIA_Milten_WannaMage_02_02");	//�� ��� ���, ���� �� �� �������� ���-������ ��������������, �� � ������������� �� ������� � ����� ��������.
	if(Npc_GetTrueGuild(hero) == GIL_NONE && KAPITEL < 2)
	{
		AI_Output(self,other,"DIA_Milten_WannaMage_02_03");	//������ �����, �� ������ ������������ � ������� ������. ����������, ��� �������� ������� ���� � ������� �������� �� ������ ����� �������.
	};
};


instance INFO_MILTEN_SHWAIT(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shwait_condition;
	information = info_milten_shwait_info;
	important = 1;
	permanent = 0;
};


func int info_milten_shwait_condition()
{
	if(Npc_GetDistToWP(hero,"OW_PATH_274") < 1000 && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return 1;
	};
};

func void info_milten_shwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_01");	//�����������! ��� ���� ������ �� ��������� ������ ��������� ��� � ����.
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_02");	//� �������. �� ���� ����� �������.
	AI_Output(hero,self,"Info_Milten_SHWAIT_15_03");	//���, ��������...
	AI_Output(self,hero,"Info_Milten_SHWAIT_02_04");	//��, ��. ��� ������ �������, ��?
};


instance INFO_MILTEN_SHGORN(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shgorn_condition;
	information = info_milten_shgorn_info;
	important = 0;
	permanent = 0;
	description = "� ����� �����.";
};


func int info_milten_shgorn_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shwait) && Npc_KnowsInfo(hero,info_gorn_ruinsuccess))
	{
		return TRUE;
	};
};

func void info_milten_shgorn_info()
{
	AI_Output(hero,self,"Info_Milten_SHGORN_15_01");	//� ����� �����.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_02");	//� ����� ����? � ���?
	AI_Output(hero,self,"Info_Milten_SHGORN_15_03");	//� ������ ��������� � ����. �� ������ ��� ���������.
	AI_Output(self,hero,"Info_Milten_SHGORN_02_04");	//������, ��� �� ��������� ��� ��� ����, ����� �� ���������� �����.
};


instance INFO_MILTEN_SHLESTER(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shlester_condition;
	information = info_milten_shlester_info;
	important = 0;
	permanent = 0;
	description = "�� � �������� ����������� ���� � �����.";
};


func int info_milten_shlester_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shwait) && Npc_KnowsInfo(hero,pc_psionic_finish))
	{
		return TRUE;
	};
};

func void info_milten_shlester_info()
{
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_01");	//�� � �������� ����������� ���� � �����.
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_02");	//�� ������� ��� �� ����. �����, ���� ����� ��������.
	AI_Output(hero,self,"Info_Milten_SHLESTER_15_03");	//��� ��� �� �� ����������� �� �����?
	AI_Output(self,hero,"Info_Milten_SHLESTER_02_04");	//�, ����� � ��� - � ����� ������ ������.
};


instance INFO_MILTEN_SHYOU(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shyou_condition;
	information = info_milten_shyou_info;
	important = 0;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int info_milten_shyou_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shwait))
	{
		return 1;
	};
};

func void info_milten_shyou_info()
{
	AI_Output(hero,self,"Info_Milten_SHYOU_15_01");	//��� �� ����� �������?
	AI_Output(self,hero,"Info_Milten_SHYOU_02_02");	//���������� ������ ��������� ������� �������� ������, � ������ �������� ���� ���� � ����������.
	AI_Output(hero,self,"Info_Milten_SHYOU_15_03");	//���-�� ����� ������?
	AI_Output(self,hero,"Info_Milten_SHYOU_02_04");	//��, ���-�� �����.
	AI_Output(self,hero,"Info_Milten_SHYOU_02_05");	//��� ����� ���-��� ������ �� ����� ������.
};


instance INFO_MILTEN_SHME(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shme_condition;
	information = info_milten_shme_info;
	important = 0;
	permanent = 0;
	description = "� ��� ������. �� ������ ���� ���-�� �����.";
};


func int info_milten_shme_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shwait) && !Npc_KnowsInfo(hero,info_milten_shaccept))
	{
		return 1;
	};
};

func void info_milten_shme_info()
{
	AI_Output(hero,self,"Info_Milten_SHME_15_01");	//� ��� ������. �� ������ ���� ���-�� �����.
	AI_Output(self,hero,"Info_Milten_SHME_02_02");	//������, ��� ����� ����� ������� � ���� � �� �� �����.
};


instance INFO_MILTEN_SHPROBLEM(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shproblem_condition;
	information = info_milten_shproblem_info;
	important = 0;
	permanent = 0;
	description = "������ �� ��� �� ������ ����� � ����� � ����� ��, ��� ���� �����?";
};


func int info_milten_shproblem_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shyou))
	{
		return TRUE;
	};
};

func void info_milten_shproblem_info()
{
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_01");	//� ������ �� ��� �� ������ ����� � ����� � ����� ��� ��, ��� ���� �����?
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_02");	//�, ������ �������. ������� ������ �������� ������������, ����� ���������.
	AI_Output(hero,self,"Info_Milten_SHPROBLEM_15_03");	//��������, � �� ���������!
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_04");	//������! ����� ���������� ����������� �������, ������������� ���� ���...
	AI_Output(self,hero,"Info_Milten_SHPROBLEM_02_05");	//...���� �� ����� ����� ��� ���������� ��������.
};


instance INFO_MILTEN_SHFOCUS(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shfocus_condition;
	information = info_milten_shfocus_info;
	important = 0;
	permanent = 0;
	description = "�� �������� �� ����� �� ������-��������?";
};


func int info_milten_shfocus_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shproblem))
	{
		return TRUE;
	};
};

func void info_milten_shfocus_info()
{
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_01");	//�� �������� �� ����� �� ������-��������?
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_02");	//�����! ��� �� ��� ������ ������� �� ���� ���� ������?
	AI_Output(hero,self,"Info_Milten_SHFOCUS_15_03");	//�����, � �� ����, ��������, �� �� �������� ������?
	AI_Output(self,hero,"Info_Milten_SHFOCUS_02_04");	//���, ������ ��� �� �����, �� ���� � ��� �������� �����.
};


instance INFO_MILTEN_SHSEAL(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shseal_condition;
	information = info_milten_shseal_info;
	important = 0;
	permanent = 0;
	description = "� ���� �������� ��������� � ������?";
};


func int info_milten_shseal_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shproblem))
	{
		return TRUE;
	};
};

func void info_milten_shseal_info()
{
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_01");	//� ���� �������� ��������� � ������?
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_02");	//��. ��� �������� �������������� �����. ������ �� �����, ��� ���������� ������� ������...
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_03");	//...����� ������� � ������� � ������ ������ �������� �������� �� ������ �����... �����.
	AI_Output(hero,self,"Info_Milten_SHSEAL_15_04");	//� �� ����� ������ ��� ��������?
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_05");	//� ���� ������ ��� �������������.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_06");	//��������� ��� ����� ���� �� �������, �������������� ������ �� �����, ����� ��������� � ��������.
	AI_Output(self,hero,"Info_Milten_SHSEAL_02_07");	//� ������ �� �������� ��� ���������.
};


instance INFO_MILTEN_SHTALISMAN(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shtalisman_condition;
	information = info_milten_shtalisman_info;
	important = 0;
	permanent = 0;
	description = "� ��� ��� �� ��������?";
};


func int info_milten_shtalisman_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shfocus))
	{
		return TRUE;
	};
};

func void info_milten_shtalisman_info()
{
	AI_Output(hero,self,"Info_Milten_SHTALISMAN_15_01");	//� ��� ��� �� ��������?
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_02");	//� �����, ��������� �������� ����������� ��� ��� ������ �� ������� �����.
	AI_Output(self,hero,"Info_Milten_SHTALISMAN_02_03");	//���� � ����, ���� �������� ����� ��������� ����� ��������.
};


instance INFO_MILTEN_SHOFFER(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shoffer_condition;
	information = info_milten_shoffer_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ��������� ��������. �� ������� ��������, � � - ������.";
};


func int info_milten_shoffer_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shseal) && Npc_KnowsInfo(hero,info_milten_shtalisman))
	{
		return TRUE;
	};
};

func void info_milten_shoffer_info()
{
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_01");	//��� ����� ������ ��������� ��� ��������. �� ������� ��������, � � - ������.
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_02");	//��� ��� ������, �� ���� ���� ��������...
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_03");	//��������?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_04");	//��. ���, ��� �������� ��� ��������.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_05");	//� ����� ��� ������ ������ �������� �� �����?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_06");	//��� �� ���-�� ������. �������, �� �� ������ ��������� �������� ������.
	AI_Output(hero,self,"Info_Milten_SHOFFER_15_07");	//��� �������, ��� �� ��� ���-�� ��������. � ���� ���� ����?
	AI_Output(self,hero,"Info_Milten_SHOFFER_02_08");	//��... ��... ����-�� ����, �� ������ ��� �� ����������.
};


instance INFO_MILTEN_SHOFFER2(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shoffer2_condition;
	information = info_milten_shoffer2_info;
	important = 0;
	permanent = 0;
	description = "��, � ����� � ���� ����?";
};


func int info_milten_shoffer2_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shoffer))
	{
		return TRUE;
	};
};

func void info_milten_shoffer2_info()
{
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_01");	//��, � ����� � ���� ����?
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_02");	//� ���� ���� ������ � ����� ������ �����������.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_03");	//��� �������� ���������� ����� ������.
	AI_Output(hero,self,"Info_Milten_SHOFFER2_15_04");	//�� ����� ��������� �������� ����� ����� ��������!
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_05");	//��... �� ������. � ��������� ��� ��� ������� �� ������ �����.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_06");	//��� �� ���������, ��� ���� ����� ����, ��������� ����� �� ����������.
	AI_Output(self,hero,"Info_Milten_SHOFFER2_02_07");	//� ��� ���� ��� ��������� ���� � ���� �� �����. ������ ��� �� ����������.
};


instance INFO_MILTEN_SHACCEPT(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shaccept_condition;
	information = info_milten_shaccept_info;
	important = 0;
	permanent = 0;
	description = "��� ��� ���� ������, � �� ������ ���� ������!";
};


func int info_milten_shaccept_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shoffer2))
	{
		return TRUE;
	};
};

func void info_milten_shaccept_info()
{
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_01");	//��� ��� ���� ������, � �� ������ ���� ������!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_02");	//������! � ��������, ��� �� ��� �������!
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_03");	//�� � ��� ����� ���� ������. ���������� ��������� ��� ��� ������.
	b_printtrademsg1("������� ������ ����������� ������.");
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_04");	//� ��������� ������� �������� ��������� ������� �������.
	AI_Output(hero,self,"Info_Milten_SHACCEPT_15_05");	//�������. ��� ������ � ����� ������?
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06");	//��� �� ����.
	Log_CreateTopic(CH3_STONEHENGE,LOG_MISSION);
	Log_SetTopicStatus(CH3_STONEHENGE,LOG_RUNNING);
	b_logentry(CH3_STONEHENGE,"�������� �� ����� ������ � �������� ���� ���� ��������. �� ������ ���, ��� ������, ������� � ���, ��������� � ������ ��� ���� �����������.");
	b_logentry(CH3_STONEHENGE,"������� ��� ��� ������, � ������� �������� ����� �������� ������ ������. �� ������ ������ ��������� ��� ���������.");
	CreateInvItem(self,itarscrolldestroyundead);
	b_giveinvitems(self,hero,itarscrolldestroyundead,1);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHGuide");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_SHARRIVED(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_sharrived_condition;
	information = info_milten_sharrived_info;
	important = 1;
	permanent = 0;
};


func int info_milten_sharrived_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_milten_sharrived_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHARRIVED_02_01");	//��� �� � ������. ���� ������� ����� ����� � ��������.
	AI_Output(hero,self,"Info_Milten_SHARRIVED_15_02");	//����� ������, �������� ����� ������!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_SHHEAL(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shheal_condition;
	information = info_milten_shheal_info;
	important = 0;
	permanent = 1;
	description = "� �����. ������ ���!";
};


func int info_milten_shheal_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && !Npc_KnowsInfo(hero,info_milten_shsuccess) && (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (MILTEN_HEAL < 4))
	{
		return TRUE;
	};
};

func void info_milten_shheal_info()
{
	AI_Output(hero,self,"Info_Milten_SHHEAL_15_01");	//� �����. ������ ���!
	if(MILTEN_HEAL == 0)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//������ �������� �������.
		b_printtrademsg1("������� �������� ���������.");
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		MILTEN_HEAL = 1;
	}
	else if(MILTEN_HEAL == 1)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//������ �������� �������.
		b_printtrademsg1("������� �������� ���������.");
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		MILTEN_HEAL = 2;
	}
	else if(MILTEN_HEAL == 2)
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_02");	//������ �������� �������.
		b_printtrademsg1("������� �������� ���������.");
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		MILTEN_HEAL = 3;
	}
	else
	{
		AI_Output(self,hero,"Info_Milten_SHHEAL_02_03");	//� ���� ������ ��� �������� ���������.
		MILTEN_HEAL = 4;
	};
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_SHRUNNING(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shrunning_condition;
	information = info_milten_shrunning_info;
	important = 0;
	permanent = 1;
	description = "����� ��� ��� ���!";
};


func int info_milten_shrunning_condition()
{
	var int keeperfound;
	Npc_PerceiveAll(self);
	keeperfound = Wld_DetectNpc(self,zombiethekeeper,NOFUNC,-1);
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && (keeperfound && !Npc_IsDead(other)))
	{
		return TRUE;
	};
};

func void info_milten_shrunning_info()
{
	AI_Output(hero,self,"Info_Milten_SHRUNNING_15_01");	//����� ��� ��� ���!
	AI_Output(self,hero,"Info_Milten_SHRUNNING_02_02");	//��� �������� ���, �������� ������ � �����������!
};


instance INFO_MILTEN_SHSCROLL(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shscroll_condition;
	information = info_milten_shscroll_info;
	important = 0;
	permanent = 0;
	description = "� ����������� ������... �� � �� ���� ������!";
};


func int info_milten_shscroll_condition()
{
	var int keeperfound;
	Npc_PerceiveAll(self);
	keeperfound = Wld_DetectNpc(self,zombiethekeeper,NOFUNC,-1);
	if(keeperfound && !Npc_IsDead(other) && Npc_KnowsInfo(hero,info_milten_shaccept) && (Npc_HasItems(hero,itarscrolldestroyundead) == 0) && (Npc_HasItems(hero,itarrune_6_1_destroyundead) == 0))
	{
		return TRUE;
	};
};

func void info_milten_shscroll_info()
{
	var C_NPC npc;
	AI_Output(hero,self,"Info_Milten_SHSCROLL_15_01");	//� ����������� ������... �� � �� ���� ������!
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_02");	//������ �� ���! ��������, ��� ��� ����� �������� ���!
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_03");	//����� ����, �� ������ ������ ��� ���� ������ ��� �����-������ ���� � ����� �� �������?
	AI_Output(self,hero,"Info_Milten_SHSCROLL_02_04");	//� ���� ����� ���� ���, ��� �� ����������� � ������� ���.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHWait");
	if(c_npcbelongstooldcamp(hero))
	{
		npc = Hlp_GetNpc(kdf_405_torrez);
		CreateInvItem(npc,itarscrolldestroyundead);
	}
	else if(c_npcbelongstonewcamp(hero))
	{
		npc = Hlp_GetNpc(kdw_604_cronos);
		CreateInvItem(npc,itarscrolldestroyundead);
	}
	else
	{
		npc = Hlp_GetNpc(gur_1208_baalcadar);
		CreateInvItem(npc,itarscrolldestroyundead);
	};
};


instance INFO_MILTEN_SHNEWSCROLL(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shnewscroll_condition;
	information = info_milten_shnewscroll_info;
	important = 0;
	permanent = 0;
	description = "� ���� ������ ���� ���������� '���������� ������'!";
};


func int info_milten_shnewscroll_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shscroll) && !Npc_KnowsInfo(hero,info_milten_shsuccess) && ((Npc_HasItems(hero,itarscrolldestroyundead) > 0) || (Npc_HasItems(hero,itarrune_6_1_destroyundead) > 0)))
	{
		return TRUE;
	};
};

func void info_milten_shnewscroll_info()
{
	AI_Output(hero,self,"Info_Milten_SHNEWSCROLL_15_01");	//� ���� ������ ���� ���������� '���������� ������'!
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_02");	//������. ������, �� ����� ��� ��� ���������� � ����� � ������.
	AI_Output(self,hero,"Info_Milten_SHNEWSCROLL_02_03");	//��� ������, � ����� �� �����.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SHFollow");
};


instance INFO_MILTEN_SHLEAVE(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shleave_condition;
	information = info_milten_shleave_info;
	important = 1;
	permanent = 1;
};


func int info_milten_shleave_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && !Npc_KnowsInfo(hero,info_milten_shsuccess) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") > 10000) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_milten_shleave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_01");	//������, �������� ���� ������ �� ����������.
	AI_Output(self,hero,"Info_Milten_SHLEAVE_02_02");	//���� ���-���� �����������, �� ������ ����� ���� ���, ��� �� ����������� � ����� � ������� ���.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"SHWait");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_SHCONTINUE(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shcontinue_condition;
	information = info_milten_shcontinue_info;
	important = 0;
	permanent = 1;
	description = "������� ��� ��� ���� ������?";
};


func int info_milten_shcontinue_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(hero,info_milten_shaccept) && !Npc_KnowsInfo(hero,info_milten_shsuccess) && (Npc_GetDistToWP(hero,"OW_PATH_3_STONES") < 9000) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_milten_shcontinue_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(hero,self,"Info_Milten_SHCONTINUE_15_01");	//������� ��� ��� ���� ������?
	AI_Output(self,hero,"Info_Milten_SHCONTINUE_02_02");	//� �����. ��� ������, � ����� ������.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SHFollow");
	AI_StopProcessInfos(self);
};


var int orctalismanisfound;

instance INFO_MILTEN_SHSUCCESS(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_shsuccess_condition;
	information = info_milten_shsuccess_info;
	important = 1;
	permanent = 0;
};


func int info_milten_shsuccess_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_shaccept) && Npc_HasItems(hero,itmi_orctalisman) && (c_bodystatecontains(hero,BS_RUN) || c_bodystatecontains(hero,BS_WALK) || c_bodystatecontains(hero,BS_JUMP) || (ORCTALISMANISFOUND == 1) || Npc_HasReadiedWeapon(hero)) && (Npc_GetDistToPlayer(self) < 1000))
	{
		ORCTALISMANISFOUND = 1;
		return TRUE;
	};
};

func void info_milten_shsuccess_info()
{
	AI_UnreadySpell(hero);
	AI_RemoveWeapon(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_01");	//������. ������ � ���� ���� ��������.
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//���, ������ ���. ��� �� � ������.
	b_printtrademsg1("����� �������� �����.");
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_03");	//�������, ����. � ������� �� ������� ���, ��� ����� ���.
	AI_Output(self,hero,"Info_Milten_SHSUCCESS_02_04");	//� ����������� � ������ ������. ����� ����, �� ��� ��� ����������.
	b_giveinvitems(hero,self,itmi_orctalisman,1);
	b_logentry(CH3_STONEHENGE,"������ �� ������ �������� ������ ������. ������� ����� ��, ��� �����, � ����� ��������� � ������ ������.");
	b_logentry(CH3_STONEHENGE,"������� ����������, ����� � ������� ��� ������, ������� ����� �����!");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"ReturnToOC");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_OCWARN(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocwarn_condition;
	information = info_milten_ocwarn_info;
	important = 1;
	permanent = 0;
};


func int info_milten_ocwarn_condition()
{
	if(KAPITEL == 4 && Npc_CanSeeNpcFreeLOS(self,hero) && Npc_GetDistToNpc(self,hero) < 1400)
	{
		return TRUE;
	};
};

func void info_milten_ocwarn_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_OCWARN_02_01");	//���... ��� ��� ������... ��� ������. � �� ��� �� ������... � ���... ���� ��� �� ����... �...
	if(Npc_KnowsInfo(hero,info_diego_ocretreat))
	{
		AI_Output(hero,self,"Info_Milten_OCWARN_15_02");	//�� ��������, �������, � ������ ��� ������� � �����. �� �������� �� ������ ������� ������.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_03");	//����� �� ������ �����... ��� ������ �����?
		AI_Output(hero,self,"Info_Milten_OCWARN_15_04");	//���� � ������� ����� � �������, � ����� ��, ��� �� ����� ������ �� �� ����� ������� �����.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_05");	//�����! ���� ���������!
		b_logentry(CH4_FIREMAGES,"������� �������� �������� �� ������� ������, ��� � �����. �� ������������� �� ��������� ����, ��� ������� ����� � ������.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(hero,self,"Info_Milten_OCWARN_15_06");	//���������, �������, ��� ���������?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_07");	//��� ���� ���� ������! ���, ����� ����, � � ���� ��� �� ������� �� ������.
		AI_Output(hero,self,"Info_Milten_OCWARN_15_08");	//����� �������� ��� ��� �� �������.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_09");	//�����. ��������, �������, ��������...
		AI_Output(self,hero,"Info_Milten_OCWARN_02_10");	//��� �������� � ����, ��� ���������� ������ �����...
		AI_Output(hero,self,"Info_Milten_OCWARN_15_11");	//������ ����� ����������?
		AI_Output(self,hero,"Info_Milten_OCWARN_02_12");	//��. ��� ��������� ����� ������. ����� �� ������.
		AI_Output(self,hero,"Info_Milten_OCWARN_02_13");	//���� � ����� ����������� ���������.
		b_failch4quests();
	};
};


instance INFO_MILTEN_OCMINE(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocmine_condition;
	information = info_milten_ocmine_info;
	important = 0;
	permanent = 0;
	description = "��� �� ��� ����� ����������?";
};


func int info_milten_ocmine_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ocwarn) && !Npc_KnowsInfo(hero,info_diego_ocretreat))
	{
		return TRUE;
	};
};

func void info_milten_ocmine_info()
{
	AI_Output(hero,self,"Info_Milten_OCMINE_15_01");	//��� �� ��� ����� ����������?
	AI_Output(self,hero,"Info_Milten_OCMINE_02_02");	//������� �� ����. �� �� ���������, ��� ��� � ��� ������ � �����, ����� ��������, ��� �������� ���-�� ����� �������������, � ����� �� ������� ��������� �������� ������ ����.
	AI_Output(hero,self,"Info_Milten_OCMINE_15_03");	//�� ��� ���?
	AI_Output(self,hero,"Info_Milten_OCMINE_02_04");	//��. ��� � � �����, ��� ����� ����������.
};


instance INFO_MILTEN_OCKDW(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ockdw_condition;
	information = info_milten_ockdw_info;
	important = 0;
	permanent = 0;
	description = "�� ������� ���-�� � ����� ����.";
};


func int info_milten_ockdw_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ocwarn) && !Npc_KnowsInfo(hero,info_diego_ocretreat))
	{
		return TRUE;
	};
};

func void info_milten_ockdw_info()
{
	AI_Output(hero,self,"Info_Milten_OCKDW_15_01");	//�� ������� ���-�� � ����� ����.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_02");	//� ���� ������ ��, ��� ������ ����� ����, ��� ����� ����������, �� ���� ����� ������.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_03");	//����� � �������� �� ��������, ��������� � ����� �������� ������ �� ����.
	AI_Output(self,hero,"Info_Milten_OCKDW_02_04");	//��� �������� ���� ����������. ��� ���� ������� ����.
};


instance INFO_MILTEN_OCWHY(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocwhy_condition;
	information = info_milten_ocwhy_info;
	important = 0;
	permanent = 0;
	description = "����� ������� ����� ���� ����� �����? ��� �� �����...";
};


func int info_milten_ocwhy_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ockdw))
	{
		return TRUE;
	};
};

func void info_milten_ocwhy_info()
{
	AI_Output(hero,self,"Info_Milten_OCWHY_15_01");	//����� ������� ����� ���� ������� �����? ��� �� �����!
	AI_Output(self,hero,"Info_Milten_OCWHY_02_02");	//�� ����. �� � ���� �� ���� ����� �������� �� ���� � ����������. ��� ����� �� ������� �� ����.
	AI_Output(self,hero,"Info_Milten_OCWHY_02_03");	//��������, ����� ���-�� �����. ��� ��� � �� ����� �� ��� � ������.
};


instance INFO_MILTEN_OCYOU(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocyou_condition;
	information = info_milten_ocyou_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ���������� ���, ��� ��� �� ������ ���� �����.";
};


func int info_milten_ocyou_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ockdw))
	{
		return TRUE;
	};
};

func void info_milten_ocyou_info()
{
	AI_Output(hero,self,"Info_Milten_OCYOU_15_01");	//�� ������ ���������� ���, ��� ��� �� ������ ���� �����.
	AI_Output(self,hero,"Info_Milten_OCYOU_02_02");	//���. �� � ����� ������������ ������������ �� �������� � ������������� ����� ������ �� ������ �������. ��� ���� ������ �� �����������!
	if(!Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		AI_Output(self,hero,"Info_Milten_OCYOU_02_03");	//����������, �������� � ���!
	}
	else
	{
		b_logentry(CH4_FIREMAGES,"����� ����, ��� ����� ��������� ��� � �������� � ������ ������, � �������� ��������. �������, ���� ������ �� ������ �� �����.");
	};
};


instance INFO_MILTEN_OCDIEGO(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_ocdiego_condition;
	information = info_milten_ocdiego_info;
	important = 0;
	permanent = 0;
	description = "��� � ���� ����� �����?";
};


func int info_milten_ocdiego_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_ocwhy) && Npc_KnowsInfo(hero,info_milten_ocyou) && !Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		return TRUE;
	};
};

func void info_milten_ocdiego_info()
{
	AI_Output(hero,self,"Info_Milten_OCDIEGO_15_01");	//��� � ���� ����� �����?
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_02");	//�� ���������� � ������ �����, �� ������ ����� ������.
	AI_Output(self,hero,"Info_Milten_OCDIEGO_02_03");	//����������, �������� � ���!
	b_logentry(CH4_FIREMAGES,"�������� �� ������� ������ ���� �������� �������. �� ��������� �� ������ �� ������ ����� � �������� ����� ����.");
	b_logentry(CH4_FIREMAGES,"����� �������� �� ������ ������� ������, �������� �� �����. ��� ������ ����� � ��� ����������. �� ����� � ����������� ������� �����.");
};


instance INFO_MILTEN_LOADSWORD(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_loadsword_condition;
	information = info_milten_loadsword_info;
	important = 1;
	permanent = 0;
};


func int info_milten_loadsword_condition()
{
	if(LOADSWORD)
	{
		return TRUE;
	};
};

func void info_milten_loadsword_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_LOADSWORD_02_01");	//����������� ����, ��� ����. ����� ���� ������ � ��� ���, ��� �� �������� ��������� ���.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_02");	//������, �������. � ��� ��� ����� ������ ����������.
	AI_Output(hero,self,"Info_Milten_LOADSWORD_15_03");	//� �� � ������������� ��������� �� ���� ��� ����, �� ������ �� ��� ��� �������. � ����� �����.
};


instance INFO_MILTEN_LOADSWORD1(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_loadsword1_condition;
	information = info_milten_loadsword1_info;
	important = 0;
	permanent = 0;
	description = "�������, ��� ����� ���� ������!";
};


func int info_milten_loadsword1_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_loadsword))
	{
		return 1;
	};
};

func void info_milten_loadsword1_info()
{
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_01");	//�������, ��� ����� ���� ������!
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_02");	//��� ���������? ��� � ���� ���� ������?
	AI_Output(hero,self,"Info_Milten_LOADSWORD1_15_03");	//� �������� ���� �� ���� ���, ��� ��� ����� �� �������.
	AI_Output(self,hero,"Info_Milten_LOADSWORD1_02_04");	//������. ��� �� ����.
	Npc_ExchangeRoutine(self,"LSAway");
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_LSAWAY(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsaway_condition;
	information = info_milten_lsaway_info;
	important = 1;
	permanent = 0;
};


func int info_milten_lsaway_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_loadsword1) && (Npc_GetDistToWP(hero,"NC_KDW04_IN") < 500))
	{
		return TRUE;
	};
};

func void info_milten_lsaway_info()
{
	if((hero.attribute[ATR_STRENGTH] < 30) || (Npc_HasItems(hero,ITMW_2H_SWORD_HEAVY_03) || Npc_HasItems(hero,INNOS_ZORN) || Npc_HasItems(hero,GORNS_RACHE) || Npc_HasItems(hero,ROTER_WIND) || Npc_HasItems(hero,LEES_AXT) || Npc_HasItems(hero,THORUS_SCHWERT) || Npc_HasItems(hero,ITMW_2H_SWORD_HEAVY_04) || Npc_HasItems(hero,ITMW_2H_AXE_HEAVY_01) || Npc_HasItems(hero,ORIKS_AXT) || Npc_HasItems(hero,ITMW_2H_AXE_HEAVY_02) || Npc_HasItems(hero,ITMW_2H_AXE_HEAVY_04) || Npc_HasItems(hero,TORLOFS_AXT) || Npc_HasItems(hero,ITMW_2H_AXE_HEAVY_03)))
	{
		CreateInvItem(hero,demourizel);
	};
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_01");	//������ �����������, ��� ���������?
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_02");	//��� ����� ������� ������ ����, � � �����, ��� ���� ���� �� ���������� ������ ��� �������� ��.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_03");	//�� ������?
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_04");	//������ �� ����� ������. � ��������, ��� �������.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_05");	//� ����� ��������, ����������.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_06");	//�� ������ ���, ��� ����� ������.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_07");	//�������? �� ���� �������!
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_08");	//����� �� ������������ � ��� � ��� ����� ���, ��� �� ������� ������ ������.
	AI_Output(hero,self,"Info_Milten_LSAWAY_15_09");	//� ������� � ���.
	AI_Output(self,hero,"Info_Milten_LSAWAY_02_10");	//����� ���� ������������ ���� �������� ����?
	if(Npc_HasItems(hero,mythrilklinge01))
	{
		AI_Output(hero,self,"Info_Milten_LSAWAY_15_11");	//� ���� �������� �� ����� ����.
		AI_EquipBestMeleeWeapon(hero);
		AI_ReadyMeleeWeapon(hero);
		AI_Output(self,hero,"Info_Milten_LSAWAY_02_12");	//��, ��! ��� ��� ������!
		AI_Output(hero,self,"Info_Milten_LSAWAY_15_13");	//��� ��� �������!
		AI_RemoveWeapon(hero);
	};
};


instance INFO_MILTEN_LOADSWORD4(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_loadsword4_condition;
	information = info_milten_loadsword4_info;
	important = 0;
	permanent = 0;
	description = "������� ��� ��� ����������, ������� �������� ���� ���� ����.";
};


func int info_milten_loadsword4_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_lsaway))
	{
		return 1;
	};
};

func void info_milten_loadsword4_info()
{
	if(Npc_HasItems(hero,demourizel))
	{
		Npc_RemoveInvItem(hero,demourizel);
		AI_EquipBestMeleeWeapon(hero);
	};
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_01");	//������� ��� ��� ����������, ������� �������� ���� ���� ����.
	if(Npc_HasItems(hero,scroll4milten))
	{
		b_printtrademsg1("������ ���������� �������� �������.");
	};
	AI_Output(hero,self,"Info_Milten_LOADSWORD4_15_02");	//���� ����� ����� ��������� ���, ����� � ������� ��� � ����.
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_03");	//��, ��, ���� ��� ����� ������ �������� ����������...
	if(Npc_HasItems(hero,scroll4milten))
	{
		b_usefakescroll();
	};
	AI_Output(self,hero,"Info_Milten_LOADSWORD4_02_04");	//�� � ��� ��������� �������� � ��������� � ������� ������!
	if(Npc_HasItems(hero,scroll4milten))
	{
		b_printtrademsg2("�������� ���������� �������� �������.");
	};
};

instance INFO_MILTEN_LSRISK(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsrisk_condition;
	information = info_milten_lsrisk_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ��������!";
};


func int info_milten_lsrisk_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_loadsword4))
	{
		return TRUE;
	};
};

func void info_milten_lsrisk_info()
{
	AI_Output(hero,self,"Info_Milten_LSRISK_15_01");	//�� ������ ��������!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_02");	//��� ����� �����!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_03");	//����� ��� ���� ������� �������!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_04");	//� �� �������...
	AI_Output(hero,self,"Info_Milten_LSRISK_15_05");	//��� ������� ��� ��������� ������. ������ ���!
	AI_Output(self,hero,"Info_Milten_LSRISK_02_06");	//��, ������. ����� ����� ����, ��� �� ��� ��� ������, � �� ���� ���������� � ���� ����� ��� � ������ ��������.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_07");	//������ �����, ������, � ������� ���� ��������.
	AI_Output(self,hero,"Info_Milten_LSRISK_02_08");	//���������� ����� �������� ����, �... ������ �� ������ �� ����!
	AI_Output(hero,self,"Info_Milten_LSRISK_15_09");	//������. ���������� � ������ ����.
	b_logentry(CH5_URIZIEL,"� ���� ������� ����� ����� �������� ������ ��� ��������� ������� ���������� ���� � ���. �� ������������ ����������� � �������� ������ ����.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LSOreHeap");
};


instance INFO_MILTEN_OREGUARD(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_oreguard_condition;
	information = info_milten_oreguard_info;
	important = 1;
	permanent = 0;
};


func int info_milten_oreguard_condition()
{
	if(Npc_KnowsInfo(hero,info_oreguard))
	{
		return TRUE;
	};
};

func void info_milten_oreguard_info()
{
	AI_Output(hero,self,"DIA_Huno_YouKnowYourJob_15_00");	//� � ���� ������� ����������, ��� � ����.
	AI_Output(self,hero,"Info_Milten_SHACCEPT_02_06");	//��� �� ����.
	Npc_ExchangeRoutine(self,"LSOreHeap2");
	AI_StopProcessInfos(self);
};

instance INFO_MILTEN_LSOREHEAP(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsoreheap_condition;
	information = info_milten_lsoreheap_info;
	important = 1;
	permanent = 0;
};


func int info_milten_lsoreheap_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_lsrisk) && (Npc_GetDistToWP(hero,"NC_PATH41") < 500))
	{
		return TRUE;
	};
};

func void info_milten_lsoreheap_info()
{
	AI_Output(self,hero,"Info_Milten_LSOREHEAP_02_01");	//�� ������ ��� � ����������?
};


instance INFO_MILTEN_LSNOW(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsnow_condition;
	information = info_milten_lsnow_info;
	important = 0;
	permanent = 0;
	description = "��� ����������!";
};


func int info_milten_lsnow_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_lsoreheap) && Npc_HasItems(hero,mythrilklinge01) && Npc_HasItems(hero,scroll4milten) && (Npc_GetDistToWP(hero,"NC_PATH41") < 1000))
	{
		return TRUE;
	};
};

func void info_milten_lsnow_info()
{
	AI_Output(hero,self,"Info_Milten_LSNOW_15_01");	//��� ����������!
	b_printtrademsg1("������ ���������� �������� �������.");
	AI_Output(hero,self,"Info_Milten_LSNOW_15_02");	//�� �����?
	AI_Output(self,hero,"Info_Milten_LSNOW_02_03");	//���� ������ ���-������ ����� ���� ����� � �����...
	AI_Output(hero,self,"Info_Milten_LSNOW_15_04");	//����� ����� ������!
	b_giveinvitems(hero,self,scroll4milten,1);
	STARTCHAPTERSSIX = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_MILTEN_CHAPTERSIX(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_chaptersix_condition;
	information = info_milten_chaptersix_info;
	important = 1;
	permanent = 0;
};


func int info_milten_chaptersix_condition()
{
	if(Npc_KnowsInfo(hero,info_milten_lsnow) && STARTCHAPTERSSIX)
	{
		return TRUE;
	};
};

func void info_milten_chaptersix_info()
{
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"NC_PIT_CENTER");
	b_kapitelwechsel(6);
};


instance INFO_MILTEN_LSDONE(C_INFO)
{
	npc = pc_mage;
	condition = info_milten_lsdone_condition;
	information = info_milten_lsdone_info;
	important = 1;
	permanent = 0;
};


func int info_milten_lsdone_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void info_milten_lsdone_info()
{
	AI_Output(self,hero,"Info_Milten_LSDONE_02_01");	//������!
	if(hero.attribute[ATR_STRENGTH] >= 30)
	{
		AI_EquipBestMeleeWeapon(hero);
		AI_ReadyMeleeWeapon(hero);
		AI_PlayAni(hero,"T_URISELINSPECT");
		AI_RemoveWeapon(hero);
		AI_Output(hero,self,"Info_Milten_LSDONE_15_02");	//����������! ���� ������ ��� �����, � ������ �� �������� ����� ����!
	};
	AI_Output(self,hero,"Info_Milten_LSDONE_02_03");	//������, � ��� ����������! ���������� ���� ���� ���� ���� ������ ��������� � ����� ������ ����.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_04");	//��, �������, �� ��������� � ���� ������� ����� ��������.
	AI_Output(self,hero,"Info_Milten_LSDONE_02_05");	//���� �������� ��������������� ����������� ������, ��� ���� ����� ��������� ������!
	if(!Npc_HasItems(hero,itarrune_1_6_teleport3) && !Npc_HasItems(hero,itarrune_1_5_teleport5))
	{
		b_printtrademsg1("������� ������ ������������.");
		CreateInvItem(hero,itarscrollteleport5);
	};
	AI_Output(hero,self,"Info_Milten_LSDONE_15_06");	//� ��� ����� � �����?
	AI_Output(self,hero,"Info_Milten_LSDONE_02_07");	//��� ��� �� ��������, � ���-������ ��������. �����!
	if(hero.attribute[ATR_MANA] < 5 && !Npc_HasItems(hero,itfo_potion_mana_01) && !Npc_HasItems(hero,itfo_potion_mana_02) && !Npc_HasItems(hero,itfo_potion_mana_03))
	{
		b_printtrademsg2("�������� �������� ���������� �������.");
		CreateInvItem(hero,itfo_potion_mana_01);
	};
	b_story_urizielloaded();
	AI_StopProcessInfos(self);
	b_exchangeroutine(pc_thief,"Reunion");
	if(Npc_KnowsInfo(hero,info_gorn_diegomilten))
	{
		b_exchangeroutine(pc_fighter,"Reunion");
	};
	if(Npc_KnowsInfo(hero,info_lester_diegomilten))
	{
		b_exchangeroutine(pc_psionic,"Reunion");
	};
	AI_StartState(self,zs_miltensescape,1,"");
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};

