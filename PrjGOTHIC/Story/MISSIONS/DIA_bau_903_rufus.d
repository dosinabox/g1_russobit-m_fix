
instance DIA_RUFUS_EXIT(C_INFO)
{
	npc = bau_903_rufus;
	nr = 999;
	condition = dia_rufus_exit_condition;
	information = dia_rufus_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_rufus_exit_condition()
{
	return 1;
};

func void dia_rufus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_RUFUS_WASSER(C_INFO)
{
	npc = bau_903_rufus;
	nr = 800;
	condition = info_rufus_wasser_condition;
	information = info_rufus_wasser_info;
	permanent = 1;
	description = "���� ������ �����. � ������ ����.";
};


func int info_rufus_wasser_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(((LEFTY_MISSION == LOG_RUNNING) || ((LEFTY_MISSION == LOG_SUCCESS) && Npc_HasItems(other,itfo_potion_water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void info_rufus_wasser_info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00");	//���� ������ �����. � ������ ����.
	if(Npc_HasItems(other,itfo_potion_water_01) >= 1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//�������, ��������. ���� ����� �����.
		b_giveinvitems(other,self,itfo_potion_water_01,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfo_potion_water_01);
		AN_BAUERN_VERTEILT = AN_BAUERN_VERTEILT + 1;
		if(AN_BAUERN_VERTEILT >= DURSTIGEBAUERN)
		{
			LEFTY_MISSION = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00");	//����! ��, ������! �� � ���� �� ������ ������ �� ��������! ������ �� ������ ���, ��� �� ������ ����, ����� ����!
	};
};


instance DIA_RUFUS_HELLO(C_INFO)
{
	npc = bau_903_rufus;
	nr = 1;
	condition = dia_rufus_hello_condition;
	information = dia_rufus_hello_info;
	permanent = 0;
	description = "������!";
};


func int dia_rufus_hello_condition()
{
	return 1;
};

func void dia_rufus_hello_info()
{
	if(KAPITEL == 1)
	{
		AI_Output(other,self,"DIA_Rufus_Hello_15_00");	//������! � ����� ���������. ���, ����� ������, ��� ��� ����?
	}
	else
	{
		AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//������! ��� ����?
	};
	AI_Output(self,other,"DIA_Rufus_Hello_02_01");	//������ ����-������ ���, �? � ������ ������� � ���� � ������ �� ����.
	AI_Output(self,other,"DIA_Rufus_Hello_02_02");	//��, ������, � �� � ������������� ��������� ������ ����� ������ ���������� ���� �������� �������!
};


instance DIA_RUFUS_WHY(C_INFO)
{
	npc = bau_903_rufus;
	nr = 1;
	condition = dia_rufus_why_condition;
	information = dia_rufus_why_info;
	permanent = 0;
	description = "���� ���� �� �������� ����� ������, ����� ������ �� �����?";
};


func int dia_rufus_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_rufus_hello))
	{
		return 1;
	};
};

func void dia_rufus_why_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"DIA_Rufus_Why_15_00");	//���� ���� �� �������� ����� ������, ����� ������ ���������� �������� �����?
	AI_Output(self,other,"DIA_Rufus_Why_02_01");	//��� ��������� � ������ �� ����, ����� ���� ��� � ����� ����. �����, ���� �� ����������� �����, ������ �� ��� � ��������� ���������� �� �����.
	AI_Output(self,other,"DIA_Rufus_Why_02_02");	//�������, � ����������. � ��� �������� � ����� ����� ���� � ���-�� ��������.
	AI_Output(self,other,"DIA_Rufus_Why_02_03");	//�� ��������� ����, ����� � ����������� ������� �����������, ���� ��� �������� �����.
	AI_Output(self,other,"DIA_Rufus_Why_02_04");	//'�� �� �� ������, ����� ���� �������� ������ ��� ������ �� ����, ���?' - ������� ��.
	AI_Output(self,other,"DIA_Rufus_Why_02_05");	//� ������ ���, ��� ������������ ��������� � ������ �� ����, ��� ��� ����� ����� � ��� �����... �� �� ���� �� ������.
	AI_Output(self,other,"DIA_Rufus_Why_02_06");	//������ ������� ���� �� �������� � ������� ������� � ����.
	AI_Output(self,other,"DIA_Rufus_Why_02_07");	//� ���� ������ �� ������ ���� �������� ���� ����� �����. �� ��� ���, ���� � ��� �� ���� ������ �� ������. �� ���� ��������� � ����� ������.
	AI_Output(self,other,"DIA_Rufus_Why_02_08");	//��� ��������� ����������, � ����� ��������� �� ��� ��������.
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance DIA_RUFUS_RICELORD(C_INFO)
{
	npc = bau_903_rufus;
	nr = 2;
	condition = dia_rufus_ricelord_condition;
	information = dia_rufus_ricelord_info;
	permanent = 1;
	description = "��� �� ����� ���� ����?";
};


func int dia_rufus_ricelord_condition()
{
	if(Npc_KnowsInfo(hero,dia_rufus_hello))
	{
		return 1;
	};
};

func void dia_rufus_ricelord_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00");	//��� �� �����, ���� ����?
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01");	//�� �������� ����� ����� �� ������, ����� �������� ������ � ������� ������� ����.
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02");	//������ ����� ��� ���� � ���� � ������. ������ �������, �������, ��� ������.
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	ricelord.aivar[AIV_FINDABLE] = TRUE;
};

instance INFO_RUFUS_WASSER_NOLEFTY(C_INFO)
{
	npc = bau_903_rufus;
	nr = 800;
	condition = info_rufus_wasser_nolefty_condition;
	information = info_rufus_wasser_nolefty_info;
	permanent = 1;
	description = "� ������ ���� ����.";
};

func int info_rufus_wasser_nolefty_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(Npc_HasItems(other,itfo_potion_water_01) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_rufus_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//� ������ ���� ����.
	AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//�������, ��������. ���� ����� �����.
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	b_giveinvitems(other,self,itfo_potion_water_01,1);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfo_potion_water_01);
};

instance DIA_RUFUS_HELLO2(C_INFO)
{
	npc = bau_903_rufus;
	nr = 1;
	condition = dia_rufus_hello2_condition;
	information = dia_rufus_hello2_info;
	permanent = 0;
	important = 1;
};


func int dia_rufus_hello2_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		return 1;
	};
};

func void dia_rufus_hello2_info()
{
	AI_Output(self,other,"SVM_2_HeDeservedIt");	//�� ������� �� ��������.
	AI_StopProcessInfos(self);
};

