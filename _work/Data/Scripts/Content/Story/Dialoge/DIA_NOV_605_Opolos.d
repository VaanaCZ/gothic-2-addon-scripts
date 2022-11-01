
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Opolos_Kap1_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap1_EXIT_Condition;
	information = DIA_Opolos_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//		Hello
//*********************************************************************
INSTANCE DIA_Opolos_Hello   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 1;
	condition   = DIA_Opolos_Hello_Condition;
	information = DIA_Opolos_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Opolos_Hello_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_Hello_Info()
{
	AI_Output (self ,other,"DIA_Opolos_Hello_12_00"); //Ahoj, ty musíš být ten nový chlapík.
	AI_Output (self ,other,"DIA_Opolos_Hello_12_01"); //Jsem Opolos. Starám se tady o ovce.
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Opolos_Wurst(C_INFO)
{
	npc         = NOV_605_Opolos;
	nr			= 2;
	condition	= DIA_Opolos_Wurst_Condition;
	information	= DIA_Opolos_Wurst_Info;
	permanent	= FALSE;
	description = "Mám tu pro tebe skopovou klobásu...";
};                       

FUNC INT DIA_Opolos_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Opolos_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Opolos_Wurst_15_00"); //Mám tu pro tebe skopovou klobásu.
	AI_Output (self, other, "DIA_Opolos_Wurst_12_01"); //No človęče, to je skvęlý! Konečnę další výborná skopová klobása.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//*********************************************************************
//		Seit wann bist Du hier?
//*********************************************************************
INSTANCE DIA_Opolos_HowLong   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 1;
	condition   = DIA_Opolos_HowLong_Condition;
	information = DIA_Opolos_HowLong_Info;
	permanent   = FALSE;
	description	= "Jak dlouho už jsi v klášteâe?";
};
FUNC INT DIA_Opolos_HowLong_Condition()
{
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_HowLong_Info()
{
	AI_Output (other,self ,"DIA_Opolos_HowLong_15_00"); //Jak dlouho už jsi v klášteâe?
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_01"); //Jsem tady tâi roky. Ale zatím jsem vůbec nestudoval, i když bych rád.
	AI_Output (other,self ,"DIA_Opolos_HowLong_15_02"); //Proč ne?
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_03"); //Mojí prací je starat se o ovce - ne studovat spisy.
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_04"); //Dokud mę mistr Parlan neuvolní z téhle služby, nemůžu studovat v knihovnę.
	
	MIS_HelpOpolos = LOG_RUNNING;
	Log_CreateTopic (Topic_OpolosStudy,LOG_MISSION);
	Log_SetTopicStatus (Topic_OpolosStudy,LOG_RUNNING);
	B_LogEntry (Topic_OpolosStudy,"Opolos hlídá ovce, ale rád by si prostudoval i spisky v knihovnę.");
};
//*********************************************************************
//		Auf was muss ich hier im Kloster achten?
//*********************************************************************
INSTANCE DIA_Opolos_Monastery   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_Monastery_Condition;
	information = DIA_Opolos_Monastery_Info;
	permanent   = FALSE;
	description	= "Jak se mám tady v klášteâe chovat?";
};
FUNC INT DIA_Opolos_Monastery_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Monastery_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Monastery_15_00"); //Jak se mám tady v klášteâe chovat?
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_01"); //Nikdy nelži mágům. Neprohâeš se proti bratrovi ze společenstva.
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_02"); //Respektuj majetek společenstva. Pokud tato pravidla porušíš, budeš se zodpovídat mistru Parlanovi.
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_03"); //Kromę toho bych tę męl varovat, aby ses męl na pozoru pâed Agonem. Když nebudeš dost opatrný, skončíš jako Babo.
};
//*********************************************************************
//		Kannst du mir was beibringen?
//*********************************************************************
INSTANCE DIA_Opolos_beibringen   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_beibringen_Condition;
	information = DIA_Opolos_beibringen_Info;
	permanent   = FALSE;
	description	= "Můžeš mę nęčemu naučit?";
};
FUNC INT DIA_Opolos_beibringen_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	&& ((other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_beibringen_Info()
{
	AI_Output (other,self ,"DIA_Opolos_beibringen_15_00"); //Mohl bys mę nęco naučit?
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_01"); //Jasnę, kdysi jsem býval docela dobrý rváč. Můžu ti ukázat, jak posílit paže.
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_02"); //Ale já bych se rád naučil nęco o lektvarech, hlavnę o tęch magických.
	AI_Output (other,self ,"DIA_Opolos_beibringen_15_03"); //Jak bych ti s tím jen mohl pomoci?
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_04"); //No, kdybys pracoval pro Neorase, určitę by se ti naskytla pâíležitost 'vypůjčit' si na chvíli jeden z jeho receptů.
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_05"); //Když mi ho pâineseš, abych se na nęj mohl podívat, nęco tę určitę naučím.
	
	Log_CreateTopic (Topic_OpolosRezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosRezept,LOG_RUNNING);
	B_LogEntry (Topic_OpolosRezept,"Opolos chce letmo nahlédnout do receptu na lektvary many. Když budu pracovat pro Neorase, možná bych si mohl nęjaký takový spisek půjčit.");
};
//*********************************************************************
// rezept
//*********************************************************************
INSTANCE DIA_Opolos_rezept   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_rezept_Condition;
	information = DIA_Opolos_rezept_Info;
	permanent   = TRUE;
	description	= "Co se týče toho receptu...";
};
//-----------------------------------
var int DIA_Opolos_rezept_permanent;
//-----------------------------------
FUNC INT DIA_Opolos_rezept_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_beibringen)
	&& (other.guild == GIL_NOV)
	&& (DIA_Opolos_rezept_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_rezept_Info()
{
	if (Npc_HasItems (other, ItWr_Manarezept) >= 1)
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_00"); //Mám ten recept, který jsi chtęl.
		AI_Output (self ,other,"DIA_Opolos_rezept_12_01"); //Dobrá, půjč mi ho, aă si ho pâečtu.
		B_UseFakeScroll ();
		AI_Output (self ,other,"DIA_Opolos_rezept_12_02"); //Aha... hm... ano... jo takhle... dobrá, dobrá...
		B_UseFakeScroll ();
		AI_Output (self ,other,"DIA_Opolos_rezept_12_03"); //A je to. Pokud chceš, můžu tę nęco naučit.
		
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		
		Opolos_Rezept = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
		
		Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry (Topic_KlosterTeacher,"S Opolovou pomocí se mohu stát silnęjším.");

	}
	else if (MIS_NEORASRezept == LOG_SUCCESS)
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_04"); //Už jsem ten recept vrátil Neorasovi.
		AI_Output (self ,other,"DIA_Opolos_rezept_12_05"); //A dopr... Asi se tady nic nenaučím. Ale co. Stejnę ti nęco ukážu.
		
		Opolos_Rezept = LOG_FAILED;
		
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		
		Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry (Topic_KlosterTeacher,"S Opolovou pomocí se mohu stát silnęjším.");
	}
	else 
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_06"); //K tomu se dostanu pozdęji.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_STR
///////////////////////////////////////////////////////////////////////
instance DIA_Opolos_TEACH_STR		(C_INFO)
{
	npc			 = 	NOV_605_Opolos;
	nr 			 =  99;
	condition	 = 	DIA_Opolos_TEACH_STR_Condition;
	information	 = 	DIA_Opolos_TEACH_STR_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chci se stát silnęjším.";
};
func int DIA_Opolos_TEACH_STR_Condition ()
{	
	if (hero.guild == GIL_KDF
	||  hero.guild == GIL_NOV) 
	&& (Opolos_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Opolos_TEACH_STR_Info ()
{
		AI_Output (other, self, "DIA_Opolos_TEACH_STR_15_00"); //Chtęl bych se stát silnęjším.
		
		Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
		Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
		Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
		Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
FUNC VOID DIA_Opolos_TEACH_STR_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_MED)  
	{
		AI_Output (self, other, "DIA_Opolos_TEACH_STR_12_00"); //Už teë jsi dost silný. Tęžko bych tę naučil nęco nového.
	};
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
};
FUNC VOID DIA_Opolos_TEACH_STR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
	Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
FUNC VOID DIA_Opolos_TEACH_STR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
	Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
//*********************************************************************
//		Wer ist Agon?
//*********************************************************************
INSTANCE DIA_Opolos_Agon   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 4;
	condition   = DIA_Opolos_Agon_Condition;
	information = DIA_Opolos_Agon_Info;
	permanent   = FALSE;
	description	= "Kdo jsou Agon a Babo?";
};
FUNC INT DIA_Opolos_Agon_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Opolos_Monastery))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Agon_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Agon_15_00"); //Kdo jsou Agon a Babo?
	AI_Output (self ,other,"DIA_Opolos_Agon_12_01"); //Agon se staré o bylinkovou zahradu. Je také novic, ale chová se, jako by byl sám vyvolený.
	AI_Output (self ,other,"DIA_Opolos_Agon_12_02"); //Babo pâišel do kláštera krátce pâed tebou. Zpočátku pomáhal Agonovi v zahradę.
	AI_Output (self ,other,"DIA_Opolos_Agon_12_03"); //Ale museli se asi nęjak poprat a od té doby Babo jen zametá dvůr.
	AI_Output (other,self ,"DIA_Opolos_Agon_15_04"); //Víš, co se stalo?
	AI_Output (self ,other,"DIA_Opolos_Agon_12_05"); //Ne tak docela pâesnę. Na to se budeš muset zeptat jich. Ale Agonovo slovo má vętší váhu než kohokoliv z noviců, protože je synovec místodržícího.
};
///////////////////////////////////////////////////////////////////////
//	Info SHEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Opolos_LIESEL		(C_INFO)
{
	npc			 = 	NOV_605_Opolos;
	nr			 =  2;
	condition	 = 	DIA_Opolos_LIESEL_Condition;
	information	 = 	DIA_Opolos_LIESEL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Podívej, pâivedl jsem ti Betsy.";
};
func int DIA_Opolos_LIESEL_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (Liesel_Giveaway == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Opolos_LIESEL_Info ()
{
	
	
	AI_Output (other, self, "DIA_Opolos_LIESEL_15_00"); //Podívej, pâivedl jsem Betsy. Můžu ji nechat u tebe?
	
	Npc_PerceiveAll (self);
	
	if  Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 800)
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = ZS_MM_AllScheduler; 
		
		Liesel_Giveaway = TRUE;
		AI_Output (self, hero, "DIA_Opolos_LIESEL_12_01"); //Ano, samozâejmę. Hezké zvíâátko. Dobâe se o ni postarám.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (other, self, "DIA_Opolos_Add_15_00"); //Hm... zdá se, že jsem to špatnę založil. Vrátím se pozdęji.
	};
	
	
	
};
//*********************************************************************
//	Wegen der  Biblothek... 
//*********************************************************************
INSTANCE DIA_Opolos_Biblothek   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 98;
	condition   = DIA_Opolos_Biblothek_Condition;
	information = DIA_Opolos_Biblothek_Info;
	permanent   = TRUE;
	description	= "Co se týče knihovny...";
};
FUNC INT DIA_Opolos_Biblothek_Condition()
{
	if (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other, DIA_Opolos_HowLong)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_Biblothek_Info()
{
	AI_Output (other ,self,"DIA_Opolos_Biblothek_15_00"); //Co se týče knihovny...
	
	if (Parlan_Erlaubnis == FALSE)
	{
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_01"); //Je to ta zamčená místnost nalevo, vedle vrat.
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_02"); //Ale klíč dostaneš až ve chvíli, kdy mistr Parlan dojde k názoru, že můžeš studovat.
	}
	else
	{
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_03"); //Ty máš víc štęstí než rozumu! Máš klíč ke knihovnę, a pâitom jsi tady jenom takovou chvilku.
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_04"); //Využij té pâíležitosti a uč se ze starých spisů!
	};
	
	
	AI_StopProcessInfos (self);
};
//*********************************************************************
//		Sc hat Opolos das Studieren ermöglicht (Kap. 2)
//*********************************************************************
INSTANCE DIA_Opolos_HelloAgain   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 2;
	condition   = DIA_Opolos_HelloAgain_Condition;
	information = DIA_Opolos_HelloAgain_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Opolos_HelloAgain_Condition()
{
	if (other.guild == GIL_KDF)
	&& (MIS_HelpOpolos == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_HelloAgain_Info()
{
	AI_Output (self ,other,"DIA_Opolos_HelloAgain_12_00"); //Ahoj. Dękuji, žes mi pomohl. Pokusím se z téhle šance vytęžit co nejvíc a naučit se tolik, co jen půjde.
	AI_Output (self ,other,"DIA_Opolos_HelloAgain_12_01"); //Ale určitę nemáš čas jen tak klábosit s obyčejným novicem, mistâe.
	
	B_GivePlayerXP (XP_Ambient); 
	AI_StopProcessInfos (self);
};

//*********************************************************************
//		Sc hat Opolos zum Einkaufen geschickt (Kap. 2)
//*********************************************************************
INSTANCE DIA_Opolos_HowIsIt   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_HowIsIt_Condition;
	information = DIA_Opolos_HowIsIt_Info;
	permanent   = TRUE;
	description	= "Jak se vede?";
};
FUNC INT DIA_Opolos_HowIsIt_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_HowIsIt_Info()
{
	AI_Output (other,self ,"DIA_Opolos_HowIsIt_15_00"); //Jak se vede?
	
	if (MIS_HelpOpolos == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_01"); //Výbornę. Od chvíle, co mohu studovat, je všechno vynikající.
	}
	else
	{
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_02"); //Poslušnę plním všechny zadané úkoly, mistâe.
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_03"); //Každý den pâede mne Innos klade nové výzvy. Budu nadále pracovat na vlastním zdokonalování.
	};
	
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 2
//##
//##########################################

INSTANCE DIA_Opolos_Kap2_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap2_EXIT_Condition;
	information = DIA_Opolos_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 3
//##
//##########################################

INSTANCE DIA_Opolos_Kap3_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap3_EXIT_Condition;
	information = DIA_Opolos_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*************************************************************
//	Was amchen die Schafe?
//************************************************************

INSTANCE DIA_Opolos_Kap3_PERM   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 39;
	condition   = DIA_Opolos_Kap3_PERM_Condition;
	information = DIA_Opolos_Kap3_PERM_Info;
	permanent   = TRUE;
	description = "Jak je ovečkám?";
};
FUNC INT DIA_Opolos_Kap3_PERM_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap3_PERM_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_15_00"); //Jak je ovečkám?
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_12_01"); //Jak by jim asi tak bylo? Stojí tady a pâežvykují trávu.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_12_02"); //Radši bych vędęl, co se dęje venku. Zdá se, že mágové jsou nęjak pâehnanę nervózní.

	Info_ClearChoices (DIA_Opolos_Kap3_PERM);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,DIALOG_BACK,DIA_Opolos_Kap3_PERM_BACK);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,"V Hornickém údolí se objevili draci.",DIA_Opolos_Kap3_PERM_DRAGONS);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,"Po krajinę se potulují divní lidé v černých róbách.",DIA_Opolos_Kap3_PERM_DMT);
	
	if (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Opolos_Kap3_PERM,"Pedro nás zradil.",DIA_Opolos_Kap3_PERM_PEDRO);
	};
};

FUNC VOID DIA_Opolos_Kap3_PERM_BACK()
{
	Info_ClearChoices (DIA_Opolos_Kap3_PERM);
};

var int Opolos_Dragons;

FUNC VOID DIA_Opolos_Kap3_PERM_DRAGONS()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00"); //V Hornickém údolí jsou draci. Společnę s armádou skâetů obléhají královské jednotky.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01"); //Draci? Vždycky jsem si myslel, že existují jenom ve strašidelných pâíbęzích.
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02"); //Jsou tam, vęâ mi.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03"); //Ale královští paladini si s nimi snad poradí, ne?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04"); //Uvidíme.
	
	if (Opolos_Dragons == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_Dragons = TRUE;
	};	
};

var int Opolos_DMT;

FUNC VOID DIA_Opolos_Kap3_PERM_DMT()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_00"); //Po krajinę se potulují divní lidé v černých róbách.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DMT_12_01"); //Jak to myslíš? Jací divní lidé?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_02"); //Nikdo neví, odkud pâišli. Nosí dlouhé černé pláštę a tváâe mají zakryté.
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_03"); //Vypadá to na nęjaké mágy. Nebo aspoŕ na nękoho, kdo umí kouzlit.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DMT_12_04"); //To zní nepâíjemnę, ale jsem si jistý, že nejvyšší rada tenhle problém vyâeší.
	
	if (Opolos_DMT == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_DMT = TRUE;
	};	
};

var int Opolos_Pedro;

FUNC VOID DIA_Opolos_Kap3_PERM_PEDRO()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_PEDRO_15_00"); //Pedro nás zradil.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01"); //Slyšel jsem o tom, ale nevędęl jsem, že o tom také víš. Proto jsem nic neâíkal.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02"); //Nepâítel je silnęjší než my. Chci âíct - dokážeme ho porazit?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_PEDRO_15_03"); //Ještę nejsme mrtví.
	
	if (Opolos_Pedro == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_Pedro = TRUE;
	};
};
//##########################################
//##
//##	Kapitel 4
//##
//##########################################

INSTANCE DIA_Opolos_Kap4_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999; 
	condition   = DIA_Opolos_Kap4_EXIT_Condition;
	information = DIA_Opolos_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 5
//##
//##########################################

INSTANCE DIA_Opolos_Kap5_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap5_EXIT_Condition;
	information = DIA_Opolos_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Opolos_PICKPOCKET (C_INFO)
{
	npc			= NOV_605_Opolos;
	nr			= 900;
	condition	= DIA_Opolos_PICKPOCKET_Condition;
	information	= DIA_Opolos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Opolos_PICKPOCKET_Condition()
{
	C_Beklauen (54, 70);
};
 
FUNC VOID DIA_Opolos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Opolos_PICKPOCKET);
	Info_AddChoice		(DIA_Opolos_PICKPOCKET, DIALOG_BACK 		,DIA_Opolos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Opolos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Opolos_PICKPOCKET_DoIt);
};

func void DIA_Opolos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Opolos_PICKPOCKET);
};
	
func void DIA_Opolos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Opolos_PICKPOCKET);
};


