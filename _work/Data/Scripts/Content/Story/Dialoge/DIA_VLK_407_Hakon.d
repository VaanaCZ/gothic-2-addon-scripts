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
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //Uciekaj st¹d, skazañcu! Canthar powiedzia³ mi, jaki z ciebie drañ!
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
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //Jestem Hakon, handlarz broni¹.
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //W dzisiejszych czasach ka¿dy powinien nosiæ broñ. Szczególnie poza miastem.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon sprzedaje broñ na targowisku.");
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
	description	 = 	"Poka¿ mi swoje towary.";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Poka¿ mi swoje towary.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //To dla mnie zaszczyt, ¿e reprezentant naszego œwiêtego koœcio³a okazuje zainteresowanie moimi towarami.
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

	description	 = 	"Co wiesz o zaginionych mieszkañcach Khorinis?";
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
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //Co wiesz o zaginionych mieszkañcach Khorinis?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //Wielu z nich przechodzi przez wschodni¹ bramê miasta.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Czêœci z tych, którzy przychodz¹, nie widzia³em nigdy w ¿yciu... A wielu takich, którzy wychodz¹, nigdy ju¿ nie wraca.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //Tylko... Ostatnio wydarzy³o siê coœ niezwyk³ego.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //By³ taki goœæ... Chyba Joe mia³ na imiê. Gada³ na lewo i na prawo, jaki to wkrótce bêdzie bogaty.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //Twierdzi³, ¿e zna sposób na dostanie siê do wie¿, w których stra¿ przechowuje broñ.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //Od tej pory przesta³ siê pojawiaæ - nie zobaczy³em go ju¿ nigdy, choæ wczeœniej widywa³em go codziennie o tej samej porze.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //Pomyœla³em, ¿e mo¿e aresztowa³a go stra¿ i ich o to zapyta³em.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //Lord Andre nie mia³ pojêcia, o co mi chodzi - nigdy nawet nie s³ysza³ o tym goœciu.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Hakon, kupiec z Khorinis, twierdzi, ¿e cz³owiek o imieniu Joe znikn¹³ bez œladu. Podobno Joe wiedzia³, jak dostaæ siê do wie¿ miejskich, w których przechowywana jest broñ stra¿y."); 

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
	description	 = 	"Opowiedz mi o terenach wokó³ miasta.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Opowiedz mi o terenach wokó³ miasta.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //Zrobi³o siê tam cholernie niebezpiecznie.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //Po pierwsze - z powodu bandytów, po drugie - z powodu dzikich bestii.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Nawet zwierzêta g³oduj¹ w dzisiejszych czasach.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //Dlatego zapuszczaj¹ siê coraz bli¿ej miasta.
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
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //Ci goœcie doprowadzaj¹ mnie do ruiny!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //W mieœcie mo¿na kupiæ co najwy¿ej krótkie miecze.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //Wszystko, co jest d³u¿sze ni¿ pó³ metra, zostaje przez nich skonfiskowane.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //A w zamian mogê sobie za darmo pomieszkaæ w gospodzie - ha!
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
	description	 = 	"Sk¹d bierzesz broñ?";
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
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //Sk¹d bierzesz broñ?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //Znik¹d! Do tej pory moim dostawc¹ by³ Harad.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Do tej pory kupowa³em broñ od kowala Harada.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Jednak teraz Harad produkuje miecze tylko i wy³¹cznie na u¿ytek paladynów.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //Pracuje dla nich jak szalony dzieñ i noc, i to za darmo. Uwa¿a to za swój obowi¹zek.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //Dlatego mogê ci zaoferowaæ jedynie resztki moich towarów...
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
	description	 = 	"Harad powiedzia³ mi o ataku bandytów...";
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
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Harad powiedzia³ mi o ataku bandytów...
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //Doprawdy?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //Obieca³ udzieliæ mi poparcia, jeœli zrobiê z nimi porz¹dek.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //Poczciwy stary Harad. Pewnie w ten sposób daje do zrozumienia, jak mu przykro, ¿e nie mo¿e mi sprzedaæ ¿adnej broni.
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
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //I nie tylko mnie. Kr¹¿¹ po okolicy ju¿ od jakiegoœ czasu.
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //Stra¿ próbowa³a ich znaleŸæ, ale nic z tego.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Handlarz broni¹, Hakon, zosta³ obrabowany poza murami miasta przez bandytów." );
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
	description	 = 	"Zajmê siê tym...";
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
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //Zajmê siê tym...
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //Co, TY siê nimi zajmiesz? Zupe³nie sam? Chyba musisz byæ niez³ym wojownikiem, co?
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //Ile mi za to zap³acisz?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //Chcesz siê wkupiæ w ³aski Harada, co?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //Nie s¹dzê, abym musia³ ci za to p³aciæ...
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //To niebezpieczne zadanie.
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //No dobrze. Jeœli pokonasz bandytów, dostaniesz ode mnie 100 sztuk z³ota.
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
	description	 = 	"Czy wiesz, kto ze stra¿y bra³ udzia³ w poszukiwaniach?";
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
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //Czy wiesz, kto ze stra¿y bra³ udzia³ w poszukiwaniach?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //Nazywa siê Pablo. On i jeszcze parê osób próbowali odnaleŸæ kryjówkê bandytów. Na pró¿no.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //Czy wiesz, gdzie przebywa Pablo?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //Patroluje miasto. Znajdziesz go albo na placu œwi¹tynnym, albo w dolnej czêœci miasta.
	
	B_LogEntry(TOPIC_HakonBanditen,"Pablo, cz³onek stra¿y miejskiej, bra³ udzia³ w bezowocnych poszukiwaniach bandytów." );
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
	description	 = 	"Gdzie ciê napadli?";
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
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //Gdzie ciê napadli?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //W pobli¿u farmy Akila. IdŸ do bramy miasta i udaj siê drog¹ w prawo.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //Po jakimœ czasie dojdziesz do schodów. To stamt¹d nadeszli ci dranie. Za³o¿ê siê, ¿e maj¹ kryjówkê w lesie.
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
	description	 = 	"Zaj¹³em siê bandytami.";
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
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //Zaj¹³em siê bandytami.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //Doprawdy? Ka¿dy mo¿e tak powiedzieæ. Masz na to jakiœ dowód?
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //Czy mam tam wróciæ i obci¹æ im g³owy?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //Nie - to chyba nie bêdzie konieczne. Wierzê ci.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //Odda³eœ miastu i kupcom ogromn¹ przys³ugê.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //S¹dzê, ¿e Harada ucieszy ta wiadomoœæ.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //Oto obiecane pieni¹dze.
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
	description = "Sprzedajesz udzia³y w kopalni? Sk¹d je wzi¹³eœ?";
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
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //Sprzedajesz udzia³y w kopalni? Sk¹d je wzi¹³eœ?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Przykro mi, nie mogê ci powiedzieæ. Mog³oby siê to dla mnie Ÿle skoñczyæ.
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
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad wreszcie skoñczy³ produkowaæ broñ dla paladynów.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //W zwi¹zku z tym mój wybór towarów znacznie siê powiêkszy³. Zainteresowany?
};
