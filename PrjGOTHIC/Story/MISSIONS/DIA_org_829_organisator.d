
instance INFO_ORG_829_EXIT(C_INFO)
{
	npc = org_829_organisator;
	nr = 999;
	condition = info_org_829_exit_condition;
	information = info_org_829_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_829_exit_condition()
{
	return 1;
};

func void info_org_829_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_829_HELLO(C_INFO)
{
	npc = org_829_organisator;
	nr = 1;
	condition = info_org_829_hello_condition;
	information = info_org_829_hello_info;
	permanent = 0;
	description = "Как дела?";
};


func int info_org_829_hello_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void info_org_829_hello_info()
{
	AI_Output(other,self,"Info_ORG_829_Hello_15_00");	//Как дела?
	AI_Output(self,other,"Info_ORG_829_Hello_06_01");	//Так себе. У меня закончилось курево.
};


var int org_829_gotjoint;

instance INFO_ORG_829_OFFERJOINT(C_INFO)
{
	npc = org_829_organisator;
	nr = 1;
	condition = info_org_829_offerjoint_condition;
	information = info_org_829_offerjoint_info;
	permanent = 0;
	description = "У меня есть болотник. Будешь?";
};


func int info_org_829_offerjoint_condition()
{
	if(Npc_KnowsInfo(hero,info_org_829_hello))
	{
		return 1;
	};
};

func void info_org_829_offerjoint_info()
{
	AI_Output(other,self,"Info_ORG_829_OfferJoint_15_00");	//У меня есть болотник. Будешь?
	if((Npc_HasItems(other,itmijoint_1) > 0) || (Npc_HasItems(other,itmijoint_2) > 0) || (Npc_HasItems(other,itmijoint_3) > 0))
	{
		if(Npc_HasItems(other,itmijoint_1))
		{
			b_giveinvitems(other,self,itmijoint_1,1);
		}
		else if(Npc_HasItems(other,itmijoint_2))
		{
			b_giveinvitems(other,self,itmijoint_2,1);
		}
		else if(Npc_HasItems(other,itmijoint_3))
		{
			b_giveinvitems(other,self,itmijoint_3,1);
		};
		AI_Output(self,other,"Info_ORG_829_OfferJoint_06_01");	//Еще бы! Ты ведь из Лагеря сектантов, да?
		NC_JOINTS_VERTEILT = NC_JOINTS_VERTEILT + 1;
		ORG_829_GOTJOINT = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_ORG_829_OfferJoint_No_Joint_06_00");	//Эй! Ты обмануть меня захотел, да? Мне это не нравится!
	};
};


instance INFO_ORG_829_SPECIALINFO(C_INFO)
{
	npc = org_829_organisator;
	nr = 1;
	condition = info_org_829_specialinfo_condition;
	information = info_org_829_specialinfo_info;
	permanent = 0;
	description = "Я здесь недавно. Можешь мне что-нибудь посоветовать?";
};


func int info_org_829_specialinfo_condition()
{
	if(ORG_829_GOTJOINT == TRUE)
	{
		return 1;
	};
};

func void info_org_829_specialinfo_info()
{
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_00");	//Я здесь недавно. Можешь мне что-нибудь посоветовать?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_01");	//Конечно! Когда придешь в лагерь, поговори с Горном. Он один из наемников, охраняет магов, но с ним можно иметь дело. Он был один из нас.
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_02");	//Один из вас?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_03");	//Ну, из воров, знаешь? Таких, которым даже Бароны нипочем. Вот так.
};


instance INFO_ORG_829_PERM(C_INFO)
{
	npc = org_829_organisator;
	nr = 1;
	condition = info_org_829_perm_condition;
	information = info_org_829_perm_info;
	permanent = 1;
	description = "А ты можешь рассказать мне, что это за лагерь?";
};


func int info_org_829_perm_condition()
{
	if(ORG_829_GOTJOINT == TRUE)
	{
		return 1;
	};
};

func void info_org_829_perm_info()
{
	AI_Output(other,self,"Info_ORG_829_PERM_15_00");	//А ты можешь рассказать мне, что это за лагерь?
	AI_Output(self,other,"Info_ORG_829_PERM_06_01");	//Просто пойди туда, и сам все увидишь.
};

