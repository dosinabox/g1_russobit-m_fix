
instance KDF_401_DAMAROK_WELCOME(C_INFO)
{
	npc = kdf_401_damarok;
	condition = kdf_401_damarok_welcome_condition;
	information = kdf_401_damarok_welcome_info;
	important = 1;
	permanent = 0;
};


func int kdf_401_damarok_welcome_condition()
{
	if(Npc_KnowsInfo(hero,kdf_402_corristo_robe) && Npc_KnowsInfo(hero,kdf_403_drago_rune) && Npc_KnowsInfo(hero,kdf_405_torrez_book) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_welcome_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"KDF_401_Damarok_Alchemy_01");	//������ � ���� ������� ���� ����� � ������� ���� ��������� �������.
	if(ALCHEMYACTIVE == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"��� ���� ������� ����� ������� ���� �������.");
	};
	CORRISTO_KDFAUFNAHME = 6;
	b_story_feueraufnahme();
	AI_StopProcessInfos(self);
};


instance KDF_401_DAMAROK_EXIT(C_INFO)
{
	npc = kdf_401_damarok;
	nr = 999;
	condition = kdf_401_damarok_exit_condition;
	information = kdf_401_damarok_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int kdf_401_damarok_exit_condition()
{
	return TRUE;
};

func void kdf_401_damarok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance KDF_401_DAMAROK_TEACH(C_INFO)
{
	npc = kdf_401_damarok;
	condition = kdf_401_damarok_teach_condition;
	information = kdf_401_damarok_teach_info;
	important = 0;
	permanent = 1;
	description = "� ���� ������� ���������� ������.";
};

func int kdf_401_damarok_teach_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF && LOG_DAMAROKTRAIN == FALSE)
	{
		return TRUE;
	};
};

func void kdf_401_damarok_teach_info()
{
	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01");	//� ���� ������� ���������� ������.
	if(ALCHEMYACTIVE == FALSE)
	{
		AI_Output(self,other,"KDF_401_Damarok_Alchemy_02");	//��� �� ������ ������?
		Info_ClearChoices(kdf_401_damarok_teach);
		Info_AddChoice(kdf_401_damarok_teach,DIALOG_BACK,kdf_401_damarok_teach_back);
		Info_AddChoice(kdf_401_damarok_teach,"������� (10 ����� ��������)",kdf_401_damarok_teach_alchemy);
	}
	else
	{
		AI_Output(self,other,"KDF_401_Damarok_Alchemy_05");	//�� ��� ������ ���, ���� � ��� ������� ����.
		LOG_DAMAROKTRAIN = TRUE;
	};
};

func void kdf_401_damarok_teach_back()
{
	Info_ClearChoices(kdf_401_damarok_teach);
};

func void kdf_401_damarok_teach_alchemy()
{
	if(hero.lp < 10)
	{
		PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Info_ClearChoices(kdf_401_damarok_teach);
		Info_AddChoice(kdf_401_damarok_teach,DIALOG_BACK,kdf_401_damarok_teach_back);
		Info_AddChoice(kdf_401_damarok_teach,"������� (10 ����� ��������)",kdf_401_damarok_teach_alchemy);
	}
	else
	{
		AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//������ ����� ������.
		AI_Output(self,other,"KDF_401_Damarok_Alchemy_03");	//����� ����������� ����� �� ������������ �����, ���� ����������� ������������ ��������.
		AI_Output(self,other,"KDF_401_Damarok_Alchemy_04");	//����� ���� ����������� ��������� �������� � ������ �����������.
		Log_CreateTopic("�������",LOG_NOTE);
		b_logentry("�������","������� ��������� ��� � ������� ����������� ��� ������������� �����. ������ ����� ������ �������.");
		PrintScreen("������ ����� �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",4);
		hero.lp = hero.lp - 10;
		ALCHEMYACTIVE = TRUE;
		Npc_SetTalentSkill(hero,NPC_TALENT_REGENERATE,1);
		if(Npc_HasItems(kdf_405_torrez,alchemybook))
		{
			Npc_RemoveInvItem(kdf_405_torrez,alchemybook);
		};
		if(Npc_HasItems(kdw_604_cronos,alchemybook))
		{
			Npc_RemoveInvItem(kdw_604_cronos,alchemybook);
		};
		if(Npc_HasItems(nov_1357_fortuno,alchemybook))
		{
			Npc_RemoveInvItem(nov_1357_fortuno,alchemybook);
		};
		if(Npc_HasItems(stt_329_dexter,alchemybook))
		{
			Npc_RemoveInvItem(stt_329_dexter,alchemybook);
		};
		if(Npc_HasItems(kdw_605_riordian,alchemybook))
		{
			Npc_RemoveInvItem(kdw_605_riordian,alchemybook);
		};
		LOG_DAMAROKTRAIN = TRUE;
		Info_ClearChoices(kdf_401_damarok_teach);
	};
};

instance KDF_401_DAMAROK_TRADE(C_INFO)
{
	npc = kdf_401_damarok;
	condition = kdf_401_damarok_trade_condition;
	information = kdf_401_damarok_trade_info;
	important = 0;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};

func int kdf_401_damarok_trade_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void kdf_401_damarok_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//������ ��� ���� ������.
};

