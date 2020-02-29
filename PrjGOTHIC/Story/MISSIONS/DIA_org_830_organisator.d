
instance INFO_ORG_830_EXIT(C_INFO)
{
	npc = org_830_organisator;
	nr = 999;
	condition = info_org_830_exit_condition;
	information = info_org_830_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_830_exit_condition()
{
	return 1;
};

func void info_org_830_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_830_HELLO(C_INFO)
{
	npc = org_830_organisator;
	nr = 1;
	condition = info_org_830_hello_condition;
	information = info_org_830_hello_info;
	permanent = 0;
	description = "Привет! Я здесь недавно.";
};


func int info_org_830_hello_condition()
{
	return 1;
};

func void info_org_830_hello_info()
{
	AI_Output(other,self,"Info_ORG_830_Hello_15_00");	//Привет! Я здесь недавно.
	AI_Output(self,other,"Info_ORG_830_Hello_13_01");	//Ну и что?
};


instance INFO_ORG_830_WHAT(C_INFO)
{
	npc = org_830_organisator;
	nr = 1;
	condition = info_org_830_what_condition;
	information = info_org_830_what_info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int info_org_830_what_condition()
{
	if(Npc_KnowsInfo(hero,info_org_830_hello))
	{
		return 1;
	};
};

func void info_org_830_what_info()
{
	AI_Output(other,self,"Info_ORG_830_What_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"Info_ORG_830_What_13_01");	//Только не думай, что я дам тебе затянуться... ничего не выйдет!	
};


instance INFO_ORG_830_AUFHALTEN(C_INFO)
{
	npc = org_830_organisator;
	nr = 2;
	condition = info_org_830_aufhalten_condition;
	information = info_org_830_aufhalten_info;
	permanent = 0;
	description = "И ты даже не попытаешься остановить меня?..";
};


func int info_org_830_aufhalten_condition()
{
	if(Npc_KnowsInfo(hero,info_org_830_hello))
	{
		return 1;
	};
};

func void info_org_830_aufhalten_info()
{
	AI_Output(other,self,"Info_ORG_830_Aufhalten_15_00");	//И ты даже не попытаешься остановить меня? Ну, или спросить о чем-нибудь?
	AI_Output(self,other,"Info_ORG_830_Aufhalten_13_01");	//Нет. Делать мне больше нечего. И потом, такие как ты обычно не доставляют нам неприятностей.
};


instance INFO_ORG_830_PERM(C_INFO)
{
	npc = org_830_organisator;
	nr = 3;
	condition = info_org_830_perm_condition;
	information = info_org_830_perm_info;
	permanent = 1;
	description = "Как там дела в шахте?";
};


func int info_org_830_perm_condition()
{
	if(Npc_KnowsInfo(hero,info_org_830_hello))
	{
		return 1;
	};
};

func void info_org_830_perm_info()
{
	AI_Output(other,self,"Info_ORG_830_Perm_15_00");	//Как там дела в шахте?
	AI_Output(self,other,"Info_ORG_830_Perm_13_01");	//Как обычно - тихо, разве что было несколько драк.
};

