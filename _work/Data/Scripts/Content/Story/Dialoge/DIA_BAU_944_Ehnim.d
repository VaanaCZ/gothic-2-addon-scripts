///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ehnim_EXIT   (C_INFO)
{
	npc         = BAU_944_Ehnim;
	nr          = 999;
	condition   = DIA_Ehnim_EXIT_Condition;
	information = DIA_Ehnim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_HALLO		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	3;
	condition	 = 	DIA_Ehnim_HALLO_Condition;
	information	 = 	DIA_Ehnim_HALLO_Info;

	description	 = 	"Wer bist du?";
};

func int DIA_Ehnim_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_HALLO_15_00"); //Wer bist du?
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_01"); //Mein Name ist Ehnim. Ich bin einer der Feldarbeiter.

	if	(
		(Hlp_IsValidNpc (Egill))
		&& (!C_NpcIsDown (Egill))
		)
			{
				AI_Output			(self, other, "DIA_Ehnim_HALLO_12_02"); //Und die halbe Portion da drüben ist mein Bruder Egill.
			};
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_03"); //Wir arbeiten schon seit einigen Jahren für Akil hier auf dem Hof.

};


///////////////////////////////////////////////////////////////////////
//	Info Feldarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDARBEIT		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	4;
	condition	 = 	DIA_Ehnim_FELDARBEIT_Condition;
	information	 = 	DIA_Ehnim_FELDARBEIT_Info;

	description	 = 	"Wie läuft die Feldarbeit?";
};

func int DIA_Ehnim_FELDARBEIT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Ehnim_FELDARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_FELDARBEIT_15_00"); //Wie läuft die Feldarbeit?
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_01"); //Willst du mithelfen? Da hinten steht noch eine Hake. Schnapp sie dir und dann ab aufs Feld.
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_02"); //Du musst nur aufpassen, dass die Feldräuber dich nicht überraschen. Die reißen dir mit einem Bissen glatt den Arm ab.

};

///////////////////////////////////////////////////////////////////////
//	Info feldraeuber
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDRAEUBER		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	5;
	condition	 = 	DIA_Ehnim_FELDRAEUBER_Condition;
	information	 = 	DIA_Ehnim_FELDRAEUBER_Info;

	description	 = 	"Warum unternimmst du nichts gegen die Feldräuber?";
};

func int DIA_Ehnim_FELDRAEUBER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_FELDARBEIT))
		{
				return TRUE;
		};
};

func void DIA_Ehnim_FELDRAEUBER_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_FELDRAEUBER_15_00"); //Warum unternimmst du nichts gegen die Feldräuber?
	AI_Output			(self, other, "DIA_Ehnim_FELDRAEUBER_12_01"); //Ich hab schon viele von ihnen erschlagen, ich kann sie gar nicht mehr zählen. Das Dumme ist nur, sie kommen immer wieder.

};

///////////////////////////////////////////////////////////////////////
//	Info Streit1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT1		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	6;
	condition	 = 	DIA_Ehnim_STREIT1_Condition;
	information	 = 	DIA_Ehnim_STREIT1_Info;

	description	 = 	"Dein Bruder hat das Gleiche erzählt.";
};

func int DIA_Ehnim_STREIT1_Condition ()
{
	if 	(
			(
			(Npc_KnowsInfo(other, DIA_Egill_FELDRAEUBER))
			&& (Npc_KnowsInfo(other, DIA_Ehnim_FELDRAEUBER))
			&& ((Npc_KnowsInfo(other, DIA_Egill_STREIT2))== FALSE)
			)
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		)
				{
					return TRUE;
				};
			
};

func void DIA_Ehnim_STREIT1_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT1_15_00"); //Dein Bruder hat das Gleiche erzählt.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_01"); //Was denn? Der Drückeberger? Der ist doch immer gleich verschwunden, wenn die Biester auf unser Land kommen.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_02"); //Er sollte besser nicht so einen Unsinn erzählen.
};

///////////////////////////////////////////////////////////////////////
//	Info Streit3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT3		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	7;
	condition	 = 	DIA_Ehnim_STREIT3_Condition;
	information	 = 	DIA_Ehnim_STREIT3_Info;

	description	 = 	"Dein Bruder hält dich für einen Aufschneider.";
};

func int DIA_Ehnim_STREIT3_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Egill_STREIT2))
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		)	
			{
					return TRUE;
			};
};

func void DIA_Ehnim_STREIT3_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT3_15_00"); //Dein Bruder hält dich für einen Aufschneider.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_01"); //Was? Er wagt es tatsächlich, so was zu sagen?
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_02"); //Er soll bloß aufpassen, dass ich ihm nicht das Fell über die Ohren zieh.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_03"); //Geh hin und sagt ihm das.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Streit5
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT5		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	8;
	condition	 = 	DIA_Ehnim_STREIT5_Condition;
	information	 = 	DIA_Ehnim_STREIT5_Info;
	permanent	 =  TRUE;

	description	 = 	"Ich finde, ihr beide solltet euch wieder entspannen.";
};

var int DIA_Ehnim_STREIT5_noPerm;

func int DIA_Ehnim_STREIT5_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Egill_STREIT4))
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		&& (DIA_Ehnim_STREIT5_noPerm == FALSE)
		)	
				{
						return TRUE;
				};
};

func void DIA_Ehnim_STREIT5_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_15_00"); //Ich finde, ihr beide solltet euch wieder entspannen.
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_01"); //Der Dreckskerl gibt nicht nach, hab ich recht?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_02"); //Ich werde ihm die Gedärme rausreißen. Sag ihm das.

	Info_ClearChoices	(DIA_Ehnim_STREIT5);

	Info_AddChoice	(DIA_Ehnim_STREIT5, "Macht doch, was ihr wollt. Ich gehe. ", DIA_Ehnim_STREIT5_gehen );
	Info_AddChoice	(DIA_Ehnim_STREIT5, "Sag es ihm doch selbst.", DIA_Ehnim_STREIT5_Attack );


};
func void DIA_Ehnim_STREIT5_Attack ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_Attack_15_00"); //Sag es ihm doch selbst.
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_Attack_12_01"); //Das werde ich auch.

	AI_StopProcessInfos (self);

	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Egill, AR_NONE, 0);
	
	B_GivePlayerXP (XP_EgillEhnimStreit);
	
};

func void DIA_Ehnim_STREIT5_gehen ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_gehen_15_00"); //Macht doch, was ihr wollt. Ich gehe.
	AI_Output			(self ,other, "DIA_Ehnim_STREIT5_gehen_12_01"); //Ja, verdrück dich ruhig.
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_PERMKAP1_Condition;
	information	 = 	DIA_Ehnim_PERMKAP1_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Ehnim_PERMKAP1_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Npc_IsInState (self,ZS_Talk))
		&& ((Kapitel < 3) || (hero.guild == GIL_KDF))
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_PERMKAP1_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP1_12_00"); //Willst du noch mehr Ärger anzetteln? Ich glaube, es ist besser, wenn du jetzt gehst.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MoleRatFett
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_MoleRatFett		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_MoleRatFett_Condition;
	information	 = 	DIA_Ehnim_MoleRatFett_Info;
	important	 = 	TRUE;
};

func int DIA_Ehnim_MoleRatFett_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Kapitel >= 3)
		&& (hero.guild != GIL_KDF)
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_MoleRatFett_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_00"); //Du bist ja immer noch da.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_01"); //Offensichtlich. Immer noch sauer?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_02"); //Ach was, Schwamm drüber. Sag mal, warst du in letzter Zeit mal auf Lobarts Hof?
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_03"); //Kann sein. Warum?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_04"); //Ach, nichts Wichtiges. Ich wollte nur mal wieder mit Vino über seine Brennerei sprechen.
	
	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Ich hab jetzt keine Zeit.", DIA_Ehnim_MoleRatFett_nein );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Was für eine Brennerei?", DIA_Ehnim_MoleRatFett_was );

	if (Npc_IsDead(Vino))
	{
		Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Vino ist tot.", DIA_Ehnim_MoleRatFett_tot );
	};

};
func void DIA_Ehnim_MoleRatFett_tot ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_tot_15_00"); //Vino ist tot.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_tot_12_01"); //Oh je. Nun ja. Dann hat sich das wohl erledigt.

};

func void DIA_Ehnim_MoleRatFett_was ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_15_00"); //Was für eine Brennerei?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_01"); //Ach. Das hätte ich jetzt besser nicht sagen sollen. Vino war immer sehr eigen mit seinem kleinen Geheimnis.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_02"); //Egal, jetzt ist es mir eh rausgerutscht. In dem Wald dahinten hat Vino eine geheime Schnapsbrennerei eingerichtet.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_03"); //Vor einiger Zeit bat er mich, ihm ein Schmiermittel für seine mechanische Gittertür zu besorgen.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_04"); //In der letzten Zeit hat es viel geregnet und da ist ihm das Ding zugerostet. Die Winde klemmt jetzt und man kommt nicht mehr hinein. So ein Schlammassel.

	Log_CreateTopic (TOPIC_FoundVinosKellerei, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei, LOG_RUNNING);
	B_LogEntry (TOPIC_FoundVinosKellerei,"Ehnim verriet mir, dass Vino im nahegelegenen Wald bei Akils Hof eine geheime Schnapsbrennerei hat. Der Tormechanismus, um hinein zu kommen, sei jedoch verklemmt und nur noch mit Moleratfett zu bewegen."); 
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Und? Hast du das Schmiermittel?", DIA_Ehnim_MoleRatFett_was_Fett );
};
func void DIA_Ehnim_MoleRatFett_was_Fett ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_15_00"); //Und? Hast du das Schmiermittel?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_12_01"); //Ja, klar. Das beste, was es gibt. Moleratfett. Ein Teufelszeug, sag ich dir. Es wird sogar zum Schmieren von Bordkanonen verwendet.
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Verkauf´ mir das Fett.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill );

};
var int Ehnim_MoleRatFettOffer;
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00"); //Verkauf mir das Fett.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01"); //Das wird aber nicht billig, Kollege. Es ist verdammt selten in diesem Teil des Landes.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02"); //Wie viel?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03"); //Mmh. 100 Goldmünzen?
	Ehnim_MoleRatFettOffer = 100;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Das ist zuviel.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Abgemacht.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00"); //Abgemacht.

	if (B_GiveInvItems (other, self, ItMi_Gold,Ehnim_MoleRatFettOffer))
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01"); //Alles klar. Hier hast du es.
			
			if (Npc_HasItems (self,ItMi_Moleratlubric_MIS))
			{
				B_GiveInvItems (self, other, ItMi_Moleratlubric_MIS, 1);
				
				if (Npc_IsDead(Vino) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02"); //(zu sich) Oh je. Vino wird mich umbringen.
					};					
			}
			else
			{
				AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03"); //Verdammt, wo habe ich es denn? So ein Mist. Tja, tut mir Leid. Ich habe es offensichtlich nicht mehr. Hier hast du deine Kohle wieder.
				B_GiveInvItems (self, other, ItMi_Gold,Ehnim_MoleRatFettOffer);
				
				if (Npc_IsDead(Egill) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04"); //Das war doch sicher wieder mein Bruder, dieser Mistkerl.
						AI_StopProcessInfos (self);
						other.aivar[AIV_INVINCIBLE] = FALSE;
						B_Attack (self, Egill, AR_NONE, 0);
					};
			};
		}
	else
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05"); //Na, das habe ich gerne. Erst groß auf die Kacke hauen und dann hast du das Geld nicht mal. Hau bloß ab.
		};
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00"); //Das ist zu viel.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01"); //Ok, ok. Dann eben 70 Goldmünzen. Das ist aber mein letztes Angebot.
	Ehnim_MoleRatFettOffer = 70;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Das ist immer noch zuviel.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Abgemacht.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_immernoch_15_00"); //Das ist immer noch zu viel.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_immernoch_12_01"); //(verärgert) Dann eben nicht. Schönen Tag noch.
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_nein ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_nein_15_00"); //Ich hab jetzt keine Zeit.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_nein_12_01"); //Lass dich bloß nicht aufhalten, Mann.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP3		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_PERMKAP3_Condition;
	information	 = 	DIA_Ehnim_PERMKAP3_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Ehnim_PERMKAP3_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Ehnim_MoleRatFett))
		&& (Npc_IsInState (self,ZS_Talk))
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_PERMKAP3_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP3_12_00"); //Ich habe jetzt keine Zeit.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ehnim_PICKPOCKET (C_INFO)
{
	npc			= BAU_944_Ehnim;
	nr			= 900;
	condition	= DIA_Ehnim_PICKPOCKET_Condition;
	information	= DIA_Ehnim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ehnim_PICKPOCKET_Condition()
{
	C_Beklauen (76, 35);
};
 
FUNC VOID DIA_Ehnim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ehnim_PICKPOCKET);
	Info_AddChoice		(DIA_Ehnim_PICKPOCKET, DIALOG_BACK 		,DIA_Ehnim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ehnim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ehnim_PICKPOCKET_DoIt);
};

func void DIA_Ehnim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ehnim_PICKPOCKET);
};
	
func void DIA_Ehnim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ehnim_PICKPOCKET);
};
























