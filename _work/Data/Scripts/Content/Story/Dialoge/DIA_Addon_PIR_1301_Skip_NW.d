
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(verärgert) Da bist du ja endlich. Ich warte hier schon seit Stunden.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(irritiert) Aber Moment mal. Du bist gar kein Händler aus der Stadt, oder?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(sauer) Wo ist Baltram?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"Wer bist du?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Wer bist du?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Ich wüsste nicht, was dich das angeht. Aber wenn du es unbedingt wissen willst, mein Name ist Skip. Na klingelt's?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(als hätte er es nicht verstanden) Wer?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //Jetzt sag bloß, du hast den Namen Skip noch nie gehört? Meine Fresse, wo lebst du denn?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Ich bin einer der meist gesuchten Verbrecher in Khorinis. Meine Jungs und ich machen schon seit Jahren die Gewässer um diese lausige Insel hier unsicher.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(entrüstet) Das musst du doch schon mal gehört haben.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Du bist ein Pirat.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Muss ich dich kennen?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Ja. Natürlich. Jetzt fällt's mir wieder ein.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Ja. Natürlich. Jetzt fällt's mir wieder ein.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(verblüfft) Ehrlich? Du hast wirklich schon von mir gehört.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Ach du Scheiße! Ich hatte mir schon überlegt, in die Stadt zu marschieren.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Ein Glück, dass ich das nicht gemacht hab'.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //Die Miliz hätte mich sicher sofort in den Knast gesteckt.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Du bist doch nicht etwa hergekommen, um mich einzulochen, oder?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Tjaaa ...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Will ich dir auch nicht geraten haben. Wer sich mit dem alten Skip anlegt, ist Fischfutter.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //Muss ich dich kennen?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Jetzt sei mal nicht so vorlaut, Bursche, sonst lernst du den alten Skip mal kennen.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Du bist ein Pirat.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(genervt) Ja, verdammt. Das siehst du doch. Und ein genervter noch dazu.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Ich könnte vor Langeweile noch in die Planken meiner Kogge beißen.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"Baltram? Wartest du auf einen Händler?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //Baltram? Wartest du auf einen Händler?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Du bist wohl ein ganz Schlauer, was?
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Das habe ich doch eben gesagt, oder etwa nicht?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Dieser Nichtsnutz von einem Kleinkrämer hat mich wohl vergessen, so wie es aussieht.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Der soll mir noch mal in die Finger kommen, sag ich dir.
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Der Pirat Skip erzählte mir, dass der Stadthändler Baltram mit den Piraten Geschäfte macht."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"Ich habe ein Paket von Baltram für dich.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //Ich habe ein Paket von Baltram für dich.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Was denn? Jetzt schickt er schon einen Laufburschen zu mir.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Er hat die Hosen gestrichen voll, was? Naja. Was will man von so einer Händlerpfeife auch erwarten?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Er sagte, er will 3 Flaschen von deinem Rum dafür.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(lacht) Das hätte er wohl gerne. Erst lässt er mich hier ewig warten, kommt nicht einmal persönlich und stellt obendrein auch noch Forderungen.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Hier, gib ihm 2 Flaschen. Damit soll er zufrieden sein.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"Wo kommst du her?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Wo kommst du her?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Du willst wissen, wo unser Unterschlupf ist?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //Das werde ich einem Typen von der Miliz ganz bestimmt nicht auf die Nase binden.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Wenn ich dir das erzähle, dann könnte ich mich ja gleich der Miliz stellen.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //Außerdem würde dir das sowieso nichts nutzen, falls du vor haben solltest uns aufzusuchen.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //Die Insel Khorinis ist groß und da, wo wir sind, kommt sowieso niemand hin. Es sei denn, er fährt mit einer Kogge oder einem Schiff.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //Dann müsstest du auch noch ein Weg durch die Klippen finden. Niemand kommt da durch, es sei denn, er kennt den geheimen Weg.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //Es gibt nur zwei Menschen, die den Weg kennen, und du bist keiner von ihnen.
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"Kennst du jemanden mit einer Augenklappe?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Kennst du jemanden mit einer Augenklappe?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Ich kenne eine Menge Männer mit Augenklappe.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //Da gibt es so jemanden, der über das Land von Khorinis läuft und er scheint dich gut zu kennen.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Kann ich mir nicht vorstellen. Die Männer, mit denen ich zu tun habe, sind keine Landratten.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Aber ...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Hör schon auf, mich interessiert das wirklich nicht.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"Eine Menge Einwohner werden vermisst.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Eine Menge Einwohner werden vermisst. Und alles deutet darauf hin, dass du daran nicht ganz unschuldig zu sein scheinst.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(fühlt sich erwischt) Äh ... verdammt, aber die Sache ist nicht so, wie du denkst.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Seh ich etwa aus wie ein Menschenhändler? Nein, ich transportiere Waren, was das für Waren sind oder wo sie herkommen, geht mich nichts an.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Wir haben viele Dinge für diese Schweine geschippert.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Am Anfang war es ganz normaler Kram. Naja, das eine oder andere war Schmuggelware.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Doch irgendwann fingen sie an, die Bewohner der Stadt zu entführen. Keine Ahnung, was sie mit ihnen vorhaben.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //Wir haben sie nur übergefahren.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"Von wem sprichst du?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //Von wem sprichst du?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Von den Banditen, Mann. Von wem sonst? Das schmierige Pack, das sich hier überall auf der Insel breit macht.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //Und nicht nur hier um Khorinis.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //Jetzt fällt mir auch sein Name wieder ein. Dexter. Ja, ich meine, sein Name war Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Der Banditenhauptmann Dexter hat die Leute aus Khorinis verschleppen lassen. Dexter soll sich irgendwo südlich von Onars Hof befinden."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"'Banditen!' reicht mir nicht. Ich will einen Namen...";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //Banditen!' reicht mir nicht. Ich will einen Namen ...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Einen Namen? Du willst wissen, wer der Kopf der Banditen ist? Verdammt, wie hieß denn der Hund noch mal ...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Mmh. Mir fällt der Name von dem Kerl nicht mehr ein. Dabei war er eigentlich ganz einfach zu merken.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Aber ich kann dir zeigen, wo du den Boss der Bande in diesem Teil von Khorinis finden kannst.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //Hast du eine ordentliche Landkarte dabei?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Ich hab hier eine Landkarte.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Die ist ja schon vollgemalt. Da macht mir das ja gar keinen Spaß, dir deine Karte zu verschandeln.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Nein.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Dann werde ich's dir wohl beschreiben müssen, was?
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Weit im Osten gibt es einen sehr großen Bauernhof. Ich glaube, der Bauer dort heißt Onar.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Er hat ziemliche große Felder da. Im Süden dieser Felder gibt es eine kleine Festung auf einem hohen Felsen.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //Da sitzt der Typ, den du suchst.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"Hier. Ich hab eine Landkarte von Khorinis.";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Hier. Ich habe eine Landkarte von Khorinis.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //Das ist gut. Dann werde ich dir den Sitz von diesem Kerl einzeichnen.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Hier. Deine Karte.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wo habt ihr die Leute hingebracht?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //Wo habt ihr die Leute hingebracht?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Ich hab dir schon gesagt, ich werde dir nicht verraten, wo sich unsere Bucht befindet.
};
