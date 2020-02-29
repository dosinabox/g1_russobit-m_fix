
const int SPELL_GOOD = 0;
const int SPELL_NEUTRAL = 1;
const int SPELL_BAD = 2;
const int SPL_DONTINVEST = 0;
const int SPL_RECEIVEINVEST = 1;
const int SPL_SENDCAST = 2;
const int SPL_SENDSTOP = 3;
const int SPL_NEXTLEVEL = 4;
const int SPL_SENDCAST_LIGHT = 1;
const int SPL_SENDCAST_FIREBOLT = 1;
const int SPL_SENDCAST_FIREBALL = 5;
const int SPL_SENDCAST_FIRESTORM = 10;
const int SPL_SENDCAST_FIRERAIN = 15;
const int SPL_SENDCAST_TELEPORT = 5;
const int SPL_SENDCAST_TRF_MEATBUG = 5;
const int SPL_SENDCAST_TRF_MOLERAT = 5;
const int SPL_SENDCAST_TRF_SCAVENGER = 5;
const int SPL_SENDCAST_TRF_BLOODFLY = 10;
const int SPL_SENDCAST_TRF_WOLF = 10;
const int SPL_SENDCAST_TRF_LURKER = 15;
const int SPL_SENDCAST_TRF_WARAN = 15;
const int SPL_SENDCAST_TRF_ORCDOG = 20;
const int SPL_SENDCAST_TRF_CRAWLER = 20;
const int SPL_SENDCAST_TRF_SNAPPER = 25;
const int SPL_SENDCAST_TRF_SHADOWBEAST = 25;
const int SPL_SENDCAST_THUNDERBOLT = 1;
const int SPL_SENDCAST_THUNDERBALL = 5;
const int SPL_SENDCAST_ICECUBE = 3;
const int SPL_SENDCAST_ICEWAVE = 8;
const int SPL_SENDCAST_SUMMONDEMON = 20;
const int SPL_SENDCAST_SUMMONSKELETON = 10;
const int SPL_SENDCAST_SUMMONGOLEM = 15;
const int SPL_SENDCAST_ARMYOFDARKNESS = 25;
const int SPL_SENDCAST_MASSDEATH = 10;
const int SPL_SENDCAST_DESTROYUNDEAD = 5;
const int SPL_SENDCAST_WINDFIST = 3;
const int SPL_SENDCAST_STORMFIST = 8;
const int SPL_SENDCAST_CHARM = 5;
const int SPL_SENDCAST_SLEEP = 3;
const int SPL_SENDCAST_FEAR = 5;
const int SPL_SENDCAST_BERZERK = 10;
const int SPL_SENDCAST_BREATHOFDEATH = 5;
const int SPL_SENDCAST_NEW1 = 5;
const int SPL_SENDCAST_SHRINK = 5;
const int SPL_DAMAGE_FIREBOLT = 30;
const int SPL_DAMAGE_FIREBALL = 30;
const int SPL_DAMAGE_FIRESTORM = 50;
const int SPL_DAMAGE_FIRERAIN = 100;
const int SPL_DAMAGE_THUNDERBOLT = 20;
const int SPL_DAMAGE_THUNDERBALL = 20;
const int SPL_DAMAGE_MASSDEATH = 200;
const int SPL_DAMAGE_BREATHOFDEATH = 100;
const int SPL_DAMAGE_DESTROYUNDEAD = 9999;
const int SPL_DAMAGE_WINDFIST = 10;
const int SPL_DAMAGE_STORMFIST = 15;
const int SPL_FREEZE_DAMAGE = 50;
const int SPL_ZAPPED_DAMAGE_PER_SEC = 25;
const int SPL_PYRO_DAMAGE_PER_SEC = 20;
const int SPL_HEALING_HP_PER_MP = 10;
const int SPL_TIME_SHORTZAPPED = 2;
const int SPL_TIME_FREEZE = 9;
const int SPL_TIME_SLEEP = 30;
const int SPL_TIME_BERZERK = 30;
const int SPL_RANGE_ICEATTACK = 300;
const int SPL_RANGE_WINDFIST = 1200;
const int SPL_RANGE_STORMFIST = 1200;
const int SPL_RANGE_SLEEP = 1000;
const int SPL_RANGE_CHAINLIGHTNING = 1000;


const string SPELLFXINSTANCENAMES[59] =
{
	"Light",
	"Fireball",
	"Transform",
	"Fear",
	"Heal",
	"Lightning",
	"Demon",
	"Skeleton",
	"Forget",
	"WindFist",
	"Telekinesis",
	"Charm",
	"Sleep",
	"Pyrokinesis",
	"MassDeath",
	"Control",
	"DestroyUndead",
	"Firebolt",
	"Firestorm",
	"Firerain",
	"Speed",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Chainlightning",
	"Thunderbolt",
	"Thunderball",
	"Icecube",
	"Icewave",
	"Golem",
	"ArmyOfDarkness",
	"Stormfist",
	"Telekinesis2",
	"BreathOfDeath",
	"Shrink",
	"Undress",
	"Dance",
	"Berzerk",
	"BreathOfDeath",
	"New2",
	"New3",
	"New4",
	"New5"
};

const string SPELLFXANILETTERS[59] =
{
	"SLE",
	"FIB",
	"TRF",
	"FEA",
	"HEA",
	"XXX",
	"SUM",
	"SUM",
	"XXX",
	"WND",
	"TEL",
	"SLE",
	"SLE",
	"PYR",
	"FEA",
	"CON",
	"FIB",
	"FBT",
	"FIB",
	"FEA",
	"XXX",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"HEA",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"TRF",
	"LIN",
	"FBT",
	"FIB",
	"FRZ",
	"FEA",
	"SUM",
	"SUM",
	"WND",
	"XXX",
	"FIB",
	"SLE",
	"XXX",
	"XXX",
	"SLE",
	"FIB",
	"NE2",
	"NE3",
	"NE4",
	"NE5"
};

instance SPELL_LIGHT(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_FIREBOLT(C_SPELL_PROTO)
{
	time_per_mana = 500;
	damage_per_level = SPL_DAMAGE_FIREBOLT;
	spelltype = SPELL_BAD;
	damagetype = DAM_FIRE;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_FIREBALL(C_SPELL_PROTO)
{
	time_per_mana = 750;
	damage_per_level = SPL_DAMAGE_FIREBALL;
	spelltype = SPELL_BAD;
	damagetype = DAM_FIRE;
	ismultieffect = 0;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_FIRESTORM(C_SPELL_PROTO)
{
	time_per_mana = 250;
	damage_per_level = SPL_DAMAGE_FIRESTORM;
	spelltype = SPELL_BAD;
	damagetype = DAM_FIRE;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_FIRERAIN(C_SPELL_PROTO)
{
	time_per_mana = 250;
	damage_per_level = SPL_DAMAGE_FIRERAIN;
	spelltype = SPELL_BAD;
	damagetype = DAM_FIRE;
	targetcollectalgo = TARGET_COLLECT_ALL_FALLBACK_NONE;
	targetcollectrange = 1000;
	targetcollectazi = 360;
	targetcollectelev = 60;
};

instance SPELL_TELEPORT(C_SPELL_PROTO)
{
	time_per_mana = 750;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_CASTER;
	canturnduringinvest = 0;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_HEAL(C_SPELL_PROTO)
{
	time_per_mana = 250;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_CASTER;
	canturnduringinvest = 0;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_TRANSFORM(C_SPELL_PROTO)
{
	time_per_mana = 250;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
	canturnduringinvest = 0;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_CHAINLIGHTNING(C_SPELL_PROTO)
{
	time_per_mana = 750;
	spelltype = SPELL_BAD;
	damage_per_level = 0;
	damagetype = DAM_MAGIC;
	ismultieffect = 1;
	targetcollectalgo = TARGET_COLLECT_ALL;
	targetcollectrange = 1500;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_THUNDERBOLT(C_SPELL_PROTO)
{
	time_per_mana = 100;
	spelltype = SPELL_BAD;
	damage_per_level = SPL_DAMAGE_THUNDERBOLT;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_THUNDERBALL(C_SPELL_PROTO)
{
	time_per_mana = 250;
	spelltype = SPELL_BAD;
	damage_per_level = SPL_DAMAGE_THUNDERBALL;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_ICECUBE(C_SPELL_PROTO)
{
	time_per_mana = 250;
	spelltype = SPELL_BAD;
	damage_per_level = 0;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollectrange = 1500;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_ICEWAVE(C_SPELL_PROTO)
{
	time_per_mana = 125;
	spelltype = SPELL_BAD;
	damage_per_level = 0;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_ALL_FALLBACK_NONE;
	targetcollectrange = 1000;
	targetcollectazi = 360;
	targetcollectelev = 60;
};

instance SPELL_DEMON(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_SKELETON(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_GOLEM(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_ARMYOFDARKNESS(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_MASSDEATH(C_SPELL_PROTO)
{
	time_per_mana = 250;
	damage_per_level = SPL_DAMAGE_MASSDEATH;
	spelltype = SPELL_BAD;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_ALL_FALLBACK_NONE;
	targetcollectrange = 1000;
	targetcollectazi = 360;
	targetcollectelev = 60;
};

instance SPELL_DESTROYUNDEAD(C_SPELL_PROTO)
{
	time_per_mana = 250;
	damage_per_level = SPL_DAMAGE_DESTROYUNDEAD;
	spelltype = SPELL_NEUTRAL;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollectrange = 1500;
	targetcollecttype = TARGET_TYPE_UNDEAD;
};

instance SPELL_WINDFIST(C_SPELL_PROTO)
{
	time_per_mana = 250;
	damage_per_level = SPL_DAMAGE_WINDFIST;
	spelltype = SPELL_BAD;
	damagetype = DAM_FLY;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollectrange = SPL_RANGE_WINDFIST;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_STORMFIST(C_SPELL_PROTO)
{
	time_per_mana = 125;
	damage_per_level = SPL_DAMAGE_STORMFIST;
	spelltype = SPELL_BAD;
	damagetype = DAM_FLY;
	targetcollectalgo = TARGET_COLLECT_ALL_FALLBACK_NONE;
	targetcollectrange = SPL_RANGE_STORMFIST;
	targetcollectazi = 60;
	targetcollectelev = 60;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_TELEKINESIS(C_SPELL_PROTO)
{
	time_per_mana = 5000;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	canturnduringinvest = FALSE;
	canchangetargetduringinvest = FALSE;
};

instance SPELL_CHARM(C_SPELL_PROTO)
{
	time_per_mana = 250;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 1000;
	targetcollecttype = TARGET_TYPE_HUMANS;
};

instance SPELL_SLEEP(C_SPELL_PROTO)
{
	time_per_mana = 250;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 1000;
	targetcollecttype = TARGET_TYPE_HUMANS;
};

instance SPELL_PYROKINESIS(C_SPELL_PROTO)
{
	time_per_mana = 250;
	damage_per_level = 0;
	spelltype = SPELL_BAD;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 1000;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_CONTROL(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 1000;
	targetcollecttype = TARGET_TYPE_HUMANS;
};

instance SPELL_FEAR(C_SPELL_PROTO)
{
	time_per_mana = 250;
	damage_per_level = 0;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_BERZERK(C_SPELL_PROTO)
{
	time_per_mana = 125;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 1000;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_BREATHOFDEATH(C_SPELL_PROTO)
{
	time_per_mana = 100;
	damage_per_level = SPL_DAMAGE_BREATHOFDEATH;
	spelltype = SPELL_BAD;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_NEW1(C_SPELL_PROTO)
{
	time_per_mana = 100;
	damage_per_level = 150;
	spelltype = SPELL_BAD;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollecttype = TARGET_TYPE_NPCS;
};

instance SPELL_SHRINK(C_SPELL_PROTO)
{
	time_per_mana = 1000;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 800;
	targetcollecttype = TARGET_TYPE_NPCS;
};

