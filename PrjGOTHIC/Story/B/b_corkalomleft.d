
func void b_corkalomleft()
{
	var C_NPC templerguard1;
	var C_NPC templerguard2;
	templerguard1 = Hlp_GetNpc(tpl_1442_templer);
	templerguard2 = Hlp_GetNpc(tpl_1441_templer);
	b_exchangeroutine(tpl_1407_templer,"remove");
	b_exchangeroutine(tpl_1425_templer,"remove");
	b_exchangeroutine(tpl_1413_templer,"remove");
	b_exchangeroutine(tpl_1431_templer,"remove");
	b_exchangeroutine(tpl_1430_templer,"remove");
	b_exchangeroutine(tpl_1432_templer,"remove");
	b_exchangeroutine(nov_1313_novize,"remove");
	b_exchangeroutine(nov_1336_novize,"remove");
	b_exchangeroutine(nov_1342_novize,"remove");
	b_exchangeroutine(nov_1353_novize,"remove");
	b_exchangeroutine(gur_1201_corkalom,"FLEE");
	b_exchangeroutine(tpl_1406_templer,"FLEE");
	b_exchangeroutine(nov_1301_caine,"FLEE");
	b_exchangeroutine(templerguard1,"remove");
	b_exchangeroutine(templerguard2,"remove");
	b_exchangeroutine(nov_1357_fortuno,"lab");
	templerguard1.aivar[AIV_PASSGATE] = TRUE;
	templerguard2.aivar[AIV_PASSGATE] = TRUE;
};

