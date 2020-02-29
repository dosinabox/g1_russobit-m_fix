
func void b_story_accesstoxardas()
{
	CreateInvItem(hero,itarruneteleport3);
	b_logentry(CH4_FINDXARDAS,"Я нашел сердца всех трех големов и отдал их демону-охраннику. Взамен он дал мне Руну Телепортации. Посмотрим, куда она меня перенесет.");
	b_givexp(XP_DELIVEREDGOLEMHEARTS);
	FINDGOLEMHEARTS = 4;
};

