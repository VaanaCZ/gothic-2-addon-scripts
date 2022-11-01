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

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Služebníku zla. Proč ses tu objevil? Přišel jsi jen kvůli tomu, aby rozséval děs a hrůzu?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Nejvyšší zájmy našeho shromáždění ti zůstanou utajeny človíčku.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Jak se dostanu za ostatními draky?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Co u Innose musím udělat, abych tě vykázal z domova lidského pokolení?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Co u Innose musím udělat, abych tě vykázal z domova lidského pokolení?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(smích) Předtím, než budeš moci jednat, musíš nejprve poznat zájmy našeho shromáždění.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Nicméně, nikdo ti to dobrovolně neprozradí.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Jen samotné Oko může rozvázat naše jazyky a prozradit naše skutečné záměry.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //V každém případě ti to bude k ničemu, až budeš mrtvý.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Doneslo se k nám, že sis zvolil cestu drakobijce.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Proto jsme do vašeho světa vyslali naše potomky, aby zajistili pokračování našeho starobylého rodu.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Jsi ztracen, človíčku.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Jeden z draků mumlal něco o 'potomstvu' a o pokračování rodu. Obávám se, že svá mláďata roznesli po celém civilizovaném světě."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //Oko ti zajistilo přístup. Nicméně až samotný boj rozhodne, jestli jsi mě vůbec hoden.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Jak se dostanu za ostatními draky?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Pouze mé srdce ti může pomoci obnovit moc Oka.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Ale nikdy se ti nepodaří vytrhnout mi srdce.

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
	description = "Kdo tě sem poslal?";
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
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //Kdo ti rozkazuje? Kdo tě sem poslal?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Naše budoucnost a dobré bydlo je v rukou Pána využívajícího Mocné slovo. Už brzo mu nebude nikdo schopen vzdorovat.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Jeho dlouhé ruce vždycky dosahovaly daleko za hranice říše mrtvých. Jeho příchod naplňuje duchy noci radostným očekáváním.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Přemůže vaše lidské pokolení a stane se vládcem světa.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //V temnotě nejsme ničím jiným než přisluhovači jeho tvůrčí síly.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Pán sestoupí mezi vás a pozvedne vaše zubožená těla z popela a využije jich ke změně běhu světa.

	B_LogEntry (TOPIC_DRACHENJAGD,"Draci nejsou vlastními pány. Slouží vládci, který jim nedovoluje vyslovit nic než mlhavá proroctví, jako že náš pán přijde, zničí celý svět a tak dále. Prostě obvyklé věci."); 
	
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
	description = "Jak můžu zabít vašeho pána?";
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
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Jak můžu zabít vašeho Pána?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Je všemohoucí a téměř neporazitelný. Pokud budeš tak pošetilý a přesto se s ním setkáš, zemřeš pomalou a bolestivou smrtí.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //To neslyším poprvé. Téměř úplná nezranitelnost neznamená, že ho nemůžu zabít.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //No, skončeme to: Co musím udělat?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Aby ses mohl postavit mému Pánu, musíš si opatřit předměty, jež on není schopen jakkoli získat.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //A co to má být?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Musíš získat tu nejlepší zbroj, jakou vaše pozemská společnost kdy poznala, a chránit si jí svou kůži.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Potřebuješ meč, jenž byl posvěcen vaším bohem.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Potřebuješ runu, která bude vyrobena jen pro tebe.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Potřebuješ zbraň, již vyrobili jen pro tvé použití.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Ale tou nejtěžší podmínkou je, že musíš získat pět společníků, kteří budou ochotni tě následovat i na druhý břeh.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Jedině tak se můžeš odvážit postavit našemu Pánu.
	
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
	description 	= "Jak můžu nalézt vašeho pána?";
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
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Jak můžu nalézt vašeho Pána?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Postavil si úkryt v pevné skále Irdorathských síní a čeká tam na svůj osud.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Do té doby, než bude schopen obnovit podobu světa, jež mu byla předurčena, čeká tam v hluboké meditaci a...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Ušetři mě podrobností. Prostě mi řekni, kde najdu ty Irdorathské síně.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha, ha, ha. Zklamal jsi mě, človíčku. Dokázals překonat všechna nebezpečí a porazit všechny z nás, a teď skončíš na tom, že nedokážeš pochopit vyšší vědění.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Pokud ti Irdorath nic neříká, pak uděláš líp, když zajdeš za vašimi mágy a požádáš je, aby si uspořádali své světské záležitosti.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Je více než zřejmé, že ještě nejsi připraven na těžké břímě vyššího vzdělání.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pán draků prý sídlí na mohutné skále v posvátných Irdorathských síních. Hmm. To je mi nějak povědomé - kde jsem o tom jenom četl?"); 

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













