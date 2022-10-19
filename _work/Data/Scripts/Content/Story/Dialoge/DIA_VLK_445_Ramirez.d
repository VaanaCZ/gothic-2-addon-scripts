//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_EXIT   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 999;
	condition   = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ramirez_PICKPOCKET (C_INFO)
{
	npc			= VLK_445_Ramirez;
	nr			= 900;
	condition	= DIA_Ramirez_PICKPOCKET_Condition;
	information	= DIA_Ramirez_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Ramirez_PICKPOCKET_Condition()
{
	C_Beklauen (90, 300);
};
 
FUNC VOID DIA_Ramirez_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_BACK 		,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
	
func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Zeichen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Zeichen_Condition;
	information = DIA_Ramirez_Zeichen_Info;
	permanent   = FALSE;
	description = "(Poka� z�odziejski gest)";
};

FUNC INT DIA_Ramirez_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Ramirez_Zeichen_14_00");//No, no, widz�, �e kto� pokaza� ci znak. Jestem pod wra�eniem.
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Hallo   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent   = TRUE;
	important	= TRUE;
};
//----------------------------------
var int DIA_Ramirez_Hallo_permanent;
//----------------------------------
FUNC INT DIA_Ramirez_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ramirez_Hallo_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Hallo_Info()
{
	if (self.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Join_Thiefs == FALSE) 
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_00");//Zab��dzi�e�? To chyba nie jest odpowiednie miejsce dla ciebie.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_01");//Je�li co� ci si� tutaj stanie, to mo�esz by� pewien, �e nikt nie przyjdzie ci na ratunek. Wi�c lepiej uwa�aj.
	};
	if  (Join_Thiefs == TRUE)  
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_02");//Uda�o ci si� wej��. C�, �ycz� szcz�cia - i uwa�aj na siebie, cokolwiek b�dziesz robi�.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_03");//Och, i jeszcze co� - nie obchodzi mnie, kim jeste� na g�rze, ani dla kogo pracujesz.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_04");//Tu, na dole, wszyscy jeste�my z�odziejami. Ni mniej, ni wi�cej.
		DIA_Ramirez_Hallo_permanent = TRUE;
	};
	
	DG_gefunden = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Beute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Beute   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 3;
	condition   = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ramirez_Beute_Condition()
{
	if ((Mob_HasItems ("THIEF_CHEST_01",ItMi_Gold) < 50)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Gold) < 100)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Silvercup) == FALSE)
	|| (Mob_HasItems  ("THIEF_CHEST_03",ItMi_Gold) < 75))
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Beute_Info()
{
	AI_Output (self, other, "DIA_Ramirez_Beute_14_00");//S�uchaj, ty chyba nie masz w sobie za grosz godno�ci, co? Kradniesz nam nasze w�asne z�oto?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_01");//Nie gor�czkuj si� tak z powodu kilku monet.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_02");//To znaczy, czy to jest wasz ca�y �up? Czy tylko tyle ma do zaoferowania gildia z�odziei z Khorinis?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_03");//A kto m�wi, �e �upy trzymamy tutaj?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_04");//Mnie te� co� nie chce si� w to uwierzy�. Gdzie wi�c ukryli�cie skarby?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_05");//W bardzo bezpiecznym miejscu.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_06");//Rozumiem.
	AI_Output (self, other, "DIA_Ramirez_Beute_14_07");//W porz�dku, mo�esz zatrzyma� z�oto, ale uwa�aj, b�d� mia� na ciebie oko. Nie przesadzaj.
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Bezahlen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 9;
	condition   = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Mo�esz mnie czego� nauczy�?";
};
//--------------------------------------
var int DIA_Ramirez_Bezahlen_permanent;
//--------------------------------------
FUNC INT DIA_Ramirez_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (DIA_Ramirez_Bezahlen_permanent == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Info()
{	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else 
	{
		Ramirez_Cost = 300;
	};	
		
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_15_00");//Czy m�g�by� mnie czego� nauczy�?
	
	if (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_01");//Nie mog� nauczy� ci� nic wi�cej. Przekaza�em ci ca�� moj� wiedz� na temat otwierania zamk�w.
		if (other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output (self, other, "DIA_Ramirez_Add_14_00"); //Teraz musisz ju� tylko poprawi� swoj� zr�czno��.
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_02");//Mog� ci pokaza�, jak otwiera� zamki. B�dzie ci� to kosztowa� jakie�...
		B_Say_Gold (self, other, Ramirez_Cost);
		
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"Mo�e p�niej... (POWR�T)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"Dobra, zap�ac�...",DIA_Ramirez_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Ramirez_Bezahlen);
};
FUNC VOID DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_00");//Dobra, zap�ac�...
	
	if B_GiveInvItems (other, self, ItMi_Gold, Ramirez_Cost)
	{
		AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_01");//...Oto twoje z�oto.
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_02");//�wietnie. S�u�� pomoc�.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_03");//Bierz wi�c z�oto i wracaj.
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	};

};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Teach   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 99;
	condition   = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent   = TRUE;
	description = "Naucz mnie otwiera� zamki!";
};

FUNC INT DIA_Ramirez_Teach_Condition()
{	
	if (Ramirez_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Teach_Info()
{
	AI_Output (other,self, "DIA_Ramirez_Teach_15_00");//Poka� mi, jak otwiera� zamki.
	
	if (Ramirez_Zweimal == FALSE)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_06");//Umiej�tno�� otwierania zamk�w to niemal sztuka.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_01");//Potrzeba do tego wiele uczucia i intuicji. No, i kilka dobrych wytrych�w.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_02");//Niekt�re skrzynie s� jednak zabezpieczone zamkami, daj�cymi si� otworzy� tylko przez u�ycie odpowiedniego klucza.
		Ramirez_Zweimal = TRUE;
	}
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_03");//Tak wi�c, kl�cz�c przy zamku, nale�y �agodnie obr�ci� wytrych, w lewo i w prawo.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_04");//Je�li obr�cisz go zbyt szybko lub zbyt mocno - z�amie si�.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_05");//Jednak z czasem nabierzesz wprawy w pos�ugiwaniu si� tym narz�dziem.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info oberes Viertel
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Viertel   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 8;
	condition   = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent   = FALSE;
	description = "Gdzie warto si� w�amywa�?";
};
FUNC INT DIA_Ramirez_Viertel_Condition()
{
	if (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Viertel_Info()
{	
	AI_Output (other, self, "DIA_Ramirez_Viertel_15_00");//Gdzie warto si� w�amywa�?
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_01");//Oczywi�cie w g�rnym mie�cie.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_02");//Jednak je�li przyjdzie ci do g�owy gdzie� tam si� w�amywa�, lepiej zaczekaj, a� zapadnie zmrok. Miasto zapada wtedy w sen, oczywi�cie pozostaj� jeszcze stra�e.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_03");//Stra�nicy kontroluj� miasto noc�. Znam jednego - Wambo, to jedyny z nich, kt�rego interesuje tylko z�oto.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_04");//Liczy sobie do�� sporo, ale je�li raz mu zap�acisz, nie b�dzie wi�cej sprawia� k�opot�w.
};
///////////////////////////////////////////////////////////////////////
//	Info Sextant
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Sextant   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent   = FALSE;
	description = "Masz dla mnie jak�� robot�?";
};

FUNC INT DIA_Ramirez_Sextant_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Sextant_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_00");//Czy masz dla mnie jak�� prac�?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_01");//Hmmm... Jest pewna rzecz, kt�ra mnie interesuje. Jednak dotychczas nie uda�o mi si� jej zdoby�.
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_02");//C� to takiego?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_03");//Sekstans. Przynie� mi go, a dobrze zap�ac�.
	
	Log_CreateTopic (Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus (Topic_RamirezSextant, LOG_RUNNING);
	B_LogEntry (Topic_RamirezSextant, "Ramirez chce, abym przyni�s� mu sekstans.");
	
	MIS_RamirezSextant = LOG_RUNNING;
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Success   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent   = FALSE;
	description = "Mam dla ciebie sekstans.";
};

FUNC INT DIA_Ramirez_Success_Condition()
{
	if Npc_KnowsInfo (other, DIA_Ramirez_Sextant)
	&& (Npc_HasItems (other, Itmi_Sextant ) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Success_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Success_15_00");//Mam dla ciebie sekstans.
	B_GiveInvItems (other, self, Itmi_Sextant,1);
	AI_Output (self, other, "DIA_Ramirez_Success_14_01");//Niewiarygodne. Naprawd� uda�o ci si� go zdoby�.
	AI_Output (self, other, "DIA_Ramirez_Success_14_02");//Prosz�, naprawd� zas�u�y�e� sobie na te pieni�dze.
	
	B_GiveInvItems (self, other, Itmi_Gold,Value_Sextant/2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP (XP_RamirezSextant);
};


