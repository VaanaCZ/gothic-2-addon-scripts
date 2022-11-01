// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_DiegoOw_EXIT(C_INFO)
{
	npc			= PC_ThiefOw;
	nr			= 999;
	condition	= DIA_DiegoOw_EXIT_Condition;
	information	= DIA_DiegoOw_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_DiegoOw_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//******************************************************************
//				Begrüssung
//******************************************************************
INSTANCE DIA_DiegoOw_Hallo(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_DiegoOw_Hallo_Condition;
	information	= DIA_DiegoOw_Hallo_Info;

	Important	= TRUE;
};                       
FUNC INT DIA_DiegoOw_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Hallo_Info()
{	
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_00");//Hej, myslel jsem si, že jsi mrtvý.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_01");//Ano... to jsem také byl.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_02");//Ale teë jsem zpátky a hledám důkaz o tom, že tady jsou draci.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_03");//Proč to dęláš?
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_04");//Pracuji pro lorda Hagena. S pomocí paladinů se nám určitę podaâí draky zastavit.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_05");//Paladinové? Nęco ti âeknu. Když se mi odsud podaâilo pláchnout, šel jsem do Khorinidu.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_06");//Chtęl jsem paladiny varovat pâed draky. Nebesa vędí, proč jsem to vůbec zkoušel.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_07");//Ten nadutec Lothar mę ani neposlouchal - a už vůbec mę nenechal si promluvit s lordem Hagenem.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_08");//Místo toho mę poslali zpátky s touhle výpravou. Takže o paladinech mi vůbec nemluv.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_09");//Důležité je zastavit draky, dokud máme čas - a vůbec nezáleží na tom, kdo nám k tomu pomůže.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_10");//Zastavit je? Męli bysme vypadnout z tohohle údolí, dokud máme čas aspoŕ na to.
	
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_03");//Âekni, jak se ti podaâilo dostat se pâes průsmyk? Myslel jsem, že se to tam hemží skâety.
	AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_04");//Skrz opuštęný důl vede cesta, kterou skâeti nehlídají.
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_05");//To je dobrý vędęt. V tom pâípadę se brzy vydám do Khorinidu - mám tam pár nevyâízených účtů.
};	

//******************************************************************
//				Beweise
//******************************************************************
INSTANCE DIA_DiegoOw_Beweise(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 2;
	condition	= DIA_DiegoOw_Beweise_Condition;
	information	= DIA_DiegoOw_Beweise_Info;

	description	= "Potâebuji ten důkaz.";
};                       
FUNC INT DIA_DiegoOw_Beweise_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Beweise_Info()
{	
		//AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_00");//Was weißt du von Silvestros Erz?
	
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_11"); //Poslouchej, potâebuju ten důkaz.
		
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_14");//Dobrá, udęlám pro tebe, co bude v mých silách. Ale nebudu za nikoho riskovat krk.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_12");//Dobrá, jestli to je smysl tvojí cesty - bęž si promluvit s velitelem Garondem.
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_13");//Jestli nękdo ví nęco o útocích draků, tak to jsou hoši z hradu.
	};
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_00");//Jsem na cestę z Garondova rozkazu. Potâebuje vędęt, kolik rudy jste zatím vykutali.
		AI_Output (self ,other,"DIA_DiegoOw_Garond_11_01");//A pak ti dá ten důkaz, po kterým tak toužíš?
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_02");//Pâesnę tak. Takže co - můžeš mi nęco âíct?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Garond_11_01"); //A když už budeš na hradę, můžeš Garondovi âíct nęco, co ho určitę hodnę zaujme:
	};
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") <= 1000)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_01"); //Tady vzadu v jeskyni jsou ČTYÂI bedny s rudou. Narubali jí Silvestrovi chlapi.
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_02"); //Jen aă si pro ní Garond pâijde a vezme si jí - ale to už já tady nebudu.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_01"); //V jeskyni kousek od té, kde jsem ukryl ty ČTYÂI bedny rudy. Vytęžili je Silvestrovi muži.
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_02"); //Jen aă si pro nę Garond dojde, já už je nepotâebuju.
	};
	
	Silvestro_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Diego dopravil ČTYÂI bedny rudy, kterou vytęžili Silvestrovi muži, do bezpečí.");
};
//******************************************************************
//			Mine
//******************************************************************
INSTANCE DIA_DiegoOw_Mine(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 3;
	condition	= DIA_DiegoOw_Mine_Condition;
	information	= DIA_DiegoOw_Mine_Info;
	permanent	= FALSE;
	description = "Jak to, že jsi u rudy právę ty?";
};                       

FUNC INT DIA_DiegoOw_Mine_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_DiegoOw_Beweise))
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Mine_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Mine_15_00");//Jak to, že jsi u rudy právę ty?
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_01");//Byl jsem v Silvestrovę skupinę. Tęžili jsme nękolik dní a pak začal být Silvestro z ničeho nic strašnę nervózní.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_02");//Âekl, že bysme męli ukrýt rudu na nęjaké bezpečné místo.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_03");//No, a protože jsem se tehdy už stejnę chystal pláchnout, nabídnul jsem se, že rudu schovám.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_04");//A to bylo moje jediný štęstí. Horníci totiž narazili na pár důlních červů. Žádný z nich nepâežil.
};
//******************************************************************
//			Ritter
//******************************************************************
INSTANCE DIA_DiegoOw_Ritter(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 4;
	condition	= DIA_DiegoOw_Ritter_Condition;
	information	= DIA_DiegoOw_Ritter_Info;
	permanent	= FALSE;
	description = "Pokud jde o ty dva mrtvé rytíâe...";
};                       

FUNC INT DIA_DiegoOw_Ritter_Condition()
{	
	if (Npc_HasItems (PAL_Leiche4,ItMI_OldCoin) == 0)
	|| (Npc_HasItems (PAL_Leiche5,ItMI_OldCoin) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Ritter_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Ritter_15_00");//Co ti dva mrtví rytíâi pâed tvou skrýší?
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_01");//Našla si je zubatá bęhem bitvy se skupinou chŕapavců.
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_02");//No, Hornický údolí má svoje vlastní zákony. Âíkal jsem jim to. Ale nechtęli mę poslouchat.
};
//******************************************************************
//			Perm
//******************************************************************
INSTANCE DIA_DiegoOw_Perm(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 5;
	condition	= DIA_DiegoOw_Perm_Condition;
	information	= DIA_DiegoOw_Perm_Info;
	permanent	= FALSE;
	description = "Co bych męl o údolí vędęt?";
};                       
FUNC INT DIA_DiegoOw_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Perm_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Perm_15_00");//Co bych męl o údolí vędęt?
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_01");//Od pádu bariéry se tady pár vęcí zmęnilo. Hlavní slovo tu teë mají skâeti.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_02");//My lidé nejsme nic jinýho než žrádlo pro skutečný pány údolí: draky.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_03");//Drž se stranou od všeho, co je nad tvoje síly - a vyhýbej se všemu, co vypadá jako drak.
};

//******************************************************************
//			Gorn Freikaufen
//******************************************************************
INSTANCE DIA_DiegoOw_Gorn(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 6;
	condition	= DIA_DiegoOw_Gorn_Condition;
	information	= DIA_DiegoOw_Gorn_Info;
	permanent	= FALSE;
	description = "Rád bych Gorna vykoupil z vęzení...";
};                       

FUNC INT DIA_DiegoOw_Gorn_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Gorn_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Gorn_15_00");//Chtęl bych vykoupit Gornovi na svobodu, ale Garond za to chce 1000 zlatých.
	AI_Output (self ,other,"DIA_DiegoOw_Gorn_11_01");//Hezká sumička. Mám u sebe 300 zlatých, klidnę si je vezmi. Ale zbytek je na tobę.
	
	B_GiveInvItems (self, other, ItmI_Gold, 300);
	
	B_LogEntry (TOPIC_RescueGorn,"Diego mi zaplatil 300, abych Gornovi pomohl na svobodu.");
};

//******************************************************************
//		Kannst du mir was beibringen?
//******************************************************************
var int Diego_MerkeDEX;
var int Diego_MerkeSTR;
// -----------------------------------------------------------------
instance DIA_DiegoOw_Teach(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 100;
	condition	= DIA_DiegoOw_Teach_Condition;
	information	= DIA_DiegoOw_Teach_Info;
	permanent	= TRUE;
	description = "Můžeš mę nęčemu naučit?";
};                       
func INT DIA_DiegoOw_Teach_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_DiegoOw_Teach_info ()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Teach_15_00");//Můžeš mę nęčemu naučit?
	AI_Output (self, other,"DIA_Addon_DiegoOw_Teach_11_01");//Jasnę, co bys rád vędęl?
		
	Diego_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Diego_MerkeSTR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_Teach, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //Trochu obratnosti už jsi získal.
	};
	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //(odhadnę) Dobâe. Tvá síla se zvýšila.
	};
	
	Info_ClearChoices (DIA_DiegoOw_TEACH);
};
func void DIA_DiegoOw_TEACHDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_ThiefOW_PICKPOCKET (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 900;
	condition	= DIA_ThiefOW_PICKPOCKET_Condition;
	information	= DIA_ThiefOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_ThiefOW_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_ThiefOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice		(DIA_ThiefOW_PICKPOCKET, DIALOG_BACK 		,DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_ThiefOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_ThiefOW_PICKPOCKET);
};
	
func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_ThiefOW_PICKPOCKET);
};

// ************************************************************
// *** 														***
// 					Mit Diego Durch die Gegend
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 					Lass uns zusammen gehen!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Together(C_INFO)
{
	npc			= 	PC_ThiefOW;
	nr		 	= 	11;
	condition	= 	DIA_Addon_ThiefOW_Together_Condition;
	information	= 	DIA_Addon_ThiefOW_Together_Info;

	description	= 	"Pojëme spolu.";
};
func int DIA_Addon_ThiefOW_Together_Condition ()
{
	return TRUE;
};
func void DIA_Addon_ThiefOW_Together_Info ()
{
	AI_Output (other, self,	"DIA_Addon_Diego_Together_15_00"); //Tak pojëme spolu.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_01"); //Do průsmyku? Proč ne.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_02"); //Bęž první. Sotva jsi odsud pâišel.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_03"); //Ale aă tę ani nenapadne se moc pâibližovat k hradu nebo ke skâetí palisádę.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_04"); //A taky se vyhýbej opevnęným táborům paladinů.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_05"); //Právę jsem z jednoho utekl a rozhodnę se nehodlám dâít do úmoru nękde v dole.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_06"); //A snad ani nemusím zmiŕovat, že by ses nemęl pâibližovat k žádnému z draků.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_07"); //Dej mi vędęt, až budeš pâipravenej.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_ComeOn(C_INFO)
{
	npc			= 	PC_ThiefOW;
	nr		 	= 	12;
	condition	= 	DIA_Addon_ThiefOW_ComeOn_Condition;
	information	= 	DIA_Addon_ThiefOW_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Pojë se mnou.";
};
func int DIA_Addon_ThiefOW_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_ThiefOW_Together))
	&& (Diego_angekommen == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_ThiefOW_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Diego_ComeOn_15_00"); //Pojë se mnou.
	
	if (C_DiegoTooFar(0))
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_01"); //Tudy ne!

		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_02"); //Dobâe.

		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_GoHome(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 13;
	condition	= DIA_Addon_ThiefOW_GoHome_Condition;
	information	= DIA_Addon_ThiefOW_GoHome_Info;
	permanent	= TRUE;
	description = "Počkej tady.";
};                       
FUNC INT DIA_Addon_ThiefOW_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_ThiefOW_GoHome_Info()
{	
	AI_Output (other, self,"DIA_Addon_Diego_WarteHier_15_00"); //Počkej tady!
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") < 2000)
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_01"); //Fajn. 
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else if (Npc_GetDistToWP (self, "DT_E1_04") < (1500+1000)) //XARDAS
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_02"); //Počkám u té vęže venku.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"XARDAS");
	}
	else if (Npc_GetDistToWP (self, "OW_NEWMINE_11") < (4000+1000)) //FAJETHMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_03"); //Počkám u dolu.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"FAJETH");
	}
	else if (Npc_GetDistToWP (self, "OW_MINE3_OUT") < (1200+1000)) //SILVESTROMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_04"); //Počkám pâímo pâed dolem.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"SILVESTRO");
	}
	else if (Npc_GetDistToWP (self, "OW_PATH_266") < (3000+1000)) //GRIMESMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_05"); //Počkám tady kousek.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"GRIMES");
	}
	else if (Npc_GetDistToWP (self, "LOCATION_02_05") < 15000) //Orcbarrier FIRE ANGAR LAKE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_06"); //Ne. Vrátím se zpátky do jeskynę.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_07"); //Až tu skončíš, zajdi za mnou.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_08"); //Ale moc dlouho neotálej, nebo se vrátím sám.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else //zu weit weg
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_09"); //Dęláš si srandu? To se máme rozdęlit? Tady?
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_10"); //Jen pâes mou mrtvolu!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_11"); //Půjdeme teë do průsmyku - spolu.
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_00"); //Bęž první a omrkni to tam - já počkám venku.
};
// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_01"); //Do průsmyku se jde jinudy!
};
// ------------------------------------------------------------
var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_TooFar(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 14;
	condition	= DIA_Addon_ThiefOW_TooFar_Condition;
	information	= DIA_Addon_ThiefOW_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{	
		if (C_DiegoTooFar(0))
		{
			if (Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
};

FUNC VOID DIA_Addon_ThiefOW_TooFar_Info()
{	
	if (C_DiegoTooFar(1000) == LOC_ANGAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_02"); //Na týhle hrobce je nęco strašidelnýho.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_03"); //Radši bysme to męli obejít.
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_04"); //To je vchod do bývalýho Novýho tábora. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_05"); //Určitę se tam usadil nęjakej drak.
			B_Addon_Diego_PassOtherDirection();
			Diego_IceVariation = 1;
		}
		else //1 
		{
			B_Addon_Diego_PassOtherDirection();
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SWAMP)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_06"); //Bažina je slepá ulička.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_07"); //Nepâekvapilo by mę, kdyby se v ní usídlil nęjakej drak.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_08"); //Nechoëme tam.
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_09"); //Když půjdeme poâád nahoru, určitę potkáme draka.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_10"); //A já bych se rád dostal do Khorinidu ŽIVEJ.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_11"); //Vezmęme to jinudy.
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_12"); //Tohle jezero nás nikam nedovede.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_13"); //Do průsmyku musíme jít jinudy!
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_14"); //Tohle je stará Xardasova vęž. Ale pochopitelnę ji opustil už dávno.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_15"); //Určitę tam narafičil spoustu nepâíjemnejch pâekvapení. 
			B_Addon_Diego_WillWaitOutside();
			Diego_XardasVariation = 1;
		}
		else //1
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos (self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine	(self,"XARDAS");
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_FAJETHMINE)
	{
		if (Diego_FajethVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_16"); //Tamhle je Fajethův důl.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_17"); //Jestli chceš jít dovnitâ, tak mę vynech!
			Diego_FajethVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_18"); //Já bych se tomu dolu vyhýbal na sto honů!
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_19"); //Pâesnę do tohohle dolu mę odvlekli i s ostatníma trestancema.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_20"); //Vím určitę, že NIKDO nepâežil.
			B_Addon_Diego_WillWaitOutside();
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //Ale když ti to potrvá moc dlouho, vrátím se do svýho tábora.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //Pokud teda nechceš, abych tu na tebe počkal.
			Diego_SilvestroVariation = 1;
		}
		else //1
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos (self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine	(self,"SILVESTRO");
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_GRIMESMINE)
	{
		if (Diego_GrimesVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_21"); //Tohle je jeden z novejch paladinskejch dolů. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_22"); //Nikdy jsem tam nebyl, a ani o to nestojím.
			Diego_GrimesVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_23"); //Od tohohle dolu se radši držme dál.
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_24"); //Seš snad sebevrah, nebo co? Od toho hradu se drž hezky daleko!
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{	
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_25"); //Hele, posloucháš mę vůbec?! Drž se od toho hradu dál!
			Diego_BurgVariation = 2;
		}
		else //2
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_26"); //Copak nerozumíš česky? 'Od toho hradu dál'! Je to tak nepochopitelný, nebo co?
			Diego_BurgVariation = 1;
		};	
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_27"); //Tady už dál nemůžeme. Skâetí bariéra je pâíliš nebezpečná.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_28"); //Myslím, že bude lepší, když to teë stâihneme k západu a obejdeme to z druhý strany.
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_29"); //Kdybychom pokračovali tudy, jen bysme zase narazili na skâetí bariéru.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_30"); //Vzhůru do průsmyku!
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_02"); //Dál už půjdu sám.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_03"); //Ještę si musím pár vęcí zaâídit, než se vrátím do Khorinidu.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_04"); //Díky, kamaráde. Uvidíme se ve męstę.
	
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"PASS");
	
	Diego_angekommen = TRUE;
};
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_Angekommen (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_Addon_ThiefOW_Angekommen_Condition;
	information	= DIA_Addon_ThiefOW_Angekommen_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_Angekommen_Condition()
{
	if (Npc_GetDistToWP (self, "OW_VM_ENTRANCE") < 800)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_Angekommen_Info()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_01"); //Tak a jsme tu.
	B_GivePlayerXP (500);
	B_Diego_WirSindDa();
};

// ------------------------------------------------------------
// 							Nostalgie
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Nostalgie (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_Addon_ThiefOW_Nostalgie_Condition;
	information	= DIA_Addon_ThiefOW_Nostalgie_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if (Npc_GetDistToWP (self, "WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_Nostalgie_Info()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //Pamatuješ?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //Jak jsme se potkali poprvé?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //Už je to tak dlouho...
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //Ale tady bývalo nęco JINÝHO... Hmm, sakra! Už si to nepamatuju!
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_05"); //To je fuk.
	B_GivePlayerXP (500);
	hero.exp = hero.exp + 500;
	PrintScreen (ConcatStrings(NAME_Addon_NostalgieBonus, IntToString(500)), -1, 60, FONT_Screen, 2);
	
	
	B_Diego_WirSindDa();
};


// ------------------------------------------------------------
// 							PERM
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_PERM (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 10;
	condition	= DIA_Addon_ThiefOW_PERM_Condition;
	information	= DIA_Addon_ThiefOW_PERM_Info;
	permanent	= TRUE;
	description = "Je všechno v poâádku?";
};                       
FUNC INT DIA_Addon_ThiefOW_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_DiegoOw_Perm))
	&& (Npc_KnowsInfo(other, DIA_Addon_ThiefOW_Together))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_PERM_Info()
{	
	AI_Output (other ,self,"DIA_Addon_Diego_PERM_15_00"); //Jak se vede?
	if (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_01"); //Hodil by se mi léčivej lektvar, nemęl bys nęjakej?
	}
	else if (DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& 		(Diego_angekommen == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_02"); //Tak mi âekni, až budeš chtít vyrazit.
	}
	else if (Diego_angekommen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_03"); //Fajn, jen si chvilku oddychnu.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_04"); //Fajn.
	};
};


