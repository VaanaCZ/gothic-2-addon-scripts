///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hakon_EXIT   (C_INFO)
{
	npc         = VLK_407_Hakon;
	nr          = 999;
	condition   = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Sperre		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Sperre_Condition;
	information	 = 	DIA_Hakon_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Hakon_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	{
		return TRUE;
	};
	//return FALSE;
};
func void DIA_Hakon_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //Uciekaj st�d, skaza�cu! Canthar powiedzia� mi, jaki z ciebie dra�!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Hallo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 =  3;
	condition	 = 	DIA_Hakon_Hallo_Condition;
	information	 = 	DIA_Hakon_Hallo_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Hakon_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Hallo_Info ()
{
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //Jestem Hakon, handlarz broni�.
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //W dzisiejszych czasach ka�dy powinien nosi� bro�. Szczeg�lnie poza miastem.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon sprzedaje bro� na targowisku.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Trade		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	99;
	condition	 = 	DIA_Hakon_Trade_Condition;
	information	 = 	DIA_Hakon_Trade_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Poka� mi swoje towary.";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Poka� mi swoje towary.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //To dla mnie zaszczyt, �e reprezentant naszego �wi�tego ko�cio�a okazuje zainteresowanie moimi towarami.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Hakon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_407_Hakon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Hakon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Hakon_MissingPeople_Info;

	description	 = 	"Co wiesz o zaginionych mieszka�cach Khorinis?";
};

func int DIA_Addon_Hakon_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Hakon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //Co wiesz o zaginionych mieszka�cach Khorinis?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //Wielu z nich przechodzi przez wschodni� bram� miasta.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Cz�ci z tych, kt�rzy przychodz�, nie widzia�em nigdy w �yciu... A wielu takich, kt�rzy wychodz�, nigdy ju� nie wraca.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //Tylko... Ostatnio wydarzy�o si� co� niezwyk�ego.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //By� taki go��... Chyba Joe mia� na imi�. Gada� na lewo i na prawo, jaki to wkr�tce b�dzie bogaty.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //Twierdzi�, �e zna spos�b na dostanie si� do wie�, w kt�rych stra� przechowuje bro�.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //Od tej pory przesta� si� pojawia� - nie zobaczy�em go ju� nigdy, cho� wcze�niej widywa�em go codziennie o tej samej porze.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //Pomy�la�em, �e mo�e aresztowa�a go stra� i ich o to zapyta�em.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //Lord Andre nie mia� poj�cia, o co mi chodzi - nigdy nawet nie s�ysza� o tym go�ciu.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Hakon, kupiec z Khorinis, twierdzi, �e cz�owiek o imieniu Joe znikn�� bez �ladu. Podobno Joe wiedzia�, jak dosta� si� do wie� miejskich, w kt�rych przechowywana jest bro� stra�y."); 

	B_GivePlayerXP (XP_Ambient);
};

// ********************************************************
// 						OutOfTown
// ********************************************************
instance DIA_Hakon_OutOfTown		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_OutOfTown_Condition;
	information	 = 	DIA_Hakon_OutOfTown_Info;
	permanent	 = 	FALSE;
	description	 = 	"Opowiedz mi o terenach wok� miasta.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Opowiedz mi o terenach wok� miasta.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //Zrobi�o si� tam cholernie niebezpiecznie.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //Po pierwsze - z powodu bandyt�w, po drugie - z powodu dzikich bestii.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Nawet zwierz�ta g�oduj� w dzisiejszych czasach.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //Dlatego zapuszczaj� si� coraz bli�ej miasta.
};

// ********************************************************
// 						Paladine
// ********************************************************
instance DIA_Hakon_Paladine		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	3;
	condition	 = 	DIA_Hakon_Paladine_Condition;
	information	 = 	DIA_Hakon_Paladine_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co wiesz na temat paladyn�w?";
};
func int DIA_Hakon_Paladine_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Paladine_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_07"); //Co wiesz na temat paladyn�w?
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //Ci go�cie doprowadzaj� mnie do ruiny!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //W mie�cie mo�na kupi� co najwy�ej kr�tkie miecze.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //Wszystko, co jest d�u�sze ni� p� metra, zostaje przez nich skonfiskowane.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //A w zamian mog� sobie za darmo pomieszka� w gospodzie - ha!
};

// ********************************************************
// 						WoWaffen
// ********************************************************
instance DIA_Hakon_WoWaffen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_WoWaffen_Condition;
	information	 = 	DIA_Hakon_WoWaffen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Sk�d bierzesz bro�?";
};
func int DIA_Hakon_WoWaffen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Hakon_WoWaffen_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //Sk�d bierzesz bro�?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //Znik�d! Do tej pory moim dostawc� by� Harad.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Do tej pory kupowa�em bro� od kowala Harada.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Jednak teraz Harad produkuje miecze tylko i wy��cznie na u�ytek paladyn�w.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //Pracuje dla nich jak szalony dzie� i noc, i to za darmo. Uwa�a to za sw�j obowi�zek.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //Dlatego mog� ci zaoferowa� jedynie resztki moich towar�w...
};

// ********************************************************
// 						HaradBandits
// ********************************************************
instance DIA_Hakon_HaradBandits		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_HaradBandits_Condition;
	information	 = 	DIA_Hakon_HaradBandits_Info;
	permanent	 = 	FALSE;
	description	 = 	"Harad powiedzia� mi o ataku bandyt�w...";
};
func int DIA_Hakon_HaradBandits_Condition ()
{
	if (Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_HaradBandits_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Harad powiedzia� mi o ataku bandyt�w...
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //Doprawdy?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //Obieca� udzieli� mi poparcia, je�li zrobi� z nimi porz�dek.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //Poczciwy stary Harad. Pewnie w ten spos�b daje do zrozumienia, jak mu przykro, �e nie mo�e mi sprzeda� �adnej broni.
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Banditen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Banditen_Condition;
	information	 = 	DIA_Hakon_Banditen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co wiesz na temat bandyt�w?";
};
func int DIA_Hakon_Banditen_Condition ()
{
	if (Npc_KnowsInfo (hero, DIA_Hakon_HaradBandits))
	|| (Npc_KnowsInfo (hero, DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};
func void DIA_Hakon_Banditen_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_15_00"); //Co wiesz na temat bandyt�w?
	AI_Output (self, other, "DIA_Hakon_Banditen_12_01"); //Co wiem na temat bandyt�w? Obrabowali mnie w drodze do miasta!
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //I nie tylko mnie. Kr��� po okolicy ju� od jakiego� czasu.
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //Stra� pr�bowa�a ich znale��, ale nic z tego.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Handlarz broni�, Hakon, zosta� obrabowany poza murami miasta przez bandyt�w." );
};


///////////////////////////////////////////////////////////////////////
//	WIEVIEL
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wieviel		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Wieviel_Condition;
	information	 = 	DIA_Hakon_Wieviel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Zajm� si� tym...";
};
func int DIA_Hakon_Wieviel_Condition ()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wieviel_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //Zajm� si� tym...
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //Co, TY si� nimi zajmiesz? Zupe�nie sam? Chyba musisz by� niez�ym wojownikiem, co?
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //Ile mi za to zap�acisz?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //Chcesz si� wkupi� w �aski Harada, co?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //Nie s�dz�, abym musia� ci za to p�aci�...
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //To niebezpieczne zadanie.
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //No dobrze. Je�li pokonasz bandyt�w, dostaniesz ode mnie 100 sztuk z�ota.
		MIS_HakonBanditsPay = TRUE;
	};
	
	Info_ClearChoices (DIA_Hakon_Banditen);
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Miliz		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_Miliz_Condition;
	information	 = 	DIA_Hakon_Miliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"Czy wiesz, kto ze stra�y bra� udzia� w poszukiwaniach?";
};

func int DIA_Hakon_Miliz_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Miliz_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //Czy wiesz, kto ze stra�y bra� udzia� w poszukiwaniach?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //Nazywa si� Pablo. On i jeszcze par� os�b pr�bowali odnale�� kryj�wk� bandyt�w. Na pr�no.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //Czy wiesz, gdzie przebywa Pablo?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //Patroluje miasto. Znajdziesz go albo na placu �wi�tynnym, albo w dolnej cz�ci miasta.
	
	B_LogEntry(TOPIC_HakonBanditen,"Pablo, cz�onek stra�y miejskiej, bra� udzia� w bezowocnych poszukiwaniach bandyt�w." );
};
///////////////////////////////////////////////////////////////////////
//	Info Wo
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_Wo_Condition;
	information	 = 	DIA_Hakon_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Gdzie ci� napadli?";
};

func int DIA_Hakon_Wo_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wo_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //Gdzie ci� napadli?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //W pobli�u farmy Akila. Id� do bramy miasta i udaj si� drog� w prawo.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //Po jakim� czasie dojdziesz do schod�w. To stamt�d nadeszli ci dranie. Za�o�� si�, �e maj� kryj�wk� w lesie.
};
///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Success		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Success_Condition;
	information	 = 	DIA_Hakon_Success_Info;
	permanent	 = 	FALSE;
	description	 = 	"Zaj��em si� bandytami.";
};

func int DIA_Hakon_Success_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	&& (Npc_IsDead (Bandit_1))
	&& (Npc_IsDead (Bandit_2))
	&& (Npc_IsDead (Bandit_3))
	
	{
		return TRUE;
	};
};
func void DIA_Hakon_Success_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //Zaj��em si� bandytami.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //Doprawdy? Ka�dy mo�e tak powiedzie�. Masz na to jaki� dow�d?
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //Czy mam tam wr�ci� i obci�� im g�owy?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //Nie - to chyba nie b�dzie konieczne. Wierz� ci.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //Odda�e� miastu i kupcom ogromn� przys�ug�.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //S�dz�, �e Harada ucieszy ta wiadomo��.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //Oto obiecane pieni�dze.
		B_GiveInvItems (self, other, ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Hakon_Bandits); 
	
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Hakon_Minenanteil (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 3;
	condition	= DIA_Hakon_Minenanteil_Condition;
	information	= DIA_Hakon_Minenanteil_Info;
	permanent	= FALSE;
	description = "Sprzedajesz udzia�y w kopalni? Sk�d je wzi��e�?";
};   
                    
FUNC INT DIA_Hakon_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hakon_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //Sprzedajesz udzia�y w kopalni? Sk�d je wzi��e�?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Przykro mi, nie mog� ci powiedzie�. Mog�oby si� to dla mnie �le sko�czy�.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hakon_PICKPOCKET (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 900;
	condition	= DIA_Hakon_PICKPOCKET_Condition;
	information	= DIA_Hakon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Hakon_PICKPOCKET_Condition()
{
	C_Beklauen (45, 65);
};
 
FUNC VOID DIA_Hakon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hakon_PICKPOCKET);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_BACK 		,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};
	
func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};


// ************************************************************
// 			  				Kapitel2
// ************************************************************

INSTANCE DIA_Hakon_Kapitel2 (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 5;
	condition	= DIA_Hakon_Kapitel2_Condition;
	information	= DIA_Hakon_Kapitel2_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Hakon_Kapitel2_Condition()
{
	if (Kapitel >= 2)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hakon_Kapitel2_Info()
{	
	AI_Output (self ,other,"DIA_Hakon_Add_12_22"); //To znowu ty!
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad wreszcie sko�czy� produkowa� bro� dla paladyn�w.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //W zwi�zku z tym m�j wyb�r towar�w znacznie si� powi�kszy�. Zainteresowany?
};
