
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
	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01");	//�� ������ ���� ���������� �����!
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


instance KDF_401_DAMAROK_HEAL(C_INFO)
{
	npc = kdf_401_damarok;
	condition = kdf_401_damarok_heal_condition;
	information = kdf_401_damarok_heal_info;
	important = 1;
	permanent = 0;
};


func int kdf_401_damarok_heal_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDF) && Npc_IsInRoutine(self,rtn_start_401))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_heal_info()
{
	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01");	//���� �� ������ �����, � ������ ���� �������� ����.
	AI_StopProcessInfos(self);
};


instance KDF_401_DAMAROK_HEALINFO(C_INFO)
{
	npc = kdf_401_damarok;
	nr = 100;
	condition = kdf_401_damarok_healinfo_condition;
	information = kdf_401_damarok_healinfo_info;
	important = 0;
	permanent = 1;
	description = "� �����. �� ������ ������ ���?";
};


func int kdf_401_damarok_healinfo_condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_healinfo_info()
{
	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01");	//� �����. �� ������ ������ ���?
	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02");	//��������� ����, � ������ ���.
	Snd_Play("MFX_Heal_Cast");
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
};

