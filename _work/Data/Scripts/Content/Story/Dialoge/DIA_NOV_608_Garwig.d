//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Garwig_EXIT   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 999;
	condition   = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Garwig_Wurst(C_INFO)
{
	npc         = Nov_608_Garwig;
	nr			= 3;
	condition	= DIA_Garwig_Wurst_Condition;
	information	= DIA_Garwig_Wurst_Info;
	permanent	= FALSE;
	description = "Nedal by sis klobásu?";
};                       

FUNC INT DIA_Garwig_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garwig_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Garwig_Wurst_15_00"); //Nedal by sis klobásu?
	AI_Output (self, other, "DIA_Garwig_Wurst_06_01"); //Hmm - ta je výborná. Dękuji ti mockrát, bratâe.
	
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
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Hello   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 3;
	condition   = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Garwig_Hello_Condition()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garwig_Hello_Info()
{
	AI_Output (self ,other,"DIA_Garwig_Hello_06_00"); //Innos tę doprovázej... Nikdy jsem tę tu nevidęl, jsi tady nový?
	AI_Output (other ,self,"DIA_Garwig_Hello_15_01"); //Ano, právę jsem sem vstoupil.
	AI_Output (self ,other,"DIA_Garwig_Hello_06_02"); //V tom pâípadę doufám, že si tady brzy zvykneš. Dej mi vędęt, kdybys potâeboval s nęčím pomoci.
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Room   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 5;
	condition   = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent   = FALSE;
	description	= "Co je tohle za místnost?";
};
FUNC INT DIA_Garwig_Room_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Garwig_Room_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Room_15_00"); //Co je tohle za místnost?
	AI_Output (self ,other,"DIA_Garwig_Room_06_01"); //Zde se uchovávají svaté klášterní relikvie.
	AI_Output (other,self ,"DIA_Garwig_Room_15_02"); //Jaké relikvie?
	AI_Output (self ,other,"DIA_Garwig_Room_06_03"); //Je zde uloženo Innosovo kladivo a také Štít ohnę. To jsou nejvýznamnęjší relikvie Innosovy církve nacházející se mimo hlavní męsto âíše.
};
//**************************************************************************
//	Info Hammer 
//**************************************************************************
INSTANCE DIA_Garwig_Hammer  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 99;
	condition   = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent   = TRUE;
	description	= "Povęz mi o tom kladivu.";
};
FUNC INT DIA_Garwig_Hammer_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Hammer_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Hammer_15_00"); //Povęz mi o tom kladivu.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_01"); //Je to posvátné Innosovo kladivo. Svatý Rhobar s ním skolil Kamenného strážce.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_02"); //Posvátné spisy âíkají, že Kamenný strážce byl nezranitelný. V bitvę stál jako vęž a zbranę jeho nepâátel se o jeho kamennou kůži lámaly.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_03"); //S Innosovým jménem na rtech se Rhobar na tuhle pâíšeru vrhl a zničil ji jediným mocným máchnutím svého kladiva.
};
//**************************************************************************
//	Info Schild 
//**************************************************************************
INSTANCE DIA_Garwig_Shield  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 98;
	condition   = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent   = FALSE;
	description	= "Povęz mi o tom štítu.";
};
FUNC INT DIA_Garwig_Shield_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Shield_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Shield_15_00"); //Povęz mi o tom štítu.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_01"); //Štít ohnę u sebe męl Dominique v bitvę o Jižní ostrovy.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_02"); //Moc tohoto štítu však už nikdy nikdo tâímat nebude - proto jsme jej pâitloukli ke zdi.
};
//**************************************************************************
//	Info Auge Innos
//**************************************************************************
INSTANCE DIA_Garwig_Auge  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 4;
	condition   = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent   = FALSE;
	description	= "Je tady také Innosovo oko?";
};
FUNC INT DIA_Garwig_Auge_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garwig_Room)
	&& (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Auge_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Auge_15_00"); //Je tady také Innosovo oko?
	AI_Output (self ,other,"DIA_Garwig_Auge_06_01"); //Samozâejmę že ne. Co to je za podivný nápad? Nikdo neví, kde je tenhle posvátný artefakt ukrytý.
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_SLEEP		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	23;
	condition	 = 	DIA_Garwig_SLEEP_Condition;
	information	 = 	DIA_Garwig_SLEEP_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co tady dęláš?";
};
func int DIA_Garwig_SLEEP_Condition ()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
func void DIA_Garwig_SLEEP_Info ()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_15_00"); //Co tady dęláš?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_06_01"); //Jsem strážce posvátných artefaktů.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice 		(DIA_Garwig_SLEEP,DIALOG_BACK,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Můžu to za tebe na chvíli vzít?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Proč ty artefakty tolik stâežíte?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"To nikdy nespíš?",DIA_Garwig_SLEEP_NEVER);
};
FUNC VOID DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
};
FUNC VOID DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //Můžu to za tebe na chvíli vzít?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //To je nęjaká zkouška? Poslali tę mágové, abys mę pokoušel, co? No jasnę - prokoukl jsem to!
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //Ale já tímto testem projdu. Âekni svým mágům, že zde stojím pevnę jako skála a že odolám všem pokušením, protože jsem důvęryhodný strážce.
};
FUNC VOID DIA_Garwig_SLEEP_THIEF()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //Proč je zapotâebí ty artefakty hlídat? Hrozí snad nebezpečí, že by je mohl nękdo ukradnout?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //Vážnę podivná pâedstava. Proč tę to napadlo?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //Do kláštera mají vstup jen ti, kdo slouží Innosovi. A žádného skutečného vęâícího by nęco podobného ani nenapadlo.
};
FUNC VOID DIA_Garwig_SLEEP_NEVER()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //To nikdy nespíš?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //Ponękud neobvyklá pâedstava. Samozâejmę že nikdy nespím. Samotný Innos mi dal sílu, s jejíž pomocí se obejdu naprosto bez spánku.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //Vždyă jak jinak bych mohl plnit své posvátné povinnosti strážného?
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice (DIA_Garwig_SLEEP,"Opravdu NIKDY nespíš?",DIA_Garwig_SLEEP_AGAIN);
};
FUNC VOID DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //Opravdu NIKDY nespíš?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //Ne. Pokud strážce usne, zklamal.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //Ale já nezklamu, protože Innos mi dal sílu a výdrž, takže se nikdy neunavím.
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info THIEF Der Hammer ist nicht mehr da
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_THIEF		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_THIEF_Condition;
	information	 = 	DIA_Garwig_THIEF_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Garwig_THIEF_Condition ()
{	
	if  (Npc_IsInState (self, ZS_Talk))
	&&  (Npc_HasItems (hero, Holy_Hammer_MIS) == 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_THIEF_Info ()
{		
					
	if (Hammer_Taken == TRUE) 
	{ 
		AI_Output (self, other, "DIA_Garwig_THIEF_06_00"); //(rozzlobenę) Zlodęji! Pošlapal jsi jméno nejen svoje a moje, ale celého kláštera!
		AI_Output (self, other, "DIA_Garwig_THIEF_06_01"); //Za tuhle svatokrádež zaplatíš. A vůbec - VRAĂ MI TO KLADIVO!!
		
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_THIEF_06_02"); //(zoufale) Kladivo zmizelo - jak se to jen mohlo stát?
		AI_Output (self, other, "DIA_Garwig_THIEF_06_03"); //Selhal jsem. Innos mę potrestá!
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Hammer zurückbringen (immer wenn Spieler den Hammer hat)
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_Abgeben		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_Abgeben_Condition;
	information	 = 	DIA_Garwig_Abgeben_Info;
	permanent	 = 	TRUE;
	description	 =  "Vracím zpátky to kladivo.";
};
func int DIA_Garwig_Abgeben_Condition ()
{	
	if (Npc_HasItems (other, Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Garwig_Abgeben_15_00"); //Vracím zpátky to kladivo.
	
	if (Hammer_Taken == TRUE)
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_01"); //Bídný zlodęji!
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_02"); //Takže jsi to byl ty, kdo ho ukradl.
	};
	AI_Output (self, other, "DIA_Garwig_Abgeben_06_03"); //Ale mnę nepâísluší, abych tę soudil. Innos rozhodne nad tvým osudem a pak na tvá bedra uloží spravedlivý trest!
	
	B_GiveInvItems (other,self, Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garwig_PICKPOCKET (C_INFO)
{
	npc			= Nov_608_Garwig;
	nr			= 900;
	condition	= DIA_Garwig_PICKPOCKET_Condition;
	information	= DIA_Garwig_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Garwig_PICKPOCKET_Condition()
{
	C_Beklauen (52, 80);
};
 
FUNC VOID DIA_Garwig_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garwig_PICKPOCKET);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_BACK 		,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};
	
func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};















