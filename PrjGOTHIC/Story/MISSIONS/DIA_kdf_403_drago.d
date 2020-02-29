
instance KDF_403_DRAGO_RUNE(C_INFO)
{
	npc = kdf_403_drago;
	condition = kdf_403_drago_rune_condition;
	information = kdf_403_drago_rune_info;
	important = 1;
	permanent = 0;
};


func int kdf_403_drago_rune_condition()
{
	if(Npc_KnowsInfo(hero,kdf_402_corristo_robe))
	{
		return TRUE;
	};
};

func void kdf_403_drago_rune_info()
{
	AI_Output(self,other,"KDF_403_Drago_RUNE_Info_13_01");	//Прими эту руну как дар Инноса. Она защитит тебя на твоем пути!
	b_printtrademsg1("Получена руна огненной стрелы.");
	CreateInvItem(self,itarrune_2_1_firebolt);
	b_giveinvitems(self,other,itarrune_2_1_firebolt,1);
	AI_StopProcessInfos(self);
};


instance KDF_403_DRAGO_EXIT(C_INFO)
{
	npc = kdf_403_drago;
	nr = 999;
	condition = kdf_403_drago_exit_condition;
	information = kdf_403_drago_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int kdf_403_drago_exit_condition()
{
	return TRUE;
};

func void kdf_403_drago_exit_info()
{
	AI_StopProcessInfos(self);
};

