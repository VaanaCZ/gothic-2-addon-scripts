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

	description	 = 	"Alles klar?";
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
	AI_Output			(other, self, "DIA_Malak_HALLO_15_00"); //Alles klar?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_01"); //Noch ein Tagelöhner, der nicht weiß, wohin? Kein Problem. Rede mal mit unserem Bauern Bengar.
		}
	else
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_02"); //Sicher.
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

	description	 = 	"Was machst du hier?";
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
	AI_Output			(other, self, "DIA_Malak_WASMACHSTDU_15_00"); //Was machst du hier?
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_01"); //Ich bin unser Schafhirte. Es ist nicht gerade eine Arbeit, bei der ich mich kaputt mache.
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_02"); //Aber zuweilen muss man ganz schön aufpassen. Erst recht, wenn man dem Pass zu nahe kommt.

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

	description	 = 	"Was weißt du über den Pass?";
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
	AI_Output			(other, self, "DIA_Malak_PASS_15_00"); //Was weißt du über den Pass?
	AI_Output			(self, other, "DIA_Malak_PASS_08_01"); //Nicht viel. Nur, dass er zum alten Minental führt, das bis vor ein paar Wochen noch von der Barriere umschlossen war.
	AI_Output			(self, other, "DIA_Malak_PASS_08_02"); //Damals war die monatliche Karawane, die alle möglichen Güter ins Minental brachte, das Einzige, was wir Bauern zu fürchten hatten.
	AI_Output			(self, other, "DIA_Malak_PASS_08_03"); //Diese Halsabschneider haben uns hier draußen oftmals ganz schön zugesetzt.

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

	description	 = 	"Wo finde ich den Pass ins alte Minental?";
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
	AI_Output			(other, self, "DIA_Malak_WOPASS_15_00"); //Wo finde ich den Pass ins alte Minental?
	AI_Output			(self, other, "DIA_Malak_WOPASS_08_01"); //In der Nähe der beiden Wasserfälle auf der anderen Seite des Weidenplateaus.

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

	description	 = 	"Was erzählt man sich über das Minental?";
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

	AI_Output			(other, self, "DIA_Malak_MINENTAL_15_00"); //Was erzählt man sich über das Minental?
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_01"); //Alles Mögliche. Nachts wollen einige der Jungs Schreie von dort gehört haben, manche haben seltsame Lichter über den Bergen gesehen.
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_02"); //Aber wenn du mich fragst, sind das alles Ammenmärchen.

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

	description	 = 	"Warst du schon mal im Minental?";
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
	AI_Output			(other, self, "DIA_Malak_WARSTDUSCHONDA_15_00"); //Warst du schon mal im Minental?
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_01"); //Nein. Ich bin nur ab und zu in der Nähe des Passes. Ich sehe dann immer diese beiden Paladine da herumstehen und Wache halten.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_02"); //Es sieht so aus, als ob sie darauf aufpassen, dass nichts aus dem Tal mehr heraus kommt.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_03"); //Damals war das Minental ein natürliches Gefängnis. Bist du einmal reingegangen, kamst du nicht wieder raus.

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

	description	 = 	"Erzähl mir mehr über die Paladine.";
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
	AI_Output			(other, self, "DIA_Malak_PALADINE_15_00"); //Erzähl mir mehr über die Paladine. Seit wann stehen sie da?
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_01"); //Ich schätze mal ein bis zwei Wochen. Ganz genau weiß ich das nicht.
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_02"); //Vor einiger Zeit ist sogar ein ganzer Trupp von ihnen im Pass verschwunden. Seither habe ich sie nicht wieder gesehen.

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

	description	 = 	"Ich sehe hier gar keine Frauen.";
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
	AI_Output			(other, self, "DIA_Malak_KEINEFRAUEN_15_00"); //Ich sehe hier gar keine Frauen.
	AI_Output			(self, other, "DIA_Malak_KEINEFRAUEN_08_01"); //Das hast du richtig beobachtet. Das ist sozusagen ein Männerhof. Funktioniert ganz gut, denke ich.

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

	description	 = 	"Überarbeite dich nicht.";
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
	AI_Output			(other, self, "DIA_Malak_PERMKAP1_15_00"); //Überarbeite dich nicht.
	AI_Output			(self, other, "DIA_Malak_PERMKAP1_08_01"); //Ich werde mich bemühen.

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

	description	 = 	"Was machst du hier?";
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
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_00"); //Was machst du hier?
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_01"); //Ich bin von Bengars Hof hierher geflüchtet. Ich hatte keine Lust, mich von dem ganz Viehzeugs, das aus dem Pass kam, niedermachen zu lassen.
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_02"); //Du kannst dir gar nicht vorstellen, was da für Kreaturen in den letzten Tagen aus dem Pass herausgekommen sind.
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_03"); //Ich kann.
	B_LogEntry (TOPIC_BengarALLEIN,"Malak hat sich im Süden verschanzt, weil er Angst vor den Kreaturen hatte, die aus dem Pass aufs Weidenplateau kamen."); 
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

	description	 = 	"Du brauchst Hilfe.";
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
	AI_Output			(other, self, "DIA_Malak_Heilung_15_00"); //Du brauchst Hilfe.

	if (DIA_Malak_Heilung_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Malak_Heilung_08_01"); //(weinerlich) Ich will einfach nur nach Hause. Ich geh zurück zu Bengar. Ich hoffe, dass er noch lebt.

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
		AI_Output			(self, other, "DIA_Malak_Heilung_08_02"); //Lass mich in Ruhe, Magier. Ich komm schon klar.
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

	description	 = 	"Wie ist es hier?";
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
	AI_Output			(other, self, "DIA_Malak_PERMCASTLE_15_00"); //Wie ist es hier?
	AI_Output			(self, other, "DIA_Malak_PERMCASTLE_08_01"); //Ich muss mich hier nur mit Banditen herumärgern. Das ist das kleinere Übel.
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

	description	 = 	"Bengar braucht dich.";
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
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_00"); //Bengar braucht dich. Er will, dass du zu seinem Hof zurück kommst.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_01"); //Ich bin doch nicht wahnsinnig. Solange wir auf dem Hof schutzlos leben müssen, bewege ich mich hier keinen Meter weg!
	
	B_LogEntry (TOPIC_BengarALLEIN,"Malak wird nicht zu Bengar zurückkehren, solange Bengars Hof schutzlos ist."); 

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_02"); //Ich habe einen Söldner angeheuert. Er wird auf den Hof Acht geben.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_03"); //Das ist natürlich etwas anderes. Aber Moment mal. Wer bezahlt den Kerl denn?
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_04"); //Das ist mein Problem.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_05"); //(prüfend) Mmh. Keine Chance, nein zu sagen, was?
	
	Info_AddChoice	(DIA_Malak_BACKTOBENGAR, "Nein", DIA_Malak_BACKTOBENGAR_los );
	};
};

func void DIA_Malak_BACKTOBENGAR_los ()
{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_los_15_00"); //Nein.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_los_08_01"); //Gut. Dann gehe ich zurück. Hoffentlich taugt der Junge was.
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

	description	 = 	"Wirst du jetzt auf Bengars Hof bleiben?";
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
	AI_Output			(other, self, "DIA_Malak_BACK_15_00"); //Wirst du jetzt auf Bengars Hof bleiben?
	AI_Output			(self, other, "DIA_Malak_BACK_08_01"); //Sicher. Da muss ich jetzt durch. Wird schon schief gehen.
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



























































