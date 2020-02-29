
instance SLD_701_ORIK_EXIT(C_INFO)
{
	npc = sld_701_orik;
	nr = 999;
	condition = sld_701_orik_exit_condition;
	information = sld_701_orik_exit_info;
	important = 0;
	permanent = 1;
	description = "«¿ ŒÕ◊»“‹ –¿«√Œ¬Œ–";
};


func int sld_701_orik_exit_condition()
{
};

func void sld_701_orik_exit_info()
{
	AI_StopProcessInfos(self);
};

