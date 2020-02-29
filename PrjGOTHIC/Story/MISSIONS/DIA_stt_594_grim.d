
instance DIA_GRIM2_EXIT(C_INFO)
{
	npc = stt_594_grim;
	nr = 999;
	condition = dia_grim2_exit_condition;
	information = dia_grim2_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_grim2_exit_condition()
{
	return 1;
};

func void dia_grim2_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GRIM_INEXTREMOAWAY(C_INFO)
{
	npc = stt_594_grim;
	nr = 1;
	condition = dia_grim_inextremoaway_condition;
	information = dia_grim_inextremoaway_info;
	permanent = 0;
	important = 0;
	description = "А где In Extremo?";
};

func int dia_grim_inextremoaway_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_inextremo) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_grim_inextremoaway_info()
{
	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01");	//А где In Extremo?
	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02");	//Они уже уехали. А я уже так привык сидеть по вечерам перед сценой.
	AI_StopProcessInfos(self);
};

