
instance INFO_SFB_13_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sfb_13_exit_condition;
	information = info_sfb_13_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_sfb_13_exit_condition()
{
	return 1;
};

func void info_sfb_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SFB_13_HI(C_INFO)
{
	nr = 4;
	condition = info_sfb_13_hi_condition;
	information = info_sfb_13_hi_info;
	permanent = 1;
	description = "Как ты?";
};


func int info_sfb_13_hi_condition()
{
	return 1;
};

func void info_sfb_13_hi_info()
{
	AI_Output(other,self,"DIA_Pock_ForgotAll_15_00");	//Как ты?
	AI_Output(self,other,"SVM_13_TheyKilledMyFriend");	//Один из наших людей был зверски убит. Его кровь взывает к мести!
};

func void b_assignambientinfos_sfb_13(var C_NPC slf)
{
	info_sfb_13_exit.npc = Hlp_GetInstanceID(slf);
	info_sfb_13_hi.npc = Hlp_GetInstanceID(slf);
};

instance INFO_SFB_14_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sfb_14_exit_condition;
	information = info_sfb_14_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_sfb_14_exit_condition()
{
	return 1;
};

func void info_sfb_14_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SFB_14_HI(C_INFO)
{
	nr = 4;
	condition = info_sfb_14_hi_condition;
	information = info_sfb_14_hi_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_sfb_14_hi_condition()
{
	return 1;
};

func void info_sfb_14_hi_info()
{
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"SVM_14_Help");	//Я должен вернуться к своему занятию!
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_sfb_14(var C_NPC slf)
{
	info_sfb_14_exit.npc = Hlp_GetInstanceID(slf);
	info_sfb_14_hi.npc = Hlp_GetInstanceID(slf);
};

