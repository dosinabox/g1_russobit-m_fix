
instance DIA_VLK_520_EXIT(C_INFO)
{
	npc = vlk_520_buddler;
	nr = 999;
	condition = dia_vlk_520_exit_condition;
	information = dia_vlk_520_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_vlk_520_exit_condition()
{
	return 1;
};

func void dia_vlk_520_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_520_LEAVEME(C_INFO)
{
	npc = vlk_520_buddler;
	nr = 2;
	condition = dia_vlk_520_leaveme_condition;
	information = dia_vlk_520_leaveme_info;
	permanent = 1;
	description = "Что ты здесь делаешь?";
};


func int dia_vlk_520_leaveme_condition()
{
	return 1;
};

func void dia_vlk_520_leaveme_info()
{
	AI_Output(other,self,"DIA_Vlk_520_LeaveMe_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Vlk_520_LeaveMe_01_01");	//Оставь меня в покое! Убирайся!
	AI_StopProcessInfos(self);
};

