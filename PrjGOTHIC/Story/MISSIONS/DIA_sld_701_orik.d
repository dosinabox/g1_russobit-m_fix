
instance SLD_701_ORIK_EXIT(C_INFO)
{
	npc = sld_701_orik;
	nr = 999;
	condition = sld_701_orik_exit_condition;
	information = sld_701_orik_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int sld_701_orik_exit_condition()
{
	return TRUE;
};

func void sld_701_orik_exit_info()
{
	AI_StopProcessInfos(self);
};

instance SLD_701_ORIK_DIELAGE(C_INFO)
{
	npc = sld_701_orik;
	nr = 1;
	condition = sld_701_orik_dielage_condition;
	information = sld_701_orik_dielage_info;
	permanent = 1;
	description = "��� ���� ����?";
};


func int sld_701_orik_dielage_condition()
{
	if(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		if(fmtaken && !Npc_KnowsInfo(hero,info_xardas_disturb))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};
	};
};

func void sld_701_orik_dielage_info()
{
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00");	//��� ���� ����?
	if(!fmtaken)
	{
		AI_Output(self,other,"Sld_701_Orik_DieLage_02_01");	//���� ����� ������� ������������ ������� ��� � �������. �� ���� ������ �� �������� ������ �� �����������...
	}
	else
	{
		AI_Output(self,other,"Sld_701_Orik_DieLage_02_02");	//���������� �����������. ����� ������� ����� ����� ����� ��������. �� ���� ��������, ����.
		AI_Output(self,other,"Sld_701_Orik_DieLage_02_03");	//� �� ���� ����, ����� ��� ���������.
	};
	if(Npc_KnowsInfo(hero,sld_701_orik_daslager) && Npc_KnowsInfo(hero,sld_701_orik_einervoneuchwerden) && Npc_KnowsInfo(hero,sld_701_orik_krautprobe))
	{
		AI_StopProcessInfos(self);
	};
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
};


instance SLD_701_ORIK_DASLAGER(C_INFO)
{
	npc = sld_701_orik;
	nr = 2;
	condition = sld_701_orik_daslager_condition;
	information = sld_701_orik_daslager_info;
	permanent = 0;
	description = "�������� ��� �� ���� ������.";
};


func int sld_701_orik_daslager_condition()
{
	return TRUE;
};

func void sld_701_orik_daslager_info()
{
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00");	//�������� ��� �� ���� ������.
	AI_Output(self,other,"Sld_701_Orik_DasLager_02_01");	//������ �� ������, �������� � ������. �� ��� ��� �������. ������ �� ������� ���������� ����� �� ��������.
};


instance SLD_701_ORIK_EINERVONEUCHWERDEN(C_INFO)
{
	npc = sld_701_orik;
	nr = 3;
	condition = sld_701_orik_einervoneuchwerden_condition;
	information = sld_701_orik_einervoneuchwerden_info;
	permanent = 0;
	description = "��� ��� �������������� � ���?";
};


func int sld_701_orik_einervoneuchwerden_condition()
{
	if(((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_ORG)) && (oldheroguild != GIL_KDF))
	{
		return TRUE;
	};
};

func void sld_701_orik_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00");	//��� ��� �������������� � ���?
	AI_Output(self,other,"Sld_701_Orik_EinerVonEuchWerden_02_01");	//��� �� ����� �������. �� ���� �� - ������� ������, � ���� ���� ����. �������� � ��.
};


instance SLD_701_ORIK_KRAUTPROBE(C_INFO)
{
	npc = sld_701_orik;
	nr = 4;
	condition = sld_701_orik_krautprobe_condition;
	information = sld_701_orik_krautprobe_info;
	permanent = 0;
	description = "� ���� ���� ��������. ������?";
};


func int sld_701_orik_krautprobe_condition()
{
	if((baalkagan_verteilkraut == LOG_RUNNING) || (baalkagan_verteilkraut == LOG_SUCCESS))
	{
		if(Npc_HasItems(hero,itmijoint_1) || Npc_HasItems(hero,itmijoint_2) || Npc_HasItems(hero,itmijoint_3))
		{
			return TRUE;
		};
	};
};

func void sld_701_orik_krautprobe_info()
{
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//� ���� ���� ��������. ������?
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_01");	//���, ������. � ������ ���, ��������� �������� ���� �������� ���� �����.
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_02");	//�� �������, ��� ������ ��� ���������? ��� �� �� ���!
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_03");	//� ��������� ��-�� ��������� ���� � ������� ���������. �� ������ �������?
	if(Npc_KnowsInfo(hero,dia_torlof_hallo))
	{
		AI_Output(other,self,"INFO_THORUS_LETTERFORMAGES_15_02");	//��.
	}
	else
	{
		AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//��� ���.
	};
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_06");	//������� ������! ������ ������� ����! �� � ��������� ��� �� �� ����� ��������� �����. �������, ��� ��� ��������� �����-�� ���� � ������ �����.
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_07");	//��� ������� �� ������ �����, ����� ���� �����������, �����������, ��� � ������� �������. �� � ���� ������ � ���� ����� �� ���������! �����?
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_BACK_15_00");	//�� �����, �� �������� ���.
	AI_StopProcessInfos(self);
};

instance ORIK_STEALKEY(C_INFO)
{
	npc = sld_701_orik;
	nr = 990;
	condition = orik_stealkey_condition;
	information = orik_stealkey_info;
	important = 0;
	permanent = 0;
	description = "(������� ����)";
};


func int orik_stealkey_condition()
{
	if(Npc_HasItems(self,orik_key) && Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1 && Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1)
	{
		return TRUE;
	};
};

func void orik_stealkey_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//� ���� ���� ��������. ������?
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_01");	//���, ������. � ������ ���, ��������� �������� ���� �������� ���� �����.
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_02");	//�� �������, ��� ������ ��� ���������? ��� �� �� ���!
	PrintScreen("������� ����.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,orik_key);
	Npc_RemoveInvItem(self,orik_key);
	AI_StopProcessInfos(self);
};

