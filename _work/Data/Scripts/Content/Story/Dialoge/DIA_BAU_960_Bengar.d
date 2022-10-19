///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bengar_EXIT   (C_INFO)
{
	npc         = BAU_960_Bengar;
	nr          = 999;
	condition   = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bengar_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_HALLO		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	3;
	condition	 = 	DIA_Bengar_HALLO_Condition;
	information	 = 	DIA_Bengar_HALLO_Info;

	description	 = 	"Du bist der Bauer hier?";
};

func int DIA_Bengar_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //Du bist der Bauer hier?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Könnte man so sagen, doch eigentlich bin ich nur der Pächter.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Dem Großbauern gehört das ganze Land hier.

};

///////////////////////////////////////////////////////////////////////
//	Info wovonlebtihr
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_WOVONLEBTIHR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Bengar_WOVONLEBTIHR_Condition;
	information	 = 	DIA_Bengar_WOVONLEBTIHR_Info;

	description	 = 	"Wovon lebt ihr?";
};

func int DIA_Bengar_WOVONLEBTIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_WOVONLEBTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Wovon lebt ihr?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //Hauptsächlich von der Jagd und vom Holz, das wir fällen. Natürlich züchten wir auch Schafe und betreiben Ackerbau.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Ich muss ja auch die ganzen Tagelöhner, die Onar mir aufhalst, beschäftigen. Die wenigsten sind gute Jäger, verstehst du?

};


///////////////////////////////////////////////////////////////////////
//	Info tageloehner
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_TAGELOEHNER		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	6;
	condition	 = 	DIA_Bengar_TAGELOEHNER_Condition;
	information	 = 	DIA_Bengar_TAGELOEHNER_Info;

	description	 = 	"Du unterhältst Tagelöhner?";
};

func int DIA_Bengar_TAGELOEHNER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_TAGELOEHNER_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //Du unterhältst Tagelöhner?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Die Arbeiter, die Onar nicht gebrauchen kann, wirft er von seinem Hof.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Er schickt sie dann zu mir. Ich ernähre sie und sie arbeiten hier für mich.

};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bengar_MissingPeople_Info;

	description	 = 	"Ist dir in letzter Zeit, was merkwürdiges wiederfahren?";
};

func int DIA_Addon_Bengar_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //Ist hier in letzter Zeit etwas Merkwürdiges passiert?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Hier passieren eine Menge merkwürdiger Dinge.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Aber das Seltsamste ist wohl Pardos' rätselhaftes Verschwinden.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //Er ist einer meiner Feldarbeiter und nicht der Typ, der einfach über Nacht alles hinwirft und sich aus dem Staub macht, verstehst du?

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Der Bauer Bengar vermisst seinen Feldarbeiter Pardos."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Irgendeinen Anhaltspunkt?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Vielleicht hatte er einfach die Schnauze voll.", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Was genau ist an seinem Verschwinden so merkwürdig?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Was genau ist an seinem Verschwinden so merkwürdig?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos ist ein sehr ängstlicher Kerl und hat sich niemals weiter als bis zu den Grenzen meiner Felder vom Hof entfernt.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Er hat schon die Beine in die Hand genommen, wenn ihm eine Fleischwanze über den Weg gekrabbelt kam.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Die Biester sind zwar nicht besonders schön, aber gefährlich sind sie nun wirklich nicht.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //(ekelt sich) Es soll ja Leute geben, die sie essen. Widerlich.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Man gewöhnt sich daran.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Vielleicht hatte er einfach die Schnauze voll.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //Die Feldarbeit war sein Ein und Alles. Schwer vorzustellen, dass jetzt er bei einem anderen Bauern arbeitet.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //Bei mir konnte er machen, was er wollte.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //Irgendeinen Anhaltspunkt?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Ich glaube ja, dass ihn die Banditen verschleppt haben. Die streunen schon seit Tagen hier in der Gegend herum.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Einmal habe ich gesehen, wie sie einen Bürger der Stadt in ihr Lager gezerrt haben.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Sah so aus, als ob sie ihn versklaven wollten.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Wo ist dieses Lager der Banditen?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Wo ist dieses Lager der Banditen?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Am Ende meiner Felder führt eine Treppe hinunter in einen kleinen Talkessel. Dort haben sie sich niedergelassen.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Ich würde dort ja gerne nach Pardos suchen, aber ich werde mich ganz sicher nicht mit den Kerlen anlegen.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //An deiner Stelle würde ich auch einen großen Bogen darum machen. Die kennen keinen Spaß.
	Bengar_ToldAboutRangerBandits = TRUE;
};
func void DIA_Addon_Bengar_MissingPeople_back ()
{
	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPardos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_ReturnPardos		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_ReturnPardos_Condition;
	information	 = 	DIA_Addon_Bengar_ReturnPardos_Info;

	description	 = 	"Ist Pardos wieder zurück?";
};

func int DIA_Addon_Bengar_ReturnPardos_Condition ()
{
	if 	(MIS_Bengar_BringMissPeopleBack == LOG_RUNNING)
	&&  (Npc_GetDistToWP (Pardos_NW, "NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //Ist Pardos wieder zurück?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Ja, er ist drin und ruht sich aus. Danke für alles was ...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //Schon gut.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Warte, ich würde dich ja entlohnen aber ich habe selber nicht ...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //Vergiss es.
	
	B_GivePlayerXP (XP_Ambient);
};	

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_FernandosWeapons		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Bengar_FernandosWeapons_Info;

	description	 = 	"Hatten die Banditen, die hier vorbei kamen, Waffen bei sich?";
};

func int DIA_Addon_Bengar_FernandosWeapons_Condition ()
{
	if (Bengar_ToldAboutRangerBandits == TRUE)
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //Hatten die Banditen Waffen bei sich, die hier vorbei kamen?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //Was ist denn das für eine blöde Frage? Was wären das für Banditen, wenn sie keine Waffen hätten?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Ich meine richtig VIELE Waffen. Eine Waffenlieferung.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Stimmt. Jetzt, wo du es sagst, sie hatten Massen davon bei sich.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //Einige in Fässern, einige in Taschen oder auf dem Karren, den sie dabei hatten.
	 B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info rebellieren
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_REBELLIEREN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	8;
	condition	 = 	DIA_Bengar_REBELLIEREN_Condition;
	information	 = 	DIA_Bengar_REBELLIEREN_Info;

	description	 = 	"Was hältst du von Onar?";
};

func int DIA_Bengar_REBELLIEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Was hältst du von Onar?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //Er ist ein gieriger Sack, der uns noch alle an den Galgen bringen wird.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Irgendwann kommen die Paladine aus der Stadt und lassen uns kleine Bauern für das, was er hier abzieht, bluten.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Aber ich habe keine Wahl, die Milizen kommen nur hierher, um zu kassieren, und nicht, um den Hof zu verteidigen.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Wenn ich mich loyal zur Stadt verhalten würde, könnte ich selber zusehen, wie ich klarkomme.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Onar schickt zumindest ab und zu mal Söldner, um nach dem Rechten zu sehen.
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PALADINE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	9;
	condition	 = 	DIA_Bengar_PALADINE_Condition;
	information	 = 	DIA_Bengar_PALADINE_Info;

	description	 = 	"Was hast du gegen die Königstruppen?";
};

func int DIA_Bengar_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_REBELLIEREN))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) 
		{
				return TRUE;
		};
};

func void DIA_Bengar_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Was hast du gegen die Königstruppen?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //Liegt doch auf der Hand. Es hat überhaupt keine Verbesserung gebracht, dass die Paladine jetzt in der Stadt sind. Ganz im Gegenteil.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Jetzt kommen diese verfluchten Milizen nur noch häufiger auf unser Land und rauben, was das Zeug hält, und die Paladine machen nichts dagegen.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Die einzigen Paladine, die ich je gesehen habe, sind die beiden Wachen vor dem Pass.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //Die würden sich keinen Meter da weg bewegen, auch wenn die Miliz uns alle abschlachten würde.

};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PASS		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	10;
	condition	 = 	DIA_Bengar_PASS_Condition;
	information	 = 	DIA_Bengar_PASS_Info;

	description	 = 	"Der Pass?";
};

func int DIA_Bengar_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Bengar_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //Der Pass?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //Ja. Der Pass ins alte Minental bei den Wasserfällen am anderen Ende des Weidenplateaus.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Frag mal Malak danach. Er ist die letzte Woche ein paar mal da gewesen.

};

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZ (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_MILIZ_Condition;
	information	= DIA_Bengar_MILIZ_Info;
	permanent 	= FALSE;
	description	= "Ich soll mich um euer Milizproblem kümmern.";
};

func int DIA_Bengar_MILIZ_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //Ich soll mich um euer Milizproblem kümmern.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Was? Ich hab Onar gesagt, er soll ein paar von seinen SÖLDNERN schicken.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //Das hier ist meine Bewährungsprobe.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //Na großartig. Weißt du, was die Milizen mit mir machen, wenn du es vermasselst?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Ich dachte schon, es würde niemand mehr kommen.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //Hab Onar schon vor Tagen Bescheid gesagt. Wofür bezahle ich eigentlich meine Pacht?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Die Mistkerle kommen bei uns jede Woche einmal vorbei und kassieren die Abgaben für die Stadt.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //Es trifft sich gut, dass du gerade jetzt kommst. Das ist normalerweise immer ihre Zeit.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //Sie müssten eigentlich jeden Moment hier sein.
};

// ************************************************************
// 			  				Selber vorknöpfen
// ************************************************************
instance DIA_Bengar_Selber (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_Selber_Condition;
	information	= DIA_Bengar_Selber_Info;
	permanent 	= FALSE;
	description	= "Warum knöpft ihr euch die Milizen nicht selber vor?";
};

func int DIA_Bengar_Selber_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Bengar_MilSuccess == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info ()
{
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Ihr seid so viele Männer. Warum knöpft ihr euch die Milizen nicht selber vor?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //Wir sind viele, das ist richtig. Aber wir sind keine ausgebildeten Kämpfer, so wie die Miliz.
};		

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZKLATSCHEN		(C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZKLATSCHEN_Condition;
	information	= DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent	= FALSE;
	description	= "Die Miliz soll ruhig kommen, mit denen werde ich schon fertig!";
};

func int DIA_Bengar_MILIZKLATSCHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (!Npc_IsDead(Rick))
	&& (!Npc_IsDead(Rumbold))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Die Miliz soll ruhig kommen, mit denen werde ich schon fertig!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Da bin ja mal gespannt. Da vorne kommen sie nämlich schon. Hab ich's dir doch gesagt.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Vermassel es bloß nicht!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //Na dann, viel Glück! Zeig's ihnen!
	};

	AI_StopProcessInfos (self);
				
	Npc_ExchangeRoutine	(self,"MilComing"); 
	
	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))
	{
		Npc_ExchangeRoutine	(Rick,"MilComing");
		AI_ContinueRoutine (Rick);
	};
	if (Hlp_IsValidNpc (Rumbold))
	&& (!Npc_IsDead (Rumbold))
	{		
		Npc_ExchangeRoutine	(Rumbold,"MilComing"); 
		AI_ContinueRoutine (Rumbold);
	};
};
	
// ************************************************************
// 			  				Miliz weg 
// ************************************************************
var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZWEG_Condition;
	information	= DIA_Bengar_MILIZWEG_Info;
	permanent	= TRUE;
	description	= "Euer Milizproblem ist Vergangenheit.";
};

func int DIA_Bengar_MILIZWEG_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZ))
	&& (Bengar_MilSuccess == FALSE)
	{
		if (Npc_IsDead (Rick) && Npc_IsDead (Rumbold))
		|| (Rumbold_Bezahlt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //Euer Milizproblem ist Vergangenheit.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Bist du verrückt? Weißt du, was die Kerle mit mir machen, wenn du weg bist?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Die stehen doch noch da vorne rum. Sag ihnen, sie sollen GANZ verschwinden!
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //Nicht übel. Vielleicht bleibt am Ende des Monats jetzt ja auch mal was übrig. Danke.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Du wolltest sogar für mich bezahlen. Sehr anständig von dir.
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
		};
		
		Bengar_MilSuccess = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info balthasar
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASAR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	13;
	condition	 = 	DIA_Bengar_BALTHASAR_Condition;
	information	 = 	DIA_Bengar_BALTHASAR_Info;

	description	 = 	"Balthasar der Schafhirte darf nicht auf deine Weide?";
};

func int DIA_Bengar_BALTHASAR_Condition ()
{
	if 	(
		(MIS_Balthasar_BengarsWeide == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASAR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //Balthasar der Schafhirte darf nicht auf deine Weide?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //Ach so. Die Geschichte. Ich habe ihm erzählt, Sekob soll mir Geld bezahlen, wenn er die Schafe auf meine Weide führt.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //Wenn ich ehrlich bin, ist das nur Schikane. Ich kann Balthasar einfach nicht leiden.
	B_LogEntry (TOPIC_BalthasarsSchafe,"Wenn ich Bengar überzeugen will, dass er Balthasar wieder auf seine Weide läßt, werde ich etwas für ihn tun müssen. Die Gelegenheit wird sich sicherlich noch ergeben."); 
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info balthasardarfaufweide
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASARDARFAUFWEIDE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	14;
	condition	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;

	description	 = 	"Die Miliz ist weg und Balthasar kann wieder auf dein Land.";
};

func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bengar_BALTHASAR))
		&& (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
		&& (Bengar_MilSuccess == TRUE)
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //Die Miliz ist weg und Balthasar kann wieder auf dein Land.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Wieso?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //(droht) Weil ich es gesagt habe.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Mmh. Na gut, wie du meinst.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //Soll er sich hinter dem Feld eine Stelle mit seinen Viechern suchen.

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	15;
	condition	 = 	DIA_Bengar_PERMKAP1_Condition;
	information	 = 	DIA_Bengar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bleib senkrecht.";
};

func int DIA_Bengar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_BALTHASARDARFAUFWEIDE))
	&& (Kapitel < 3)
			{
					return TRUE;
			};
};

func void DIA_Bengar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //Bleib senkrecht.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Du auch.

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

INSTANCE DIA_Bengar_KAP3_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP3_EXIT_Condition;
	information	= DIA_Bengar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Allein
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_ALLEIN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	30;
	condition	 = 	DIA_Bengar_ALLEIN_Condition;
	information	 = 	DIA_Bengar_ALLEIN_Info;

	description	 = 	"Wie ist die Lage?";
};

func int DIA_Bengar_ALLEIN_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_ALLEIN_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Wie ist die Lage?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak ist verschwunden und hat alles und jeden mitgenommen, der für mich arbeiten wollte. Er sagte, er wollte in die Berge.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Er hat es hier nicht mehr ausgehalten.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //Schwere Zeiten sind das. Ich weiß nicht, ob ich noch länger durchhalte.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Die Horden von Monstern, die täglich aus dem Pass aufs Weidenplateau kommen, machen mich ganz fertig.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Wenn ich wenigstens ein paar Helfer oder Söldner hätte.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //Es gab sogar schon mal einen, der für mich arbeiten wollte. Hat es aber dann doch nicht getan. Ich glaube, 'Wolf' war sein Name.
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar steht alleine auf seinem Hof. Malak sein Freund ist weg und aht alle anderen mitgenommen. Bengar denkt, dass er in die Berge geflohen ist."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Sein Hof ist nun völlig schutzlos. Er braucht eine Hilfe. Er sprach von einm Söldner mit dem Namen Wolf. Den kenn ich doch!?"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Malaktot
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKTOT		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_MALAKTOT_Condition;
	information	 = 	DIA_Bengar_MALAKTOT_Info;

	description	 = 	"Malak ist tot.";
};

func int DIA_Bengar_MALAKTOT_Condition ()
{
	if (Npc_IsDead(Malak))
	&& (Malak_isAlive_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKTOT_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak ist tot.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //Dann wird alles nur noch schlimmer werden.
};

///////////////////////////////////////////////////////////////////////
//	Info SLDda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_SLDDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_SLDDA_Condition;
	information	 = 	DIA_Bengar_SLDDA_Info;

	description	 = 	"Ich habe dir den Söldner besorgt, den du wolltest.";
};

func int DIA_Bengar_SLDDA_Condition ()
{
	if (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_SLDDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Ich habe dir den Söldner besorgt, den du wolltest.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Ich hatte noch nie so jemanden auf meinem Hof. Hoffentlich geht das gut.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Hier, nimm dies. Ich denke, das kannst du gebrauchen.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);
	B_GivePlayerXP (XP_BengarsHelpingSLDArrived);
					
};

///////////////////////////////////////////////////////////////////////
//	Info Malakwiederda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKWIEDERDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	35;
	condition	 = 	DIA_Bengar_MALAKWIEDERDA_Condition;
	information	 = 	DIA_Bengar_MALAKWIEDERDA_Info;

	description	 = 	"Malak ist wieder da.";
};

func int DIA_Bengar_MALAKWIEDERDA_Condition ()
{
	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((MIS_GetMalakBack == LOG_SUCCESS)||(NpcObsessedByDMT_Malak == TRUE))
	&& ((Npc_IsDead(Malak))==FALSE)

		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKWIEDERDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak ist wieder da.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Das wurde auch Zeit. Ich dachte schon, ich würde ihn nie wiedersehen.
	B_GivePlayerXP (XP_GetMalakBack);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERM		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	80;
	condition	 = 	DIA_Bengar_PERM_Condition;
	information	 = 	DIA_Bengar_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Das wird schon wieder.";
};

func int DIA_Bengar_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_ALLEIN))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //Das wird schon wieder.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak ist zwar wieder da, aber die Situation hat sich kaum verändert.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //Wenn kein Wunder geschieht, werden wir hier alle noch zu Grunde gehen.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Wolf ist schon ein merkwürdiger Kerl, aber ich denke, das wird schon irgendwie gehen.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Ohne Malak läuft hier gar nichts mehr. Wenn nicht bald etwas passiert, muss ich meinen Hof aufgeben.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Hoffentlich kommt er bald zurück.
		};
	};
	AI_StopProcessInfos (self);
	
	if (Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	B_StartOtherRoutine	(SLD_815_Soeldner,"Start");
	B_StartOtherRoutine	(SLD_817_Soeldner,"Start");
	};
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

INSTANCE DIA_Bengar_KAP4_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP4_EXIT_Condition;
	information	= DIA_Bengar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Bengar_KAP5_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP5_EXIT_Condition;
	information	= DIA_Bengar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Bengar_KAP6_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP6_EXIT_Condition;
	information	= DIA_Bengar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bengar_PICKPOCKET (C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 900;
	condition	= DIA_Bengar_PICKPOCKET_Condition;
	information	= DIA_Bengar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bengar_PICKPOCKET_Condition()
{
	C_Beklauen (28, 50);
};
 
FUNC VOID DIA_Bengar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bengar_PICKPOCKET);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_BACK 		,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};
	
func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};


















































































