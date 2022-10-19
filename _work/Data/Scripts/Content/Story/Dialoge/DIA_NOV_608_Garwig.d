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
	description = "Nedal by sis klob�su?";
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
	AI_Output (other, self, "DIA_Garwig_Wurst_15_00"); //Nedal by sis klob�su?
	AI_Output (self, other, "DIA_Garwig_Wurst_06_01"); //Hmm - ta je v�born�. D�kuji ti mockr�t, brat�e.
	
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
	AI_Output (self ,other,"DIA_Garwig_Hello_06_00"); //Innos t� doprov�zej... Nikdy jsem t� tu nevid�l, jsi tady nov�?
	AI_Output (other ,self,"DIA_Garwig_Hello_15_01"); //Ano, pr�v� jsem sem vstoupil.
	AI_Output (self ,other,"DIA_Garwig_Hello_06_02"); //V tom p��pad� douf�m, �e si tady brzy zvykne�. Dej mi v�d�t, kdybys pot�eboval s n���m pomoci.
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
	description	= "Co je tohle za m�stnost?";
};
FUNC INT DIA_Garwig_Room_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Garwig_Room_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Room_15_00"); //Co je tohle za m�stnost?
	AI_Output (self ,other,"DIA_Garwig_Room_06_01"); //Zde se uchov�vaj� svat� kl�tern� relikvie.
	AI_Output (other,self ,"DIA_Garwig_Room_15_02"); //Jak� relikvie?
	AI_Output (self ,other,"DIA_Garwig_Room_06_03"); //Je zde ulo�eno Innosovo kladivo a tak� �t�t ohn�. To jsou nejv�znamn�j�� relikvie Innosovy c�rkve nach�zej�c� se mimo hlavn� m�sto ��e.
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
	description	= "Pov�z mi o tom kladivu.";
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
	AI_Output (other,self ,"DIA_Garwig_Hammer_15_00"); //Pov�z mi o tom kladivu.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_01"); //Je to posv�tn� Innosovo kladivo. Svat� Rhobar s n�m skolil Kamenn�ho str�ce.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_02"); //Posv�tn� spisy ��kaj�, �e Kamenn� str�ce byl nezraniteln�. V bitv� st�l jako v� a zbran� jeho nep��tel se o jeho kamennou k��i l�maly.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_03"); //S Innosov�m jm�nem na rtech se Rhobar na tuhle p��eru vrhl a zni�il ji jedin�m mocn�m m�chnut�m sv�ho kladiva.
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
	description	= "Pov�z mi o tom �t�tu.";
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
	AI_Output (other,self ,"DIA_Garwig_Shield_15_00"); //Pov�z mi o tom �t�tu.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_01"); //�t�t ohn� u sebe m�l Dominique v bitv� o Ji�n� ostrovy.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_02"); //Moc tohoto �t�tu v�ak u� nikdy nikdo t��mat nebude - proto jsme jej p�itloukli ke zdi.
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
	description	= "Je tady tak� Innosovo oko?";
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
	AI_Output (other,self ,"DIA_Garwig_Auge_15_00"); //Je tady tak� Innosovo oko?
	AI_Output (self ,other,"DIA_Garwig_Auge_06_01"); //Samoz�ejm� �e ne. Co to je za podivn� n�pad? Nikdo nev�, kde je tenhle posv�tn� artefakt ukryt�.
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
	description	 = 	"Co tady d�l�?";
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
	AI_Output			(other, self, "DIA_Garwig_SLEEP_15_00"); //Co tady d�l�?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_06_01"); //Jsem str�ce posv�tn�ch artefakt�.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice 		(DIA_Garwig_SLEEP,DIALOG_BACK,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"M��u to za tebe na chv�li vz�t?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Pro� ty artefakty tolik st�e��te?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"To nikdy nesp�?",DIA_Garwig_SLEEP_NEVER);
};
FUNC VOID DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
};
FUNC VOID DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //M��u to za tebe na chv�li vz�t?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //To je n�jak� zkou�ka? Poslali t� m�gov�, abys m� pokou�el, co? No jasn� - prokoukl jsem to!
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //Ale j� t�mto testem projdu. �ekni sv�m m�g�m, �e zde stoj�m pevn� jako sk�la a �e odol�m v�em poku�en�m, proto�e jsem d�v�ryhodn� str�ce.
};
FUNC VOID DIA_Garwig_SLEEP_THIEF()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //Pro� je zapot�eb� ty artefakty hl�dat? Hroz� snad nebezpe��, �e by je mohl n�kdo ukradnout?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //V�n� podivn� p�edstava. Pro� t� to napadlo?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //Do kl�tera maj� vstup jen ti, kdo slou�� Innosovi. A ��dn�ho skute�n�ho v���c�ho by n�co podobn�ho ani nenapadlo.
};
FUNC VOID DIA_Garwig_SLEEP_NEVER()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //To nikdy nesp�?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //Pon�kud neobvykl� p�edstava. Samoz�ejm� �e nikdy nesp�m. Samotn� Innos mi dal s�lu, s jej� pomoc� se obejdu naprosto bez sp�nku.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //V�dy� jak jinak bych mohl plnit sv� posv�tn� povinnosti str�n�ho?
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice (DIA_Garwig_SLEEP,"Opravdu NIKDY nesp�?",DIA_Garwig_SLEEP_AGAIN);
};
FUNC VOID DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //Opravdu NIKDY nesp�?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //Ne. Pokud str�ce usne, zklamal.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //Ale j� nezklamu, proto�e Innos mi dal s�lu a v�dr�, tak�e se nikdy neunav�m.
	
	
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
		AI_Output (self, other, "DIA_Garwig_THIEF_06_00"); //(rozzloben�) Zlod�ji! Po�lapal jsi jm�no nejen svoje a moje, ale cel�ho kl�tera!
		AI_Output (self, other, "DIA_Garwig_THIEF_06_01"); //Za tuhle svatokr�de� zaplat�. A v�bec - VRA� MI TO KLADIVO!!
		
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_THIEF_06_02"); //(zoufale) Kladivo zmizelo - jak se to jen mohlo st�t?
		AI_Output (self, other, "DIA_Garwig_THIEF_06_03"); //Selhal jsem. Innos m� potrest�!
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Hammer zur�ckbringen (immer wenn Spieler den Hammer hat)
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_Abgeben		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_Abgeben_Condition;
	information	 = 	DIA_Garwig_Abgeben_Info;
	permanent	 = 	TRUE;
	description	 =  "Vrac�m zp�tky to kladivo.";
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
	AI_Output (other, self, "DIA_Garwig_Abgeben_15_00"); //Vrac�m zp�tky to kladivo.
	
	if (Hammer_Taken == TRUE)
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_01"); //B�dn� zlod�ji!
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_02"); //Tak�e jsi to byl ty, kdo ho ukradl.
	};
	AI_Output (self, other, "DIA_Garwig_Abgeben_06_03"); //Ale mn� nep��slu��, abych t� soudil. Innos rozhodne nad tv�m osudem a pak na tv� bedra ulo�� spravedliv� trest!
	
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















