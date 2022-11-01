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
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //Uciekaj stąd, skazańcu! Canthar powiedział mi, jaki z ciebie drań!
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
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //Jestem Hakon, handlarz bronią.
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //W dzisiejszych czasach każdy powinien nosić broń. Szczególnie poza miastem.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon sprzedaje broń na targowisku.");
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
	description	 = 	"Pokaż mi swoje towary.";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Pokaż mi swoje towary.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //To dla mnie zaszczyt, że reprezentant naszego świętego kościoła okazuje zainteresowanie moimi towarami.
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

	description	 = 	"Co wiesz o zaginionych mieszkańcach Khorinis?";
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
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //Co wiesz o zaginionych mieszkańcach Khorinis?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //Wielu z nich przechodzi przez wschodnią bramę miasta.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Części z tych, którzy przychodzą, nie widziałem nigdy w życiu... A wielu takich, którzy wychodzą, nigdy już nie wraca.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //Tylko... Ostatnio wydarzyło się coś niezwykłego.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //Był taki gość... Chyba Joe miał na imię. Gadał na lewo i na prawo, jaki to wkrótce będzie bogaty.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //Twierdził, że zna sposób na dostanie się do wież, w których straż przechowuje broń.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //Od tej pory przestał się pojawiać - nie zobaczyłem go już nigdy, choć wcześniej widywałem go codziennie o tej samej porze.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //Pomyślałem, że może aresztowała go straż i ich o to zapytałem.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //Lord Andre nie miał pojęcia, o co mi chodzi - nigdy nawet nie słyszał o tym gościu.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Hakon, kupiec z Khorinis, twierdzi, że człowiek o imieniu Joe zniknął bez śladu. Podobno Joe wiedział, jak dostać się do wież miejskich, w których przechowywana jest broń straży."); 

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
	description	 = 	"Opowiedz mi o terenach wokół miasta.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Opowiedz mi o terenach wokół miasta.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //Zrobiło się tam cholernie niebezpiecznie.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //Po pierwsze - z powodu bandytów, po drugie - z powodu dzikich bestii.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Nawet zwierzęta głodują w dzisiejszych czasach.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //Dlatego zapuszczają się coraz bliżej miasta.
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
	description	 = 	"Co wiesz na temat paladynów?";
};
func int DIA_Hakon_Paladine_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Paladine_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_07"); //Co wiesz na temat paladynów?
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //Ci goście doprowadzają mnie do ruiny!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //W mieście można kupić co najwyżej krótkie miecze.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //Wszystko, co jest dłuższe niż pół metra, zostaje przez nich skonfiskowane.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //A w zamian mogę sobie za darmo pomieszkać w gospodzie - ha!
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
	description	 = 	"Skąd bierzesz broń?";
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
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //Skąd bierzesz broń?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //Znikąd! Do tej pory moim dostawcą był Harad.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Do tej pory kupowałem broń od kowala Harada.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Jednak teraz Harad produkuje miecze tylko i wyłącznie na użytek paladynów.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //Pracuje dla nich jak szalony dzień i noc, i to za darmo. Uważa to za swój obowiązek.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //Dlatego mogę ci zaoferować jedynie resztki moich towarów...
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
	description	 = 	"Harad powiedział mi o ataku bandytów...";
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
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Harad powiedział mi o ataku bandytów...
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //Doprawdy?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //Obiecał udzielić mi poparcia, jeśli zrobię z nimi porządek.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //Poczciwy stary Harad. Pewnie w ten sposób daje do zrozumienia, jak mu przykro, że nie może mi sprzedać żadnej broni.
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
	description	 = 	"Co wiesz na temat bandytów?";
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
	AI_Output (other, self, "DIA_Hakon_Banditen_15_00"); //Co wiesz na temat bandytów?
	AI_Output (self, other, "DIA_Hakon_Banditen_12_01"); //Co wiem na temat bandytów? Obrabowali mnie w drodze do miasta!
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //I nie tylko mnie. Krążą po okolicy już od jakiegoś czasu.
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //Straż próbowała ich znaleźć, ale nic z tego.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Handlarz bronią, Hakon, został obrabowany poza murami miasta przez bandytów." );
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
	description	 = 	"Zajmę się tym...";
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
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //Zajmę się tym...
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //Co, TY się nimi zajmiesz? Zupełnie sam? Chyba musisz być niezłym wojownikiem, co?
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //Ile mi za to zapłacisz?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //Chcesz się wkupić w łaski Harada, co?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //Nie sądzę, abym musiał ci za to płacić...
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //To niebezpieczne zadanie.
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //No dobrze. Jeśli pokonasz bandytów, dostaniesz ode mnie 100 sztuk złota.
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
	description	 = 	"Czy wiesz, kto ze straży brał udział w poszukiwaniach?";
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
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //Czy wiesz, kto ze straży brał udział w poszukiwaniach?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //Nazywa się Pablo. On i jeszcze parę osób próbowali odnaleźć kryjówkę bandytów. Na próżno.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //Czy wiesz, gdzie przebywa Pablo?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //Patroluje miasto. Znajdziesz go albo na placu świątynnym, albo w dolnej części miasta.
	
	B_LogEntry(TOPIC_HakonBanditen,"Pablo, członek straży miejskiej, brał udział w bezowocnych poszukiwaniach bandytów." );
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
	description	 = 	"Gdzie cię napadli?";
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
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //Gdzie cię napadli?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //W pobliżu farmy Akila. Idź do bramy miasta i udaj się drogą w prawo.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //Po jakimś czasie dojdziesz do schodów. To stamtąd nadeszli ci dranie. Założę się, że mają kryjówkę w lesie.
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
	description	 = 	"Zająłem się bandytami.";
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
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //Zająłem się bandytami.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //Doprawdy? Każdy może tak powiedzieć. Masz na to jakiś dowód?
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //Czy mam tam wrócić i obciąć im głowy?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //Nie - to chyba nie będzie konieczne. Wierzę ci.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //Oddałeś miastu i kupcom ogromną przysługę.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //Sądzę, że Harada ucieszy ta wiadomość.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //Oto obiecane pieniądze.
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
	description = "Sprzedajesz udziały w kopalni? Skąd je wziąłeś?";
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
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //Sprzedajesz udziały w kopalni? Skąd je wziąłeś?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Przykro mi, nie mogę ci powiedzieć. Mogłoby się to dla mnie źle skończyć.
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
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad wreszcie skończył produkować broń dla paladynów.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //W związku z tym mój wybór towarów znacznie się powiększył. Zainteresowany?
};
