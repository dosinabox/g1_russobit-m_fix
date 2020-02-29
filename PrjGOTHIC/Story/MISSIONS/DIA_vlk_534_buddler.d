
instance DIA_VLK_534_EXIT(C_INFO)
{
	npc = vlk_534_buddler;
	nr = 999;
	condition = dia_vlk_534_exit_condition;
	information = dia_vlk_534_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_vlk_534_exit_condition()
{
	return 1;
};

func void dia_vlk_534_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_534_LEAVEME(C_INFO)
{
	npc = vlk_534_buddler;
	nr = 1;
	condition = dia_vlk_534_leaveme_condition;
	information = dia_vlk_534_leaveme_info;
	permanent = 1;
	description = "ѕочему ты не в лагере?";
};


func int dia_vlk_534_leaveme_condition()
{
	if(KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_vlk_534_leaveme_info()
{
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00");	//ѕочему ты не в лагере?
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01");	//я жду одного друга из шахты. ќн задолжал мне руду.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02");	//ј без руды мне нельз€ по€вл€тьс€ в лагере, потому что € не смогу заплатить стражникам за защиту, и тогда у мен€ начнутс€ большие непри€тности.
	AI_StopProcessInfos(self);
};

