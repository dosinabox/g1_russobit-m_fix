
instance IE_397_ANNOUNCER_EXIT(C_INFO)
{
	npc = ie_397_announcer;
	nr = 999;
	condition = ie_397_announcer_exit_condition;
	information = ie_397_announcer_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int ie_397_announcer_exit_condition()
{
	return 1;
};

func void ie_397_announcer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance IE_397_ANNOUNCER_ANNOUNCE(C_INFO)
{
	npc = ie_397_announcer;
	condition = ie_397_announcer_announce_condition;
	information = ie_397_announcer_announce_info;
	important = 1;
	permanent = 0;
};


func int ie_397_announcer_announce_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void ie_397_announcer_announce_info()
{
	AI_Output(self,other,"Info_Announcer_ANNOUNCE_11_01");	//Многоуважаемые Бароны, уважаемые стражники, Призраки и рудокопы...
	AI_Output(self,other,"Info_Announcer_ANNOUNCE_11_02");	//Позвольте представить вашему вниманию группу...
	AI_Output(self,other,"Info_Announcer_ANNOUNCE_11_03");	//IN EXTREMO!
	Npc_ExchangeRoutine(self,"concert");
	b_exchangeroutine(charlotte,"concert");
	b_inextremostartmusic();
	AI_StopProcessInfos(self);
};

