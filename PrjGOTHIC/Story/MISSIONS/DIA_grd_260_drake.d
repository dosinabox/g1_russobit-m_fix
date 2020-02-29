
instance GRD_260_DRAKE_EXIT(C_INFO)
{
	npc = grd_260_drake;
	nr = 999;
	condition = grd_260_drake_exit_condition;
	information = grd_260_drake_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_260_drake_exit_condition()
{
	return 1;
};

func void grd_260_drake_exit_info()
{
	AI_Output(other,self,"Info_Exit_Info_15_01");	//До встречи!
	AI_StopProcessInfos(self);
};


instance GRD_260_DRAKE_GEFAHR(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_gefahr_condition;
	information = grd_260_drake_gefahr_info;
	important = 0;
	permanent = 0;
	description = "Расскажи мне, чего здесь следует остерегаться.";
};


func int grd_260_drake_gefahr_condition()
{
	return Npc_KnowsInfo(hero,grd_260_drake_mine);
};

func void grd_260_drake_gefahr_info()
{
	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_01");	//Расскажи мне, чего здесь следует остерегаться.
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_02");	//Главную опасность представляют ползуны. 
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_03");	//Из-за них мы вынуждены были оставить несколько забоев. Они даже съели нескольких рудокопов.
	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_04");	//Расскажи мне о ползунах.
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_05");	//У меня в горле совсем пересохло...
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_06");	//Если ты принесешь мне пиво, я расскажу тебе о них.
};


instance GRD_260_DRAKE_CRAWLER_OKAY(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_crawler_okay_condition;
	information = grd_260_drake_crawler_okay_info;
	important = 0;
	permanent = 0;
	description = "(предложить пиво)";
};


func int grd_260_drake_crawler_okay_condition()
{
	if(Npc_KnowsInfo(hero,grd_260_drake_gefahr))
	{
		return 1;
	};
};

func void grd_260_drake_crawler_okay_info()
{
	if(Npc_HasItems(hero,itfobeer))
	{
		AI_Output(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");	//Вот, выпей это за мое здоровье!
		b_giveinvitems(hero,self,itfobeer,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfobeer);
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");	//Спасибо. Ползуны живут большими стаями в старых заброшенных забоях.
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");	//В основном стволе они еще ни на кого не нападали. Если ты наткнешься на ползуна, беги от него как можно скорее!
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");	//Или стань спиной к стене. Тогда, может быть, тебе удастся спастись.
	}
	else
	{
		AI_Output(self,other,"Grd_260_Drake_Crawler_Okay_11_06");	//Ты шутишь, да? Приходи, когда у тебя будет пиво.
		grd_260_drake_crawler_okay.permanent = 1;
	};
};


instance GRD_260_DRAKE_MINE(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_mine_condition;
	information = grd_260_drake_mine_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь рассказать мне что-нибудь о шахте?";
};


func int grd_260_drake_mine_condition()
{
	return 1;
};

func void grd_260_drake_mine_info()
{
	AI_Output(other,self,"Grd_260_Drake_Mine_Info_15_01");	//Ты можешь рассказать мне что-нибудь о шахте?
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_02");	//Мы находимся в главном стволе. Вниз можно спуститься с помощью системы переходов.
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_03");	//Рудокопы работают везде. Но будь осторожен, здесь очень много ползунов.
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_04");	//На нижнем горизонте стоит плавильня. Мы сами плавим небольшую часть добываемой руды.
};


instance GRD_260_DRAKE_MINE_MEHR(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_mine_mehr_condition;
	information = grd_260_drake_mine_mehr_info;
	important = 0;
	permanent = 0;
	description = "Расскажи об этом что-нибудь еще.";
};


func int grd_260_drake_mine_mehr_condition()
{
	if(Npc_KnowsInfo(hero,grd_260_drake_mine))
	{
		return 1;
	};
};

func void grd_260_drake_mine_mehr_info()
{
	AI_Output(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");	//Расскажи об этом что-нибудь еще.
	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");	//Я думаю, Вайпер сможет рассказать тебе больше. Спроси его. Он наш плавильщик.
	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");	//Или поговори с Яном. Он управляет всеми делами шахты. 
};


instance GRD_260_DRAKE_IAN(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_ian_condition;
	information = grd_260_drake_ian_info;
	important = 0;
	permanent = 0;
	description = "Где мне найти Яна?";
};


func int grd_260_drake_ian_condition()
{
	if(!Npc_KnowsInfo(hero,stt_301_ian_hi) && Npc_KnowsInfo(hero,grd_260_drake_mine_mehr))
	{
		return TRUE;
	};
};

func void grd_260_drake_ian_info()
{
	AI_Output(other,self,"Grd_260_Drake_Ian_Info_15_01");	//Где мне найти Яна?
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_02");	//Он находится в центре главного ствола, возле склада.
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_03");	//Да, ты знаешь Торуса? Забудь здесь о нем!
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_04");	//В шахте командует только один человек, и это Ян. Он у нас главный.
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_05");	//Если ты поссорился с ним, считай, что ты поссорился со всеми в шахте, понял?
};


instance GRD_260_DRAKE_GARDEAUFNAHME(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_gardeaufnahme_condition;
	information = grd_260_drake_gardeaufnahme_info;
	important = 1;
	permanent = 0;
};


func int grd_260_drake_gardeaufnahme_condition()
{
	if((Npc_HasItems(hero,itat_crawlerqueen) >= 1) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,grd_264_gardist_gardeaufnahme))
	{
		return TRUE;
	};
};

func void grd_260_drake_gardeaufnahme_info()
{
	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01");	//Эй! Ты отлично расправился с ползунами! Думаю, теперь ты заслуживаешь должности стражника.
	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02");	//Иди в Старый лагерь и поговори с Торусом!
	Log_CreateTopic(GE_BECOMEGUARD,LOG_NOTE);
	b_logentry(GE_BECOMEGUARD,"Когда я принесу яйца, я должен буду поговорить с Торусом. Может быть, он примет меня в стражники.");
};

