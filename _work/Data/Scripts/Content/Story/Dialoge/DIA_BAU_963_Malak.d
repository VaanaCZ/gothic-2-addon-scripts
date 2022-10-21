///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Malak_EXIT   (C_INFO)
{
	npc         = BAU_963_Malak;
	nr          = 999;
	condition   = DIA_Malak_EXIT_Condition;
	information = DIA_Malak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Malak_EXIT_Condition()
{
		if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Malak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_HALLO		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	3;
	condition	 = 	DIA_Malak_HALLO_Condition;
	information	 = 	DIA_Malak_HALLO_Info;

	description	 = 	"Va tutto bene?";
};

func int DIA_Malak_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Malak_HALLO_15_00"); //Va tutto bene?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_01"); //Chi sei, un altro bracciante che ha smarrito la strada? Non c'è problema. Parla con il nostro fattore Bengar.
		}
	else
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_02"); //Certo.
		};

};


///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	4;
	condition	 = 	DIA_Malak_WASMACHSTDU_Condition;
	information	 = 	DIA_Malak_WASMACHSTDU_Info;

	description	 = 	"Cosa stai facendo, qui?";
};

func int DIA_Malak_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WASMACHSTDU_15_00"); //Cosa stai facendo, qui?
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_01"); //Sono il pastore. Non è esattamente un lavoro molto impegnativo.
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_02"); //Ma ogni tanto devi stare all'erta, specialmente se ti avvicini troppo al passo.

};


///////////////////////////////////////////////////////////////////////
//	Info pass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	5;
	condition	 = 	DIA_Malak_PASS_Condition;
	information	 = 	DIA_Malak_PASS_Info;

	description	 = 	"Cosa sai dirmi sul passaggio?";
};

func int DIA_Malak_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PASS_15_00"); //Cosa sai dirmi sul passo?
	AI_Output			(self, other, "DIA_Malak_PASS_08_01"); //Non molto. So solo che porta alla Valle delle Miniere, che fino a un paio di settimane fa era circondata dalla Barriera.
	AI_Output			(self, other, "DIA_Malak_PASS_08_02"); //A quei tempi, l'unica cosa di cui noi contadini dovevamo temere era la carovana che ogni mese portava ogni genere di merci nella Valle delle Miniere.
	AI_Output			(self, other, "DIA_Malak_PASS_08_03"); //Quei tagliagole spesso ci rendevano la vita difficile.

};

///////////////////////////////////////////////////////////////////////
//	Info wopass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WOPASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	6;
	condition	 = 	DIA_Malak_WOPASS_Condition;
	information	 = 	DIA_Malak_WOPASS_Info;

	description	 = 	"Dove si trova il passaggio per la vecchia Valle delle Miniere?";
};

func int DIA_Malak_WOPASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_HALLO))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WOPASS_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WOPASS_15_00"); //Dove si trova il passo della vecchia Valle delle Miniere?
	AI_Output			(self, other, "DIA_Malak_WOPASS_08_01"); //Vicino alle due cascate dall'altra parte dei pascoli dell'altopiano.

};



///////////////////////////////////////////////////////////////////////
//	Info minental
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_MINENTAL		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	7;
	condition	 = 	DIA_Malak_MINENTAL_Condition;
	information	 = 	DIA_Malak_MINENTAL_Info;

	description	 = 	"Che voci circolano sulla Valle delle Miniere?";
};

func int DIA_Malak_MINENTAL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_MINENTAL_Info ()
{

	AI_Output			(other, self, "DIA_Malak_MINENTAL_15_00"); //Che voci circolano sulla Valle delle Miniere?
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_01"); //Ogni genere di voce. Alcuni dei ragazzi dicono di aver sentito delle urla di notte, mentre altri hanno visto delle strane luci sulle montagne.
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_02"); //Ma, se vuoi saperlo, per me sono solo tutte favole da vecchie comare.

};


///////////////////////////////////////////////////////////////////////
//	Info warstduschonda
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WARSTDUSCHONDA		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	8;
	condition	 = 	DIA_Malak_WARSTDUSCHONDA_Condition;
	information	 = 	DIA_Malak_WARSTDUSCHONDA_Info;

	description	 = 	"Sei mai stato nella Valle delle Miniere?";
};

func int DIA_Malak_WARSTDUSCHONDA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WARSTDUSCHONDA_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WARSTDUSCHONDA_15_00"); //Sei mai stato nella Valle delle Miniere?
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_01"); //No. Ma ogni tanto mi avvicino al passo e vedo sempre quei due paladini di guardia.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_02"); //Sembra che siano lì per accertarsi che niente lasci la valle.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_03"); //Un tempo la Valle delle Miniere era una prigione naturale. Se venivi mandato lì, non potevi più uscirne.

};


///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PALADINE		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 9;
	condition	 = 	DIA_Malak_PALADINE_Condition;
	information	 = 	DIA_Malak_PALADINE_Info;

	description	 = 	"Parlami ancora dei paladini.";
};

func int DIA_Malak_PALADINE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Malak_WARSTDUSCHONDA))
		&& 	(Npc_KnowsInfo(other, DIA_Malak_MINENTAL))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Malak_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PALADINE_15_00"); //Parlami dei paladini. Da quanto tempo si trovano lì?
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_01"); //Una settimana o due, credo. Non so dirtelo con precisione.
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_02"); //Qualche tempo fa un intero plotone di paladini ha attraversato il passo. Da allora non li ho più visti.

};

///////////////////////////////////////////////////////////////////////
//	Info keineFrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_KEINEFRAUEN		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 10;
	condition	 = 	DIA_Malak_KEINEFRAUEN_Condition;
	information	 = 	DIA_Malak_KEINEFRAUEN_Info;

	description	 = 	"Non vedo proprio nessuna donna, qui.";
};

func int DIA_Malak_KEINEFRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_KEINEFRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Malak_KEINEFRAUEN_15_00"); //Non vedo nessuna donna qui.
	AI_Output			(self, other, "DIA_Malak_KEINEFRAUEN_08_01"); //Esatto. Questa è una fattoria per soli uomini e credo che funzioni abbastanza bene.

};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	11;
	condition	 = 	DIA_Malak_PERMKAP1_Condition;
	information	 = 	DIA_Malak_PERMKAP1_Info;
	permanent	 =  TRUE;	

	description	 = 	"Non lavorare troppo.";
};

func int DIA_Malak_PERMKAP1_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Malak_HALLO))
		&& (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Npc_KnowsInfo(other, DIA_Malak_MINENTAL))
		&& (Npc_KnowsInfo(other, DIA_Malak_WARSTDUSCHONDA))
		&& (Npc_KnowsInfo(other, DIA_Malak_PALADINE))
		&& (Npc_KnowsInfo(other, DIA_Malak_KEINEFRAUEN))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Malak_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PERMKAP1_15_00"); //Non lavorare troppo.
	AI_Output			(self, other, "DIA_Malak_PERMKAP1_08_01"); //Ci proverò.

	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Malak_KAP3_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP3_EXIT_Condition;
	information	= DIA_Malak_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info fleefromPass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_FLEEFROMPASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	30;
	condition	 = 	DIA_Malak_FLEEFROMPASS_Condition;
	information	 = 	DIA_Malak_FLEEFROMPASS_Info;

	description	 = 	"Cosa stai facendo, qui?";
};

func int DIA_Malak_FLEEFROMPASS_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Malak_FLEEFROMPASS_Info ()
{
	if 	(NpcObsessedByDMT_Malak == FALSE)
	&& (hero.guild == GIL_KDF)
	{
	B_NpcObsessedByDMT (self);
	}
	else
	{
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_00"); //Cosa stai facendo, qui?
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_01"); //Sono fuggito qui dalla fattoria di Bengar. Non volevo essere ucciso da tutte le creature fuoriuscite dal passo.
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_02"); //Non puoi nemmeno immaginare quali creature hanno attraversato il passo ultimamente.
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_03"); //Posso immaginarlo.
	B_LogEntry (TOPIC_BengarALLEIN,"Malak si è trincerato a sud poiché teme le creature arrivate sino ai pascoli dal passo."); 
	B_GivePlayerXP (XP_FoundMalakFLEEFROMPASS);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_Heilung		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	55;
	condition	 = 	DIA_Malak_Heilung_Condition;
	information	 = 	DIA_Malak_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ti serve aiuto.";
};

func int DIA_Malak_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Malak == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& (Kapitel >= 3)
	 {
				return TRUE;
	 };
};
var int DIA_Malak_Heilung_oneTime;
func void DIA_Malak_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Malak_Heilung_15_00"); //Ti serve aiuto.

	if (DIA_Malak_Heilung_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Malak_Heilung_08_01"); //(lamentandosi) Voglio solo tornarmene a casa. Tornerò da Bengar. Spero sia ancora vivo.

		B_NpcClearObsessionByDMT (self);
		Npc_ExchangeRoutine	(self,"Start");
		B_StartOtherRoutine   (BAU_962_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_964_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_965_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_966_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_967_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_968_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_969_Bauer,"Start"); 

	DIA_Malak_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Malak_Heilung_08_02"); //Lasciami in pace, mago. Posso farcela da solo.
		B_NpcClearObsessionByDMT (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info permcastle
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PERMCASTLE		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	31;
	condition	 = 	DIA_Malak_PERMCASTLE_Condition;
	information	 = 	DIA_Malak_PERMCASTLE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Com'è la vita da queste parti?";
};

func int DIA_Malak_PERMCASTLE_Condition ()
{
	if (Npc_GetDistToWP(self,"CASTLEMINE")<4000) 
	&& (MIS_GetMalakBack != LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Malak_FLEEFROMPASS))
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >=3)
		{
				return TRUE;
		};
};

func void DIA_Malak_PERMCASTLE_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PERMCASTLE_15_00"); //Com'è la vita da queste parti?
	AI_Output			(self, other, "DIA_Malak_PERMCASTLE_08_01"); //Qui ho a che fare solo con i briganti. È il male minore.
};

///////////////////////////////////////////////////////////////////////
//	Info BacktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_BACKTOBENGAR		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	31;
	condition	 = 	DIA_Malak_BACKTOBENGAR_Condition;
	information	 = 	DIA_Malak_BACKTOBENGAR_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bengar ha bisogno di te.";
};

func int DIA_Malak_BACKTOBENGAR_Condition ()
{
	if (MIS_GetMalakBack == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Malak_FLEEFROMPASS))
	&& ((Npc_IsDead(Bengar))==FALSE)
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_BACKTOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_00"); //Bengar ha bisogno di te. Vuole che tu torni alla sua fattoria.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_01"); //Fossi matto. Finché saremo lasciati in balia di noi stessi alla fattoria, non mi muoverò di un centimetro da qui!
	
	B_LogEntry (TOPIC_BengarALLEIN,"Malak non intende tornare alla fattoria di Bengar fino a quando questa sarà indifesa."); 

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_02"); //Ho assoldato un mercenario per tenere d'occhio la fattoria.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_03"); //Se le cose stanno così, allora è diverso. Ma aspetta un attimo: chi pagherà quel tizio?
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_04"); //Ci penserò io.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_05"); //(incuriosito) Mmmh. Non posso rifiutarmi, vero?
	
	Info_AddChoice	(DIA_Malak_BACKTOBENGAR, "No.", DIA_Malak_BACKTOBENGAR_los );
	};
};

func void DIA_Malak_BACKTOBENGAR_los ()
{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_los_15_00"); //No.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_los_08_01"); //Bene. Allora tornerò indietro. Spero che quel tizio sappia farsi valere.
	MIS_GetMalakBack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Malak_BACKTOBENGAR);
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine	 (self,"Start");
	B_StartOtherRoutine   (BAU_962_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_964_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_965_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_966_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_967_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_968_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_969_Bauer,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Back
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_BACK		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	32;
	condition	 = 	DIA_Malak_BACK_Condition;
	information	 = 	DIA_Malak_BACK_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ti fermerai alla fattoria di Bengar, adesso?";
};

func int DIA_Malak_BACK_Condition ()
{
	if (MIS_GetMalakBack == LOG_SUCCESS)
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_BACK_Info ()
{
	AI_Output			(other, self, "DIA_Malak_BACK_15_00"); //Resterai alla fattoria di Bengar, adesso?
	AI_Output			(self, other, "DIA_Malak_BACK_08_01"); //Certo. Devo cercare di vederci chiaro. In qualche modo ne usciremo.
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Malak_KAP4_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP4_EXIT_Condition;
	information	= DIA_Malak_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Malak_KAP5_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP5_EXIT_Condition;
	information	= DIA_Malak_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Malak_KAP6_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP6_EXIT_Condition;
	information	= DIA_Malak_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Malak_PICKPOCKET (C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 900;
	condition	= DIA_Malak_PICKPOCKET_Condition;
	information	= DIA_Malak_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Malak_PICKPOCKET_Condition()
{
	C_Beklauen (43, 40);
};
 
FUNC VOID DIA_Malak_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Malak_PICKPOCKET);
	Info_AddChoice		(DIA_Malak_PICKPOCKET, DIALOG_BACK 		,DIA_Malak_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Malak_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Malak_PICKPOCKET_DoIt);
};

func void DIA_Malak_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Malak_PICKPOCKET);
};
	
func void DIA_Malak_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Malak_PICKPOCKET);
};



























































