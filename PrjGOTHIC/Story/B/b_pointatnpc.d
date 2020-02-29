
func void b_pointatnpc(var C_NPC slf,var C_NPC oth,var C_NPC targ)
{
	AI_WaitTillEnd(slf,oth);
	AI_PointAtNpc(slf,targ);
	b_say(slf,oth,"$THEREHEIS");
	AI_StopPointAt(slf);
};

