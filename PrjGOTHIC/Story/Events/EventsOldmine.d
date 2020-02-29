
func void event_om_crawler_01()
{
	if(ASGHAN_GATE_WAS_OPENED != 1)
	{
		Wld_InsertNpc(minecrawler,"OM_CAVE3_28");
		Wld_InsertNpc(minecrawler,"OM_CAVE3_28");
		Wld_InsertNpc(minecrawler,"OM_059");
		Wld_InsertNpc(minecrawler,"OM_059");
		Wld_InsertNpc(minecrawler,"OM_060");
	};
	ASGHAN_GATE_WAS_OPENED = 1;
};

