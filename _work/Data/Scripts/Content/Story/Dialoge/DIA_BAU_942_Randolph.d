///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Randolph_EXIT   (C_INFO)
{
	npc         = BAU_942_Randolph;
	nr          = 999;
	condition   = DIA_Randolph_EXIT_Condition;
	information = DIA_Randolph_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Randolph_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Randolph_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchwereLuft
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_SchwereLuft		(C_INFO)
{
	npc			 = 	BAU_942_Randolph;
	nr			 = 	4;
	condition	 = 	DIA_Randolph_SchwereLuft_Condition;
	information	 = 	DIA_Randolph_SchwereLuft_Info;
	permanent  	 =  FALSE;
	description	 = 	"Alles Klar?";
};
func int DIA_Randolph_SchwereLuft_Condition ()
{	
	if  !(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};
func void DIA_Randolph_SchwereLuft_Info ()
{
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_00"); //Alles klar?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_01"); //Hmm ... sobald hier einer was Falsches sagt, geht der Tanz los ... also halt lieber die Füße still, sonst gibt's ein Gemetzel...
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_02"); //Kämpfst du mit?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_03"); //Ich werde nicht hier herum stehen, wenn der Tanz beginnt. Aber ich werd's auch nicht herauf beschwören.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akils Hof wird von Söldnern bedroht."); 
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_HALLO		(C_INFO)
{
	npc			 = 	BAU_942_Randolph;
	nr			 = 	4;
	condition	 = 	DIA_Randolph_HALLO_Condition;
	information	 = 	DIA_Randolph_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Alles in Ordnung?";
};

func int DIA_Randolph_HALLO_Condition ()
{	
	if  (Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};
func void DIA_Randolph_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Randolph_HALLO_15_00"); //Alles in Ordnung?
	
	if Npc_IsDead (Akil)
	&& Npc_IsDead (Kati)
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_01"); //Jetzt, da Kati und Akil in Innos' Reich eingekehrt sind, werde ich den Hof führen.
		
		Npc_ExchangeRoutine (self,"START");
		AI_ContinueRoutine  (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_02"); //Ja, mir geht's gut. Dieser Alvares ist in letzter Zeit immer dreister geworden. Gut, dass es jetzt vorbei ist.
	};
	AI_Output (self, other, "DIA_Randolph_HALLO_06_03"); //Jetzt bräuchte ich einen kräftigen Schluck in der Taverne.
};

///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Baltram		(C_INFO)
{
	npc			 = 	BAU_942_Randolph;
	nr			 = 	5;
	condition	 = 	DIA_Randolph_Baltram_Condition;
	information	 = 	DIA_Randolph_Baltram_Info;
	permanent  	 =  FALSE;
	description	 = 	"Baltram schickt mich...";
};

func int DIA_Randolph_Baltram_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&&  (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	&& 	Npc_IsDead (Akil)
	&& 	Npc_IsDead (Kati)
	&&  (Lieferung_Geholt == FALSE)
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Randolph_Baltram_Info ()
{
	AI_Output (other, self, "DIA_Randolph_Baltram_15_00"); //Baltram schickt mich. Ich soll seine Lieferung abholen.
	AI_Output (self, other, "DIA_Randolph_Baltram_06_01"); //Gut. Ich habe schon alles fertig gemacht. Hier ist das Paket.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Geschichte 
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Geschichte		(C_INFO)
{
	npc			 = 	BAU_942_Randolph;
	nr			 = 	5;
	condition	 = 	DIA_Randolph_Geschichte_Condition;
	information	 = 	DIA_Randolph_Geschichte_Info;
	permanent	 =  FALSE;
	description	 = 	"Du kommst nicht aus der Gegend, richtig? ";
};

func int DIA_Randolph_Geschichte_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Randolph_Geschichte_Info ()
{
	AI_Output (other, self, "DIA_Randolph_Geschichte_15_00"); //Du kommst nicht aus der Gegend, richtig?
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_01"); //Ich komme von den südlichen Inseln. Irgendwann hieß es, sie bräuchten Leute in Khorinis, wegen dem magischen Erz.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_02"); //Aber als ich ankam, war da diese riesige Barriere. Und da wollte ich nicht rein. Ich hab dann angefangen, im Hafen zu arbeiten.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_03"); //Nun, seitdem keine Schiffe mehr kommen, bin ich halt zu Akil gegangen. Na ja, ich hab schon schlechtere Jobs gemacht.
};
/*
	Du kommst nicht aus der Gegend, richtig? 
	Ich komme von den südlichen Inseln. Irgendwann hieß es, sie bräuchten Leute in Khorinis, wegen dem magischen Erz. 
	Aber als ich ankam war da diese riesige Barriere. Und da wollte ich nicht rein. Ich hab dann angefangen im Hafen zu arbeiten. 
	Und seitdem keine Schiffe mehr kommen, bin ich halt zu Akil gegangen. Naja, ich hab schon schlechtere Jobs gemacht.  
	
	
	Hey, ich kenne da noch jemanden, der dir ein paar Sachen besorgen kann. 
	Ein Freund, der mit mir zusammen aus dem Süden gekommen ist. 
	Aber ich brauche 10 Goldmünzen, um beim Wett - Trinken in der Taverne mitzumachen.  
	Also wenn du die Info willst, dann gib mir das Gold. 
	
//Wenn du die Taverne suchst dann geh einfach über die Brücke und folge dem Weg, dann kommst direkt daran vorbei.
*/
///////////////////////////////////////////////////////////////////////
//	Info Taverne
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_TAVERNE		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	5;
	condition	 = 	DIA_Randolph_TAVERNE_Condition;
	information	 = 	DIA_Randolph_TAVERNE_Info;

	description	 = 	"Du gehst in die Taverne?";
};

func int DIA_Randolph_TAVERNE_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&& (Kapitel < 4)
			{
					return TRUE;
			};
};

func void DIA_Randolph_TAVERNE_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_TAVERNE_15_00"); //Du gehst in die Taverne?
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_01"); //Das ist richtig. Jedoch in letzter Zeit nicht mehr.
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_02"); //Ich kann es mir nicht mehr leisten, dorthin zu gehen.
};

///////////////////////////////////////////////////////////////////////
//	Info WasistinTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WASISTINTAVERNE		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	6;
	condition	 = 	DIA_Randolph_WASISTINTAVERNE_Condition;
	information	 = 	DIA_Randolph_WASISTINTAVERNE_Info;

	description	 = 	"Was genau passiert dort in der Taverne?";
};

func int DIA_Randolph_WASISTINTAVERNE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Randolph_TAVERNE))
	&& (Kapitel < 4)
		{
				return TRUE;
		};
};

func void DIA_Randolph_WASISTINTAVERNE_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_WASISTINTAVERNE_15_00"); //Was genau passiert dort in der Taverne?
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_01"); //Es wird dort gewettet.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_02"); //Zwei Kontrahenten treten gegeneinander an und derjenige, der das meiste Bier verträgt, hat gewonnen.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_03"); //Am Ende habe ich nur noch verloren und nun muss ich erst wieder zu Geld kommen.
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"In der Taverne wird gewettet."); 

};

///////////////////////////////////////////////////////////////////////
//	Info GegenWen
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_GEGENWEN		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	7;
	condition	 = 	DIA_Randolph_GEGENWEN_Condition;
	information	 = 	DIA_Randolph_GEGENWEN_Info;

	description	 = 	"Gegen wen bist du angetreten?";
};

func int DIA_Randolph_GEGENWEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Randolph_WASISTINTAVERNE))
	&& (Kapitel < 4)
		{
				return TRUE;
		};
};

func void DIA_Randolph_GEGENWEN_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_GEGENWEN_15_00"); //Gegen wen bist du angetreten?
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_01"); //Gegen Rukhar, dem alten Mistkerl. Er hat mich bisher jedes Mal geschlagen.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_02"); //Doch werde ich irgendwie den Verdacht nicht los, dass mir dieses miese Schwein jedes Mal Wacholder ins Bier gekippt hat.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_03"); //Ich vermute, er hat den Wacholder in seiner verdammten Truhe versteckt, die immer bei ihm steht. Dieser Dreckskerl!
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_04"); //Jemand müsste ihm einfaches Wasser in die Truhe schmuggeln. Dann kann er von mir aus panschen, so viel er will.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_05"); //Wenn ich doch nur genug Geld hätte, um noch mal gegen ihn anzutreten.

	B_LogEntry (TOPIC_Wettsaufen,"Randolph erzählte mir von Rukhar und seinem Wettsaufen. Randolph hat nicht genug Geld um nochmal gegen Rukhar anzutreten."); 
	B_LogEntry (TOPIC_Wettsaufen,"Randolph hat den Verdacht, dass Rukhar beim Wettsaufen betrügt. Randolph würde die Flasche Wacholder in Rukhars Truhe am liebsten mit einer Flasche Wasser vertauschen."); 
};

///////////////////////////////////////////////////////////////////////
//	Info WasBrauchstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WASBRAUCHSTDU		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	8;
	condition	 = 	DIA_Randolph_WASBRAUCHSTDU_Condition;
	information	 = 	DIA_Randolph_WASBRAUCHSTDU_Info;

	description	 = 	"Wie viel Geld brauchst du für den Wettkampf?";
};

func int DIA_Randolph_WASBRAUCHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Randolph_GEGENWEN))
	&& (MIS_Rukhar_Wettkampf == LOG_RUNNING)
	&& (Kapitel < 4)
		{
				return TRUE;
		};
};

func void DIA_Randolph_WASBRAUCHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_WASBRAUCHSTDU_15_00"); //Wie viel Geld brauchst du für den Wettkampf?
	AI_Output			(self, other, "DIA_Randolph_WASBRAUCHSTDU_06_01"); //10 Goldmünzen.
};

///////////////////////////////////////////////////////////////////////
//	Info IchgebedirGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_ICHGEBEDIRGELD		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	9;
	condition	 = 	DIA_Randolph_ICHGEBEDIRGELD_Condition;
	information	 = 	DIA_Randolph_ICHGEBEDIRGELD_Info;
	permanent	 =  TRUE;

	description	 = 	"Ich gebe dir das Geld für den Wettkampf gegen Rukhar.";
};

var int DIA_Randolph_ICHGEBEDIRGELD_noPerm;

func int DIA_Randolph_ICHGEBEDIRGELD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Randolph_WASBRAUCHSTDU))
	&& (DIA_Randolph_ICHGEBEDIRGELD_noPerm == FALSE)
	&& (Kapitel < 4)
			{
					return TRUE;
			};
};

func void DIA_Randolph_ICHGEBEDIRGELD_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_ICHGEBEDIRGELD_15_00"); //Ich gebe dir das Geld für den Wettkampf gegen Rukhar.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_01"); //(begeistert) Wirklich? Besten Dank. Ich werde es dir bald zurückzahlen.
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_02"); //Wenn ich gewinne, lege ich sogar noch was drauf. Wir sehen uns.
		
			B_LogEntry (TOPIC_Wettsaufen,"Die Wette läuft. Das sollte ich weiter beobachten."); 
			B_GivePlayerXP (XP_Randolph_WettkampfStart);
		
			DIA_Randolph_ICHGEBEDIRGELD_noPerm = TRUE;
			
			B_NpcClearObsessionByDMT (self);
			
			MIS_Rukhar_Wettkampf_Day = Wld_GetDay(); 
			
			Npc_ExchangeRoutine	(self,"Wettkampf"); 
			B_StartOtherRoutine	(Orlan,"Wettkampf");
			B_StartOtherRoutine	(Rukhar,"Wettkampf");
		}
		else
		{
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_03"); //Ist schon gut. Du hast ja selber nicht genug.
		};
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WettkampfZuende
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WETTKAMPFZUENDE		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	10;
	condition	 = 	DIA_Randolph_WETTKAMPFZUENDE_Condition;
	information	 = 	DIA_Randolph_WETTKAMPFZUENDE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kopfschmerzen?";
};

func int DIA_Randolph_WETTKAMPFZUENDE_Condition ()
{
	if (MIS_Rukhar_Wettkampf == LOG_SUCCESS)
	&& (Kapitel < 4)
		{
				return TRUE;
		};
};
VAR int DIA_Randolph_WETTKAMPFZUENDE_OneTime;
func void DIA_Randolph_WETTKAMPFZUENDE_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_WETTKAMPFZUENDE_15_00"); //Kopfschmerzen?
	
	
	if (Rukhar_Won_Wettkampf == TRUE)
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_01"); //Ich glaube, den dicken Schädel werde ich nie wieder los. Ich trinke keinen Tropfen mehr, das schwöre ich.
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_02"); //Dein Geld ist weg. Tut mir Leid.
		}
	else
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_03"); //Nö. Mir geht's bestens.
		
			if (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_04"); //Dieses Mal hat es endlich geklappt. Ich danke dir noch Mal für dein Geld. Hier hast es zurück.
				CreateInvItems (self, ItMi_Gold, 20);									
				B_GiveInvItems (self, other, ItMi_Gold, 12);
				DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;					
			};
			
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_05"); //Rukhar steht nicht so schnell wieder auf, schätze ich.
		};

	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_PERM		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	30;
	condition	 = 	DIA_Randolph_PERM_Condition;
	information	 = 	DIA_Randolph_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Geht's dir gut?";
};

func int DIA_Randolph_PERM_Condition ()
{
	if (Kapitel >= 4)
	&& (NpcObsessedByDMT_Randolph == FALSE)
		{
				return TRUE;
		};
};

var int DIA_Randolph_PERM_GotMoney;

func void DIA_Randolph_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
		{
			B_NpcObsessedByDMT (self);
		}
	else
		{
			AI_Output			(other, self, "DIA_Randolph_PERM_15_00"); //Geht's dir gut?

			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			&& (MIS_HealRandolph != LOG_SUCCESS)
				{
					if (DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE)
					&& (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE)
					&& (DIA_Randolph_PERM_GotMoney == FALSE)
					{
						AI_Output			(other, self, "DIA_Randolph_PERM_15_01"); //Du schickst mich los ohne eine Münze und sagst mir nicht, dass das Mittel so teuer ist?
						AI_Output			(other, self, "DIA_Randolph_PERM_15_02"); //300 Goldmünzen will Sagitta von mir.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_03"); //Ich kann dir nur 150 Goldmünzen geben. Bitte. Du musst mir helfen. Bitte.
						CreateInvItems (self, ItMi_Gold, 150);									
						B_GiveInvItems (self, other, ItMi_Gold, 150);					
						DIA_Randolph_PERM_GotMoney = TRUE;
					}
					else
					{
						AI_Output			(self, other, "DIA_Randolph_PERM_06_04"); //Richtig dreckig. Seit ich nicht mehr trinke, bin ich total auf Entzug. Ich brauche unbedingt Hilfe.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_05"); //Es gibt da ein Mittel, das hilft.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_06"); //Sagitta, die alte Kräuterhexe, hat es mir immer gemacht. Aber bis da hin schaffe ich es wohl nicht mehr bei den ganzen Orks hier.
					};
					Log_CreateTopic (TOPIC_HealRandolph, LOG_MISSION);
					Log_SetTopicStatus(TOPIC_HealRandolph, LOG_RUNNING);
					B_LogEntry (TOPIC_HealRandolph,"Randolph hat angeblich mit dem Saufen aufgehört und schickt mich nun zu Sagitta der Kräuterhexe um ihm ein Mittel zu besorgen gegen seine Entzugserscheinungen."); 

					MIS_HealRandolph = LOG_RUNNING;
				}
			else
				{
					AI_Output			(self, other, "DIA_Randolph_PERM_06_07"); //Bin ein bisschen wackelig auf den Beinen, aber ansonsten geht's schon.
				};	
		};	
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Heilung		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	55;
	condition	 = 	DIA_Randolph_Heilung_Condition;
	information	 = 	DIA_Randolph_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Das Saufen ist dir zu Kopf gestiegen, was?";
};

func int DIA_Randolph_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Randolph == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Randolph_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_Heilung_15_00"); //Das Saufen ist dir zu Kopf gestiegen, was?
	AI_Output			(self, other, "DIA_Randolph_Heilung_06_01"); //Ich trink nie wieder einen Tropfen. Nicht in diesem Leben. Da kannst du dich drauf verlassen, Mann.
	B_NpcClearObsessionByDMT (self);
};


///////////////////////////////////////////////////////////////////////
//	Info SagittaHeal
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_SAGITTAHEAL		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	56;
	condition	 = 	DIA_Randolph_SAGITTAHEAL_Condition;
	information	 = 	DIA_Randolph_SAGITTAHEAL_Info;

	description	 = 	"Hier. Das wird deinen Entzug lindern.";
};

func int DIA_Randolph_SAGITTAHEAL_Condition ()
{
	if (MIS_HealRandolph == LOG_RUNNING)
	&& (Npc_HasItems (other,ItPo_HealRandolph_MIS))
		{
				return TRUE;
		};
};

func void DIA_Randolph_SAGITTAHEAL_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_00"); //Hier. Das wird deinen Entzug lindern.
	B_GiveInvItems 		(other, self, ItPo_HealRandolph_MIS, 1);					
	
	if (Npc_IsInState (self,ZS_Pick_FP))
		{
			B_UseItem 			(self,ItPo_HealRandolph_MIS);
		};	
		
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_01"); //Oah! Danke, Mann. Jetzt kann ich wieder ruhig schlafen.
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_02"); //Wie kann ich das nur wieder gut machen.
	
	if (DIA_Randolph_PERM_GotMoney == FALSE)
		{
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_03"); //Ich denke, die paar Münzen hier werden nur mein Gesicht vor dir wahren. Mehr jedoch nicht, fürchte ich.
		
			CreateInvItems (self, ItMi_Gold, 150);									
			B_GiveInvItems (self, other, ItMi_Gold, 150);					
		}
	else
		{
			AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_04"); //Ich habe für dich einen Batzen Geld bezahlt und deine paar Kröten tilgen bei weitem meine Unkosten nicht.
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_05"); //Tja. Da kann ich ja froh sein, dass ich an so einen hilfsbereiten Paladin geraten bin, was?
			
		};
	
	MIS_HealRandolph = LOG_SUCCESS;
	B_GivePlayerXP (XP_HealRandolph);
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Randolph_PICKPOCKET (C_INFO)
{
	npc			= BAU_942_Randolph;
	nr			= 900;
	condition	= DIA_Randolph_PICKPOCKET_Condition;
	information	= DIA_Randolph_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Randolph_PICKPOCKET_Condition()
{
	C_Beklauen (58, 2);	//Joly: darf nicht Gold mehr haben!
};
 
FUNC VOID DIA_Randolph_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Randolph_PICKPOCKET);
	Info_AddChoice		(DIA_Randolph_PICKPOCKET, DIALOG_BACK 		,DIA_Randolph_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Randolph_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Randolph_PICKPOCKET_DoIt);
};

func void DIA_Randolph_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Randolph_PICKPOCKET);
};
	
func void DIA_Randolph_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Randolph_PICKPOCKET);
};






