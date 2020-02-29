
instance TPL_1433_GORNAVID_EXIT(C_INFO)
{
	npc = tpl_1433_gornavid;
	nr = 999;
	condition = tpl_1433_gornavid_exit_condition;
	information = tpl_1433_gornavid_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1433_gornavid_exit_condition()
{
	return 1;
};

func void tpl_1433_gornavid_exit_info()
{
	AI_Output(self,other,"Tpl_1433_GorNaVid_Exit_Info_13_02");	//Да пробудится Спящий!
	AI_StopProcessInfos(self);
};


instance TPL_1433_GORNAVID_HEALTH(C_INFO)
{
	npc = tpl_1433_gornavid;
	condition = tpl_1433_gornavid_health_condition;
	information = tpl_1433_gornavid_health_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь мне помочь?";
};


func int tpl_1433_gornavid_health_condition()
{
	if(Npc_KnowsInfo(hero,grd_263_asghan_open) && !Npc_KnowsInfo(hero,grd_263_asghan_open_now))
	{
		return TRUE;
	};
};

func void tpl_1433_gornavid_health_info()
{
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01");	//Ты можешь мне помочь?
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02");	//Мне нужно добыть слюну ползунов для Кор Галома. Я знаю, где находится логово этих тварей.
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03");	//Сможешь ли ты прикрыть меня, когда я открою ворота?
	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04");	//Охота на ползунов без крови не обходится. Если бы у меня был целебный эликсир, я не задумываясь бы помог тебе.
	b_logentry(CH2_MCEGGS,"Я должен отдать Гор На Виду лечебное зелье, прежде чем он сможет помочь Асгхану защищать ворота от ползунов.");
};

instance TPL_1433_GORNAVID_IAN(C_INFO)
{
	npc = tpl_1433_gornavid;
	condition = tpl_1433_gornavid_ian_condition;
	information = tpl_1433_gornavid_ian_info;
	important = 0;
	permanent = 0;
	description = "Я ищу логово ползунов. Не знаешь, где оно?";
};


func int tpl_1433_gornavid_ian_condition()
{
	if((CORKALOM_BRINGMCQBALLS == LOG_RUNNING) && !Npc_KnowsInfo(hero,grd_263_asghan_open))
	{
		return 1;
	};
};

func void tpl_1433_gornavid_ian_info()
{
	AI_Output(other,self,"Tpl_1433_GorNaVid_IAN_Info_15_01");	//Я ищу логово ползунов. Не знаешь, где оно?
	AI_Output(self,other,"Tpl_1433_GorNaVid_IAN_Info_13_02");	//Возле главной шахты много пещер, но логова там нет.
};


instance TPL_1433_GORNAVID_HEALTH_SUC(C_INFO)
{
	npc = tpl_1433_gornavid;
	condition = tpl_1433_gornavid_health_suc_condition;
	information = tpl_1433_gornavid_health_suc_info;
	important = 0;
	permanent = 0;
	description = "(отдать лечебное зелье)";
};


func int tpl_1433_gornavid_health_suc_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1433_gornavid_health) && (Npc_HasItems(hero,itfo_potion_health_01) || Npc_HasItems(hero,itfo_potion_health_02) || Npc_HasItems(hero,itfo_potion_health_03)))
	{
		return 1;
	};
};

func void tpl_1433_gornavid_health_suc_info()
{
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01");	//Вот, может быть, это поможет тебе.
	AI_Output(self,other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02");	//Благодарю. Можешь на меня положиться. Я и Асгхан будем ждать тебя внизу.
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03");	//Я подойду к вам.
	if(Npc_HasItems(hero,itfo_potion_health_01))
	{
		b_printtrademsg1("Отдана эссенция исцеления.");
		b_giveinvitems(hero,self,itfo_potion_health_01,1);
	}
	else if(Npc_HasItems(hero,itfo_potion_health_02))
	{
		b_printtrademsg1("Отдан экстракт исцеления.");
		b_giveinvitems(hero,self,itfo_potion_health_02,1);
	}
	else if(Npc_HasItems(hero,itfo_potion_health_03))
	{
		b_printtrademsg1("Отдано зелье исцеления.");
		b_giveinvitems(hero,self,itfo_potion_health_03,1);
	}
	else
	{
		printdebugnpc(PD_MISSION,"У меня нет зелья.");
	};
	Npc_ExchangeRoutine(self,"GATE");
	npc_setpermattitude(self,ATT_FRIENDLY);
	b_logentry(CH2_MCEGGS,"Я отдал Гор На Виду лечебное зелье и теперь он поможет мне.");
	b_givexp(XP_HIREGORNAVID);
	AI_StopProcessInfos(self);
};


instance TPL_1433_GORNAVID_VICTORY(C_INFO)
{
	npc = tpl_1433_gornavid;
	condition = tpl_1433_gornavid_victory_condition;
	information = tpl_1433_gornavid_victory_info;
	important = 0;
	permanent = 0;
	description = "Я нашел логово королевы ползунов!";
};


func int tpl_1433_gornavid_victory_condition()
{
	if(Npc_HasItems(hero,itat_crawlerqueen) >= 1)
	{
		return TRUE;
	};
};

func void tpl_1433_gornavid_victory_info()
{
	AI_Output(other,self,"Tpl_1433_GorNavid_VICTORY_Info_15_01");	//Я нашел логово королевы ползунов!
	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_02");	//От всего Братства благодарен тебе!
	AI_Output(self,other,"Tpl_1433_GorNavid_VICTORY_Info_13_03");	//И пусть Спящий хранит тебя!
};

