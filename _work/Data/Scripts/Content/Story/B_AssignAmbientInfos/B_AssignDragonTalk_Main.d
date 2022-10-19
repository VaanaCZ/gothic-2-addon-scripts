// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Kde ses tu vzal?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Služebníku zla. Proè ses tu objevil? Pâišel jsi jen kvùli tomu, aby rozséval dês a hrùzu?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Nejvyšší zájmy našeho shromáždêní ti zùstanou utajeny èlovíèku.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Jak se dostanu za ostatními draky?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Co u Innose musím udêlat, abych tê vykázal z domova lidského pokolení?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Co u Innose musím udêlat, abych tê vykázal z domova lidského pokolení?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(smích) Pâedtím, než budeš moci jednat, musíš nejprve poznat zájmy našeho shromáždêní.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Nicménê, nikdo ti to dobrovolnê neprozradí.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Jen samotné Oko mùže rozvázat naše jazyky a prozradit naše skuteèné zámêry.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //V každém pâípadê ti to bude k nièemu, až budeš mrtvý.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Doneslo se k nám, že sis zvolil cestu drakobijce.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Proto jsme do vašeho svêta vyslali naše potomky, aby zajistili pokraèování našeho starobylého rodu.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Jsi ztracen, èlovíèku.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Jeden z drakù mumlal nêco o 'potomstvu' a o pokraèování rodu. Obávám se, že svá mláëata roznesli po celém civilizovaném svêtê."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //Oko ti zajistilo pâístup. Nicménê až samotný boj rozhodne, jestli jsi mê vùbec hoden.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Jak se dostanu za ostatními draky?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Pouze mé srdce ti mùže pomoci obnovit moc Oka.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Ale nikdy se ti nepodaâí vytrhnout mi srdce.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "Kdo tê sem poslal?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //Kdo ti rozkazuje? Kdo tê sem poslal?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Naše budoucnost a dobré bydlo je v rukou Pána využívajícího Mocné slovo. Už brzo mu nebude nikdo schopen vzdorovat.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Jeho dlouhé ruce vždycky dosahovaly daleko za hranice âíše mrtvých. Jeho pâíchod naplàuje duchy noci radostným oèekáváním.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Pâemùže vaše lidské pokolení a stane se vládcem svêta.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //V temnotê nejsme nièím jiným než pâisluhovaèi jeho tvùrèí síly.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Pán sestoupí mezi vás a pozvedne vaše zubožená têla z popela a využije jich ke zmênê bêhu svêta.

	B_LogEntry (TOPIC_DRACHENJAGD,"Draci nejsou vlastními pány. Slouží vládci, který jim nedovoluje vyslovit nic než mlhavá proroctví, jako že náš pán pâijde, znièí celý svêt a tak dále. Prostê obvyklé vêci."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "Jak mùžu zabít vašeho pána?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Jak mùžu zabít vašeho Pána?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Je všemohoucí a témêâ neporazitelný. Pokud budeš tak pošetilý a pâesto se s ním setkáš, zemâeš pomalou a bolestivou smrtí.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //To neslyším poprvé. Témêâ úplná nezranitelnost neznamená, že ho nemùžu zabít.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //No, skonèeme to: Co musím udêlat?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Aby ses mohl postavit mému Pánu, musíš si opatâit pâedmêty, jež on není schopen jakkoli získat.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //A co to má být?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Musíš získat tu nejlepší zbroj, jakou vaše pozemská spoleènost kdy poznala, a chránit si jí svou kùži.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Potâebuješ meè, jenž byl posvêcen vaším bohem.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Potâebuješ runu, která bude vyrobena jen pro tebe.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Potâebuješ zbraà, již vyrobili jen pro tvé použití.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Ale tou nejtêžší podmínkou je, že musíš získat pêt spoleèníkù, kteâí budou ochotni tê následovat i na druhý bâeh.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Jedinê tak se mùžeš odvážit postavit našemu Pánu.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "Jak mùžu nalézt vašeho pána?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Jak mùžu nalézt vašeho Pána?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Postavil si úkryt v pevné skále Irdorathských síní a èeká tam na svùj osud.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Do té doby, než bude schopen obnovit podobu svêta, jež mu byla pâedurèena, èeká tam v hluboké meditaci a...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Ušetâi mê podrobností. Prostê mi âekni, kde najdu ty Irdorathské sínê.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha, ha, ha. Zklamal jsi mê, èlovíèku. Dokázals pâekonat všechna nebezpeèí a porazit všechny z nás, a teë skonèíš na tom, že nedokážeš pochopit vyšší vêdêní.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Pokud ti Irdorath nic neâíká, pak udêláš líp, když zajdeš za vašimi mágy a požádáš je, aby si uspoâádali své svêtské záležitosti.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Je více než zâejmé, že ještê nejsi pâipraven na têžké bâímê vyššího vzdêlání.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pán drakù prý sídlí na mohutné skále v posvátných Irdorathských síních. Hmm. To je mi nêjak povêdomé - kde jsem o tom jenom èetl?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













